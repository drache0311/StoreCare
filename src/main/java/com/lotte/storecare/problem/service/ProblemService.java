package com.lotte.storecare.problem.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.lotte.storecare.vo.ProblemVO;

public interface ProblemService {
	public List<ProblemVO> selectProblemList();
	
	// 뎁스 1,2,3 별 쿼리사항 검색
	public List<Map<String,String>> selectProblemListTest(ProblemVO vo);
	
	// 뎁스 1,2,3 별 문의사항 추가 
	void insertProblem(ProblemVO vo);

	// 뎁스 1,2,3 별 문의사항 수정
	public void updateProblem(ProblemVO vo);

	// 뎁스 1,2,3 별 문의사항 삭제
	public void deleteProblem(ProblemVO vo);
}
