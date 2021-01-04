package com.lotte.storecare.vo;



//VO(Value Object)
public class ProblemVO {
	private int category_category_code;
	private int problem_code;
	private String problem_detail;
	private String category_detail;



	public int getCategory_category_code() {
		return category_category_code;
	}


	public void setCategory_category_code(int category_category_code) {
		this.category_category_code = category_category_code;
	}


	public int getProblem_code() {
		return problem_code;
	}


	public void setProblem_code(int problem_code) {
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
		return "ProblemVO [category_category_code=" + category_category_code + ", problem_code=" + problem_code + ", problem_detail=" + problem_detail + ", category_detail=" + category_detail + "]";
	}
}