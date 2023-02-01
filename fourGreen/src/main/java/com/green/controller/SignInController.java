package com.green.controller;

import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.service.SHA256;
import com.green.service.SignInService;
import com.green.vo.MemberVO;

@Controller
public class SignInController {
	
	@Autowired
	private SignInService signInService;
	
	@RequestMapping("/signInForm")
	public String signInForm() {
		return "member/signInForm";
	}
	
	@GetMapping("/signIn")
	public String signIn(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("user");
		System.out.println(member);
		if(member != null) {
			MemberVO m = signInService.getMember(member.getId());
			session.setAttribute("user", m);
			return "redirect:/";
		}else {
			return "member/signIn";
		}
	}
	
	@PostMapping("/googleSignIn")
	@ResponseBody
	public String googleSignIn(String email, String nickname, HttpSession session) {
		String data = "";
		MemberVO member = signInService.getMember(email);
		if(member != null && member.getType().equals("auction")) {
			data = "denied";
		}else if(member == null) {
			signInService.registerByGoogle(email, nickname);
			MemberVO m = signInService.getMember(email);
			System.out.println(m.getId());
			session.setAttribute("user", m);
			System.out.println("정보 등록에서 세션에 유저 등록");
			data = "signUp";
		}else if(member != null && member.getPhone().equals("null") && member.getType().equals("google")) {
			session.setAttribute("user", member);
			data = "googleUserInfo";
		}else if(member != null && !member.getPhone().equals("null") && member.getType().equals("google")) {
			session.setAttribute("user", member);
			data = "signIn";
		}
		return data;
	}
	
	@GetMapping("googleUserInfo")
	public String googleUserInfo() {
		return "googleUserInfoForm";
	}
	
	@PostMapping("googleUserInfo")
	public String googleUserInfo2(@RequestParam String phone, @RequestParam String address, @RequestParam String id) {
		int result = signInService.registerGoogleUserInfo(phone, address, id);
		if(result == 1) {
			return "redirect:/signIn";
		}
		return "member/erorrPage";
	}
	
	@PostMapping("/signInCheck")
	public String signInCheck(MemberVO member, Model model, HttpSession session) {
		MemberVO user = signInService.getUser(member);
		if(user == null) {
			model.addAttribute("msg","로그인에 실패했습니다.");
			return "signIn";
		}
		session.setAttribute("user", user);
		
		return "redirect:/";
	}
	
	@GetMapping("/myPage")
	public String myPage() {
		return "member/myPage";
	}
	
	@GetMapping("/changePassword")
	public String changePassword() {
		return "member/changePassword";
	}
	
	@PostMapping("/changePassword")
	public String changePassword(String id, String password, String newPassword, Model model){
		int result = 0;
		MemberVO member = signInService.getMember(id);
		if(member.getPassword().equals(password
				
				)) {
			result = signInService.updatePassword(newPassword, id);
			if(result == 1) {
				System.out.println("변경 성공");
				return "redirect:/myPage";
			}
		}
		model.addAttribute("msg","현재 비밀번호가 틀렸습니다. 다시 입력해주세요.");
		return "changePassword";
	}
	
	@PostMapping("/updateMember")
	public String updateMember(MemberVO member, HttpSession session) {
		signInService.updateMember(member);
		session.setAttribute("user", signInService.getMember(member.getId()));
		return "redirect:/myPage";
	}
	
	@GetMapping("/withdrawalPage")
	public String withdraw(){
		
		return "member/withdrawalPage";
	}
	
	@PostMapping("/withdraw")
	public String withdraw(@RequestParam(value="userId") String userId,@RequestParam(value="password") String password, HttpSession session, Model model) {
		MemberVO member = signInService.getMember(userId);
		if(member.getPassword().equals(password)&& member.getType().equals("auction") && !password.equals("0")) {
			signInService.withdrawDeleteCharge(member.getId());
			signInService.deleteMember(userId);
			session.invalidate();
			return "redirect:/";
		}else if(member.getType().equals("google")&&password.equals("0")) {
			signInService.withdrawDeleteCharge(member.getId());
			signInService.deleteMember(userId);
			session.invalidate();
			return "redirect:/";
		}else {
			model.addAttribute("msg","비밀번호를 다시 입력해주세요.");
			return "member/withdrawalPage";
		}
	}
	
	@GetMapping("/searchId")
	public String searchId(String phone) throws ParseException {
		return "member/searchId";
	}
	
	@PostMapping("/searchId")
	@ResponseBody
	public String searchIdAjax(String phone){
		System.out.println("searchIdAjax : "+phone);
		List<String> idList = signInService.getMemberIdList(phone);
		String data = "";
		if(!idList.isEmpty()) {
			for(String s : idList) {
				data += s+",";
			}
		}else {
			data = "null";
		}
	
		return data;
	}
	
	@GetMapping("/searchPassword")
	public String searchPassword() {
		
		return "member/searchPassword";
	}
	
	@PostMapping("/searchPassSendEmail")
	@ResponseBody
	public String searchPassSendEmail(String email) throws NoSuchAlgorithmException {
		SHA256 sha256 = new SHA256();
		MemberVO user = signInService.getMember(email);
		String data = "";
		if(user != null) {
			data = System.currentTimeMillis()+""+(int)(Math.random()*1000000)+RandomStringUtils.randomAlphanumeric(5);
			signInService.insertSearchPassAuth(email,sha256.encrypt(data));
			data = sha256.encrypt(data);
			return data;
		}else if(user == null) {
			data = "null";
		}
		return data;
	}
	
	@GetMapping("/searchPassEmail")
	public String searchPassEmail(@RequestParam(value="key") String key, Model model) {
		String id = signInService.searchPassGetId(key);
		if(id != null) {
			model.addAttribute("userid",id);
			return "member/searchPassChangePass";
		}
		return "member/errorPage";
	}
	
	@PostMapping("/searchPassChangePass")
	public String searchPassChangePass(@RequestParam(value = "id") String id,@RequestParam(value = "newPass") String password, HttpSession session) {
		int result = signInService.searchPassChange(id, password);
		if(result == 1) {
			return "redirect:/signIn";
		}
		return "member/errorPage";
	}
	
	@GetMapping("/dibsOnList")
	public String dibsOnList(HttpSession session,Model model) {
		MemberVO member = (MemberVO)session.getAttribute("user");
		model.addAttribute("dibsOnList",signInService.getDibsOnList(member.getId()));
		return "member/dibsOnList";
	}
	
}
