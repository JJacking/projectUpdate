package com.green.controller;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.SHA256;
import com.green.service.SignUpService;
import com.green.vo.MemberVO;

@Controller
public class SignUpController {
	
	@Autowired
	private SignUpService signUpService;
	
	@RequestMapping("/signUp")
	public String signUp() {
		
		return "member/signUpForm";
	}
	
	@PostMapping("/createRandomKey")
	@ResponseBody
	public String createRandomKey(String email) throws Exception {
		SHA256 sha256 = new SHA256();
		String ranKey = System.currentTimeMillis()+""+(int)(Math.random()*1000000)+RandomStringUtils.randomAlphanumeric(5);
		signUpService.insertAuth(email, sha256.encrypt(ranKey));
		String data = sha256.encrypt(ranKey);
		return data;
	}
	
	@PostMapping("/overlappingCheck")
	@ResponseBody
	public String overlappingCheck(String email){
		MemberVO member = signUpService.getMember(email);
		if(member == null) {
			return "null";
		}
		return "notNull";
	}
	
	@PostMapping("/signUpCheck")
	public String register(MemberVO member) {
		MemberVO mem = signUpService.getMember(member.getId());
		if(mem != null) {
			return "member/signUp";
		}else {
			int cnt = signUpService.register(member);
			if(cnt == 1) {
				return "member/welcomePage";
			}else {
				return "member/index";
			}
		}
		
	}
	
}
