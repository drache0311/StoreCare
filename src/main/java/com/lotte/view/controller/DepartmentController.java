package com.lotte.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.storecare.department.DepartmentVO;
import com.lotte.storecare.department.impl.DepartmentDAO;

@Controller
public class DepartmentController {
	// 글 등록
	@RequestMapping("/insertDepartment.do")
	public String insertDepartment(DepartmentVO vo, DepartmentDAO departmentDAO) {
		departmentDAO.insertDepartment(vo);
		return "getDepartmentList.do";
	}

	// 글 수정
	@RequestMapping("/updateDepartment.do")
	public String updateDepartment(DepartmentVO vo, DepartmentDAO departmentDAO) {
		departmentDAO.updateDepartment(vo);
		return "getDepartmentList.do";
	}

	// 글 삭제
	@RequestMapping("/deleteDepartment.do")
	public String deleteDepartment(DepartmentVO vo, DepartmentDAO departmentDAO) {
		departmentDAO.deleteDepartment(vo);
		return "getDepartmentList.do";
	}

	// 글 상세 조회
	@RequestMapping("/getDepartment.do")
	public ModelAndView getDepartment(DepartmentVO vo, DepartmentDAO departmentDAO, ModelAndView mav) {
		mav.addObject("department", departmentDAO.getDepartment(vo)); // Model 정보 저장
		mav.setViewName("selectProcess"); // View 정보 저장
		// mav 이거 jsp 보여주는게 아니고 다시 requestMapping잡아서 return해줘야 jsp 보여줌
		return mav;
	}

	// 글 목록 검색
	@RequestMapping("/getDepartmentList.do")
	public ModelAndView getDepartmentList(DepartmentVO vo, DepartmentDAO departmentDAO, ModelAndView mav) {
		mav.addObject("departmentList", departmentDAO.getDepartmentList(vo)); // Model 정보 저장
		mav.setViewName("selectProcess"); // View 정보 저장
		return mav;
	}
}
