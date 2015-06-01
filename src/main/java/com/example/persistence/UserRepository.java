package com.example.persistence;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, String> {

	public UserEntity findByEmail(String email);
	
	@SuppressWarnings("unchecked")
	public UserEntity save(UserEntity user);
}
