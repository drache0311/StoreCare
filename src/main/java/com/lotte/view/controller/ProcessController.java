package com.lotte.view.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProcessController {

	@RequestMapping("/selectProcessdddd")
	public String selectProcess() {		
		return "selectProcess";
	}
	
	// 
	@RequestMapping(value="/getBoardUserList", method=RequestMethod.GET)
	public String GETBOARDLIST_GET() {	
		return "getBoardUserList";
	}
	
	@RequestMapping(value="/getBoard", method=RequestMethod.GET)
	public String GETBOARD_GET() {	
		return "getBoard";
	}
	
	@RequestMapping(value="/deleteBoard", method=RequestMethod.GET)
	public String DELETEBOARD_GET() {	
		return "getBoardUserList";
	}
	
	@RequestMapping(value="/insertBoard", method=RequestMethod.GET)
	public String INSERTBOARD_GET() {	
		System.out.println("여긴 GET");
		return "insertBoard";
	}
	
	
	@RequestMapping(value="/checkBoard", method=RequestMethod.GET)
	public String CHECKBOARD_GET() {	
		return "checkBoard";
	}	
	
	// 12/22 11:35 테스트중 삽입
	@RequestMapping(value="/updateBoard", method=RequestMethod.GET)
	public String UPDATEBOARD_GET() {	
		return "checkBoard";
	}	
	
	
	
	@RequestMapping(value="/insertUser", method=RequestMethod.POST)
	public String INSERTUSER_POST() {	
		return "signUp";
	}	
	
	
}
