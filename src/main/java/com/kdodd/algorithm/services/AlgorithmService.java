package com.kdodd.algorithm.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kdodd.algorithm.models.Algorithm;
import com.kdodd.algorithm.models.Language;
import com.kdodd.algorithm.repositories.AlgorithmRepository;
import com.kdodd.algorithm.repositories.UserRepository;

@Service
public class AlgorithmService {
	private UserRepository userRepository;
	private AlgorithmRepository algorithmRepository;
	public AlgorithmService(UserRepository userRepository, AlgorithmRepository algorithmRepository) {
		this.userRepository = userRepository;
		this.algorithmRepository = algorithmRepository;
	}
	public void addAlgo(Algorithm algo) {
		algorithmRepository.save(algo);
	}
	public List<Algorithm> getAllAlgos(Long user_id){
		return(List<Algorithm>) algorithmRepository.findAllAlgorithmByUserIdOrderByTitleAsc(user_id);
	}
	public Algorithm getOne(Long id) {
		Optional<Algorithm> optionalAlgo = algorithmRepository.findById(id);
		if(optionalAlgo.isPresent()) {
			return optionalAlgo.get();
		} else {
			return null;
		}
	}
	public void deleteAlgorithm(Long id) {
		Optional<Algorithm> optionalAlgo = algorithmRepository.findById(id);
		if(optionalAlgo.isPresent());
		algorithmRepository.deleteById(id);
	}
	public Algorithm updateAlgo(Long id, String title, String algorithm, Language language) {
		Optional<Algorithm> optionalAlgo = algorithmRepository.findById(id);
		if(optionalAlgo.isPresent()) {
			Algorithm algo = optionalAlgo.get();
			algo.setTitle(title);
			algo.setAlgorithm(algorithm);
			algo.setLanguage(language);
			algorithmRepository.save(algo);
			return algo;
		} else {
			return null;
		}
	}
	
}
