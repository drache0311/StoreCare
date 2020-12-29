package com.lotte.storecare.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lotte.storecare.place.PlaceVO;
import com.lotte.storecare.place.impl.PlaceDAO;

@Controller
public class PlaceController {
	// 글 등록
	@RequestMapping("/insertPlace.do")
	public String insertPlace(PlaceVO vo, PlaceDAO placeDAO) {
		placeDAO.insertPlace(vo);
		return "getPlaceList.do";
	}

	// 글 수정
	@RequestMapping("/updatePlace.do")
	public String updatePlace(PlaceVO vo, PlaceDAO placeDAO) {
		placeDAO.updatePlace(vo);
		return "getPlaceList.do";
	}

	// 글 삭제
	@RequestMapping("/deletePlace.do")
	public String deletePlace(PlaceVO vo, PlaceDAO placeDAO) {
		placeDAO.deletePlace(vo);
		return "getPlaceList.do";
	}

	// 글 상세 조회
	@RequestMapping("/getPlace.do")
	public ModelAndView getPlace(PlaceVO vo, PlaceDAO placeDAO, ModelAndView mav) {
		mav.addObject("place", placeDAO.getPlace(vo)); // Model 정보 저장
		mav.setViewName("selectProcess"); // View 정보 저장
		// mav 이거 jsp 보여주는게 아니고 다시 requestMapping잡아서 return해줘야 jsp 보여줌
		return mav;
	}

	// 글 목록 검색
	@RequestMapping("/getPlaceList.do")
	public ModelAndView getPlaceList(PlaceVO vo, PlaceDAO placeDAO, ModelAndView mav) {
		mav.addObject("placeList", placeDAO.getPlaceList(vo)); // Model 정보 저장
		mav.setViewName("insertBoard"); // View 정보 저장
		return mav;
	}
}
