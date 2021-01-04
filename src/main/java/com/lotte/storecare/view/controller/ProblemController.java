package com.lotte.storecare.view.controller;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.lotte.storecare.problem.service.ProblemService;
import com.lotte.storecare.vo.ProblemVO;


@Controller
public class ProblemController {
	
	@Inject
	private ProblemService service;
	

	// 문의 뎁스들 조회
	@RequestMapping("/getProblemList.do")
	public ModelAndView getProblemList(ModelAndView mav) {
		mav.addObject("problemList", service.selectProblemList()); // Model 정보 저장
		mav.setViewName("insertBoard"); // View 정보 저장
		return mav;
	}
	
	// 문의 뎁스 수정
	@RequestMapping(value="/updateQuestion.do", method=RequestMethod.GET)
	public ModelAndView updateProblemList_GET(ModelAndView mav, HttpServletRequest request) {
		String depth = request.getParameter("depth");
		String category_code = request.getParameter("category_code");
		String problem_code = request.getParameter("problem_code");
		
		System.out.println("category_code = " + category_code +"problem_code = " + problem_code);
		if(category_code != null && problem_code == null) {
			depth="2";
		}else if(problem_code != null) {
			depth="3";
		}

		HashMap<String,String> param = new HashMap<String,String>();
		param.put("depth", depth);
		param.put("category_code", category_code);
		param.put("problem_code", problem_code);
		
		
		mav.addObject("problemList", service.selectProblemListTest(param)); // Model 정보 저장
		mav.setViewName("updateQuestion"); // View 정보 저장
		return mav;
	}
	
}
