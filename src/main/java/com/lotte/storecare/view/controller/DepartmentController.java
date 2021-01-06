package com.lotte.storecare.view.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.lotte.storecare.department.service.DepartmentService;
import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentVO;

@Controller
public class DepartmentController {
	
	@Inject
	private DepartmentService service;
	@Inject
	private DepartmentService departmentService;
	
	// 글 등록
	@RequestMapping("/insertDepartment.do")
	public String insertDepartment(DepartmentVO vo) {
		service.insertDepartment(vo);
		return "getDepartmentList.do";
	}

	// 글 수정
	@RequestMapping("/updateDepartment.do")
	public String updateDepartment(DepartmentVO vo) {
		service.updateDepartment(vo);
		return "getDepartmentList.do";
	}

	// 글 삭제
	@RequestMapping("/deleteDepartment.do")
	public String deleteDepartment(DepartmentVO vo) {
		service.deleteDepartment(vo);
		return "getDepartmentList.do";
	}

	// 층 수 조회
	@RequestMapping("/checkBoard.do")
	public ModelAndView getFloor(BoardVO vo, ModelAndView mav) {
		
		List<DepartmentVO> depList = departmentService.selectAll();
		mav.addObject("departmentList", depList); // Model 정보 저장
		
		mav.addObject("board", service.selectFloor(vo)); // Model 정보 저장
		mav.setViewName("checkBoard"); // View 정보 저장
		return mav;
	}
	
	
	
	// 백화점 목록 검색
	@RequestMapping("/getDepartmentList.do")
	public ModelAndView getDepartmentList(ModelAndView mav) {
		List<DepartmentVO> vo = service.selectAll();
		mav.addObject("departmentList", vo); // Model 정보 저장
		mav.setViewName("selectProcess"); // View 정보 저장
		return mav;
	}

}
