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
/*   var rule = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9._]+\.[a-zA-Z]{2,6}$/;
  
  // 이메일 형식과 중복 검사 함수
  var checkId = function() {
      var id = document.querySelector("input[name=id]").value;
      var idCheck = document.querySelector(".idCheck");

      if (!rule.test(id)) {
          idCheck.textContent = "올바른 이메일 형식이 아닙니다.";
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
  
   */

   document.addEventListener('DOMContentLoaded', function () {
       var isIdChecked = false;

       // 중복 확인 버튼 클릭 시
       document.querySelector('.check-btn').addEventListener('click', function () {
           var id = document.querySelector("input[name=id]").value;
           var idCheck = document.querySelector(".idCheck");

           // 이메일 형식 정규 표현식 정의
           var rule = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9._]+\.[a-zA-Z]{2,6}$/;

           // 이메일 형식 검사
           if (!rule.test(id)) {
               idCheck.textContent = "올바른 이메일 형식이 아닙니다.";
               isIdChecked = false; // 중복 확인 실패
               return;
           }

           // 아이디 중복 검사
           var url = "joinForm.user?action=checkId&id=" + encodeURIComponent(id);
           fetch(url)
               .then(response => response.json())
               .then(data => {
                   if (data.status === 'fail') {
                       idCheck.textContent = data.message;
                       isIdChecked = false; // 중복 확인 실패
                   } else {
                       idCheck.textContent = "사용 가능한 아이디입니다.";
                       isIdChecked = true; // 중복 확인 성공
                   }
               })
               .catch(error => {
                   idCheck.textContent = "서버 오류가 발생했습니다.";
                   isIdChecked = false; // 중복 확인 실패
               });
       });

       // 폼 제출 시
       document.querySelector('form').addEventListener('submit', function (event) {
           if (!isIdChecked) {
               alert("아이디 중복 확인을 완료해 주세요.");
               event.preventDefault(); // 폼 제출 방지
           }

           var id = document.querySelector("input[name=id]").value;
           var pw = document.querySelector("input[name=pw]").value;
           var rePw = document.querySelector("input[name=rePw]").value;
           var idCheck = document.querySelector(".idCheck");

           // 이메일 형식 정규 표현식 정의
           var rule = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9._]+\.[a-zA-Z]{2,6}$/;

           // 이메일 형식 검사
           if (!rule.test(id)) {
               idCheck.textContent = "올바른 이메일 형식이 아닙니다.";
               event.preventDefault(); // 폼 제출 방지
               return;
           }

       });
   });
</script>


<%@ include file="../include/footer.jsp"%>