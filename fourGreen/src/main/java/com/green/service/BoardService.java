package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.green.dao.BoardDAO;
import com.green.vo.BoardVO;
import com.green.vo.CommentVO;
import com.green.vo.ManagerVO;

public class BoardService {
	
	
	@Autowired
	private BoardDAO boardDao;
	
	//전체읽어오기
	public List<BoardVO> selectAll(){
		return boardDao.selectAll(); 
	}
	
	//조회수
	public void readCount(int num) {
		boardDao.readCount(num);
	}
	
	//상세보기
	public BoardVO selectByNum(int num) {
		return boardDao.selectByNum(num);
	}
	
	//글쓰기
	public void boardWrite(BoardVO board) {
		boardDao.boardWrite(board);
	}
		
	//글수정
	public void boardUpdate(BoardVO bVo) {
		boardDao.boardUpdate(bVo);
	}
	
	//글삭제
	public void boardDelete(int num) {
		boardDao.boardDelete(num);
	}
	
	//댓글작성
	public void commentWrite(CommentVO cVo) {
		boardDao.commentWrite(cVo);
	}
	
	//댓글읽어오기
	public List<CommentVO> selectTargetComment(int num){
		return boardDao.selectTargetComment(num);
	}
	
	//댓글수정
	public void commentUpdate(CommentVO cVo) {
		boardDao.commentUpdate(cVo);
	}
	
	//댓글삭제
	public void commentDelete(int cno) {
		boardDao.commentDelete(cno);
	}

	//공지사항읽어오기
	public List<ManagerVO> selectAllmanager(){
		return boardDao.selectAllmanager(); 
	}
	
	//공지사항조회수
	public void readCountMgBoard(int mgNum) {
		boardDao.readCountMgBoard(mgNum);
	}
	
	//공지사항상세보기
	public ManagerVO selectByMgNum(int mgNum) {
		return boardDao.selectByMgNum(mgNum);
	}
	
	//공지사항글쓰기
	public void managerWrite(ManagerVO mVo) {
		boardDao.managerWrite(mVo);
	}
		
	//공지사항글수정
	public void managerUpdate(ManagerVO mVo) {
		boardDao.managerUpdate(mVo);
	}
	
	//공지사항글삭제
	public void managerDelete(int mgNum) {
		boardDao.managerDelete(mgNum);
	}
}
