package com.lotte.storecare;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProcessController {

	@RequestMapping("/selectProcessdddd")
	public String selectProcess() {		
		return "selectProcess";
	}
	
}
