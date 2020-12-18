package com.lotte.view.user;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	
	//	.jsp로 보여줄려면 
	//	com.lotte.view 에서 return 해야 .jsp로 된다.
	//	.do는 그냥 .do로 됨
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String LOGIN_GET(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "login";
	}
	
	// 입력한 아이디/비밀번호 맞으면 getDpartMent.do로 , 틀리면 다시 login.jsp로
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_POST(UserVO vo, UserDAO userDAO) {	
		if (userDAO.getUser(vo) != null) {
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
	
	// 아직 미 설정
	@RequestMapping(value = "/logout.do")
	public String LOGIN_POST(Locale locale, Model model) {
		return "login";
	}
	
	
	
}
