package com.green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.service.SignInService;
import com.green.vo.MemberVO;

@Controller
public class MainController {
	
	@Autowired
	private SignInService signInService;
	
	@RequestMapping("/")
	public String main(HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("user");
		if(member != null) {
			session.setAttribute("user", signInService.getMember(member.getId()));
		}
		return "index";
	}
	
}
