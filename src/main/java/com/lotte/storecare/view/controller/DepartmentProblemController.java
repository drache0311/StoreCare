package com.lotte.storecare.view.controller;

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


	// 각 점별 문의 뎁스 검색 완료
	@RequestMapping(value="/departmentProblem.do", method=RequestMethod.GET)
	public ModelAndView departmentProblemList_GET(ModelAndView mav, DepartmentProblemVO vo ,HttpSession session) {
		
		String department_department_code = session.getAttribute("department_code").toString();
		
		vo.setDepartment_department_code(department_department_code);
		
		System.out.println("depth =====> "+vo.getDepth()+ "department_department_code = " + vo.getDepartment_department_code() +"problem_code = " + vo.getProblem_problem_code());
		
		mav.addObject("problemList", service.selectDepProblemList(vo)); // Model 정보 저장
		mav.setViewName("departmentProblem"); // View 정보 저장
		return mav;
	}
	// 전체 문의사항 에서 각 점별로 문의사항 등록 
	@RequestMapping("/insertDepartmentProblem.do")
	public String insertDepartmentProblem(HttpServletRequest request) {
		
		//String[] ajaxMsg = request.getParameterValues("valueArr");
		String department_code = request.getParameter("department_code");
		String depth = request.getParameter("depth");
		String[] ajaxMsg;
		String category_code = null;
		String problem_code = null;
		
		if(depth.equals("1")) {
			ajaxMsg = request.getParameterValues("valueArr");
		}else if( depth.equals("2")) {
			ajaxMsg = request.getParameterValues("valueArr");
			category_code = request.getParameter("category_code");
		}else {
			ajaxMsg = request.getParameterValues("valueArr");
			category_code = request.getParameter("category_code");
			problem_code = request.getParameter("problem_code");
		}
		
		
		
		
		HashMap<String,String> paramMap = new HashMap<String,String>();
		
		System.out.println("depth ===================>"+depth.toString());
		

		
		int size = ajaxMsg.length;
		
		for(int i=0;i<size;i++) {
			
			paramMap.put("department_department_code", department_code);	// department_code
			paramMap.put("depth",depth); // depth
			
			if(depth.equals("1")) {
				paramMap.put("category_category_code", ajaxMsg[i]);	// category_code
				System.out.println(paramMap);
				service.insertDepProblem(paramMap);
			}else if( depth.equals("2")) {
				paramMap.put("problem_problem_code", ajaxMsg[i]);	// problem_code
				paramMap.put("category_category_code", category_code);	// category_code
				System.out.println(paramMap);
				service.insertDepProblem(paramMap);
			}else {
				paramMap.put("place_place_code", ajaxMsg[i]);	// place_code
				paramMap.put("category_category_code", category_code);	// category_code
				paramMap.put("problem_problem_code", problem_code);	// category_code
				System.out.println(paramMap);
				service.insertDepProblem(paramMap);
			}
			
			
			
			
			
			
			paramMap.put("category_category_code", ajaxMsg[i]);	// category_code
			System.out.println(paramMap);
			service.insertDepProblem(paramMap);;
		}

		return "sendProblem.do";
	}

	
	
	// 각 점에서 문의사항 삭제 완료
	@RequestMapping("/deleteDepartmentProblem.do")
	public String deleteDepartmentProblem(HttpServletRequest request) {
		System.out.println("딜리트 dep 컨틀롤\n");
		String[] ajaxMsg = request.getParameterValues("valueArr");
		String depth = request.getParameter("depth");
		String department_code = request.getParameter("department_code");
		
		HashMap<String,String> paramMap = new HashMap<String,String>();

		System.out.println("depth ===================>"+depth.toString());
		
		paramMap.put("department_department_code", department_code);
		int size = ajaxMsg.length;
		for(int i=0;i<size;i++) {
			paramMap.put("depth",depth);
			paramMap.put("param", ajaxMsg[i]);
			System.out.println(paramMap);
			service.deleteDepProblem(paramMap);
		}
		
		return "departmentProblem.do?depth=1&department_department_code="+department_code;
	}
}
