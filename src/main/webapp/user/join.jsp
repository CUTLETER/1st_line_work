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
					placeholder=" 비밀번호 (특수문자 제외 영문+숫자 6자 이상)" class="join-input" name="pw" required="required" pattern="[0-9A-Za-z]{6,}"> <i
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


<!-- 중복 검사 - 최종 완성 -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    var idChecked = false;
    var lastChecked = '';

    // 중복 확인 버튼 클릭 시
    document.querySelector('.check-btn').addEventListener('click', function () {
        var id = document.querySelector("input[name=id]").value;
        var idCheck = document.querySelector(".idCheck");

        var rule = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9._]+\.[a-zA-Z]{2,6}$/;

        // 이메일 형식 검사
        if (!rule.test(id)) {
            idCheck.textContent = "올바른 이메일 형식이 아닙니다.";
            idChecked = false;
            return;
        }

     // 아이디 중복 검사
        var url = "joinForm.user?action=checkId&id=" + encodeURIComponent(id);
        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.status === 'fail') {
                    idCheck.textContent = data.message;
                    idChecked = false;
                } else if (data.status === 'success') {
                    idCheck.textContent = data.message;
                    idChecked = true;
                    lastChecked = id; 
                } else {
                    throw new Error('Unexpected server response');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                idCheck.textContent = "서버 오류가 발생했습니다. 다시 시도해 주세요.";
                idChecked = false;
            });
    });

    // 폼 제출 시
    document.querySelector('form').addEventListener('submit', function (event) {
        var id = document.querySelector("input[name=id]").value;
        var idCheck = document.querySelector(".idCheck");

        var rule = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9._]+\.[a-zA-Z]{2,6}$/;

        // 이메일 형식 검사
        if (!rule.test(id)) {
            idCheck.textContent = "올바른 이메일 형식이 아닙니다.";
            event.preventDefault();
            return;
        }

        // 중복 확인 여부 및 아이디 변경 여부 확인
        if (!idChecked || id !== lastChecked) {
            alert("아이디 중복 확인을 완료해 주세요.");
            event.preventDefault();
            return;
        }

    });

    // 이메일 입력 값이 변경될 때
    document.querySelector("input[name=id]").addEventListener('input', function() {
        idChecked = false;
    });
});
</script>


<%@ include file="../include/footer.jsp"%>