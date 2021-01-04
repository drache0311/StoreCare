package com.lotte.storecare.problem.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.lotte.storecare.vo.ProblemVO;

@Repository
public class ProblemDAOImpl implements ProblemDAO {

	
	



	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;
	
	
	// 문의 depth 조회
	@Override
	public List<ProblemVO> selectProblemList() {
		// TODO Auto-generated method stub
		return session.selectList("problemDB.selectProblemList");
	}
	
	// 뎁스 1,2,3 포함한 쿼리 테스트 중
	@Override
	public List<Map<String,String>> selectProblemListTest(HashMap<String,String> param) {
		// TODO Auto-generated method stub
		return session.selectList("problemDB.selectProblemListTest", param);
	}
}
