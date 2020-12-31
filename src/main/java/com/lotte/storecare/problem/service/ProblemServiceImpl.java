package com.lotte.storecare.problem.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.lotte.storecare.problem.dao.ProblemDAO;
import com.lotte.storecare.vo.ProblemVO;

@Service
public class ProblemServiceImpl implements ProblemService {

	@Inject
	private ProblemDAO problemDAO;
	
	
	// 문의 depth 조회
	@Override
	public List<ProblemVO> selectProblemList() {
		// TODO Auto-generated method stub
		return problemDAO.selectProblemList();
	}

}
