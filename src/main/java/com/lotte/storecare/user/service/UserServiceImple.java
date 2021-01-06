package com.lotte.storecare.user.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.lotte.storecare.user.dao.UserDAO;
import com.lotte.storecare.vo.DepartmentVO;
import com.lotte.storecare.vo.UserVO;

@Service
public class UserServiceImple implements UserService {

	@Inject
	private UserDAO userDAO;
	
	// id로 select
	@Override
	public UserVO select(String id) {
		// TODO Auto-generated method stub
		return userDAO.select(id);
	}
	
	// vo로  select
	@Override
	public UserVO select(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.select(vo);
	}
	
	// 유저 insert
	@Override
	public void insertUser(UserVO vo) {
		// TODO Auto-generated method stub
		userDAO.insertUser(vo);
	}
	// 관리자 insert
	@Override
	public void insertAdmin(DepartmentVO vo) {
		userDAO.insertAdmin(vo);
	}
	// 관리자 delete
	@Override
	public void deleteAdmin(DepartmentVO vo) {
		userDAO.deleteAdmin(vo);
	}

	// vo로 id 있는지 check
	@Override
	public int check(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.check(vo);
	}

}
