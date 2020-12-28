package com.lotte.storecare.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lotte.storecare.user.UserVO;
import com.lotte.storecare.user.impl.UserDAO;

public interface BoardService {
	// CRUD ����� �޼ҵ� ����
	// �� ���
	void insertBoard(BoardVO vo);

	// �� ����
	void updateBoard(BoardVO vo);

	// �� ����
	void deleteBoard(BoardVO vo);

	// �� �� ��ȸ
	BoardVO getBoard(BoardVO vo);

	// �� ��� ��ȸ
	List<BoardVO> getBoardList(BoardVO vo, HttpSession session);
	
	List<BoardVO> getBoardUserList(BoardVO vo, HttpSession session);
}
