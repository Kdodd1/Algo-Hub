package com.kdodd.algorithm.controllers;

import java.util.List;

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

import com.kdodd.algorithm.models.Language;
import com.kdodd.algorithm.models.User;
import com.kdodd.algorithm.services.AlgorithmService;
import com.kdodd.algorithm.services.LanguageService;

@Controller
@RequestMapping("/languages")
public class LanguageController {
	private LanguageService languageService;
	private AlgorithmService algorithmService;
	public LanguageController(LanguageService languageService, AlgorithmService algorithmService) {
		this.languageService = languageService;
		this.algorithmService = algorithmService;
	}
	@RequestMapping("/new")
	public String addLanguage(Model model, @ModelAttribute("language") Language language) {
		List<Language> allLanguages = languageService.getAllLanguages();
		model.addAttribute("allLanguages", allLanguages);
		model.addAttribute("language", language);
		return "addLanguage.jsp";
	}
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String newLanguage(@Valid @ModelAttribute("language") Language language, BindingResult result, RedirectAttributes errors) {
		if(result.hasErrors()) {
			errors.addFlashAttribute("errors", result.getAllErrors());
			return "redirect:/languages/new";
		} else {
			languageService.addLanguage(language);
			return "redirect:/languages/new";
		}
	}


}
