package com.lotte.storecare.departmentProblem.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lotte.storecare.vo.DepartmentProblemVO;
@Repository
public class DepartmentProblemDAOImpl implements DepartmentProblemDAO {

	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;
	
	// 뎁스 1,2,3 별 쿼리사항 검색
	@Override
	public List<Map<String, String>> selectDepProblemList(DepartmentProblemVO vo) {
		return session.selectList("departmentProblemDB.selectDepProblemList", vo);
	}
	// 뎁스 1,2,3 별 문의 추가 
	@Override
	public void insertDepProblem(HashMap<String,String> param) {
		session.insert("departmentProblemDB.insertDepProblem", param);
	}
	// 각 점의 뎁스 1,2,3 별 문의 삭제
	@Override
	public void deleteDepProblem(HashMap<String, String> param) {
		session.delete("departmentProblemDB.deleteDepProblem",param);
	}

}
