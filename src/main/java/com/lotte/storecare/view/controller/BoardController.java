﻿package com.lotte.storecare.view.controller;


import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.lotte.storecare.board.service.BoardService;
import com.lotte.storecare.commons.Criteria;
import com.lotte.storecare.commons.PageMaker;
import com.lotte.storecare.department.service.DepartmentService;
import com.lotte.storecare.departmentProblem.service.DepartmentProblemService;
import com.lotte.storecare.problem.service.ProblemService;
import com.lotte.storecare.user.service.UserService;
import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentProblemVO;
import com.lotte.storecare.vo.DepartmentVO;
import com.lotte.storecare.vo.ProblemVO;
import com.lotte.storecare.vo.UserVO;



@Controller
public class BoardController {
	
	@Inject
	private BoardService service;
	
	@Inject
	private DepartmentProblemService departmentProblemService;

	@Inject
	private DepartmentService departmentService;
	
	// 문의 등록 GET
	@RequestMapping(value="/insertBoard", method=RequestMethod.GET)
	public ModelAndView INSERTBOARD_GET(ModelAndView mav, DepartmentProblemVO vo) {			
		System.out.println("depth =====> "+vo.getDepth()+ "category_code = " + vo.getCategory_code() +"problem_code = " + vo.getProblem_problem_code());
		System.out.println("여긴 insertBoard GET");
		mav.addObject("problemList", departmentProblemService.selectDepProblemList(vo)); // Model 정보 저장
		mav.addObject("departmentName",departmentService.selectDepartment(vo.getDepartment_department_code()));

		mav.setViewName("insertBoard"); // View 정보 저장
		return mav;
	}
	// 문의 등록 POST
	@RequestMapping(value="/insertBoard", method=RequestMethod.POST)
	public ModelAndView INSERTBOARD_POST(ModelAndView mav, DepartmentProblemVO vo) {			
		System.out.println("depth =====> "+vo.getDepth()+ "category_code = " + vo.getCategory_code() +"problem_code = " + vo.getProblem_problem_code());
		System.out.println("여긴 insertBoard POST");
		System.out.println("dep_code = "+ vo.getDepartment_department_code());
		mav.addObject("problemList", departmentProblemService.selectDepProblemList(vo)); // Model 정보 저장
		mav.addObject("departmentName",departmentService.selectDepartment(vo.getDepartment_department_code()));
		mav.setViewName("insertBoard"); // View 정보 저장
		return mav;
	}
	// 문의 등록  DO
	@RequestMapping(value="/insertBoard.do", method=RequestMethod.GET)
	public String INSERTBOARDTEMPDO_GET(BoardVO vo) {
		System.out.println("zzzzzzzzzzzzzzzzzzzz"+vo.getPlace_place_code());
	
		service.insertBoard(vo);

		return "getBoardUserList.do";
	}	
	

	// 문의 수정 완료
	@RequestMapping("/updateUserBoard.do")
	public String updateBoard(BoardVO vo) {
		System.out.println("VO=>>>>>>>>>>>>>>>>>>>>>>>>>>"+vo.getDepartment_department_name());
		service.updateBoard(vo);
		return "getBoardUserList.do";
	}
	
	// 문의 처리 완료
	@RequestMapping("/updateBoard.do")
	public String deleteBoard(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0;i<size;i++) {
			service.updateBoard(ajaxMsg[i]);
		}
		return "getBoardList.do";
	}
	
	// 문의 삭제 완료
	@RequestMapping("/deleteUserBoard.do")
	public String deleteUserBoard(BoardVO vo) {
		service.deleteBoard(vo);
		return "getBoardUserList.do";
	}
	


	

	
	// 유저 문의내역 검색 완료
	@RequestMapping("/getBoardUserList.do")
	public ModelAndView getBoardUserList(ModelAndView mav, HttpSession session, HttpServletRequest request, Criteria cri) {
		
		session.setAttribute("searchCondition",request.getParameter("searchCondition"));
		session.setAttribute("startDate",request.getParameter("startDate"));
		session.setAttribute("endDate",request.getParameter("endDate"));
		
		String id = session.getAttribute("login").toString();
		String searchCondition = "all";
		String startDate = "";
		String endDate = "";
		
		
		// searchCondition 설정
		if(session.getAttribute("searchCondition") != null) {
			searchCondition = session.getAttribute("searchCondition").toString();
			startDate = session.getAttribute("startDate").toString();
			endDate = session.getAttribute("endDate").toString();
		}
		
		// 날짜선택 안할 때 "" 빈값으로 넘어오기 때문에 null로 변경해줌
		if(startDate == "") {
			startDate = null;
		}
		if(endDate == "") {
			endDate = null;
		}
		
		//
		//
		//
		cri.setId(id);
		cri.setEndDate(endDate);
		cri.setSearchCondition(searchCondition);
		cri.setStartDate(startDate);
		cri.setDepartment_code("0");
		System.out.println("ddddddddddddddddddddd "+cri.getPage());
        //현재 페이지에 해당하는 게시물을 조회해 옴 
		List<BoardVO> vo = service.selectUserBoardList(cri);
		
		System.out.println(vo);
		System.out.println(cri.getPageStart());
		System.out.println("StartDate = "+cri.getStartDate() + "EndDate = "+cri.getEndDate() + "\n");
		
		//모델에 추가
		mav.addObject("boardUserList",vo); // boardList -> list check
        //PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
        //전체 게시물 수를 구함
		int totalCount = service.getTotalCount(cri);
        //pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
        //모델에 추가
		mav.addObject("pageMaker", pageMaker);

		
		//
		//
		//

		mav.setViewName("getBoardUserList"); // View 정보 저장
		return mav;
	}
	
	// 	// 관리자들은 직접 주소를 입력해 들어온다. + 관리자 문의내역 및 페이징
	@RequestMapping("/getBoardList.do")
	public ModelAndView getBoardList_GET(ModelAndView mav,  HttpSession session, HttpServletRequest request,Criteria cri) {
		


			session.setAttribute("searchCondition",request.getParameter("searchCondition"));
			session.setAttribute("startDate",request.getParameter("startDate"));
			session.setAttribute("endDate",request.getParameter("endDate"));
			session.setAttribute("searchId", request.getParameter("searchId"));
			String role="";
			String department_code ="0";
			String searchCondition = "all";
			String startDate = "";
			String endDate = "";
			String searchId = "all";
			
			
			// searchDepartment 설정
			if(session.getAttribute("role").toString().equals("0") && request.getParameter("searchDepartment") == null && session.getAttribute("department_code")==null) {
				// 총관리자이고 처음 들어왔을 때
				System.out.println("처음들어왔을때");
				session.setAttribute("department_code", 0);
			}else if(session.getAttribute("role").toString().equals("0") && request.getParameter("searchDepartment") != null){
				session.setAttribute("department_code", request.getParameter("searchDepartment"));
			}else if(session.getAttribute("role").toString().equals("1")) {
				department_code = session.getAttribute("department_code").toString();
			}
			// searchCondition 설정
			if(session.getAttribute("searchCondition") != null) {
				searchCondition = session.getAttribute("searchCondition").toString();
				department_code = session.getAttribute("department_code").toString();
				startDate = session.getAttribute("startDate").toString();
				endDate = session.getAttribute("endDate").toString();
				searchId = session.getAttribute("searchId").toString();
			}
			// role 설정 - 총관리자이면 role이 null이 아니고 0임
			if(session.getAttribute("role") != null) {
				role = session.getAttribute("role").toString();
			}
			// 날짜선택 안할 때 "" 빈값으로 넘어오기 때문에 null로 변경해줌
			if(startDate == "") {
				startDate = null;
			}
			if(endDate == "") {
				endDate = null;
			}
			if(searchId == "") {
				searchId = "all";
			}
			
			HashMap<String,String> param = new HashMap<String,String>();
			param.put("searchCondition", searchCondition);
			param.put("startDate", startDate);
			param.put("endDate", endDate);
			param.put("department_code", department_code);

			System.out.println("3333333333333333333333333333333");
			System.out.println("DEPARTMENT_CODE 222222222222222222 = "+param.get("department_code"));
			System.out.println("HASH MAP - deP_code = "+param.get("department_code"));
			
			//cri쪽 에러가 나면 이거 해보자 !!!!!!!!!!!!!!!!!!!!!!!!
			//
			//cri = new Criteria(param);
			//
			
			cri.setDepartment_code(department_code);
			cri.setEndDate(endDate);
			cri.setSearchCondition(searchCondition);
			cri.setStartDate(startDate);
			cri.setId(null); 	// 총/관리자 컨트롤러여서 id는 null로 해준다.
			cri.setSearchId(searchId);
			System.out.println("ddddddddddddddddddddd "+cri.getPage());
	        //현재 페이지에 해당하는 게시물을 조회해 옴 
			List<BoardVO> vo = service.selectBoardList(cri);
			
			System.out.println(vo);
			System.out.println(cri.getPageStart());
			System.out.println("cri.id = "+cri.getId() + "cri.dep_code = "+cri.getDepartment_code() + "\n");
			
			//모델에 추가
			mav.addObject("boardList",vo); // boardList -> list check
	        //PageMaker 객체 생성
			PageMaker pageMaker = new PageMaker(cri);
	        //전체 게시물 수를 구함
			int totalCount = service.getTotalCount(cri);
	        //pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
			pageMaker.setTotalCount(totalCount);
	        //모델에 추가
			mav.addObject("pageMaker", pageMaker);
			
			if(role.equals("0")) {	// 총관리자
				mav.setViewName("selectDepartment"); // View 정보 저장
				return mav;
			}else {	// 각 점 관리자
				mav.setViewName("admin"); // View 정보 저장
				return mav;
			}
	}
	


	
	
}
