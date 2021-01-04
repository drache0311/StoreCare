package com.lotte.storecare.department.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.vo.DepartmentVO;

@Repository
public class DepartmentDAOImpl implements DepartmentDAO {
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;

	
	@Override
	public void insertDepartment(DepartmentVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateDepartment(DepartmentVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDepartment(DepartmentVO vo) {
		// TODO Auto-generated method stub
		
	}
//	@Override
//	public DepartmentVO select(String id) {
//		return session.selectOne("departmentDB.selectUser", id);
//	}
	@Override
	public DepartmentVO selectFloor(BoardVO vo) {
		// TODO Auto-generated method stub
		return session.selectOne("departmentDB.selectFloor", vo.getDepartment_department_code());
	}
	
	// 여러 개 select
	@Override
	public List<DepartmentVO> selectAll() {
		// TODO Auto-generated method stub
		return session.selectList("departmentDB.selectDepartmentAll");
	}
	
	
}
