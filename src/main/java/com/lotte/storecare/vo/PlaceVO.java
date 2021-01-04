package com.lotte.storecare.vo;

//VO(Value Object)
public class PlaceVO {
	private int place_code;
	private String place_detail;
	private int category_category_code;





	public int getPlace_code() {
		return place_code;
	}



	public void setPlace_code(int place_code) {
		this.place_code = place_code;
	}



	public int getCategory_category_code() {
		return category_category_code;
	}



	public void setCategory_category_code(int category_category_code) {
		this.category_category_code = category_category_code;
	}



	public String getPlace_detail() {
		return place_detail;
	}



	public void setPlace_detail(String place_detail) {
		this.place_detail = place_detail;
	}



	@Override
	public String toString() {
		return "PlaceVO [place_code=" + place_code + ", place_detail=" + place_detail + "category_category_code =" + category_category_code +"]";
	}
}