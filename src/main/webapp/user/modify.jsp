<%@page import="com.kkodamkkodam.user.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div id="wrapped">
        <div class="modify-page">
            <h3>회원 정보 수정</h3>
            <form action="modifyForm.user" method="post">
            <div class="modify-box">
                <div>
                    <i class="fa-regular fa-envelope user-icon1"></i> <input type="email"
                        class="modify-input id-input" name="id" readonly="readonly" value="${user.id }">
                    <i class="fa-solid fa-lock user-icon2"></i> <input type="password"
                        placeholder=" 비밀번호 - 특수문자 제외 6자 이상" class="modify-input" name="pw" required="required" pattern="[0-9A-Za-z]{6,}"> <i
                        class="fa-solid fa-lock user-icon3"></i> <input type="password"
                        placeholder=" 비밀번호 확인" class="modify-input" name="rePw" required="required" pattern="[0-9A-Za-z]{6,}"> <i
                        class="fa-regular fa-user user-icon4"></i> <input type="text"
                        class="modify-input"  name="name" value="${user.name }">
                </div>
            </div>
            <p style="color : red; font-size : 13px;">${error }</p>
            <div>
                <button type="button" onclick="location.href = '${pageContext.request.contextPath }/index.jsp'"
                    class="modify-btn">취소</button>
                <button type="submit" class="modify-btn check-btn">저장</button>
            </div>           
            </form>
        </div>
    </div>
    
<%@ include file="../include/footer.jsp"%>