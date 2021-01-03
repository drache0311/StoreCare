package com.lotte.storecare.board.service;

import java.util.HashMap;
import java.util.List;

import com.lotte.storecare.commons.Criteria;
import com.lotte.storecare.vo.BoardVO;

public interface BoardService {
	
	public List<BoardVO> selectUserBoardList(HashMap<String,String> param);
	
	public List<BoardVO> selectBoardList(HashMap<String,String> param);

	public List<BoardVO> selectBoardList(Criteria cri);
	
	void insertBoard(BoardVO vo);


	void updateBoard(BoardVO vo);

	void updateBoard(String seq);

	void deleteBoard(BoardVO vo);
	
	int getTotalCount(Criteria cri);
}
