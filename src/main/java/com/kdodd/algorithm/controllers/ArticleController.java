package com.kdodd.algorithm.controllers;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kdodd.algorithm.models.Article;
import com.kdodd.algorithm.models.User;
import com.kdodd.algorithm.services.AlgorithmService;
import com.kdodd.algorithm.services.ArticleService;
import com.kdodd.algorithm.services.LanguageService;
import com.kdodd.algorithm.services.UserService;

@Controller
public class ArticleController {
	private UserService userService;
	private LanguageService languageService;
	private ArticleService articleService;
	private AlgorithmService algorithmService;
	
	public ArticleController(UserService userService, LanguageService languageService, ArticleService articleService,
			AlgorithmService algorithmService) {
		this.userService = userService;
		this.languageService = languageService;
		this.articleService = articleService;
		this.algorithmService = algorithmService;
	}

	@RequestMapping("/")
	public String index(Model model, HttpSession session, RedirectAttributes flash) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("articles", articleService.getAllArticles());
		return "dashboard.jsp";
	}
	@RequestMapping("/about")
	public String about() {
		return "about.jsp";
	}
	
	@RequestMapping("/articles/create")
	public String create(Model model, HttpSession session, RedirectAttributes flash) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			HashMap<String, Object> map = new HashMap<String, Object> ();
			map.put("login", "You must login first");
			flash.addFlashAttribute("errors", map);
			return "redirect:/";
		}
		else if(user.getId() != 1) {
			return "redirect:/dashboard";
		}
		model.addAttribute("article", new Article());
		model.addAttribute("userId", user.getId());
		return "createArticle.jsp";
	}
	@RequestMapping(value="/articles/create", method=RequestMethod.POST)
	public String createArticle(@Valid @ModelAttribute("article") Article article, BindingResult result, RedirectAttributes errors) {
		if(result.hasErrors()) {
			errors.addFlashAttribute("errors", result.getAllErrors());
			return "redirect:/articles/create";
		} else {
			articleService.addArticle(article);
			return "redirect:/dashboard";
		}
	}
	@RequestMapping("/articles/{id}")
	public String showArticle(Model model, @PathVariable("id") Long id,  RedirectAttributes flash, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			HashMap<String, Object> map = new HashMap<String, Object> ();
			map.put("login", "You must login first");
			flash.addFlashAttribute("errors", map);
			return "redirect:/";
		}
		Article article = articleService.getOne(id);
		model.addAttribute("article",article);
		return "displayArticle.jsp";
	}
	@RequestMapping("/articles/edit/{id}")
	public String editArticle(Model model, @PathVariable("id") Long id, HttpSession session, RedirectAttributes flash) {
		User user = (User) session.getAttribute("user");
		Article article = articleService.getOne(id);
		if(user == null) {
			HashMap<String, Object> map = new HashMap<String, Object> ();
			map.put("login", "Your must login first");
			flash.addFlashAttribute("errors", map);
			return "redirect:/";
		} else if(user.getId() != article.getUser().getId()) {
			return "redirect:/myalgos";
		}
		model.addAttribute("article", article);
		model.addAttribute("userId", user.getId());
		return "editArticle.jsp";
	}
	@RequestMapping(value="/articles/edit/{id}", method=RequestMethod.PUT)
	public String updateArticle(@Valid @ModelAttribute("article") Article article, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("Errors");
			return "redirect:/edit/" + article.getId();
		} else {
			articleService.updateArticle(article.getId(), article.getTitle(), article.getCategory(), article.getDescription(), article.getPicLink(), article.getContent(), article.getExampleCode());
			return "redirect:/articles/" + article.getId();
		}
	}
	
	
	@RequestMapping(value="/articles/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user.getId() != 1) {
				return "redirect:/";
			}
		articleService.deleteArticle(id);
		return "redirect:/";
	}
	
	
	
}
