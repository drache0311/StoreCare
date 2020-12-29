package com.lotte.storecare.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.storecare.problem.ProblemVO;
import com.lotte.storecare.problem.impl.ProblemDAO;

@Controller
public class ProblemController {
	// 글 등록
	@RequestMapping("/insertProblem.do")
	public String insertProblem(ProblemVO vo, ProblemDAO problemDAO) {
		problemDAO.insertProblem(vo);
		return "getProblemList.do";
	}

	// 글 수정
	@RequestMapping("/updateProblem.do")
	public String updateProblem(ProblemVO vo, ProblemDAO problemDAO) {
		problemDAO.updateProblem(vo);
		return "getProblemList.do";
	}

	// 글 삭제
	@RequestMapping("/deleteProblem.do")
	public String deleteProblem(ProblemVO vo, ProblemDAO problemDAO) {
		problemDAO.deleteProblem(vo);
		return "getProblemList.do";
	}

	// 글 상세 조회
	@RequestMapping("/getProblem.do")
	public ModelAndView getProblem(ProblemVO vo, ProblemDAO problemDAO, ModelAndView mav) {
		mav.addObject("problem", problemDAO.getProblem(vo)); // Model 정보 저장
		mav.setViewName("selectProcess"); // View 정보 저장
		// mav 이거 jsp 보여주는게 아니고 다시 requestMapping잡아서 return해줘야 jsp 보여줌
		return mav;
	}

	// 글 목록 검색
	@RequestMapping("/getProblemList.do")
	public ModelAndView getProblemList(ProblemVO vo, ProblemDAO problemDAO, ModelAndView mav) {
		mav.addObject("problemList", problemDAO.getProblemList(vo)); // Model 정보 저장
		mav.setViewName("insertBoard"); // View 정보 저장
		return mav;
	}
}
