package com.kdodd.algorithm.repositories;

import org.springframework.data.repository.CrudRepository;

import com.kdodd.algorithm.models.User;

public interface UserRepository extends CrudRepository<User, Long>{
	public User findByEmail(String email);
	public User findByUsername(String username);

}