package com.lotte.storecare.problem.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.ProblemVO;

public interface ProblemDAO {
	public List<ProblemVO> selectProblemList();
	
	// 뎁스 1,2,3 포함한 쿼리 테스트 중
	public List<Map<String,String>> selectProblemListTest(ProblemVO vo);
	
	// 뎁스 1,2,3 별 문의 추가 
	void insertProblem(ProblemVO vo);
	
	// 뎁스 1,2,3 별 문의 수정
	void updateProblem(String seq);
	
	// 뎁스 1,2,3 별 문의 삭제
	void deleteProblem(HashMap<String,String> param);
}
