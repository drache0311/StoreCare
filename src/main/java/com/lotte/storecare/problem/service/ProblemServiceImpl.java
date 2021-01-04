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

	

	// 뎁스 1,2,3 포함한 쿼리 테스트 중
	@Override
	public List<Map<String,String>> selectProblemListTest(HashMap<String,String> param) {
		// TODO Auto-generated method stub
		return problemDAO.selectProblemListTest(param);
	}
}
