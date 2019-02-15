package com.kdodd.algorithm.controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kdodd.algorithm.models.Algorithm;
import com.kdodd.algorithm.models.Comment;
import com.kdodd.algorithm.models.Language;
import com.kdodd.algorithm.models.User;
import com.kdodd.algorithm.services.AlgorithmService;
import com.kdodd.algorithm.services.CommentService;
import com.kdodd.algorithm.services.LanguageService;
import com.kdodd.algorithm.services.UserService;

@Controller
public class AlgorithmController {
	private UserService userService;
	private LanguageService languageService;
	private AlgorithmService algorithmService;
	private CommentService commentService;
	
	public AlgorithmController(CommentService commentService, UserService userService, AlgorithmService algorithmService, LanguageService languageService) {
		this.commentService = commentService;
		this.userService = userService;
		this.algorithmService = algorithmService;
		this.languageService = languageService;
	}
	@RequestMapping("/myalgos")
	public String myAlgos(Model model, HttpSession session,  RedirectAttributes flash) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			HashMap<String, Object> map = new HashMap<String, Object> ();
			map.put("login", "You must login first");
			flash.addFlashAttribute("errors", map);
			return "redirect:/login";
		}
		List<User> usersFollowed = userService.getAllFollowed(user.getId());
		List<User> usersFollowing = userService.getAllFollowing(user.getId());
		List<Algorithm> algos = algorithmService.getAllAlgos(user.getId());
		List<Language> languages = languageService.getAllLanguages();
		model.addAttribute("usersFollowed", usersFollowed);
		model.addAttribute("usersFollowing", usersFollowing);
		model.addAttribute("algos", algos);
		model.addAttribute("languages", languages);
		model.addAttribute("user", user);
		return "myAlgos.jsp";
	}

	@RequestMapping("/createAlgo")
	public String create(Model model, HttpSession session, RedirectAttributes flash) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			HashMap<String, Object> map = new HashMap<String, Object> ();
			map.put("login", "You must login first");
			flash.addFlashAttribute("errors", map);
			return "redirect:/login";
		}
		model.addAttribute("algo", new Algorithm());
		model.addAttribute("languages", languageService.getAllLanguages());
		model.addAttribute("userId", user.getId());
		return "createAlgo.jsp";
	}
	@RequestMapping(value="/myalgos/add", method=RequestMethod.POST)
	public String addAlgo(@Valid @ModelAttribute("algo") Algorithm algo, BindingResult result, RedirectAttributes errors) {
	if(result.hasErrors()) {
		errors.addFlashAttribute("errors", result.getAllErrors());
			return "redirect:/myalgos/add";
		} else {
		algorithmService.addAlgo(algo);
			return "redirect:/myalgos";
		}
	}
	@RequestMapping("/myalgos/{id}")
	public String showAlgo(Model model, @PathVariable("id") Long id, HttpSession session, RedirectAttributes flash) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			HashMap<String, Object> map = new HashMap<String, Object> ();
			map.put("login", "You must login first");
			flash.addFlashAttribute("errors", map);
			return "redirect:/login";
		}
		Algorithm algo = algorithmService.getOne(id);
		model.addAttribute("user", session.getAttribute("user"));
		model.addAttribute("algo",algo);
		model.addAttribute("comments", commentService.getAllComments(id));
		model.addAttribute("comment", new Comment());
		return "displayAlgo.jsp";
	}

	@RequestMapping(value="/myalgos/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Algorithm algo = algorithmService.getOne(id);
		if(user.getId() != algo.getUser().getId()) {
			return "redirect:/";
		} else {
		
		algorithmService.deleteAlgorithm(id);
		return "redirect:/myalgos";
		}
	}
	@RequestMapping("/edit/{id}")
	public String editAlgo(Model model, @PathVariable("id") Long id, HttpSession session, RedirectAttributes flash) {
		User user = (User) session.getAttribute("user");
		Algorithm algo = algorithmService.getOne(id);
		if(user == null) {
			HashMap<String, Object> map = new HashMap<String, Object> ();
			map.put("login", "You must login first");
			flash.addFlashAttribute("errors", map);
			return "redirect:/";
		} else if (user.getId() != algo.getUser().getId())  {
			return "redirect:/myalgos";
		}
			model.addAttribute("algo", algo);
			model.addAttribute("languages", languageService.getAllLanguages());
			model.addAttribute("userId", user.getId());
			return "editAlgo.jsp";
			
	}
	@RequestMapping(value="/edit/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("algo") Algorithm algo, BindingResult result) {
		if(result.hasErrors()) { 
			return "redirect:/edit/" + algo.getId();
		} else {
			algorithmService.updateAlgo(algo.getId(), algo.getTitle(), algo.getAlgorithm(), algo.getLanguage());
			return "redirect:/myalgos/" + algo.getId();
		}
		
	}
	@RequestMapping(value="/comments/create", method=RequestMethod.POST)
	public String createComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result, RedirectAttributes errors, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		if(result.hasErrors()) {
			errors.addFlashAttribute("errors", result.getAllErrors());
			return "redirect:"+ referer;
		} else {
		
			commentService.addComment(comment);
			return "redirect:"+ referer;
		}
	}
	@RequestMapping(value="/comments/{id}", method=RequestMethod.DELETE)
	public String deleteComment(@PathVariable("id") Long id, HttpSession session, HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		Comment comment = commentService.getComment(id);
		String referer = request.getHeader("Referer");
		System.out.println(user.getId());
		if(user.getId() != comment.getUser().getId() && user.getId() != 1) {
			return "redirect:/myalgos";
		} else {
		
		commentService.deleteComment(id);
		return "redirect:"+ referer;
		}
	}
	@RequestMapping(value="/followUser", method=RequestMethod.POST)
	public String followUser(@RequestParam("userId") Long userId, @RequestParam("loggedUser") Long loggedUser, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		User user = userService.findUser(userId);
		User follower = userService.findUser(loggedUser);
		List<User> followers = user.getFollowers();
		followers.add(follower);
		userService.update(user);
		return "redirect:"+ referer;
	}
	@RequestMapping(value="/unfollowUser", method=RequestMethod.POST)
	public String unfollowUser(@RequestParam("userId") Long userId, @RequestParam("loggedUser") Long loggedUser, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		User user = userService.findUser(userId);
		User follower = userService.findUser(loggedUser);
		List<User> followers = user.getFollowers();
		followers.remove(follower);
		userService.update(user);
		return "redirect:"+ referer;
	}
	@RequestMapping(value="/languages/{id}", method=RequestMethod.DELETE)
	public String deleteLanguage(@PathVariable("id") Long id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user.getId() != 1) {
			return "redirect:/";
		} else {
			languageService.deleteLanguage(id);
			return "redirect:/languages/new";
		}
	}


}
