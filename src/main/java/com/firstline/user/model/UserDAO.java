package com.firstline.user.model;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {

	private static UserDAO instance = new UserDAO();
	
	private UserDAO() {
		try {
			InitialContext init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("커넥션 풀 에러 발생");
		}
	}
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	private DataSource ds;
	
	
	
}
