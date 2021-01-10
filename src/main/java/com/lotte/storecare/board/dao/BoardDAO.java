package com.lotte.storecare.board.dao;

import java.util.HashMap;
import java.util.List;

import com.lotte.storecare.commons.Criteria;
import com.lotte.storecare.vo.BoardVO;


public interface BoardDAO {
	// CRUD 

	void insertBoard(BoardVO vo);


	void updateBoard(BoardVO vo);
	
	void updateBoard(String seq);

	void deleteBoard(BoardVO vo);
	

	// 사용자별 문의내역 조회
	public List<BoardVO> selectUserBoardList(Criteria cri);
	
	
	// ?
	public List<BoardVO> selectBoardList(HashMap<String,String> param);

	// 각 점별 5개씩 문의내역 조회
	public List<BoardVO> selectBoardList(Criteria cri);
	
	// 각 점별 총 문의내역 수
	int getTotalCount(Criteria cri);

}
