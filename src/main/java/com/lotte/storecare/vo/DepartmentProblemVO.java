package com.lotte.storecare.vo;



//VO(Value Object)
public class DepartmentProblemVO {
	private int category_category_code;
	private Integer problem_code;
	private String problem_detail;
	private String category_detail;
	private int depth;
	private Integer category_code;
	private String place_detail;





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



	public Integer getProblem_code() {
		return problem_code;
	}


	public void setProblem_code(Integer problem_code) {
		this.problem_code = problem_code;
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
		return "ProblemVO [depth=" + depth + ", problem_code=" + problem_code + ", problem_detail=" + problem_detail + ", category_detail=" + category_detail + "]";
	}
}