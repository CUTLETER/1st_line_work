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
	
	// 정보 수정
	void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	// 탈퇴
	void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
	// 비밀번호 찾기 전 계정 조회
	void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; 
	
	// 비밀번호 변경
	void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; 
}
