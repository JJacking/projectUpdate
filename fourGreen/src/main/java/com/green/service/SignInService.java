package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.dao.MemberDAO;
import com.green.vo.ChargeVO;
import com.green.vo.DibsOnVO;
import com.green.vo.MemberVO;

@Service
public class SignInService {

	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO getUser(MemberVO m) {
		MemberVO member = memberDAO.getUser(m);
		if(member!=null&&member.getPassword().equals(m.getPassword())) {
			return member;
		}
		return null;
	}
	
	public MemberVO getMember(String email) {
		return memberDAO.getMember(email);
	}
	
	public int registerByGoogle(String email, String nickname) {
		return memberDAO.registerByGoogle(email, nickname);
	}

	public int registerGoogleUserInfo(String phone, String address, String id) {
		return memberDAO.registerGoogleUserInfo(phone, address, id);
	}
	
	public void deleteMember(String userId) {
		memberDAO.deleteMember(userId);
	}

	public void updateMember(MemberVO member) {
		memberDAO.updateMember(member);
	}

	public int updatePassword(String newPassword, String id) {
		int result = memberDAO.updatePassword(newPassword, id);
		return result;
	}

	public void insertSearchPassAuth(String email, String encrypt) {
		memberDAO.insertSearchPassAuth(email, encrypt);
	}
	
	public String searchPassGetId(String key) {
		return memberDAO.searchPassGetId(key);
	}

	public int searchPassChange(String id, String password) {
		return memberDAO.searchPassChange(id, password);
	}

	public List<String> getMemberIdList(String phone) {
		List<String> idList = memberDAO.getMemberIdList(phone);
		return idList;
	}
	
	public void withdrawDeleteCharge(String id) {
		memberDAO.withdrawDeleteCharge(id);
	}

	public List<DibsOnVO> getDibsOnList(String id) {
		return memberDAO.getDibsOnList(id);
	}

	public List<ChargeVO> json(String sort, String filter){
		return memberDAO.json(sort, filter);
	}
}
