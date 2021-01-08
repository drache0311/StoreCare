package com.lotte.storecare.departmentProblem.service;

import java.util.List;
import java.util.Map;

import com.lotte.storecare.vo.DepartmentProblemVO;

public interface DepartmentProblemService {
	// 뎁스 1,2,3 포함한 쿼리 테스트 중
	public List<Map<String,String>> selectDepProblemList(DepartmentProblemVO vo);

}
