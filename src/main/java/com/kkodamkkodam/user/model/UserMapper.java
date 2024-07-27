package com.kkodamkkodam.user.model;

import org.apache.ibatis.annotations.Param;

import com.kkodamkkodam.user.model.UserDTO;

public interface UserMapper {
	
	public UserDTO checkId(String id);
	
	public void join(UserDTO dto);
	
	public UserDTO login(@Param("id") String id, @Param("pw") String pw);
	
	public UserDTO getInfo (int userNo);
	
	public int update(UserDTO dto);
	
	public void delete (int userNo);

	
}
