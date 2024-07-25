<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>


<div id="wrapped">
	<div class="delete-box">
		<h3>비밀번호 재확인</h3>
		<p>회원 탈퇴를 위해 비밀번호를 한번 더 입력해 주세요.</p>
		<div>
			<input type="password" placeholder=" password" class="input-pw pw1">
			<input type="password" placeholder=" re password"
				class="input-pw pw2">
		</div>
		<button type="button" onclick="location.href = '#'" class="check-btn">확인</button>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>