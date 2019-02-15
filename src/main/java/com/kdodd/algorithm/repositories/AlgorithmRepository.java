package com.kdodd.algorithm.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kdodd.algorithm.models.Algorithm;

public interface AlgorithmRepository extends CrudRepository<Algorithm, Long> {
	@Query(value="SELECT a FROM Algorithm a WHERE user_id = ?1 ORDER BY title")
	List<Algorithm> findAllAlgorithmByUserIdOrderByTitleAsc(Long user_id);

}
