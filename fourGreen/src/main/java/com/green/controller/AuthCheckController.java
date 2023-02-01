package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.SignUpService;

@Controller
public class AuthCheckController {
	
	@Autowired
	private SignUpService signUpService;

	@RequestMapping("/authCheck")
	public String authCheck(@RequestParam("key") String key) {
		int cnt = signUpService.authCheck(key);
		if(cnt == 1) {
			return "authSuccess";
		}
		return "member/errorPage";
	}
	
	@PostMapping("/getAuth")
	@ResponseBody
	public String getAuth(String email){
		String auth = signUpService.getAuth(email);
		if(auth != null && auth.equals("1")) {
			signUpService.removeAuth(email);
		}
		return auth;
	}
	
}
