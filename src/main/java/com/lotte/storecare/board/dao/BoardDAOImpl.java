package com.lotte.storecare.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lotte.storecare.commons.Criteria;
import com.lotte.storecare.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;
	


	// 문의 insert
	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		session.insert("boardDB.insertBoard", vo);
	}

	// 문의 update
	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		session.update("boardDB.updateUserBoard", vo);
	}
	
	// 관리자가 선택한 문의 update
	@Override
	public void updateBoard(String seq) {
		// TODO Auto-generated method stub
		session.delete("boardDB.updateBoard",seq);
	}

	// 문의 delete
	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		session.delete("boardDB.deleteBoard", vo.getSeq());	
	}

	// 유저별 문의 내역 select
	@Override
	public List<BoardVO> selectUserBoardList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("boardDB.selectUserBoardList", cri);
	}

//	// 각 점별 문의 내역 select
	@Override
	public List<BoardVO> selectBoardList(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		return session.selectList("boardDB.selectBoardList", param);
	}

	// 각 점별 문의 내역 select
	@Override
	public List<BoardVO> selectBoardList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("boardDB.selectBoardList", cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne("boardDB.gettotalcount",cri);
	}
}
