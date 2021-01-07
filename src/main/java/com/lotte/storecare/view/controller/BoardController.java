package com.lotte.storecare.view.controller;


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
import com.lotte.storecare.problem.service.ProblemService;
import com.lotte.storecare.user.service.UserService;
import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentVO;
import com.lotte.storecare.vo.ProblemVO;
import com.lotte.storecare.vo.UserVO;



@Controller
public class BoardController {
	
	@Inject
	private BoardService service;

	@Inject
	private ProblemService problemService;

	@Inject
	private UserService userService;
	
	// 문의 등록 GET
	@RequestMapping(value="/insertBoard", method=RequestMethod.GET)
	public ModelAndView INSERTBOARDTEMP_GET(ModelAndView mav, ProblemVO vo) {			
		System.out.println("depth =====> "+vo.getDepth()+ "category_code = " + vo.getCategory_code() +"problem_code = " + vo.getProblem_code());
		System.out.println("여긴 insertBoard GET");
		mav.addObject("problemList", problemService.selectProblemListTest(vo)); // Model 정보 저장
		mav.setViewName("insertBoard"); // View 정보 저장
		return mav;
	}
	// 문의 등록 POST
	@RequestMapping(value="/insertBoard", method=RequestMethod.POST)
	public ModelAndView INSERTBOARDTEMP_POST(ModelAndView mav, ProblemVO vo) {			
		System.out.println("depth =====> "+vo.getDepth()+ "category_code = " + vo.getCategory_code() +"problem_code = " + vo.getProblem_code());
		System.out.println("여긴 insertBoard POST");
		mav.addObject("problemList", problemService.selectProblemListTest(vo)); // Model 정보 저장
		mav.setViewName("insertBoard"); // View 정보 저장
		return mav;
	}
	// 문의 등록  DO
	@RequestMapping(value="/insertBoard.do", method=RequestMethod.GET)
	public String INSERTBOARDTEMPDO_GET(BoardVO vo) {
			
	
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
	public ModelAndView getBoardUserList(ModelAndView mav, HttpSession session, HttpServletRequest request) {
		String id = session.getAttribute("login").toString();
		String searchCondition = request.getParameter("searchCondition");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		// 날짜선택 안할 때 "" 빈값으로 넘어오기 때문에 null로 변경해줌
		if(startDate == "") {
			startDate = null;
		}
		if(endDate == "") {
			endDate = null;
		}
		
		HashMap<String,String> param = new HashMap<String,String>();
		param.put("searchCondition", searchCondition);
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("id", id);
		
		List<BoardVO> vo = service.selectUserBoardList(param);
		mav.addObject("boardUserList", vo); // Model 정보 저장
		mav.setViewName("getBoardUserList"); // View 정보 저장
		return mav;
	}
	
	// 	// 관리자들은 직접 주소를 입력해 들어온다. + 관리자 문의내역 및 페이징
	@RequestMapping("/getBoardList.do")
	public ModelAndView getBoardList_GET(ModelAndView mav,  HttpSession session, HttpServletRequest request,Criteria cri) {
		
			String department_code = session.getAttribute("department_code").toString();
			session.setAttribute("searchCondition",request.getParameter("searchCondition"));
			session.setAttribute("startDate",request.getParameter("startDate"));
			session.setAttribute("endDate",request.getParameter("endDate"));
			String searchCondition = "all";
			String startDate = "";
			String endDate = "";
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
			System.out.println("ddddddddddddddddddddd "+cri.getPage());
	        //현재 페이지에 해당하는 게시물을 조회해 옴 
			List<BoardVO> vo = service.selectBoardList(cri);
			
			System.out.println(vo);
			System.out.println(cri.getPageStart());
			System.out.println("StartDate = "+cri.getStartDate() + "EndDate = "+cri.getEndDate() + "\n");
			
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
			
			mav.setViewName("admin"); // View 정보 저장
			return mav;
	}
	


	
	
}
