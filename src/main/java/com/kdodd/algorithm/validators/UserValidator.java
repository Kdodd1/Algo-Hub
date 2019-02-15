package com.kdodd.algorithm.validators;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Component;

import com.kdodd.algorithm.models.User;
import com.kdodd.algorithm.services.UserService;

@Component
public class UserValidator {
	
	public static Pattern EMAIL_REGEX = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]+");
	private UserService userService;
	
	public UserValidator(UserService userService) {
		this.userService = userService;
	}
	
	public HashMap<String, Object> validate(Map<String, String> body) {
		
		HashMap<String, Object> response = new HashMap<String, Object>();
		
		if(body.get("username").length() < 3) {
			response.put("username", "*Username must be 3 characters or longer");
		} else {
			User user = this.userService.findByUsername(body.get("username"));
			if(user != null) {
				response.put("username", "*Username is already in use");
			}
		}
		if(body.get("email").length() < 1) {
			response.put("email", "*E-mail is Required");
		} else if (!EMAIL_REGEX.matcher(body.get("email")).matches()) {
			response.put("email", "*Invalid e-mail");
		} else {
			User user = this.userService.findByEmail(body.get("email"));
			if(user != null) {
				response.put("email", "*E-mail is already in use");
			}
		}
		if(body.get("password").length() < 8) {
			response.put("password", "*Password must be 8 characters or longer");
		}
		if(!body.get("password").equals(body.get("confirm"))) {
			response.put("confirm", "*Password Confirmation doesn't match Password");
		}
		if(response.isEmpty()) {
			response.put("valid", true);
		} else {
			response.put("valid", false);
		}
		return response;
	}
	public HashMap<String, Object> authenticate(Map<String, String> body) {
		HashMap<String, Object> response = new HashMap<String, Object>();
		User user = null;
		
		if(body.get("email").length() < 1) {
			response.put("emailLog", "*E-Mail is required");
		} else if(!EMAIL_REGEX.matcher(body.get("email")).matches()) {
			response.put("emailLog", "*Invalid e-mail");
		} else {
			user = this.userService.findByEmail(body.get("email"));
			if(user == null) {
				response.put("emailLog", "*Unknown e-mail");
			}
		}
		if(body.get("password").length() < 8) {
			response.put("passwordLog", "*Invalid input");
		} else if(user != null && !BCrypt.checkpw(body.get("password"), user.getPassword())) {
			response.put("passwordLog", "*Invalid password");
		}
		if(response.isEmpty()) {
			response.put("valid", true);
			response.put("user", user);
		} else {
			response.put("valid", false);
		}
		return response;
	}
	
}
