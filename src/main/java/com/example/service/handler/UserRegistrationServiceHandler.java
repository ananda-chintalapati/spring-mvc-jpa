package com.example.service.handler;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.model.User;
import com.example.persistence.UserEntity;
import com.example.persistence.UserRepository;

@Component
public class UserRegistrationServiceHandler {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private DozerBeanMapper mapper;
	
	public String registerUser(User user) {
		if(!isUserExists(user.getEmail())) {
			UserEntity userEntity = mapper.map(user, UserEntity.class);
			userRepository.save(userEntity);
			return "Successfully added User";
		}else{
			return "User already exists";
		}
	}
	
	private boolean isUserExists(String email) {
		User user = findUserByEmail(email);
		if(user != null && user.getEmail() != null) {
			return true;
		}
		return false;
	}
	public User findUserByEmail(String email) {
		UserEntity userEntity = userRepository.findByEmail(email);
		if(userEntity != null) {
			return mapper.map(userEntity, User.class);
		}
		return null;
	}
}
