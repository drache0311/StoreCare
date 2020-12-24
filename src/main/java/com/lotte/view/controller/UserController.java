package com.lotte.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.storecare.user.UserVO;
import com.lotte.storecare.user.impl.UserDAO;


@Controller
public class UserController {
	

	
	// 유저 추가
	@RequestMapping(value = "/insertUser.do", method=RequestMethod.POST)
	public String insertUser_POST(UserVO vo, UserDAO userDAO) {
		if (userDAO.getUser(vo) != null) {
			return "signUp";
		}else {
			userDAO.insertUser(vo);
			return "login";
		}
	}
	// 유저 아이디 중복 체크
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public int idCheckUser(UserVO vo, UserDAO userDAO) {
		int resultCnt=0;
		System.out.println("===> 333333333333333333"+ resultCnt);
		resultCnt = userDAO.getIdUser(vo);
		System.out.println("===> 4444444444444444444444444444" + resultCnt+ "type=");
		return resultCnt;
	}
	
	
	// 글 수정 완료
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo, UserDAO userDAO) {
		userDAO.updateUser(vo);
		return "getUserList.do";
	}

	// 글 삭제 미완
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserVO vo, UserDAO userDAO) {
		userDAO.deleteUser(vo);
		return "getUserList.do";
	}

	// 글 상세 조회 미완
	@RequestMapping("/getUser.do")
	public ModelAndView getUser(UserVO vo, UserDAO userDAO, ModelAndView mav) {
		mav.addObject("user", userDAO.getUser(vo)); // Model 정보 저장
		mav.setViewName("getUser"); // View 정보 저장
		return mav;
	}
	
	// 글 상세 조회 미완
	@RequestMapping("/checkUser.do")
	public ModelAndView getFloor(UserVO vo, UserDAO userDAO, ModelAndView mav) {
//		mav.addObject("user", userDAO.getFloor(vo)); // Model 정보 저장
		mav.setViewName("checkUser"); // View 정보 저장
		return mav;
	}
	
	// 글 목록 검색 완료
	@RequestMapping("/getUserList.do")
	public ModelAndView getUserList(UserVO vo, UserDAO userDAO, ModelAndView mav, HttpSession session) {
		mav.addObject("userList", userDAO.getUserList(vo, session)); // Model 정보 저장
		mav.setViewName("getUserList"); // View 정보 저장
		return mav;
	}
}
