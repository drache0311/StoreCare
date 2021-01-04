package com.lotte.storecare.vo;

//VO(Value Object)
public class UserVO {
	private String id;
	private String password;
	private int department_department_code;
	private int role;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getDepartment_code() {
		return department_department_code;
	}

	public void setDepartment_code(int department_department_code) {
		this.department_department_code = department_department_code;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", department_department_code=" + department_department_code + ", role=" + role + "]";
	}
}