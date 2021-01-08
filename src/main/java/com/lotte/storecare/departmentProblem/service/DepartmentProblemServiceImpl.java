package com.lotte.storecare.departmentProblem.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.lotte.storecare.departmentProblem.dao.DepartmentProblemDAO;
import com.lotte.storecare.vo.DepartmentProblemVO;
@Service
public class DepartmentProblemServiceImpl implements DepartmentProblemService {

	@Inject
	private DepartmentProblemDAO departmentProblemDAO;
	
	// 뎁스 1,2,3 별 쿼리사항 검색
	@Override
	public List<Map<String, String>> selectDepProblemList(DepartmentProblemVO vo) {
		return departmentProblemDAO.selectDepProblemList(vo);
	}

}
