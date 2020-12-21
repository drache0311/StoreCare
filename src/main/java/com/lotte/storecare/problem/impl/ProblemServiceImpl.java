package com.lotte.storecare.problem.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lotte.storecare.problem.ProblemService;
import com.lotte.storecare.problem.ProblemVO;

@Service("problemService")
public class ProblemServiceImpl implements ProblemService {
	@Autowired
	private ProblemDAO problemDAO;

	public void insertProblem(ProblemVO vo) {
//		if (vo.getSeq() == 0) {
//			throw new IllegalArgumentException("0�� ���� ����� �� �����ϴ�.");
//		}
//		problemDAO.insertProblem(vo); // 100�� �� ��� ����
		problemDAO.insertProblem(vo); // Exception �߻�
	}

	public void updateProblem(ProblemVO vo) {
		problemDAO.updateProblem(vo);
	}

	public void deleteProblem(ProblemVO vo) {
		problemDAO.deleteProblem(vo);
	}

	public ProblemVO getProblem(ProblemVO vo) {
		return problemDAO.getProblem(vo);
	}

	public List<ProblemVO> getProblemList(ProblemVO vo) {
		return problemDAO.getProblemList(vo);
	}
}