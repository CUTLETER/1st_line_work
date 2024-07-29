package com.kkodamkkodam.user.model;

public class UserDTO {

	private Long userNo;
	private String id;
	private String pw;
	private String name;
	private String deleted;
	
	public UserDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public UserDTO(String pw) {
		super();
		this.pw = pw;
	}

	public UserDTO(String id, String pw, String name) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
	}

	public UserDTO(Long userNo, String id, String pw, String name, String deleted) {
		super();
		this.userNo = userNo;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.deleted = deleted;
	}

	public Long getuserNo() {
		return userNo;
	}

	public void setuserNo(Long userNo) {
		this.userNo = userNo;
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


