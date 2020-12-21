package com.lotte.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lotte.storecare.user.UserVO;
import com.lotte.storecare.user.impl.UserDAO;

@Controller
public class ProcessController {

	@RequestMapping("/selectProcessdddd")
	public String selectProcess() {		
		return "selectProcess";
	}
	
	// 
	@RequestMapping(value="/getBoardList", method=RequestMethod.GET)
	public String GETBOARDLIST_POST() {	
		return "getBoardList";
	}
	
	@RequestMapping(value="/getBoard", method=RequestMethod.GET)
	public String GETBOARD_GET() {	
		return "getBoard";
	}
	
	@RequestMapping(value="/deleteBoard", method=RequestMethod.GET)
	public String DELETEBOARD_GET() {	
		return "getBoardList";
	}
	
	
}
