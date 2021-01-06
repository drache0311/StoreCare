package com.lotte.storecare.department.service;

import java.util.List;

import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentVO;

public interface DepartmentService {
	// CRUD 
	void insertDepartment(DepartmentVO vo);

	// 
	void updateDepartment(DepartmentVO vo);

	// 
	void deleteDepartment(DepartmentVO vo);


	public DepartmentVO selectFloor(BoardVO vo);
	
	// 백화점과 관리자 리스트 조회
	public List<DepartmentVO> selectDepartmentList();

	
	public List<DepartmentVO> selectAll();
}
