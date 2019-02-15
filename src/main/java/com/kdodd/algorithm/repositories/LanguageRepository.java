package com.kdodd.algorithm.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.kdodd.algorithm.models.Language;

public interface LanguageRepository extends CrudRepository<Language, Long> {
	public List<Language> findAllByOrderByName();
}
