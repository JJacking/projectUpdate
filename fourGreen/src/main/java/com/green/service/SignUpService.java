package com.green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.dao.MemberDAO;
import com.green.vo.MemberVO;

@Service
public class SignUpService {

	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO getMember(String email) {
		MemberVO member = memberDAO.getMember(email);
		return member;
	}
	
	public int register(MemberVO member) {
		int cnt = memberDAO.register(member);
		return cnt;
	}

	public int authCheck(String key) {
		int cnt = memberDAO.authCheck(key);
		return cnt;
	}

	public String getAuth(String email) {
		String auth = memberDAO.getAuth(email);
		return auth;
	}

	public void insertAuth(String email, String encrypt) {
		memberDAO.insertAuth(email,encrypt);
	}

	public void removeAuth(String email) {
		memberDAO.removeAuth(email);
	}


}
