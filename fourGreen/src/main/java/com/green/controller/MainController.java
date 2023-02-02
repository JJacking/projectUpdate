package com.green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.service.BoardService;
import com.green.service.SignInService;
import com.green.vo.BoardVO;
import com.green.vo.ManagerVO;
import com.green.vo.MemberVO;

@Controller
public class MainController {
	
	@Autowired
	private SignInService signInService;
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("/")
	public String main(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("user");
		List<BoardVO> list = boardService.selectAll();
		List<ManagerVO> manager = boardService.selectAllmanager();
		model.addAttribute("manager", manager);
		model.addAttribute("list",list);
		if(member != null) {
			session.setAttribute("user", signInService.getMember(member.getId()));
		}
		return "index";
	}

	
	
}
