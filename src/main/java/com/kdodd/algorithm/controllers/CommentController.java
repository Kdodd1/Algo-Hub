package com.kdodd.algorithm.controllers;

import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kdodd.algorithm.models.Comment;
import com.kdodd.algorithm.services.AlgorithmService;
import com.kdodd.algorithm.services.CommentService;
import com.kdodd.algorithm.services.LanguageService;
import com.kdodd.algorithm.services.UserService;

public class CommentController {
	private UserService userService;
	private LanguageService languagerService;
	private AlgorithmService algorithmService;
	private CommentService commentService;
	
	public CommentController(UserService userService, LanguageService languagerService,
		AlgorithmService algorithmService, CommentService commentService) {
		this.userService = userService;
		this.languagerService = languagerService;
		this.algorithmService = algorithmService;
		this.commentService = commentService;
	}

	
}
