<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>




<div id="wrapped">
	<div class="join-page">
		<h3>회원 가입</h3>
		<form action="joinForm.user" method="post">
		<div class="join-box">
			<div>
				<i class="fa-regular fa-envelope user-icon1"></i> <input type="email"
					placeholder=" 이메일" class="join-input id-input" name="id">
				<button type="button" class="check-btn" onclick="checkId()">중복 확인</button>
				<i class="fa-solid fa-lock user-icon2"></i> <label></label><input type="password"
					placeholder=" 비밀번호" class="join-input" name="pw" required="required"> <i
					class="fa-solid fa-lock user-icon3"></i> <input type="password"
					placeholder=" 비밀번호 확인" class="join-input" name="rePw" required="required"> <i
					class="fa-regular fa-user user-icon4"></i> <input type="text"
					placeholder=" 닉네임" class="join-input" name="name"> 
			</div>
		</div>
		<p style="font-size : 13px; colo : red;">${message }</p>
		<div>
			<button type="submit" class="join-btn">회원
				가입</button>
		</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	var id = document.querySelector("input[name=id]").value;
	var url = "/kkodamkkodam/user/join.jsp";
	function checkId() {	
		fetch(url, {
			method : "post",
			headers : {"Content-type" : "application/json", "X-Requested-With": "XMLHttpRequest"},
			body : JSON.stringify({id: id})
		}).then(function(response) {
			response.json();
		}).then(function(id) {
			document.getElementById("message").textContent = data.message;
		})
	}
</script>

<%@ include file="../include/footer.jsp"%>