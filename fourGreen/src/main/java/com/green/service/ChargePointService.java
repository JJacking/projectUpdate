package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.dao.MemberDAO;
import com.green.vo.ChargeVO;

@Service
public class ChargePointService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public List<ChargeVO> getChargeList(){
		return memberDAO.getChargeList();
	}
	
	public int chargePointByUserId(String id, long point) {
		int result = memberDAO.chargePointByUserId(id,point);
		return result;
	}
	
	public ChargeVO getChargeInfoByIdx(int idx) {
		return memberDAO.getChargeInfoByIdx(idx);
	}
	
	public int chargeSuccess(int idx) {
		return memberDAO.chargeSuccess(idx);
	}

	public void requestChargePoint(String id, long charge) {
		memberDAO.requestChargePoint(id,charge);
	}

	public int getTotalCount() {
		return memberDAO.getChargeTotalCount();
	}

	public List<ChargeVO> getChargeListWithPaging(int startNum) {
		return memberDAO.getChargeListWithPaging(startNum);
	}
}
