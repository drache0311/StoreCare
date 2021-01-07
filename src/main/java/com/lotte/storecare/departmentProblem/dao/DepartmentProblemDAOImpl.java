package com.lotte.storecare.departmentProblem.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

import com.lotte.storecare.vo.DepartmentProblemVO;

public class DepartmentProblemDAOImpl implements DepartmentProblemDAO {

	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;
	
	// 뎁스 1,2,3 별 쿼리사항 검색
	@Override
	public List<Map<String, String>> selectProblemList(DepartmentProblemVO vo) {
		return session.selectList("departmentProblemDB.selectProblemList", vo);
	}

}
