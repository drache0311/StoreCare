package com.lotte.storecare.problem;



//VO(Value Object)
public class ProblemVO {
	private int place_code;
	private int code;
	private String problem_detail;
	private String place_detail;

	public String getPlace_detail() {
		return place_detail;
	}


	public void setPlace_detail(String place_detail) {
		this.place_detail = place_detail;
	}


	public int getPlace_code() {
		return place_code;
	}


	public void setPlace_code(int place_code) {
		this.place_code = place_code;
	}


	public int getCode() {
		return code;
	}


	public void setCode(int code) {
		this.code = code;
	}


	public String getProblem_detail() {
		return problem_detail;
	}


	public void setProblem_detail(String problem_detail) {
		this.problem_detail = problem_detail;
	}


	@Override
	public String toString() {
		return "ProblemVO [place_code=" + place_code + ", code=" + code + ", problem_detail=" + problem_detail + ", place_detail=" + place_detail + "]";
	}
}