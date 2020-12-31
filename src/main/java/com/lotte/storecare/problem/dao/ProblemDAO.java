package com.lotte.storecare.problem.dao;

import java.util.List;

import com.lotte.storecare.vo.ProblemVO;

public interface ProblemDAO {
	public List<ProblemVO> selectProblemList();
}
