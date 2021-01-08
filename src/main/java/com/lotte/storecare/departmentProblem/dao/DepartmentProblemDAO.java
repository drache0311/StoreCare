package com.lotte.storecare.departmentProblem.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lotte.storecare.vo.DepartmentProblemVO;
import com.lotte.storecare.vo.ProblemVO;

public interface DepartmentProblemDAO {
	// 뎁스 1,2,3 포함한 쿼리 테스트 중
	public List<Map<String,String>> selectDepProblemList(DepartmentProblemVO vo);
	
	// 뎁스 1,2,3 별 문의 추가 
	void insertDepProblem(HashMap<String,String> param);
}
