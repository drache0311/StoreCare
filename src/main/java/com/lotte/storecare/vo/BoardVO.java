package com.lotte.storecare.vo;

import java.sql.Timestamp;

//VO(Value Object)
public class BoardVO {
	private int seq;
	private int floor;
	private int problem_problem_code;
	private int problem_category_code;
	private String users_id;
	private int department_department_code;
	private Timestamp datetime;
	private UserVO uvo;
	private String problem_detail;
	private String category_detail;
	private String department_name;
	private Timestamp clearTime;
	private int flag;
	private int place_place_code;
	


	public int getPlace_place_code() {
		return place_place_code;
	}




	public void setPlace_place_code(int place_place_code) {
		this.place_place_code = place_place_code;
	}




	public int getSeq() {
		return seq;
	}




	public void setSeq(int seq) {
		this.seq = seq;
	}




	public int getFloor() {
		return floor;
	}




	public void setFloor(int floor) {
		this.floor = floor;
	}




	public int getProblem_problem_code() {
		return problem_problem_code;
	}




	public void setProblem_problem_code(int problem_problem_code) {
		this.problem_problem_code = problem_problem_code;
	}




	public int getProblem_category_code() {
		return problem_category_code;
	}




	public void setProblem_category_code(int problem_category_code) {
		this.problem_category_code = problem_category_code;
	}




	public String getUsers_id() {
		return users_id;
	}




	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}




	public int getDepartment_department_code() {
		return department_department_code;
	}




	public void setDepartment_department_code(int department_department_code) {
		this.department_department_code = department_department_code;
	}




	public Timestamp getDatetime() {
		return datetime;
	}




	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}




	public UserVO getUvo() {
		return uvo;
	}




	public void setUvo(UserVO uvo) {
		this.uvo = uvo;
	}




	public String getProblem_detail() {
		return problem_detail;
	}




	public void setProblem_detail(String problem_detail) {
		this.problem_detail = problem_detail;
	}




	public String getCategory_detail() {
		return category_detail;
	}




	public void setCategory_detail(String category_detail) {
		this.category_detail = category_detail;
	}




	public String getDepartment_name() {
		return department_name;
	}




	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}




	public Timestamp getClearTime() {
		return clearTime;
	}




	public void setClearTime(Timestamp clearTime) {
		this.clearTime = clearTime;
	}




	public int getFlag() {
		return flag;
	}




	public void setFlag(int flag) {
		this.flag = flag;
	}




	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", floor=" + floor + ", problem_problem_code=" + problem_problem_code + ", problem_category_code=" + problem_category_code + ", users_id="
				+ users_id + ", department_department_code=" +department_department_code +"department_name = " + department_name + "datetime=" + datetime +"category_detail="+ category_detail + "problem_detail=" + problem_detail +"\n]";
	}
	
}