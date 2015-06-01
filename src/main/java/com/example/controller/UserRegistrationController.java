package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.User;
import com.example.service.handler.UserRegistrationServiceHandler;

@Controller
@RequestMapping("/register")
public class UserRegistrationController {

	@ModelAttribute("user")
	public User getUserObject() {
		return new User();
	}
	@Autowired
	private UserRegistrationServiceHandler serviceHandler;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView registerUser() {
		return new ModelAndView("register","result","");
	}
	
   @RequestMapping(method = RequestMethod.POST)
   public ModelAndView processRegister(@ModelAttribute User user, ModelMap model) {
	  String result = serviceHandler.registerUser(user);
	  return new ModelAndView("register","result", result);
   }
}
