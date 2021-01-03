package com.lotte.storecare.vo;

import java.sql.Timestamp;

//VO(Value Object)
public class BoardVO {
	private int seq;
	private int floor;
	private int problem_code;
	private int problem_place_code;
	private String users_id;
	private int department_code;
	private Timestamp datetime;
	private UserVO uvo;
	private String problem_detail;
	private String place_detail;
	private String dep_name;
	private Timestamp clearTime;
	private int flag;
	
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

	public String getDep_name() {
		return dep_name;
	}

	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}

	public String getProblem_detail() {
		return problem_detail;
	}

	public void setProblem_detail(String problem_detail) {
		this.problem_detail = problem_detail;
	}

	public String getPlace_detail() {
		return place_detail;
	}

	public void setPlace_detail(String place_detail) {
		this.place_detail = place_detail;
	}

	public UserVO getUvo() {
		return uvo;
	}

	public void setUvo(UserVO uvo) {
		this.uvo = uvo;
	}

	public int getProblem_code() {
		return problem_code;
	}

	public void setProblem_code(int problem_code) {
		this.problem_code = problem_code;
	}

	public int getProblem_place_code() {
		return problem_place_code;
	}

	public void setProblem_place_code(int problem_place_code) {
		this.problem_place_code = problem_place_code;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public int getDepartment_code() {
		return department_code;
	}

	public void setDepartment_code(int department_code) {
		this.department_code = department_code;
	}

	public Timestamp getDatetime() {
		return datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
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


	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", floor=" + floor + ", problem_code=" + problem_code + ", problem_place_code=" + problem_place_code + ", users_id="
				+ users_id + ", department_code=" +department_code +"department_name = " + dep_name + "datetime=" + datetime +"place_detail="+ place_detail + "problem_detail=" + problem_detail +"\n]";
	}
	
}