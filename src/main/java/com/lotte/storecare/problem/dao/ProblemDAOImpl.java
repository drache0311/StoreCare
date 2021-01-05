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
	
	@Override
	public void updateProblem(String seq) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProblem(ProblemVO vo) {
		// TODO Auto-generated method stub
		
	}

	// 뎁스 1,2,3 별 문의 추가
	@Override
	public void insertProblem(ProblemVO vo) {
		session.insert("problemDB.insertProblem", vo);
	}

	// 문의 depth 조회
	@Override
	public List<ProblemVO> selectProblemList() {
		return session.selectList("problemDB.selectProblemList");
	}
	
	// 뎁스 1,2,3 포함한 쿼리 테스트 중
	@Override
	public List<Map<String,String>> selectProblemListTest(ProblemVO vo) {
		return session.selectList("problemDB.selectProblemListTest", vo);
	}
}
