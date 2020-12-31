package com.lotte.storecare.view.controller;


import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.lotte.storecare.problem.service.ProblemService;


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
}
