package com.lotte.storecare.board.dao;

import java.util.HashMap;
import java.util.List;


import com.lotte.storecare.vo.BoardVO;


public interface BoardDAO {
	// CRUD 

	void insertBoard(BoardVO vo);


	void updateBoard(BoardVO vo);


	void deleteBoard(BoardVO vo);

	public List<BoardVO> selectUserBoardList(HashMap<String,String> param);
	
	public List<BoardVO> selectBoardList(HashMap<String,String> param);
}
