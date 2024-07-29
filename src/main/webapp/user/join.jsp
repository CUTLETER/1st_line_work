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
					placeholder=" 비밀번호 (특수문자 제외 6자 이상)" class="join-input" name="pw" required="required" pattern="[0-9A-Za-z]{6,}"> <i
					class="fa-solid fa-lock user-icon3"></i> <input type="password"
					placeholder=" 비밀번호 확인" class="join-input" name="rePw" required="required" pattern="[0-9A-Za-z]{6,}"> <i
					class="fa-regular fa-user user-icon4"></i> <input type="text"
					placeholder=" 닉네임" class="join-input" name="name"> 
			</div>
		</div>
		<p style="font-size : 13px; color : red;" class="idCheck"></p>
		<div>
			<button type="submit" class="join-btn">회원
				가입</button>
		</div>
		</form>
	</div>
</div>

<script>
	var checkId = function() {
	  var id = document.querySelector("input[name=id]").value;
	  var idCheck = document.querySelector(".idCheck");

	  if (id.trim() == "") { // 공백이어도 사용 가능하다고 떠서 추가함
	    idCheck.textContent = "아이디를 입력해주세요.";
	    return;
	  }

	  var url = "joinForm.user?action=checkId&id=" + encodeURIComponent(id);

	  fetch(url)
	    .then(function(response) {
	      return response.text();
	    })
	    .then(function(result) {
	      idCheck.textContent = result;
	    })
	    .catch(function(error) {
	      idCheck.textContent = "오류가 발생했습니다.";
	      console.error('Error:', error);
	    });
	};
</script>


<%@ include file="../include/footer.jsp"%>