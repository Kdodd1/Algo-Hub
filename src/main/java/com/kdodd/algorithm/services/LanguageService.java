package com.kdodd.algorithm.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kdodd.algorithm.models.Language;
import com.kdodd.algorithm.repositories.LanguageRepository;

@Service
public class LanguageService {
	private LanguageRepository languageRepository;

	public LanguageService(LanguageRepository languageRepository) {
		this.languageRepository = languageRepository;
	}
	public void addLanguage(Language language) {
		languageRepository.save(language);
	}
	public List<Language> getAllLanguages() {
		return(List<Language>) languageRepository.findAllByOrderByName();
	}
	public Language getOne(Long id) {
		Optional<Language> optionalLanguage =  languageRepository.findById(id);
		if(optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;
		}
	}
	public void deleteLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepository.findById(id);
		if(optionalLanguage.isPresent());
			languageRepository.deleteById(id);
		}
	}
