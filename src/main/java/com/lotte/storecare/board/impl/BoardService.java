package com.lotte.storecare.board.impl;

import java.util.HashMap;
import java.util.List;


import com.lotte.storecare.board.BoardVO;

public interface BoardService {
	public List<BoardVO> selectUserBoardList(HashMap<String,String> param);
	public List<BoardVO> selectBoardList(HashMap<String,String> param);

	void insertBoard(BoardVO vo);


	void updateBoard(BoardVO vo);


	void deleteBoard(BoardVO vo);
	
	
	
	
	
}
