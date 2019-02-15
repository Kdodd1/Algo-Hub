package com.kdodd.algorithm.repositories;

import org.springframework.data.repository.CrudRepository;

import com.kdodd.algorithm.models.Article;

public interface ArticleRepository extends CrudRepository<Article, Long> {

}
