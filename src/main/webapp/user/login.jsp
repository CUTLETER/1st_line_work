<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

	<div id="wrapped">
        <div class="login-box">
			<div class="input-box">
                <input type="text" placeholder="아이디" class="input-id">
                <input type="password" placeholder="비밀번호" class="input-pw">
            </div>
			<label>
				<input type="checkbox" class="id-save">아이디 기억하기
			</label>
            <button type="button" onclick="location.href = '#'" class="check-btn">로그인</button>
			<div class="find-all">
				<a href="#">아이디 찾기 | </a>
				<a href="#">비밀번호 찾기</a>
			</div>
        </div>
    </div>
    
<%@ include file="../include/footer.jsp"%>