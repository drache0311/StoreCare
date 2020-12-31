package com.lotte.storecare.department.dao;

import java.util.List;

import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentVO;

public interface DepartmentDAO {
	// CRUD 
	void insertDepartment(DepartmentVO vo);

	// 
	void updateDepartment(DepartmentVO vo);

	// 
	void deleteDepartment(DepartmentVO vo);


	
	
	public DepartmentVO selectFloor(BoardVO vo);
	
	public List<DepartmentVO> selectAll();
}
