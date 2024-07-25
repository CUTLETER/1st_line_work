package com.firstline.user.model;

public class UserDTO {

	private int user_no;
	private String id;
	private String pw;
	private String name;
	private String deleted;
	
	public UserDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public UserDTO(int user_no, String id, String pw, String name, String deleted) {
		super();
		this.user_no = user_no;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.deleted = deleted;
	}

	public int getuser_no() {
		return user_no;
	}

	public void setuser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	
	
	
	
}


