package com.lotte.storecare.departmentProblem.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lotte.storecare.vo.DepartmentProblemVO;

public interface DepartmentProblemService {
	// 뎁스 1,2,3 포함한 쿼리 테스트 중
	public List<Map<String,String>> selectDepProblemList(DepartmentProblemVO vo);
	// 뎁스 1,2,3 별 문의 추가 
	void insertDepProblem(HashMap<String,String> param);
	// 각 점의 뎁스 1,2,3 별 문의 삭제
	void deleteDepProblem(HashMap<String,String> param);
}
