package com.lotte.storecare.problem.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.lotte.storecare.vo.ProblemVO;

public interface ProblemService {
	public List<ProblemVO> selectProblemList();
	
	// 뎁스 1,2,3 별 쿼리 검색
	public List<Map<String,String>> selectProblemListTest(HashMap<String,String> param);
	
	// 뎁스 1,2,3 별 문의 추가 
	void insertProblem(HashMap<String,String> param);
}
