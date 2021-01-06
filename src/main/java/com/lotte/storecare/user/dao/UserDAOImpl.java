package com.lotte.storecare.user.dao;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.lotte.storecare.vo.DepartmentVO;
import com.lotte.storecare.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	
	@Resource(name="sqlSessoinTemplate")
	private SqlSessionTemplate session;
	
	// id로 select
	@Override
	public UserVO select(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("userDB.selectUserId", id);
	}

	// vo로 id 있는지 check
	@Override
	public int check(UserVO vo) {
		// TODO Auto-generated method stub
		UserVO user = session.selectOne("userDB.checkUserId", vo);
		
		if(user != null) {	// Id가 있으면 1 리턴
			System.out.println("===> 111111111111111");
			return 1;
		}else {	// ID가 없으면 0 리턴
			System.out.println("===> 222222222222222");
			return 0;
		}
	}


	// vo로  select
	@Override
	public UserVO select(UserVO vo) {
		// TODO Auto-generated method stub
		return session.selectOne("userDB.selectUserVo", vo);
	}
	
	// 유저 insert
	@Override
	public void insertUser(UserVO vo) {
		session.insert("userDB.insertUser", vo);
	}
	// 관리자 insert
	@Override
	public void insertAdmin(DepartmentVO vo) {
		session.insert("userDB.insertAdmin", vo);
	}

}
