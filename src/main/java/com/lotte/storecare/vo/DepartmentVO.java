package com.lotte.storecare.vo;



//VO(Value Object)
public class DepartmentVO {
	private int department_code;
	private String department_name;
	private int department_floor;
	

	public int getDepartment_code() {
		return department_code;
	}

	public void setDepartment_code(int department_code) {
		this.department_code = department_code;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public int getDepartment_floor() {
		return department_floor;
	}

	public void setDepartment_floor(int department_floor) {
		this.department_floor = department_floor;
	}


	
	// 이 부분이랑 그 사이트 참고하면 될듯 !!!
	@Override
	public String toString() {
		return "DepartmentVO [dep_code=" + department_code + ", dep_name=" + department_name +" department_floor = " + department_floor + "]";
	}
}