package com.lotte.storecare.problem.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.lotte.storecare.problem.ProblemVO;
import com.lotte.storecare.common.JDBCUtil;

// DAO(Data Access Object)
@Repository("problemDAO")
public class ProblemDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	private final String PROBLEM_INSERT = "insert into problem(seq, title, writer, content) values((select nvl(max(seq), 0)+1 from problem),?,?,?)";
	private final String PROBLEM_UPDATE = "update problem set title=?, content=? where seq=?";
	private final String PROBLEM_DELETE = "delete problem where seq=?";
	private final String PROBLEM_GET = "select * from problem where seq=?";
	private final String PROBLEM_LIST = "select * from problem order by seq desc";

	// CRUD 기능의 메소드 구현
	// 글 등록
	public void insertProblem(ProblemVO vo) {
		System.out.println("===> JDBC로 insertProblem() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PROBLEM_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 수정
	public void updateProblem(ProblemVO vo) {
		System.out.println("===> JDBC로 updateProblem() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PROBLEM_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제
	public void deleteProblem(ProblemVO vo) {
		System.out.println("===> JDBC로 deleteProblem() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PROBLEM_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 상세 조회
	public ProblemVO getProblem(ProblemVO vo) {
		System.out.println("===> JDBC로 getProblem() 기능 처리");
		ProblemVO problem = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PROBLEM_GET);
			stmt.setInt(1, vo.getSeq());
			rs = stmt.executeQuery();
			if (rs.next()) {
				problem = new ProblemVO();
				problem.setSeq(rs.getInt("SEQ"));
				problem.setTitle(rs.getString("TITLE"));
				problem.setWriter(rs.getString("WRITER"));
				problem.setContent(rs.getString("CONTENT"));
				problem.setRegDate(rs.getDate("REGDATE"));
				problem.setCnt(rs.getInt("CNT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return problem;
	}

	// 글 목록 조회
	public List<ProblemVO> getProblemList(ProblemVO vo) {
		System.out.println("===> JDBC로 getProblemList() 기능 처리");
		List<ProblemVO> problemList = new ArrayList<ProblemVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PROBLEM_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ProblemVO problem = new ProblemVO();
				problem.setSeq(rs.getInt("SEQ"));
				problem.setTitle(rs.getString("TITLE"));
				problem.setWriter(rs.getString("WRITER"));
				problem.setContent(rs.getString("CONTENT"));
				problem.setRegDate(rs.getDate("REGDATE"));
				problem.setCnt(rs.getInt("CNT"));
				problemList.add(problem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return problemList;
	}
}