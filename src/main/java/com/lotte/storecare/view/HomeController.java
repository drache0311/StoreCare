package com.lotte.storecare.view;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lotte.storecare.user.service.UserService;
import com.lotte.storecare.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private UserService service;
	
	//	.jsp로 보여줄려면 
	//	com.lotte.view 에서 return 해야 .jsp로 된다.
	//	.do는 그냥 .do로 됨
	
	@RequestMapping(value = "/", method=RequestMethod.POST)
	public String LOGIN_TEST() {
		System.out.println("Dddd");
		return "/";
	}
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String LOGIN_GET() {
		return "login";
	}
	
	// 관리자 로그인 페이지
	@RequestMapping(value = "/super", method=RequestMethod.GET)
	public String LOGIN_SUPER_GET() {
		return "loginAdmin";
	}
	
	// logout.do로 받아서 session 끊고 login으로 get방식으루 보냄
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String LOGOUT_GET(HttpSession session) {
		session.invalidate();
		System.out.println("logout.do -> / 이동 GET으로 LOGOUT");
		return "/";
	}
	
	// 로그아웃 할 때 이걸로 받아서 로그인화면으로 감
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String LOGOUT_GET() {
		System.out.println("/login -> login  GET으로");
		return "login";
	}
	
	//아디 비번 안 맞을시 여기로 와서 다시 login 페이지
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public String LOGIN_INVALID_POST() {
		System.out.println("아디비번안맞아서 /login -> login  POST임");
		return "login";
	}
	
	// 입력한 아이디/비밀번호 맞으면 insertBoard로 , 틀리면 다시 login.jsp로
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String LOGIN_POST(HttpSession session,HttpServletRequest httpServletRequest) {	
		
		String id = httpServletRequest.getParameter("id");
		
		UserVO vo = service.select(id); 
		
		if(vo == null){
			session.setAttribute("role", 2);
			session.setAttribute("login", id);
			return "selectDepartment";
		}else if(vo.getRole() == 0) { // role이 0 이면 총괄 관리자 페이지로
			session.setAttribute("role", vo.getRole());
			return "getBoardList.do";
		}else{ // role이 1이면 각 점 관리자 페이지로
			 session.setAttribute("role", vo.getRole());
			 session.setAttribute("department_code", vo.getDepartment_code());
			 return "getBoardList.do";
		}
	}
	


	// 입력한 아이디/비밀번호 맞으면 getDpartMent.do로 , 틀리면 다시 login.jsp로
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String SIGNUP_GET() {	
			return "signUp";
	}

	
	//headAdmin 은 headAdmin 페이지로
	@RequestMapping(value = "/adminHead", method=RequestMethod.POST)
	public String LOGIN_ADMINHEAD_POST() {
		return "adminHead";
	}
	
	// nav를 통한 headAdmin 은 headAdmin 페이지로
	@RequestMapping(value = "/adminHead", method=RequestMethod.GET)
	public String NAV_ADMINHEAD_GET() {
		return "adminHead";
	}
	
	//admin 은 admin 페이지로
	@RequestMapping(value = "/admin", method=RequestMethod.POST)
	public String LOGIN_ADMIN_POST() {
		System.out.println("여긴 admin POST");
		return "admin";
	}
	//nav를 통한 admin 은 admin 페이지로
	@RequestMapping(value = "/admin", method=RequestMethod.GET)
	public String NAV_ADMIN_GET() {
		System.out.println("여긴 admin GET");
		return "admin";
	}


}
