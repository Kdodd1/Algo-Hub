package com.kdodd.algorithm.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kdodd.algorithm.models.Language;
import com.kdodd.algorithm.models.User;
import com.kdodd.algorithm.services.LanguageService;
import com.kdodd.algorithm.services.UserService;
import com.kdodd.algorithm.validators.UserValidator;

@Controller
public class UserController {
	private UserValidator userValidator;
	private UserService userService;
	private LanguageService languageService;
	
	public UserController(UserValidator userValidator, UserService userService, LanguageService languageService) {
		this.userValidator = userValidator;
		this.userService = userService;
		this.languageService = languageService;
	}
	@RequestMapping("/login")
	public String log() {
		return "login.jsp";
	}
	@RequestMapping("/register")
	public String reg() {
		return "Register.jsp";
	}
	
	@PostMapping("/register")
	public String register(@RequestParam Map<String, String> body, RedirectAttributes flash, HttpSession session) {
		HashMap<String, Object> response = this.userValidator.validate(body);
		
		if((boolean) response.get("valid")) {
			User user = this.userService.createUser(body);
			session.setAttribute("user", user);
			return "redirect:/about";
		} else {
			flash.addFlashAttribute("errors", response);
			return "redirect:/register";
			}
		}
		
		@PostMapping("/login")
		public String login(@RequestParam Map<String, String> body, HttpSession session, RedirectAttributes flash) {
			HashMap<String, Object> response = this.userValidator.authenticate(body);
			if((boolean) response.get("valid")) {
				User user = (User) response.get("user");
				session.setAttribute("user", user);
				return "redirect:/myalgos";
			} else {
				flash.addFlashAttribute("errors", response);
				return "redirect:/login";
			}
		}
		@RequestMapping("/logout")
		public String logout(HttpSession session) {
			session.removeAttribute("user");
			return "redirect:/login";
		}
		@RequestMapping("/users")
		public String allUsers(Model model, @RequestParam(value="q", required=false) String q) {
			if(q != null) {
				if(userService.findByUsername(q) != null) {
					User searchedUser = userService.findByUsername(q);
					model.addAttribute("users", searchedUser.getUserName());
					model.addAttribute("usersId", searchedUser.getId());
				}
			
			} else {
			model.addAttribute("users", userService.getAllUsers());
			}
			return "allUsers.jsp";
		}
		@RequestMapping("/users/{id}")
		public String showUser(Model model, @PathVariable("id") Long id, HttpSession session, RedirectAttributes flash) {
			User user = userService.findUser(id);
			User loggedUser = (User) session.getAttribute("user");
			List<Language> languages = languageService.getAllLanguages();
			List<User> usersFollowed = userService.getAllFollowed(user.getId());
			List<User> usersFollowing = userService.getAllFollowing(user.getId());
			if(loggedUser == null) {
				HashMap<String, Object> map = new HashMap<String, Object> ();
				map.put("login", "You must login first");
				flash.addFlashAttribute("errors", map);
				return "redirect:/login";
			}
			
			Boolean check = userService.checkFollow(user.getId(), loggedUser.getId());
			model.addAttribute("usersFollowed", usersFollowed);
			model.addAttribute("usersFollowing", usersFollowing);
			model.addAttribute("check", check);
			model.addAttribute("loggedUser", loggedUser);
			model.addAttribute("user", user);
			model.addAttribute("algos", user.getAlgorithms());
			model.addAttribute("languages", languages);
			return "displayUser.jsp";
		}
		
		
	}
