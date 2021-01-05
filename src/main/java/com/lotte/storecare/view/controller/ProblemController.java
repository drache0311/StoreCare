package com.lotte.storecare.view.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.lotte.storecare.problem.service.ProblemService;
import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.ProblemVO;


@Controller
public class ProblemController {
	
	@Inject
	private ProblemService service;
	
	// 문의사항 등록 완료
	@RequestMapping("/insertProblem.do")
	public String insertProblem(ProblemVO vo) {
		service.insertProblem(vo);
		return "updateProblem.do";
	}

	// 문의사항 뎁스들 조회 ==> 사용자 측에서 지금 사용 중
	@RequestMapping("/getProblemList.do")
	public ModelAndView getProblemList(ModelAndView mav) {
		mav.addObject("problemList", service.selectProblemList()); // Model 정보 저장
		mav.setViewName("insertBoard"); // View 정보 저장
		return mav;
	}
	
	// 문의 뎁스 검색 완료
	@RequestMapping(value="/updateProblem.do", method=RequestMethod.GET)
	public ModelAndView updateProblemList_GET(ModelAndView mav, ProblemVO vo) {
		
		System.out.println("depth =====> "+vo.getDepth()+ "category_code = " + vo.getCategory_code() +"problem_code = " + vo.getProblem_code());
		
//		// 뎁스1 선택한 상황이라면 뎁스2로 바꿈 // 뎁스1,2 선택한 상황이라면 뎁스3으로 바꿈
//		if(vo.getCategory_code() != null && vo.getProblem_code() == null) {
//			vo.setDepth(2);
//		}else if(vo.getProblem_code() != null) {
//			vo.setDepth(3);
//		}
		System.out.println("depth =====> "+vo.getDepth()+ "category_code = " + vo.getCategory_code() +"problem_code = " + vo.getProblem_code());
		
		mav.addObject("problemList", service.selectProblemListTest(vo)); // Model 정보 저장
		mav.setViewName("updateProblem"); // View 정보 저장
		return mav;
	}
	
	// 문의사항 수정 
	@RequestMapping("/fixProblem.do")
	public String updateProblem(HttpServletRequest request) {
		System.out.println("fix 컨틀롤\n");
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		String depth = request.getParameter("depth");
		String detail = request.getParameter("detail");
		String category_detail = request.getParameter("category_detail");
		String problem_detail = request.getParameter("problem_detail");
		String place_detail = request.getParameter("place_detail");

		
		HashMap<String,String> paramMap = new HashMap<String,String>();
		
		System.out.println("depth ===================>"+depth.toString());
		
		paramMap.put("category_detail",category_detail);
		paramMap.put("problem_detail",problem_detail);
		paramMap.put("place_detail",place_detail);
		paramMap.put("detail", detail);
		
		int size = ajaxMsg.length;
		for(int i=0;i<size;i++) {
			paramMap.put("depth",depth);
			paramMap.put("param", ajaxMsg[i]);
			System.out.println(paramMap);
			service.updateProblem(paramMap);;
		}
		
		return "updateProblem.do";
	}
	
	// 문의사항 삭제 완료
	@RequestMapping("/deleteProblem.do")
	public String deleteProblem(HttpServletRequest request) {
		System.out.println("딜리트 컨틀롤\n");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		String depth = request.getParameter("depth");
		HashMap<String,String> paramMap = new HashMap<String,String>();

		System.out.println("depth ===================>"+depth.toString());
		
		int size = ajaxMsg.length;
		for(int i=0;i<size;i++) {
			paramMap.put("depth",depth);
			paramMap.put("param", ajaxMsg[i]);
			System.out.println(paramMap);
			service.deleteProblem(paramMap);
		}
		
		return "updateProblem.do";
	}
	
	
	
	
}
