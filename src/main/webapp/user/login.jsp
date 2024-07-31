<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<%  // 쿠키 사용 - 최종 완성
	Cookie[] cookies = request.getCookies();
	String id = "";

	boolean remember = false;
	
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
			id = cookie.getValue();
			remember = true;
			}
		}
	}
%>

	<div id="wrapped">
		<form action="loginForm.user" method="post">
        <div class="login-box">
			<div class="input-box">
                <input type="text" placeholder="이메일" class="input-id" name="id" required="required" value="<%=id %>">
                <input type="password" placeholder="비밀번호" class="input-pw" name="pw" required="required">
            </div>
            <p style="color : red; font-size : 13px;">${error }</p>
			<label>
				<input type="checkbox" name="check" value="check" class="id-save" <%= remember ? "checked" : "" %>>아이디 기억하기 <!-- 쿠키 체크 유무 수정 -->
			</label>
            <button type="submit" class="check-btn">로그인</button> <!-- 버튼에 name값 제거함 -->
			<div class="find-all">
				<a href="${pageContext.request.contextPath }/user/password.jsp">비밀번호를 잊으셨나요?</a>
			</div>
        </div>
        </form>
    </div>
    
<%@ include file="../include/footer.jsp"%>