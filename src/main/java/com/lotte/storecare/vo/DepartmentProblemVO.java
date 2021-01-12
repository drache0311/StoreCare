package com.lotte.storecare.vo;



//VO(Value Object)
public class DepartmentProblemVO {
	private int category_category_code;
	private int problem_problem_code;
	private String problem_detail;
	private String category_detail;
	private int depth;
	private int category_code;
	private int place_place_code;
	private String place_detail;
	private String department_department_code;
	private String department_department_name;



	public String getDepartment_department_name() {
		return department_department_name;
	}


	public void setDepartment_department_name(String department_department_name) {
		this.department_department_name = department_department_name;
	}


	public String getDepartment_department_code() {
		return department_department_code;
	}


	public void setDepartment_department_code(String department_department_code) {
		this.department_department_code = department_department_code;
	}


	public int getProblem_problem_code() {
		return problem_problem_code;
	}


	public void setProblem_problem_code(int problem_problem_code) {
		this.problem_problem_code = problem_problem_code;
	}


	public int getPlace_place_code() {
		return place_place_code;
	}


	public void setPlace_place_code(int place_place_code) {
		this.place_place_code = place_place_code;
	}


	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}


	public int getDepth() {
		return depth;
	}


	public void setDepth(int depth) {
		this.depth = depth;
	}




	public Integer getCategory_code() {
		return category_code;
	}


	public void setCategory_code(Integer category_code) {
		this.category_code = category_code;
	}


	public String getPlace_detail() {
		return place_detail;
	}


	public void setPlace_detail(String place_detail) {
		this.place_detail = place_detail;
	}


	public int getCategory_category_code() {
		return category_category_code;
	}


	public void setCategory_category_code(int category_category_code) {
		this.category_category_code = category_category_code;
	}



	public String getCategory_detail() {
		return category_detail;
	}


	public void setCategory_detail(String category_detail) {
		this.category_detail = category_detail;
	}


	public int getPlace_code() {
		return category_category_code;
	}


	public void setPlace_code(int category_category_code) {
		this.category_category_code = category_category_code;
	}



	public String getProblem_detail() {
		return problem_detail;
	}


	public void setProblem_detail(String problem_detail) {
		this.problem_detail = problem_detail;
	}


	@Override
	public String toString() {
		return "ProblemVO [depth=" + depth + ", problem_problem_code=" + problem_problem_code + ", problem_detail=" + problem_detail + ", category_detail=" + category_detail + "]";
	}
}