<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div id="wrapped">
    <form action="changeForm.user" method="post">
    <div class="update-box">
        <h3>비밀번호 찾기</h3>
        <div>
        	<p>새 비밀번호 : </p>
            <input type="password" placeholder=" 특수문자 제외 6자 이상 입력해 주세요." class="pw-update" name="pw" required="required" pattern="[0-9A-Za-z]{6,}">
            <p>새 비밀번호 확인 : </p>
            <input type="password" placeholder=" 한번 더 입력해 주세요."
                class="pw-update" name="rePw" required="required" pattern="[0-9A-Za-z]{6,}">
        </div>
        <p style="color : red; margin-bottom : 0;">${error }</p>
        <button type="submit" class="update-btn">확인</button>
    </div>
    </form>
</div>

<%@ include file="../include/footer.jsp"%>