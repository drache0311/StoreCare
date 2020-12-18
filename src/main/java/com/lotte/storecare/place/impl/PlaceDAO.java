package com.lotte.storecare.place.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.lotte.storecare.place.PlaceVO;
import com.lotte.storecare.common.JDBCUtil;

// DAO(Data Access Object)
@Repository("placeDAO")
public class PlaceDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	private final String PLACE_INSERT = "insert into place(seq, title, writer, content) values((select nvl(max(seq), 0)+1 from place),?,?,?)";
	private final String PLACE_UPDATE = "update place set title=?, content=? where seq=?";
	private final String PLACE_DELETE = "delete place where seq=?";
	private final String PLACE_GET = "select * from place where seq=?";
	private final String PLACE_LIST = "select * from place order by seq desc";

	// CRUD 기능의 메소드 구현
	// 글 등록
	public void insertPlace(PlaceVO vo) {
		System.out.println("===> JDBC로 insertplace() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PLACE_INSERT);
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
	public void updatePlace(PlaceVO vo) {
		System.out.println("===> JDBC로 updateplace() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PLACE_UPDATE);
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
	public void deletePlace(PlaceVO vo) {
		System.out.println("===> JDBC로 deleteplace() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PLACE_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 상세 조회
	public PlaceVO getPlace(PlaceVO vo) {
		System.out.println("===> JDBC로 getplace() 기능 처리");
		PlaceVO place = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PLACE_GET);
			stmt.setInt(1, vo.getSeq());
			rs = stmt.executeQuery();
			if (rs.next()) {
				place = new PlaceVO();
				place.setSeq(rs.getInt("SEQ"));
				place.setTitle(rs.getString("TITLE"));
				place.setWriter(rs.getString("WRITER"));
				place.setContent(rs.getString("CONTENT"));
				place.setRegDate(rs.getDate("REGDATE"));
				place.setCnt(rs.getInt("CNT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return place;
	}

	// 글 목록 조회
	public List<PlaceVO> getPlaceList(PlaceVO vo) {
		System.out.println("===> JDBC로 getplaceList() 기능 처리");
		List<PlaceVO> placeList = new ArrayList<PlaceVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(PLACE_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				PlaceVO place = new PlaceVO();
				place.setSeq(rs.getInt("SEQ"));
				place.setTitle(rs.getString("TITLE"));
				place.setWriter(rs.getString("WRITER"));
				place.setContent(rs.getString("CONTENT"));
				place.setRegDate(rs.getDate("REGDATE"));
				place.setCnt(rs.getInt("CNT"));
				placeList.add(place);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return placeList;
	}
}