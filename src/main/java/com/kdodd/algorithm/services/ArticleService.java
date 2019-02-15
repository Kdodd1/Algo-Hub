package com.kdodd.algorithm.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kdodd.algorithm.models.Article;
import com.kdodd.algorithm.repositories.ArticleRepository;

@Service
public class ArticleService {
	private ArticleRepository articleRepository;

	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}
	public void addArticle(Article article) {
		articleRepository.save(article);
	}
	public List<Article> getAllArticles() {
		return(List<Article>) articleRepository.findAll();
	}
	public Article getOne(Long id) {
		Optional<Article> optionalArticle = articleRepository.findById(id);
		if(optionalArticle.isPresent()) {
			return optionalArticle.get();
		} else {
			return null;
		}
	}
	public void deleteArticle(Long id) {
		Optional<Article> optionalArticle = articleRepository.findById(id);
		if(optionalArticle.isPresent());
			articleRepository.deleteById(id);
		}
	public Article updateArticle(Long id, String title, String category, String description, String picLink, String content, String exampleCode) {
		Optional<Article> optionalArticle = articleRepository.findById(id);
		if(optionalArticle.isPresent()) {
			Article article = optionalArticle.get();
			article.setTitle(title);
			article.setCategory(category);
			article.setDescription(description);
			article.setPicLink(picLink);
			article.setContent(content);
			article.setExampleCode(exampleCode);
			articleRepository.save(article);
			return article;
		} else {
			return null;
		}
	}
}
	

