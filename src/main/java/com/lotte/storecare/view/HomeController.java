package com.lotte.storecare.view;

import java.sql.Connection;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lotte.storecare.user.UserVO;
import com.lotte.storecare.user.impl.UserDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	// 루트컨테이너에서 빈(Bean)을 받아와서 자동으로 넣어줌
	@Inject
	private SqlSessionFactory sqlFactory;
	
	// 루트 컨테이너에서 DAO 객체를 가져와 저장
	@Resource(name = "userDAO")
	private UserDAO dao;
	
	//	.jsp로 보여줄려면 
	//	com.lotte.view 에서 return 해야 .jsp로 된다.
	//	.do는 그냥 .do로 됨
	
	@RequestMapping(value = "/", method=RequestMethod.POST)
	public String LOGIN_TEST() {
		System.out.println("Dddd");
		return "/";
	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String LOGIN_GET() {
		
		
		try {

			SqlSession session = sqlFactory.openSession();
			System.out.println("성공 : " + session);
				
		} catch (Exception ex){
			System.out.println("실패..!");
			ex.printStackTrace();
		}
		
		return "login";
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
	
	// 입력한 아이디/비밀번호 맞으면 getDpartMent.do로 , 틀리면 다시 login.jsp로
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String LOGIN_POST(HttpSession session,HttpServletRequest httpServletRequest) {	
		
		String id = httpServletRequest.getParameter("id");
		
		UserVO vo = dao.select(id);
		System.out.println("vo :" + vo);

		if(vo == null) {	// 아이디,비밀번호 틀리면 다시 로그인 페이지로
			return "login";
		}else if(vo.getRole() == 0) {	// role이 0 이면 총괄 관리자 페이지로
			session.setAttribute("role", vo.getRole());
			return "adminHead";
		}else if(vo.getRole() == 1) {	// role이 1이면 각 점 관리자 페이지로
			session.setAttribute("role", vo.getRole());
			session.setAttribute("department_code", vo.getDepartment_code());
			return "getBoardList.do";
		}else{	// 나머지 role = 2 들은 일반 사용자들로 사용자들페이지로
			session.setAttribute("role", vo.getRole());
			session.setAttribute("login", vo.getId());
			return "getDepartmentList.do";
		}
		
		
	}
	
	// 위에 getDpartMent에서 일로 넘어와서 selectProcess.jsp 보여줌
	@RequestMapping(value="/selectProcess", method=RequestMethod.POST)
	public String selectProcess_POST() {		
		System.out.println(" 여기는 selectProcess_POST");
		return "selectProcess";
	}
	
	@RequestMapping(value="/selectProcess", method=RequestMethod.GET)
	public String selectProcess_GET() {		
		System.out.println(" 여기는 selectProcess_GET");
		return "selectProcess";
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
		return "admin";
	}
	//nav를 통한 admin 은 admin 페이지로
	@RequestMapping(value = "/admin", method=RequestMethod.GET)
	public String NAV_ADMIN_GET() {
		return "admin";
	}
		
}
