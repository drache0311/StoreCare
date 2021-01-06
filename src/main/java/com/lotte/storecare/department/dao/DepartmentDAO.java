package com.lotte.storecare.department.dao;

import java.util.List;

import com.lotte.storecare.commons.Criteria;
import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentVO;

public interface DepartmentDAO {
	// CRUD 
	void insertDepartment(DepartmentVO vo);

	// 
	void updateDepartment(DepartmentVO vo);

	// 백화점 삭제
	public void deleteDepartment(DepartmentVO vo);

	// 백화점과 관리자 리스트 조회
	public List<DepartmentVO> selectDepartmentList();
	
	
	public DepartmentVO selectFloor(BoardVO vo);
	
	public List<DepartmentVO> selectAll();
}
