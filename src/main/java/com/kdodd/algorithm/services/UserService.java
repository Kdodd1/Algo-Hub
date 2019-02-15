package com.kdodd.algorithm.services;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kdodd.algorithm.models.User;
import com.kdodd.algorithm.repositories.UserRepository;
import com.kdodd.products.models.Product;

@Service
public class UserService {
	
	private UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	public User createUser(Map<String, String> body) {
		User user = new User(body);
		this.userRepository.save(user);
		return user;
	}
	
	public User findByEmail(String email) {
		return this.userRepository.findByEmail(email);
	}
	public User findByUsername(String username) {
		return this.userRepository.findByUsername(username);
	}
	public List<User> getAllUsers() {
		return(List<User>) userRepository.findAll();
	}
	public User findUser(Long id) {
		Optional<User> optionalUser = userRepository.findById(id);
		if(optionalUser.isPresent()) {
			return optionalUser.get();
		} else {
			return null;
		}
	}
	public void update(User user) {
		userRepository.save(user);
	}
	public List<User> getAllFollowed(Long userId) {
		List<User> users = this.findUser(userId).getFollowed();
		return users;
	}
	public List<User> getAllFollowing(Long userId) {
		List<User> users = this.findUser(userId).getFollowers();
		return users;
	}
	public Boolean checkFollow(Long userId, Long followerId) {
		List<User> users = this.findUser(userId).getFollowers();
		for(int i = 0; i < users.size(); i++) {
			if (users.get(i).getId() == followerId) {
				return true;
			}
		}
		return false;
	}
}
