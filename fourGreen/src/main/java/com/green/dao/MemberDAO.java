package com.green.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.vo.ChargeVO;
import com.green.vo.DibsOnVO;
import com.green.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberVO getMember(String email) {
		return sqlSession.selectOne("mybatis.mapper.member.getMember",email);
	}
	
	public int register(MemberVO m) {
		return sqlSession.insert("mybatis.mapper.member.register",m);
	}
	
	public int registerByGoogle(String email, String nickname) {
		String[] array = new String[]{email,nickname};
		return sqlSession.insert("mybatis.mapper.member.registerByGoogle", array);
	}
	
	public int registerGoogleUserInfo(String phone, String address, String id) {
		return sqlSession.update("mybatis.mapper.member.registerGoogleUserInfo", new String[] {phone,address,id});
	}
	
	public void deleteAuth(String email) {
		sqlSession.delete("mybatis.mapper.member.deleteAuth",email);
	}

	public MemberVO getUser(MemberVO m) {
		return sqlSession.selectOne("mybatis.mapper.member.getUser",m);
	}

	public int authCheck(String key) {
		return sqlSession.update("mybatis.mapper.member.authCheck",key);
	}

	public String getAuth(String email) {
		return sqlSession.selectOne("mybatis.mapper.member.getAuth",email);
	}

	public void insertAuth(String email, String key) {
		deleteAuth(email);
		sqlSession.insert("mybatis.mapper.member.insertAuth", new String[] {email, key});
	}

	public void removeAuth(String email) {
		deleteAuth(email);
	}

	public void deleteMember(String email) {
		sqlSession.delete("mybatis.mapper.member.deleteMember",email);
	}

	public void updateMember(MemberVO member) {
		sqlSession.update("mybatis.mapper.member.updateMember",member);
	}

	public int updatePassword(String newPassword, String id) {
		String[] array = {newPassword, id};
		return sqlSession.update("mybatis.mapper.member.updatePassword",array);
	}

	public void insertSearchPassAuth(String email, String encrypt) {
		String[] array = {email, encrypt};
		sqlSession.insert("mybatis.mapper.member.insertSearchPassAuth", array);
	}
	
	public String searchPassGetId(String key) {
		String id = sqlSession.selectOne("mybatis.mapper.member.searchPassGetId",key);
		deletesearchPassAuth(key);
		return id;
	}
	
	public void deletesearchPassAuth(String key) {
		sqlSession.delete("mybatis.mapper.member.deletesearchPassAuth",key);
	}

	public int searchPassChange(String id, String password) {
		int result = updatePassword(password, id);
		return result;
	}

	public List<String> getMemberIdList(String phone) {
		return sqlSession.selectList("mybatis.mapper.member.getMemberIdList",phone);
	}

	public List<ChargeVO> getChargeList(){
		return sqlSession.selectList("mybatis.mapper.member.getChargeList");
	}
	
	public ChargeVO getChargeInfoByIdx(int idx){
		System.out.println("getChargeInfoByIdx");
		ChargeVO vo =  sqlSession.selectOne("mybatis.mapper.member.getChargeInfoByIdx",idx);
		System.out.println(vo.getIdx()+"/"+vo.getPoint());
		return vo;
	}

	public int chargePointByUserId(String id, long point) {
		return sqlSession.update("mybatis.mapper.member.chargePointByUserId",new Object[]{point, id});
	}
	
	public int chargeSuccess(int idx) {
		return sqlSession.update("mybatis.mapper.member.chargeSuccess",idx);
	}

	public void requestChargePoint(String id, long charge) {
		ChargeVO chargeVO = new ChargeVO();
		chargeVO.setId(id);
		chargeVO.setPoint(charge);
		sqlSession.insert("mybatis.mapper.member.requestChargePoint",chargeVO);
	}
	
	public void withdrawDeleteCharge(String id) {
		sqlSession.delete("mybatis.mapper.member.withdrawDeleteCharge",id);
	}

	public List<ChargeVO> getChargeListWithPaging(int startNum) {
		return sqlSession.selectList("mybatis.mapper.member.getChargeListWithPaging",startNum);
	}

	public int getChargeTotalCount() {
		return sqlSession.selectOne("mybatis.mapper.member.getTotalCount");
	}

	public List<DibsOnVO> getDibsOnList(String id) {
		return sqlSession.selectOne("mybatis.mapper.member.getDibsOnList",id);
	}
	
	public List<ChargeVO> json(String sort, String filter){
		String[] array = {sort,filter};
		return sqlSession.selectList("mybatis.mapper.member.json",array);
	}
	
}




