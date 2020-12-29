package com.lotte.storecare.view.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.storecare.board.BoardVO;
import com.lotte.storecare.board.impl.BoardDAO;
import com.lotte.storecare.department.DepartmentVO;
import com.lotte.storecare.department.impl.DepartmentDAO;


@Controller
public class BoardController {
	
	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;
	
	
	
	
	// 글 등록 전 페이지 완료
	@RequestMapping(value = "/insertBoard", method=RequestMethod.POST)
	public String insertBoard() {
		System.out.println("여긴 POST");
		return "insertBoard";
	}
	
	// 글 등록 완료
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo, BoardDAO boardDAO) {
		boardDAO.insertBoard(vo);
		return "getBoardUserList.do";
	}

	// 글 수정 완료
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
		return "getBoardUserList.do";
	}

	// 글 삭제 미완
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, BoardDAO boardDAO) {
		boardDAO.deleteBoard(vo);
		return "getBoardUserList.do";
	}

	// 글 상세 조회 미완
	@RequestMapping("/getBoard.do")
	public ModelAndView getBoard(BoardVO vo, BoardDAO boardDAO, ModelAndView mav) {
		mav.addObject("board", boardDAO.getBoard(vo)); // Model 정보 저장
		mav.setViewName("getBoard"); // View 정보 저장
		return mav;
	}
	
	// 글 상세 조회 미완
	@RequestMapping("/checkBoard.do")
	public ModelAndView getFloor(BoardVO vo, BoardDAO boardDAO, ModelAndView mav) {
		mav.addObject("board", boardDAO.getFloor(vo)); // Model 정보 저장
		mav.setViewName("checkBoard"); // View 정보 저장
		return mav;
	}
	
	// 유저 문의내역 검색 완료
	@RequestMapping("/getBoardUserList.do")
	public ModelAndView getBoardUserList(ModelAndView mav, HttpSession session) {
		String id = (String) session.getAttribute("login");
		List<BoardVO> vo = boardDAO.selectUserBoardList(id);
		mav.addObject("boardUserList", vo); // Model 정보 저장
		mav.setViewName("getBoardUserList"); // View 정보 저장
		return mav;
	}
	
	// 전체 문의내역 목록 검색 완료
	@RequestMapping("/getBoardList.do")
	public ModelAndView getBoardList(BoardVO vo, BoardDAO boardDAO, ModelAndView mav, HttpSession session) {
		mav.addObject("boardList", boardDAO.getBoardList(vo, session)); // Model 정보 저장
		mav.setViewName("admin"); // View 정보 저장
		return mav;
	}
}
