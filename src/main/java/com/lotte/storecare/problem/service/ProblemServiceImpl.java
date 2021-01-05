package com.lotte.storecare.problem.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.lotte.storecare.problem.dao.ProblemDAO;
import com.lotte.storecare.vo.ProblemVO;

@Service
public class ProblemServiceImpl implements ProblemService {

	@Inject
	private ProblemDAO problemDAO;
	


	// 문의 depth 조회
	@Override
	public List<ProblemVO> selectProblemList() {
		// TODO Auto-generated method stub
		return problemDAO.selectProblemList();
	}

	
	@Override
	public void updateProblem(ProblemVO vo) {
		// TODO Auto-generated method stub
		
	}


	// 뎁스 1,2,3 별 문의 추가
	@Override
	public void insertProblem(ProblemVO vo) {
		problemDAO.insertProblem(vo);
	}


	// 뎁스 1,2,3 별 문의 삭제
	@Override
	public void deleteProblem(ProblemVO vo) {
		// TODO Auto-generated method stub
		
	}


	// 뎁스 1,2,3 별 문의 검색
	@Override
	public List<Map<String,String>> selectProblemListTest(ProblemVO vo) {
		// TODO Auto-generated method stub
		return problemDAO.selectProblemListTest(vo);
	}
}
