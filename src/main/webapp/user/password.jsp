<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>


<div id="wrapped">
    <form action="findForm.user" method="post">
    <div class="find-box">
        <h3>비밀번호 찾기</h3>
        <p>※ 가입 시 입력한 본인 정보를 입력해 주세요.</p>
        <div>
            <input type="email" placeholder=" 이메일" class="input-info" name="id">
            <input type="text" placeholder=" 닉네임"
                class="input-info" name="name">
        </div>
        <p style="color : red; margin-bottom : 0;">${error }</p>
        <button type="submit" class="find-btn">확인</button>
    </div>
    </form>
</div>


<%@ include file="../include/footer.jsp"%>