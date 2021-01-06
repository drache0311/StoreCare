package com.lotte.storecare.user.service;

import com.lotte.storecare.vo.DepartmentVO;
import com.lotte.storecare.vo.UserVO;

public interface UserService {
	
	// id로 select
	public UserVO select(String id);
	
	// vo로  select
	public UserVO select(UserVO vo);
	
	// 유저 insert
	public void insertUser(UserVO vo);
	
	// 관리자 insert
	public void insertAdmin(DepartmentVO vo);	
	
	// 관리자 delete
	public void deleteAdmin(DepartmentVO vo);
	
	// vo로 id 있는지 check
	public int check(UserVO vo);
	
}
