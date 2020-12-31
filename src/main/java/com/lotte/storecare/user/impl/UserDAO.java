package com.lotte.storecare.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lotte.storecare.user.UserVO;
import com.lotte.storecare.vo.BoardVO;
import com.lotte.storecare.common.JDBCUtil;

// DAO(Data Access Object)
@Repository("userDAO")
public class UserDAO {
	
	
	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;
	
	// id로 select
	public UserVO select(String id) {

		UserVO user = session.selectOne("userDB.selectUserId", id);
		return user;
	}
	
	// vo로  select
	public UserVO select(UserVO vo) {

		UserVO user = session.selectOne("userDB.selectUserVo", vo);
		return user;
	}	
	
	// 유저 insert
	public void insertUser(UserVO vo) {
		session.insert("userDB.insertUser", vo);
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	private final String USER_GET = "select * from users where id=? and password=?";
	private final String USER_IDGET = "select id from users where id=?";
//	private final String USER_INSERT = "insert into users(id,password,role) values(?,?,2)";
	private final String USER_UPDATE = "";
	private final String USER_DELETE = "";
	private final String USER_LIST = "";

	// CRUD 기능의 메소드 구현
	// 회원 등록
//	public UserVO getUser(UserVO vo) {
//		UserVO user = null;
//		try {
//			System.out.println("===> JDBC로 getUser() 기능 처리");
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(USER_GET);
//			stmt.setString(1, vo.getId());
//			stmt.setString(2, vo.getPassword());
//			rs = stmt.executeQuery();
//			if (rs.next()) {
//				user = new UserVO();
//				user.setId(rs.getString("ID"));
//				user.setPassword(rs.getString("PASSWORD"));
//				user.setRole(rs.getInt("ROLE"));
//				user.setDepartment_code(rs.getInt("DEPARTMENT_CODE"));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//		return user;
//	}
	// 유저 검색
	public int getIdUser(UserVO vo) {
		UserVO user = null;
		try {
			System.out.println("===> JDBC로 getIdUser() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_IDGET);
			stmt.setString(1, vo.getId());
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
			}
			System.out.println("===> JDBC로 getIdUser() 기능 처리 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		if(user != null) {	// Id가 있으면 1 리턴
			System.out.println("===> 111111111111111");
			return 1;
		}else {	// ID가 없으면 0 리턴
			System.out.println("===> 222222222222222");
			return 0;
		}
	}
	// 글 등록
//	public void insertUser(UserVO vo) {
//		System.out.println("===> JDBC로 insertUser() 기능 처리");
//		try {
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(USER_INSERT);
//			
//			stmt.setString(1, vo.getId());
//			stmt.setString(2, vo.getPassword());
//			
//			stmt.executeUpdate();
//			System.out.println("===> JDBC로 insertUser() 기능 처리 완료");
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(stmt, conn);
//		}
//	}

	// 글 수정
	public void updateUser(UserVO vo) {
		System.out.println("===> JDBC로 updateUser() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_UPDATE);
			/*
			 * stmt.setInt(1, vo.getProblem_code()); stmt.setInt(2,
			 * vo.getProblem_place_code()); stmt.setInt(3, vo.getFloor()); stmt.setInt(4,
			 * vo.getSeq());
			 */
			stmt.executeUpdate();
			System.out.println("===> JDBC로 updateUser() 기능 처리 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제
	public void deleteUser(UserVO vo) {
		System.out.println("===> JDBC로 deleteUser() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_DELETE);
//			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
			System.out.println("===> JDBC로 deleteUser() 기능 처리 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 목록 조회
	public List<UserVO> getUserList(UserVO vo, HttpSession session) {
		System.out.println("===> JDBC로 getUserList() 기능 처리");
		List<UserVO> userList = new ArrayList<UserVO>();
		String id = session.getAttribute("login").toString();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_LIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				UserVO user = new UserVO();
				/*
				 * user.setSeq(rs.getInt("SEQ")); user.setFloor(rs.getInt("FLOOR"));
				 * user.setProblem_code(rs.getInt("PROBLEM_CODE"));
				 * user.setProblem_place_code(rs.getInt("PROBLEM_PLACE_CODE"));
				 * user.setUsers_id(rs.getString("USERS_ID"));
				 * user.setDepartment_code(rs.getInt("DEPARTMENT_CODE"));
				 * user.setDatetime(rs.getTimestamp("DATETIME"));
				 * user.setPlace_detail(rs.getString("PLACE_DETAIL"));
				 * user.setProblem_detail(rs.getString("PROBLEM_DETAIL"));
				 * user.setDepartment_name(rs.getString("DEP_NAME"));
				 */
				userList.add(user);
			}
			System.out.println("===> JDBC로 getUserList() 기능 처리 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return userList;
	}

}