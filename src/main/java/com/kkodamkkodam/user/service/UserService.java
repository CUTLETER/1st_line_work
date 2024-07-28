package com.kkodamkkodam.user.service;

import java.io.IOException;

import com.kkodamkkodam.user.model.UserDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface UserService {
	
	// 중복 확인
	void checkId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	// 가입
	void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	// 로그인
	void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	// 내가 쓴 조회
	void getPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	// 내가 쓴 댓글 조회
	void getComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	// 정보 수정
	void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	// 탈퇴
	void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	
}
