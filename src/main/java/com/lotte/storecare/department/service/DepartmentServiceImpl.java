package com.lotte.storecare.department.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.lotte.storecare.department.dao.DepartmentDAO;
import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentProblemVO;
import com.lotte.storecare.vo.DepartmentVO;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	


	@Inject
	private DepartmentDAO departmentDAO;
	
	// 백화점 추가
	@Override
	public void insertDepartment(DepartmentVO vo) {
		departmentDAO.insertDepartment(vo);
	}
	
	//
	@Override
	public void updateDepartment(DepartmentVO vo) {
		departmentDAO.updateDepartment(vo);
	}
	
	// 백화점 삭제
	@Override
	public void deleteDepartment(DepartmentVO vo) {
		departmentDAO.deleteDepartment(vo);
	}
	
	@Override
	public DepartmentVO selectFloor(BoardVO vo) {
		// TODO Auto-generated method stub
		return departmentDAO.selectFloor(vo);
	}

	@Override
	public List<DepartmentVO> selectAll(){
		System.out.println("여기는 dep_serviceimp");
		return departmentDAO.selectAll();
	}
	
	// 백화점과 관리자 리스트 조회
	@Override
	public List<DepartmentVO> selectDepartmentList() {
		// TODO Auto-generated method stub
		return departmentDAO.selectDepartmentList();
	}
	// 백화점 코드로 백화점명 조회
	@Override
	public DepartmentVO selectDepartment(String department_department_code) {
		return departmentDAO.selectDepartment(department_department_code);
	}
	
	
}