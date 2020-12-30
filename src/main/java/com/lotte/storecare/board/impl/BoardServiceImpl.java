package com.lotte.storecare.board.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lotte.storecare.board.BoardDAO;
import com.lotte.storecare.board.BoardVO;
//import com.lotte.storecare.view.controller.BoardService;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
//	@Resource(name = "boardDAO")
//	private BoardDAO boardDAO;
	


	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDAO.deleteBoard(vo);
	}
	
	@Override
	public List<BoardVO> selectUserBoardList(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		return boardDAO.selectUserBoardList(param);
	}
	
	@Override
	public List<BoardVO> selectBoardList(HashMap<String, String> param) {
		return boardDAO.selectBoardList(param);
	}

}
