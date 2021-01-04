package com.lotte.storecare.problem.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lotte.storecare.vo.ProblemVO;

public interface ProblemDAO {
	public List<ProblemVO> selectProblemList();
	
	// 뎁스 1,2,3 포함한 쿼리 테스트 중
	public List<Map<String,String>> selectProblemListTest(HashMap<String,String> param);
}
