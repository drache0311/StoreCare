package com.lotte.storecare.board.service;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.lotte.storecare.board.dao.BoardDAO;
import com.lotte.storecare.commons.Criteria;
import com.lotte.storecare.vo.BoardVO;


@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	


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

	// 관리자가 선택한 문의 update
	@Override
	public void updateBoard(String seq) {
		// TODO Auto-generated method stub
		boardDAO.updateBoard(seq);
	}	
	
	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDAO.deleteBoard(vo);
	}
	



	@Override
	public List<BoardVO> selectUserBoardList(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.selectUserBoardList(cri);
	}
	
	@Override
	public List<BoardVO> selectBoardList(HashMap<String, String> param) {
		return boardDAO.selectBoardList(param);
	}
	
	@Override
	public List<BoardVO> selectBoardList(Criteria cri) {
		// TODO boardDAO.selectBoardList(cri);
		return boardDAO.selectBoardList(cri);
	}



	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.getTotalCount(cri);
	}


}
