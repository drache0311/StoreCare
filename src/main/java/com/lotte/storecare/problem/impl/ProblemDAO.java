package com.lotte.storecare.problem.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.lotte.storecare.problem.ProblemVO;
import com.lotte.storecare.board.BoardVO;
import com.lotte.storecare.common.JDBCUtil;

// DAO(Data Access Object)
@Repository("problemDAO")
public class ProblemDAO {
	
	
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;
	
	// 문의 depth 조회
	public List<ProblemVO> selectProblemList() {
		System.out.println("여기는 problemDAO의 selectProblemList");
		
		List<ProblemVO> problemList = session.selectList("problemDB.selectProblemList");
		return problemList;		
	}	
	
	
	
	
	
	
	
	
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	private final String PROBLEM_INSERT = "insert into problem(seq, title, writer, content) values((select nvl(max(seq), 0)+1 from problem),?,?,?)";
	private final String PROBLEM_UPDATE = "update problem set title=?, content=? where seq=?";
	private final String PROBLEM_DELETE = "delete problem where seq=?";
	private final String PROBLEM_GET = "select * from problem where seq=?";
//	private final String PROBLEM_LIST = "select place_code,problem.code,problem_detail,place_detail from storecare.problem, storecare.place where problem.place_code=place.code";

	// CRUD 기능의 메소드 구현
	// 글 등록   -> 미완성
	public void insertProblem(ProblemVO vo) {
		System.out.println("===> JDBC로 insertProblem() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PROBLEM_INSERT);
			stmt.setInt(1, vo.getPlace_code());
			stmt.setInt(2, vo.getCode());
			stmt.setString(3, vo.getProblem_detail());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 수정   -> 미완성
	public void updateProblem(ProblemVO vo) {
		System.out.println("===> JDBC로 updateProblem() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PROBLEM_UPDATE);
			stmt.setInt(1, vo.getPlace_code());
			stmt.setString(2, vo.getProblem_detail());
			stmt.setInt(3, vo.getCode());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제   -> 미완성
	public void deleteProblem(ProblemVO vo) {
		System.out.println("===> JDBC로 deleteProblem() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PROBLEM_DELETE);
			stmt.setInt(1, vo.getCode());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 상세 조회  -> 미완성
	public ProblemVO getProblem(ProblemVO vo) {
		System.out.println("===> JDBC로 getProblem() 기능 처리");
		ProblemVO problem = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PROBLEM_GET);
			stmt.setInt(1, vo.getCode());
			rs = stmt.executeQuery();
			if (rs.next()) {
				problem = new ProblemVO();
				problem.setPlace_code(rs.getInt("PLACE_CODE"));
				problem.setCode(rs.getInt("CODE"));
				problem.setProblem_detail(rs.getString("PROBLEM_DETAIL"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return problem;
	}

//	// 글 목록 조회  --> 수정 중
//	public List<ProblemVO> getProblemList(ProblemVO vo) {
//		System.out.println("===> JDBC로 getProblemList() 기능 처리");
//		List<ProblemVO> problemList = new ArrayList<ProblemVO>();
//		try {
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(PROBLEM_LIST);
//			rs = stmt.executeQuery();
//			while (rs.next()) {
//				ProblemVO problem = new ProblemVO();
//				problem.setPlace_code(rs.getInt("PLACE_CODE"));
//				problem.setCode(rs.getInt("CODE"));
//				problem.setProblem_detail(rs.getString("PROBLEM_DETAIL"));
//				problem.setPlace_detail(rs.getString("PLACE_DETAIL"));
//				problemList.add(problem);
//			}
//			System.out.println("===> JDBC로 getProblemList() 기능 처리 완료");
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//		return problemList;
//	}
}