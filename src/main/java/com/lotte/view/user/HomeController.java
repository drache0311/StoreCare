package com.lotte.view.user;

import java.sql.Connection;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
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
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// 루트컨테이너에서 빈(Bean)을 받아와서 자동으로 넣어줌
	@Inject
	private SqlSessionFactory sqlFactory;
	
	
	
	//	.jsp로 보여줄려면 
	//	com.lotte.view 에서 return 해야 .jsp로 된다.
	//	.do는 그냥 .do로 됨
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String LOGIN_GET(Locale locale, Model model) {
		
		
		try {

			SqlSession session = sqlFactory.openSession();
			System.out.println("성공 : " + session);
				
		} catch (Exception ex){
			System.out.println("실패..!");
			ex.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login";
	}

	// logout.do로 받아서 session 끊고 login으로 get방식으루 보냄
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String LOGOUT(HttpSession session) {
		session.invalidate();
		return "login";
	}
	
	// 로그아웃 할 때 이걸로 받아서 로그인화면으로 감
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String LOGOUT_GET() {
		return "login";
	}
	
	//아디 비번 안 맞을시 여기로 와서 다시 login 페이지
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public String LOGIN_INVALID_POST() {
		return "login";
	}
	
	// 입력한 아이디/비밀번호 맞으면 getDpartMent.do로 , 틀리면 다시 login.jsp로
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String LOGIN_POST(UserVO vo, UserDAO userDAO,HttpSession session) {	
		
		if (userDAO.getUser(vo).getRole() == 0) {	// role = 0 은 총괄 관리자이다.
			session.setAttribute("role", userDAO.getUser(vo).getId());
			return "headAdmin";
		}else if(userDAO.getUser(vo).getRole() == 1){	// role = 1 은 각 점 관리자이다.
			session.setAttribute("role", userDAO.getUser(vo).getDepartment_code());
			return "getBoardList.do";
		}else if (userDAO.getUser(vo) != null) {	// 나머지 role = 2 들은 일반 사용자들이다.
			session.setAttribute("login", userDAO.getUser(vo).getId());
			return "getDepartmentList.do";
		}else {
			return "login";
		}
	}
	
	// 위에 getDpartMent에서 일로 넘어와서 selectProcess.jsp 보여줌
	@RequestMapping("/selectProcess")
	public String selectProcess() {		
		
		return "selectProcess";
	}
	

	// 입력한 아이디/비밀번호 맞으면 getDpartMent.do로 , 틀리면 다시 login.jsp로
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String SIGNUP_GET() {	
			return "signUp";
	}

	
	//headAdmin 은 headAdmin 페이지로
	@RequestMapping(value = "/headAdmin", method=RequestMethod.POST)
	public String LOGIN_HAEDADMIN_POST() {
		return "adminHead";
	}
	
	//admin 은 admin 페이지로
	@RequestMapping(value = "/admin", method=RequestMethod.POST)
	public String LOGIN_ADMIN_POST() {
		return "admin";
	}
	
}
