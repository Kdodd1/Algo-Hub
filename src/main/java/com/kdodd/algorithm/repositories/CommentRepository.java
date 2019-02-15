package com.kdodd.algorithm.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.kdodd.algorithm.models.Comment;

public interface CommentRepository extends CrudRepository<Comment, Long>{
	List<Comment> findAllCommentsByAlgorithmIdOrderByCreatedAtDesc(Long algo_id);

}
