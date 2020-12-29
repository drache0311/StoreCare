package com.lotte.storecare.department.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.lotte.storecare.department.DepartmentVO;
import com.lotte.storecare.user.UserVO;
import com.lotte.storecare.board.BoardVO;
import com.lotte.storecare.common.JDBCUtil;

// DAO(Data Access Object)
@Repository("departmentDAO")
public class DepartmentDAO {
	
	
	
	
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;
	
	// 1개만 select
	public DepartmentVO select(String id) {

		DepartmentVO department = session.selectOne("departmentDB.selectUser", id);
		return department;
	}
	// 층 수 조회
	public DepartmentVO selectFloor(BoardVO vo) {	// 안돼면 board의 dep_code로 해보자
		System.out.println("여기는 departmentDao의 selectFloor / department_code = " + vo.getDepartment_code());
		
		DepartmentVO floor = session.selectOne("departmentDB.selectFloor", vo.getDepartment_code());
		
		System.out.println("여기는 departmentDao의 selectFloor 이후 //  " + floor);
		
		return floor;
	}
	// 여러 개 select
	public List<DepartmentVO> selectAll() {
		System.out.println("여기는 departmentDao의 selectALL");
		List<DepartmentVO> departmentList = session.selectList("departmentDB.selectDepartmentAll");
		return departmentList;		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	private final String DEPARTMENT_INSERT = "insert into department(code, title, writer, content) values((select nvl(max(code), 0)+1 from department),?,?,?)";
	private final String DEPARTMENT_UPDATE = "update department set title=?, content=? where code=?";
	private final String DEPARTMENT_DELETE = "delete department where code=?";
	private final String DEPARTMENT_GET = "select * from department";
	private final String DEPARTMENT_LIST = "select * from department ";

	// CRUD 기능의 메소드 구현
	// 글 등록
	public void insertDepartment(DepartmentVO vo) {
		System.out.println("===> JDBC로 insertDepartment() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(DEPARTMENT_INSERT);
			stmt.setString(1, vo.getDep_name());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 수정
	public void updateDepartment(DepartmentVO vo) {
		System.out.println("===> JDBC로 updateDepartment() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(DEPARTMENT_UPDATE);
			stmt.setString(1, vo.getDep_name());
			stmt.setInt(3, vo.getCode());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제
	public void deleteDepartment(DepartmentVO vo) {
		System.out.println("===> JDBC로 deleteDepartment() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(DEPARTMENT_DELETE);
			stmt.setInt(1, vo.getCode());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 상세 조회
	public DepartmentVO getDepartment(DepartmentVO vo) {
		System.out.println("===> JDBC로 getDepartment() 기능 처리");
		DepartmentVO department = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(DEPARTMENT_GET);
			
			rs = stmt.executeQuery();
			if (rs.next()) {
				department = new DepartmentVO();
				department.setCode(rs.getInt("CODE"));
				department.setDep_name(rs.getString("DEP_NAME"));
			}
			System.out.println("===> 디비완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return department;
	}
//
//	// 글 목록 조회
//	public List<DepartmentVO> getDepartmentList(DepartmentVO vo) {
//		System.out.println("===> JDBC로 getDepartmentList() 기능 처리");
//		List<DepartmentVO> departmentList = new ArrayList<DepartmentVO>();
//		try {
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(DEPARTMENT_LIST);
//			rs = stmt.executeQuery();
//			while (rs.next()) {
//				DepartmentVO department = new DepartmentVO();
//				department.setCode(rs.getInt("CODE"));
//				department.setDep_name(rs.getString("DEP_NAME"));
//				departmentList.add(department);
//			}	
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//		return departmentList;
//	}
}