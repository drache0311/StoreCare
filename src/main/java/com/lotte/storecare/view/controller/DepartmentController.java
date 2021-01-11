package com.lotte.storecare.view.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.lotte.storecare.department.service.DepartmentService;
import com.lotte.storecare.user.service.UserService;
import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentVO;

@Controller
public class DepartmentController {
	
	@Inject
	private DepartmentService service;
	@Inject
	private UserService userService;
	
	// 백화점 및 관리자 등록
	@RequestMapping("/insertDepartment.do")
	public String insertDepartment(DepartmentVO vo) {
//		service.insertDepartment(vo);
		
		service.insertDepartment(vo);
		userService.insertAdmin(vo);
		
		return "getDepartmentList";
	}

	// 백화점 및 관리자 수정
	@RequestMapping("/updateDepartment.do")
	public String updateDepartment(DepartmentVO vo) {
//		service.updateDepartment(vo);
		return "getDepartmentList";
	}

	// 백화점 및 관리자  삭제
	@RequestMapping("/deleteDepartment.do")
	public String deleteDepartment(DepartmentVO vo) {
		
		userService.deleteAdmin(vo);
		service.deleteDepartment(vo);
		return "getDepartmentList";
	}

	// 층 수 조회
	@RequestMapping("/checkBoard.do")
	public ModelAndView getFloor(BoardVO vo, ModelAndView mav) throws UnsupportedEncodingException {
		
		/*String place_detail = URLEncoder.encode(vo.getPlace_detail(), "UTF-8");
		String category_detail = URLEncoder.encode(vo.getCategory_detail(), "UTF-8");
		String problem_detail = URLEncoder.encode(vo.getProblem_detail(), "UTF-8");*/
		
		System.out.println("pl_de"+vo.getPlace_detail());
		System.out.println("pr_de"+vo.getProblem_detail());
		System.out.println("Ca_de"+vo.getCategory_detail());
		
		List<DepartmentVO> depList = service.selectAll();
		mav.addObject("departmentList", depList); // Model 정보 저장
		
		//?place_detail="+place_detail+"&category_detail="+category_detail+"&problem_detail="+problem_detail
		
		mav.addObject("board", service.selectFloor(vo)); // Model 정보 저장
		mav.setViewName("checkBoard"); // View 정보 저장
		return mav;
	}
	
	
	
	// 백화점과 관리자 목록 검색
	@RequestMapping("/getDepartmentList")
	public ModelAndView getDepartmentList(ModelAndView mav) {
		List<DepartmentVO> vo = service.selectDepartmentList();
		mav.addObject("departmentList", vo); // Model 정보 저장
		mav.setViewName("getDepartmentList"); // View 정보 저장
		return mav;
	}
	// 문의 등록 전 백화점 조회
	@RequestMapping("/selectDepartment")
	public ModelAndView selectDepartmentList_POST(BoardVO vo, ModelAndView mav,HttpSession session) {
		
		List<DepartmentVO> depList = service.selectAll();
		mav.addObject("departmentList", depList); // Model 정보 저장
		
		if(session.getAttribute("role").toString().equals("0")) {
			mav.setViewName("adminHead"); // View 정보 저장
			return mav;
		}
		mav.setViewName("selectDepartment"); // View 정보 저장
		return mav;
	}
}
