package com.lotte.storecare.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;
import com.lotte.storecare.board.BoardVO;
import com.lotte.storecare.common.JDBCUtil;


// DAO(Data Access Object)
@Repository("boardDAO")
public class BoardDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	//private final String BOARD_INSERT = "insert into board(seq, title, writer, content) values((select nvl(max(seq), 0)+1 from board),?,?,?)";
	private final String BOARD_INSERT = "insert into board(floor, problem_code,problem_place_code,users_id,department_code,datetime) values(?,?,?,?,?,?)";
	private final String BOARD_UPDATE = "update board set problem_code=? ,datetime=?, problem_place_code=?,floor=? where seq=?";
	private final String BOARD_DELETE = "delete from board where seq=?";
	private final String BOARD_GET = "select * from board where seq=?";
	private final String BOARD_FLOOR = "select distinct department_floor,dep_name from board,department where department.code=?";
	private final String BOARD_USERLIST = "select * from board,problem,place,department where problem.place_code=place.code and board.problem_code=problem.code and board.problem_place_code=place.code and board.department_code=department.code and users_id=?";
	private final String BOARD_LIST = "SELECT seq,datetime,clearTime,place_detail,problem_detail,flag,department_code,dep_name,floor,users_id FROM board join problem join place join department ON board.problem_code = problem.code and problem.place_code=place.code and board.problem_place_code=place.code and board.department_code=department.code and board.department_code=?";

	// CRUD 기능의 메소드 구현
	// 글 등록 
	public void insertBoard(BoardVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setInt(1, vo.getFloor());
			stmt.setInt(2, vo.getProblem_code());
			stmt.setInt(3, vo.getProblem_place_code());
			stmt.setString(4, vo.getUsers_id());
			stmt.setInt(5, vo.getDepartment_code());
			stmt.setTimestamp(6, vo.getDatetime());
			stmt.executeUpdate();
		System.out.println("===> JDBC로 insertBoard() 기능 처리 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 수정  
	public void updateBoard(BoardVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setInt(1, vo.getProblem_code());
			stmt.setTimestamp(2, vo.getDatetime());
			stmt.setInt(3, vo.getProblem_place_code());
			stmt.setInt(4, vo.getFloor());
			stmt.setInt(5, vo.getSeq());
			stmt.executeUpdate();
			System.out.println("===> JDBC로 updateBoard() 기능 처리 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
			System.out.println("===> JDBC로 deleteBoard() 기능 처리 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	// 층 수 조회 floor 
	public BoardVO getFloor(BoardVO vo) {
		System.out.println("===> JDBC로 getFloor() 기능 처리");
		System.out.print("=========>dep_code===>");
		System.out.println(vo.getDepartment_code());
		BoardVO board = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_FLOOR);
			stmt.setInt(1, vo.getDepartment_code());
			rs = stmt.executeQuery();
			if (rs.next()) {
				board = new BoardVO();
				board.setFloor(rs.getInt("DEPARTMENT_FLOOR"));
				board.setDepartment_name(rs.getString("DEP_NAME"));
				System.out.println("===> JDBC로 getFloor() 기능 처리 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return board;
	}
	
	
	
	// 글 상세 조회 
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		BoardVO board = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, vo.getSeq());
			rs = stmt.executeQuery();
			if (rs.next()) {
				board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setFloor(rs.getInt("FLOOR"));
				board.setProblem_code(rs.getInt("PROBLEM_CODE"));
				board.setProblem_place_code(rs.getInt("PROBLEM_PLACE_CODE"));
				board.setUsers_id(rs.getString("USERS_ID"));
				board.setDepartment_code(rs.getInt("DEPARTMENT_CODE"));
				board.setDatetime(rs.getTimestamp("DATETIME"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return board;
	}

	// 유저 문의 목록 조회 
	public List<BoardVO> getBoardUserList(BoardVO vo,HttpSession session) {
		System.out.println("===> JDBC로 getBoardUserList() 기능 처리");
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		String id = session.getAttribute("login").toString();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_USERLIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setFloor(rs.getInt("FLOOR"));
				board.setProblem_code(rs.getInt("PROBLEM_CODE"));
				board.setProblem_place_code(rs.getInt("PROBLEM_PLACE_CODE"));
				board.setUsers_id(rs.getString("USERS_ID"));
				board.setDepartment_code(rs.getInt("DEPARTMENT_CODE"));
				board.setDatetime(rs.getTimestamp("DATETIME"));
				board.setPlace_detail(rs.getString("PLACE_DETAIL"));
				board.setProblem_detail(rs.getString("PROBLEM_DETAIL"));
				board.setDepartment_name(rs.getString("DEP_NAME"));
				boardList.add(board);
			}
			System.out.println("===> JDBC로 getBoardUserList() 기능 처리 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return boardList;
	}
	
	// 전체 문의 목록 조회 
	public List<BoardVO> getBoardList(BoardVO vo, HttpSession session) {
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		String dep_code = session.getAttribute("role").toString();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			stmt.setString(1, dep_code);
			rs = stmt.executeQuery();
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setFloor(rs.getInt("FLOOR"));
				board.setUsers_id(rs.getString("USERS_ID"));
				board.setDatetime(rs.getTimestamp("DATETIME"));
				board.setPlace_detail(rs.getString("PLACE_DETAIL"));
				board.setProblem_detail(rs.getString("PROBLEM_DETAIL"));
				board.setDepartment_name(rs.getString("DEP_NAME"));
				board.setClearTime(rs.getTimestamp("CLEARTIME"));
				board.setFlag(rs.getInt("FLAG"));
				board.setDepartment_code(rs.getInt("DEPARTMENT_CODE"));
				boardList.add(board);
			}
			System.out.println("===> JDBC로 getBoardList() 기능 처리 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return boardList;
	}
}