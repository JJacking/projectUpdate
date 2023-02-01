package com.green.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.green.vo.BoardVO;
import com.green.vo.CommentVO;
import com.green.vo.ManagerVO;

public class BoardDAO {
	
//------------------------------------------------------------
	@Autowired
	private SqlSession sqlSession;

//-----------------------------------------------------------
	//게시판 전체
	public List<BoardVO> selectAll(){
		return sqlSession.selectList("mybatis.mapper.board.selectAll");
	}
	
	//상세게시판
	public BoardVO selectByNum(int num) {
		return sqlSession.selectOne("mybatis.mapper.board.selectByNum",num);
	}
	
	//조회수증가
	public void readCount(int num) {
		sqlSession.selectOne("mybatis.mapper.board.readCount",num);
	}
	
	//게시판등록
	public void boardWrite(BoardVO bVo) {
		sqlSession.insert("mybatis.mapper.board.boardWrite",bVo);
	}
	
	//게시판 수정
	public void boardUpdate(BoardVO bVo) {
		sqlSession.update("mybatis.mapper.board.boardUpdate",bVo);
	}
	
	//게시판 삭제
	public void boardDelete(int num) {
		sqlSession.delete("mybatis.mapper.board.boardDelete",num);
	}
	
	//댓글등록
	public void commentWrite(CommentVO cVo) {
		sqlSession.insert("mybatis.mapper.comment.commentWrite",cVo);
	}
	
	//댓글불러오기
	public List<CommentVO> selectTargetComment(int num) {
		return sqlSession.selectList("mybatis.mapper.comment.selectTargetComment",num);
	}
	
	
	//댓글수정
	public void commentUpdate(CommentVO cVo) {
		sqlSession.update("mybatis.mapper.comment.commentUpdate",cVo);
	}
	
	//댓글삭제
	public void commentDelete(int cno) {
		sqlSession.delete("mybatis.mapper.comment.commentDelete",cno);
	}
	
	//공지사항읽어오기(관리자페이지)
	public List<ManagerVO> selectAllmanager(){
		return sqlSession.selectList("mybatis.mapper.manager.selectAllmanager");
	}
	
	//상세게시판(관리자페이지)
	public ManagerVO selectByMgNum(int mgNum) {
		return sqlSession.selectOne("mybatis.mapper.manager.selectByMgNum", mgNum);
	}

	//조회수증가(관리자페이지)
	public void readCountMgBoard(int mgNum) {
		sqlSession.selectOne("mybatis.mapper.manager.readCountMgBoard", mgNum);
	}
	
	//게시판등록(관리자페이지)
	public void managerWrite(ManagerVO mVo) {
		sqlSession.insert("mybatis.mapper.board.boardWrite",mVo);
	}
	
	//게시판 수정(관리자페이지)
	public void managerUpdate(ManagerVO mVo) {
		sqlSession.update("mybatis.mapper.board.boardUpdate",mVo);
	}
	
	//게시판 삭제(관리자페이지)
	public void managerDelete(int mgNum) {
		sqlSession.delete("mybatis.mapper.board.boardDelete",mgNum);
	}
}

