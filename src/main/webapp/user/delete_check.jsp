<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>


<div id="wrapped">
	<form action="deleteForm.user" method="post">
	<div class="delete-box">
		<h3>비밀번호 재확인</h3>
		<p class="delete-text">회원 탈퇴를 위해 비밀번호를 한번 더 입력해 주세요.</p>
		<div>
			<input type="password" placeholder=" password" class="input-pw pw1" name="pw">
			<input type="password" placeholder=" re password"
				class="input-pw pw2" name="rePw">
		</div>
		<p style="color : red; margin-bottom : 0;">${error }</p>
		<button type="submit" class="check-btn">확인</button>
	</div>
	</form>
</div>

<%@ include file="../include/footer.jsp"%>