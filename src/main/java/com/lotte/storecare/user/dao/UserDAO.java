package com.lotte.storecare.user.dao;

import com.lotte.storecare.vo.DepartmentVO;
import com.lotte.storecare.vo.UserVO;

public interface UserDAO {
	
	// id로 select
	public UserVO select(String id);
	
	// vo로  select
	public UserVO select(UserVO vo);

	// vo로 id 있는지 check
	public int check(UserVO vo);
	
	
	// 유저 insert
	public void insertUser(UserVO vo);
	
	// 관리자 insert
	public void insertAdmin(DepartmentVO vo);	
}
