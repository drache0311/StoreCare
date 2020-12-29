package com.lotte.storecare.problem;

import java.util.List;

public interface ProblemService {
	// CRUD ����� �޼ҵ� ����
	// �� ���
	void insertProblem(ProblemVO vo);

	// �� ����
	void updateProblem(ProblemVO vo);

	// �� ����
	void deleteProblem(ProblemVO vo);

	// �� �� ��ȸ
	ProblemVO getProblem(ProblemVO vo);

	// �� ��� ��ȸ
	List<ProblemVO> selectProblemList(ProblemVO vo);
}
