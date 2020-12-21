package com.lotte.storecare.board;

import java.sql.Timestamp;

import com.lotte.storecare.user.UserVO;

//VO(Value Object)
public class BoardVO {
	private int seq;
	private String floor;
	private int problem_code;
	private int problem_place_code;
	private String users_id;
	private int department_code;
	private Timestamp datetime;
	private UserVO uvo;
	
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

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}


	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", floor=" + floor + ", problem_code=" + problem_code + ", problem_place_code=" + problem_place_code + ", users_id="
				+ users_id + ", department_code=" + department_code + "datetime" + datetime +"]";
	}
}