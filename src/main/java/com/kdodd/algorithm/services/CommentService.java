package com.kdodd.algorithm.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kdodd.algorithm.models.Comment;
import com.kdodd.algorithm.repositories.AlgorithmRepository;
import com.kdodd.algorithm.repositories.CommentRepository;
import com.kdodd.algorithm.repositories.UserRepository;

@Service
public class CommentService {
	private UserRepository userRepository;
	private AlgorithmRepository algorithmRepository;
	private CommentRepository commentRepository;
	
	

	
	public CommentService(UserRepository userRepository, AlgorithmRepository algorithmRepository,
			CommentRepository commentRepository) {
		this.userRepository = userRepository;
		this.algorithmRepository = algorithmRepository;
		this.commentRepository = commentRepository;
	}

	public void addComment(Comment comment) {
		commentRepository.save(comment);
		}
	
	public List<Comment> getAllComments(Long algo_id){
		return(List<Comment>) commentRepository.findAllCommentsByAlgorithmIdOrderByCreatedAtDesc(algo_id);
	}
	
	public Comment getComment(Long id) {
		Optional<Comment> optionalComment = commentRepository.findById(id);
		if(optionalComment.isPresent()) {
			return optionalComment.get();
		} else {
			return null;
		}
	}
	
	public void deleteComment(Long id) {
		Optional<Comment> optionalComment = commentRepository.findById(id);
		if(optionalComment.isPresent());
		commentRepository.deleteById(id);
	}
}