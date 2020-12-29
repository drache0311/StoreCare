package com.lotte.storecare.department;

import java.util.List;

public interface DepartmentService {
	// CRUD ����� �޼ҵ� ����
	// �� ���
	void insertDepartment(DepartmentVO vo);

	// �� ����
	void updateDepartment(DepartmentVO vo);

	// �� ����
	void deleteDepartment(DepartmentVO vo);

	// �� �� ��ȸ
	DepartmentVO getDepartment(DepartmentVO vo);


	List<DepartmentVO> selectAll();
}
