package com.kkodamkkodam.user.model;

import org.apache.ibatis.annotations.Param;

import com.kkodamkkodam.user.model.UserDTO;

public interface UserMapper {
	
	public UserDTO checkId(String id);
	
	public void join(UserDTO dto);
	
	public UserDTO login(@Param("id") String id, @Param("pw") String pw);
	
	public int update(UserDTO dto);

	public int delete(@Param("id") String id);
	
	public UserDTO find(@Param("id") String id, @Param("name") String name);

//	public int change(UserDTO dto);
	
}
