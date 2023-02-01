package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.service.BoardService;
import com.green.vo.BoardVO;
import com.green.vo.CommentVO;
import com.green.vo.ManagerVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	//전체게시판
	@RequestMapping("/boardList")
	public String list(Model model) {
		List<BoardVO> list = boardService.selectAll();
		model.addAttribute("list", list);
	
		return "board/boardList";
	}
	
	//상세게시판(상세글+댓글불러오기)
	@RequestMapping("/boardDetail")
	public ModelAndView boardDetail(@RequestParam int num ,Model model) {
		boardService.readCount(num);
		List<CommentVO> lists = boardService.selectTargetComment(num);
		BoardVO board = boardService.selectByNum(num);
		model.addAttribute("lists",lists);
		return new ModelAndView("board/boardDetail","board", board);
	}
	
	//게시판쓰기
	@GetMapping("/boardWrite")
	public String boardWrite(/*@ModelAttribute BoardVo board*/) {
//		boardDao.boardWrite(board);
		return "board/boardWrite";
	}
	
	//게시판쓰기
	@PostMapping("/boardWrite")
	public String boardWrite2(@ModelAttribute BoardVO board) {
		boardService.boardWrite(board);
		return "redirect:/boardList";
	}
	
	//게시판수정
	@GetMapping("/boardUpdate")
	public String boardUpdate(Model model,@RequestParam int num) {
		BoardVO board = boardService.selectByNum(num);
		model.addAttribute("board",board);
		return "board/boardUpdateForm";
	}
	
	//게시판수정
	@PostMapping("/boardUpdate")
	public String boardUpdate(@ModelAttribute BoardVO bVo,@RequestParam int num,Model model) {
		boardService.boardUpdate(bVo);
		model.addAttribute("num",num);
		return "redirect:/boardDetail";
	}
	
	//게시판삭제
	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam int num) {
		boardService.boardDelete(num);
		return "redirect:/boardList";
	}
	
	//댓글쓰기
	@PostMapping("/commentWrite")
	public String commentWrite(@ModelAttribute CommentVO cVo,Model model,@RequestParam int num) {
		boardService.commentWrite(cVo);
		model.addAttribute("num",num);
		return "redirect:/boardDetail";
	}
		
	//댓글수정
	@GetMapping("/commentUpdate")
	public String commentUpdate(Model model,@RequestParam int cno) {
		List<CommentVO> lists = boardService.selectTargetComment(cno);
		//System.out.println("num : " + num );
		model.addAttribute("lists",lists);
		return "board/commentUpdate";
	}
	
	@PostMapping("/commentUpdate")
	@ResponseBody
	public String commentUpdate(@RequestParam String nickname,@ModelAttribute CommentVO cVo,@RequestParam int num,Model model) {
		boardService.commentUpdate(cVo);
		model.addAttribute("num",num);
		return "redirect:/boardDetail";
	}
	
	//댓글 삭제
	@RequestMapping("/commentDelete")
	public String commentDelete(@RequestParam int cno,@RequestParam int num,Model model) {
		boardService.commentDelete(cno);
		model.addAttribute("num",num);
		return "redirect:/boardDetail";
	}
	
	//관리자게시판(공지사항)
	@RequestMapping("/managerBoardList")
	public String manager(Model model) {
		List<ManagerVO> manager = boardService.selectAllmanager();
		model.addAttribute("manager", manager);
		return "board/managerBoardList";
	}
	
	//관리자상세게시판(상세글)
	@RequestMapping("/managerDetail")
	public ModelAndView managerDetail(@RequestParam int mgNum ,Model model) {
		boardService.readCountMgBoard(mgNum);
		ManagerVO mVo = boardService.selectByMgNum(mgNum);
		return new ModelAndView("board/managerDetail","mVo", mVo);
	}
	
	//공지사항쓰기
	@GetMapping("/managerWrite")
	public String managerWrite() {
		return "board/managerWrite";
	}
	
	//공지사항쓰기
	@PostMapping("/managerWrite")
	public String managerWrite2(@ModelAttribute ManagerVO mVo) {
		boardService.managerWrite(mVo);
		return "redirect:/managerBoardList";
	}
	
	//게시판수정
	@GetMapping("/managerUpdate")
	public String managerUpdate(Model model,@RequestParam int mgNum) {
		ManagerVO mVo = boardService.selectByMgNum(mgNum);
		model.addAttribute("mVo",mVo);
		return "board/managerUpdateForm";
	}
	
	//게시판수정
	@PostMapping("/managerUpdate")
	public String ManagerUpdate(@ModelAttribute ManagerVO mVo,@RequestParam int mgNum,Model model) {
		boardService.managerUpdate(mVo);
		model.addAttribute("MgNum",mgNum);
		return "redirect:/managerDetail";
	}
	
	//공지사항삭제
	@RequestMapping("/managerDelete")
	public String managerDelete(@RequestParam int mgNum) {
		boardService.managerDelete(mgNum);
		return "redirect:/managerBoardList";
	}
	
	
	//페이징 삭제시
}
