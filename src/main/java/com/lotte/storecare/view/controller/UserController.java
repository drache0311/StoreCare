package com.lotte.storecare.view.controller;


import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotte.storecare.user.service.UserService;
import com.lotte.storecare.vo.UserVO;


@Controller
public class UserController {
	
	
	@Inject
	private UserService service;
	
	// 유저 중복 체크 후 유저추가
	@RequestMapping(value = "/insertUser.do", method=RequestMethod.POST)
	public String insertUser_POST(UserVO vo) {
		if (service.select(vo) != null) {
			return "signUp";
		}else {
			service.insertUser(vo);
			return "login";
		}
	}
	// 유저 아이디 중복 체크
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public int idCheckUser(UserVO vo) {
		int resultCnt=0;
		System.out.println("===> 333333333333333333"+ resultCnt);
		resultCnt = service.check(vo);

		System.out.println("===> 4444444444444444444444444444" + resultCnt+ "type=");
		return resultCnt;
	}
	
	
//	
//	// 글 목록 검색 완료
//	@RequestMapping("/getUserList.do")
//	public ModelAndView getUserList(UserVO vo, UserDAO userDAO, ModelAndView mav, HttpSession session) {
//		mav.addObject("userList", userDAO.getUserList(vo, session)); // Model 정보 저장
//		mav.setViewName("getUserList"); // View 정보 저장
//		return mav;
//	}
}
