package com.lotte.storecare.view.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.lotte.storecare.department.service.DepartmentService;
import com.lotte.storecare.departmentProblem.service.DepartmentProblemService;
import com.lotte.storecare.user.service.UserService;
import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentProblemVO;
import com.lotte.storecare.vo.DepartmentVO;
import com.lotte.storecare.vo.ProblemVO;

@Controller
public class DepartmentProblemController {
	
	@Inject
	private DepartmentProblemService service;
	@Inject
	private UserService userService;


	// 문의 뎁스 검색 완료
	@RequestMapping(value="/departmentProblem.do", method=RequestMethod.GET)
	public ModelAndView departmentProblemList_GET(ModelAndView mav, DepartmentProblemVO vo) {
		
		System.out.println("depth =====> "+vo.getDepth()+ "category_code = " + vo.getCategory_code() +"problem_code = " + vo.getProblem_code());
		
//		// 뎁스1 선택한 상황이라면 뎁스2로 바꿈 // 뎁스1,2 선택한 상황이라면 뎁스3으로 바꿈
//		if(vo.getCategory_code() != null && vo.getProblem_code() == null) {
//			vo.setDepth(2);
//		}else if(vo.getProblem_code() != null) {
//			vo.setDepth(3);
//		}

		mav.addObject("problemList", service.selectProblemList(vo)); // Model 정보 저장
		mav.setViewName("updateProblem"); // View 정보 저장
		return mav;
	}


}
