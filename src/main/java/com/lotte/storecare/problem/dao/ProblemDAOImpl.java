package com.lotte.storecare.problem.dao;

import java.util.List;
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

}
