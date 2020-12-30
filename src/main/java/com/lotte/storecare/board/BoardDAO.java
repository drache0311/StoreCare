package com.lotte.storecare.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.lotte.storecare.user.UserVO;
import com.lotte.storecare.user.impl.UserDAO;


public interface BoardDAO {
	// CRUD 

	void insertBoard(BoardVO vo);


	void updateBoard(BoardVO vo);


	void deleteBoard(BoardVO vo);

	public List<BoardVO> selectUserBoardList(HashMap<String,String> param);
	
	public List<BoardVO> selectBoardList(HashMap<String,String> param);
}
