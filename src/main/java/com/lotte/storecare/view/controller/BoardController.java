package com.lotte.storecare.view.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.storecare.board.service.BoardService;

import com.lotte.storecare.vo.BoardVO;



@Controller
public class BoardController {
	
	@Inject
	private BoardService service;
	
	
	
	
	// 글 등록 전 페이지 완료
	@RequestMapping(value = "/insertBoard", method=RequestMethod.POST)
	public String insertBoard() {
		System.out.println("여긴 POST");
		return "insertBoard";
	}
	
	// 문의 등록 미안
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) {
		service.insertBoard(vo);
		return "getBoardUserList.do";
	}

	// 문의 수정 완료
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo) {
		service.updateBoard(vo);
		return "getBoardUserList.do";
	}

	// 문의 삭제 완료
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		service.deleteBoard(vo);
		return "getBoardUserList.do";
	}


	

	
	// 유저 문의내역 검색 완료
	@RequestMapping("/getBoardUserList.do")
	public ModelAndView getBoardUserList(ModelAndView mav, HttpSession session, HttpServletRequest request) {
		String id = session.getAttribute("login").toString();
		String searchCondition = request.getParameter("searchCondition");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		// 날짜선택 안할 때 "" 빈값으로 넘어오기 때문에 null로 변경해줌
		if(startDate == "") {
			startDate = null;
		}
		if(endDate == "") {
			endDate = null;
		}
		
		HashMap<String,String> param = new HashMap<String,String>();
		param.put("searchCondition", searchCondition);
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("id", id);
		
		List<BoardVO> vo = service.selectUserBoardList(param);
		mav.addObject("boardUserList", vo); // Model 정보 저장
		mav.setViewName("getBoardUserList"); // View 정보 저장
		return mav;
	}
	
	// 전체 문의내역 목록 검색 완료
	@RequestMapping("/getBoardList.do")
	public ModelAndView getBoardList(ModelAndView mav,  HttpSession session, HttpServletRequest request) {
		String department_code = session.getAttribute("department_code").toString();
		String searchCondition = request.getParameter("searchCondition");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		// 날짜선택 안할 때 "" 빈값으로 넘어오기 때문에 null로 변경해줌
		if(startDate == "") {
			startDate = null;
		}
		if(endDate == "") {
			endDate = null;
		}
		
		
		HashMap<String,String> param = new HashMap<String,String>();
		param.put("searchCondition", searchCondition);
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("department_code", department_code);
		
		System.out.println("HASH MAP - deP_code = "+param.get(department_code));
		List<BoardVO> vo = service.selectBoardList(param);

		mav.addObject("boardList", vo); // Model 정보 저장
		mav.setViewName("admin"); // View 정보 저장
		return mav;
	}
}
