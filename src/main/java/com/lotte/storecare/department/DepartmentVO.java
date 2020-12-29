package com.lotte.storecare.department;



//VO(Value Object)
public class DepartmentVO {
	private int code;
	private String dep_name;
	private int department_floor;
	
	public int getCode() {
		return code;
	}

	public int getDepartment_floor() {
		return department_floor;
	}

	public void setDepartment_floor(int department_floor) {
		this.department_floor = department_floor;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDep_name() {
		return dep_name;
	}

	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	
	// 이 부분이랑 그 사이트 참고하면 될듯 !!!
	@Override
	public String toString() {
		return "DepartmentVO [code=" + code + ", dep_name=" + dep_name +" department_floor = " + department_floor + "]";
	}
}