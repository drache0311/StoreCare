package com.lotte.storecare.view.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProcessController {

	
	// 
	@RequestMapping(value="/getBoardUserList", method=RequestMethod.GET)
	public String GETBOARDUSERLIST_GET() {	
		return "getBoardUserList";
	}
	@RequestMapping(value="/getBoardUserList", method=RequestMethod.POST)
	public String GETBOARDUSERLIST_POST() {	
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
	
	@RequestMapping(value="/checkBoard", method=RequestMethod.GET)
	public String CHECKBOARD_GET() {	
		return "checkBoard";
	}	
	
	
	@RequestMapping(value="/updateBoard", method=RequestMethod.GET)
	public String UPDATEBOARD_GET() {	
		return "checkBoard";
	}	
	
	
	
	@RequestMapping(value="/insertUser", method=RequestMethod.POST)
	public String INSERTUSER_POST() {	
		return "signUp";
	}	
	
	@RequestMapping(value="/updateProblem", method=RequestMethod.GET)
	public String UPDATEPROBLEM_GET() {	
		return "updateProblem";
	}	
	
	@RequestMapping(value="/sendProblem", method=RequestMethod.GET)
	public String SENDPROBLEM_GET() {	
		return "sendProblem";
	}		
	
	@RequestMapping(value="/departmentProblem", method=RequestMethod.GET)
	public String DEPARTMENTPROBLEM_GET() {	
		return "departmentProblem";
	}		

	@RequestMapping(value="/getDepartment", method=RequestMethod.GET)
	public String GETDEPARTMENT_GET() {	
		return "getDepartment";
	}	
	
	@RequestMapping(value="/insertDepartment", method=RequestMethod.GET)
	public String INSERTDEPARTMENT_GET() {	
		return "insertDepartment";
	}	
}
