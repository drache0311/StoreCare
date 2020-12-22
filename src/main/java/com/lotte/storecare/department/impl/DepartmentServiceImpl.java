package com.lotte.storecare.department.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.storecare.department.DepartmentService;
import com.lotte.storecare.department.DepartmentVO;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDAO departmentDAO;

	public void insertDepartment(DepartmentVO vo) {
//		if (vo.getSeq() == 0) {
//			throw new IllegalArgumentException("0�� ���� ����� �� �����ϴ�.");
//		}
//		departmentDAO.insertDepartment(vo); // 100�� �� ��� ����
		departmentDAO.insertDepartment(vo); // Exception �߻�
	}

	public void updateDepartment(DepartmentVO vo) {
		departmentDAO.updateDepartment(vo);
	}

	public void deleteDepartment(DepartmentVO vo) {
		departmentDAO.deleteDepartment(vo);
	}

	public DepartmentVO getDepartment(DepartmentVO vo) {
		return departmentDAO.getDepartment(vo);
	}

	public List<DepartmentVO> getDepartmentList(DepartmentVO vo) {
		return departmentDAO.getDepartmentList(vo);
	}
}