package com.teamwork.model.bean;

public class Category {
	
	private long category_ID;
	private String category_Name;
	private String sex;

	

	
	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public long getCategory_ID() {
		return category_ID;
	}


	public void setCategory_ID(long category_ID) {
		this.category_ID = category_ID;
	}


	public Category(long category_ID, String category_Name,String sex) {
		super();
		this.category_ID = category_ID;
		this.category_Name = category_Name;
		this.sex = sex;
	}


	public String getCategory_Name() {
		return category_Name;
	}


	public void setCategory_Name(String category_Name) {
		this.category_Name = category_Name;
	}

	

	public Category() {
		super();
	}
	
	
	
}
