<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<div id="wrapped">
	<div class="top">
		<ul class="top_text">
			<li><a href="목록"><span class="glyphicon glyphicon-flag"></span>
					개설신청</a></li>
			<li><a href="게시판 전체보기"><span
					class="glyphicon glyphicon-list"></span> 전체 카테고리</a></li>
		</ul>
	</div>

	<div class="title">
		<h3 class="bold">뉴진스 카테고리 신설 요청합니다</h3>
		<p>
			11일 전 | 조회 111 | <span class="glyphicon glyphicon-thumbs-up"></span>7
		</p>
		<button type="button" class="title_right">
			<span class="glyphicon glyphicon-thumbs-up"></span>
		</button>
		<button type="button" class="title_left">새 글(write)</button>
	</div>

	<div class="content">
		<div class="box">
			<p class="bold">투표 전 반드시 확인!</p>
			<p>1. 모든 신설 요청에 대해 1주일 내에 한 번만 투표 가능하므로 꼭 필요한 경우에만 작성해 주세요.</p>
			<p>2. 비회원은 투표에 참여하실 수 없습니다.</p>
		</div>
	</div>

	<div class="container">
		<h4>뉴진스 카테고리를 만드시는 걸 찬성하시겠습니까?</h4>
		<div class="grid">
			<div class="option" id="yes" onclick="submitVote('yes')">
				<p class="text">찬성</p>
				<p class="percentage" id="percentageYes">%</p>
			</div>
			<div class="option" id="no" onclick="submitVote('no')">
				<p class="text">반대</p>
				<p class="percentage" id="percentageNo">%</p>
			</div>
		</div>
	</div>
</div>

<script>
	let yesVotes = ${yesVotes != null ? yesVotes : 0};
	let noVotes = ${noVotes != null ? noVotes : 0};

	document.addEventListener('DOMContentLoaded', function() {
		yesVotes = parseInt(localStorage.getItem('yesVotes')) || 0;
		noVotes = parseInt(localStorage.getItem('noVotes')) || 0;
		updatePercentages();
	});

	function submitVote(option) {
		if (option === 'yes') {
			yesVotes++;
		} else if (option === 'no') {
			noVotes++;
		}

		localStorage.setItem('yesVotes', yesVotes);
		localStorage.setItem('noVotes', noVotes);
		setCookie("voted", true, 7); // 7일 동안 쿠키 유지
		updatePercentages();

		document.getElementById('yes').onclick = null;
		document.getElementById('no').onclick = null;
	}

	function updatePercentages() {
		const totalVotes = yesVotes + noVotes;
		const percentageYes = totalVotes === 0 ? 0 : (yesVotes / totalVotes) * 100;
		const percentageNo = totalVotes === 0 ? 0 : (noVotes / totalVotes) * 100;

		document.getElementById('percentageYes').innerText = Math.round(percentageYes) + '%';
		document.getElementById('percentageNo').innerText = Math.round(percentageNo) + '%';
		
		// 배경색 비율 설정
		const yesOption = document.getElementById('yes');
		const noOption = document.getElementById('no');

		
		if (percentageYes > percentageNo) {
            yesOption.style.background = 'linear-gradient(to right, #00AFB9D5 ' + percentageYes + '%, #fff' + ' percentageYes}%)';
            noOption.style.background = 'linear-gradient(to right, #ddd ' + percentageNo + '%, #fff' + ' percentageNo}%)';
        } else {
            yesOption.style.background = 'linear-gradient(to right, #ddd ' + percentageNo + '%, #fff' + ' percentageNo}%)';
            noOption.style.background = 'linear-gradient(to right, #00AFB9D5 ' + percentageYes + '%, #fff' + ' percentageYes}%)';
        }

		yesOption.style.border = `1px solid #ccc`;
		noOption.style.border = `1px solid #ccc`;
	}

	function setCookie(name, value, days) {
		const date = new Date();
		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000)); // 현재 시간에 유효 기간을 더해서 만료 시간 설정
		const expires = "expires=" + date.toUTCString(); // 만료 시간을 UTC 형식의 문자열로 변환
		document.cookie = name + "=" + value + ";" + expires + ";path=/"; 
	}

	function getCookie(name) {
		const str = name + "=";
		const arr = document.cookie.split(";");
		for (let i = 0; i < arr.length; i++) {
			let c = arr[i];
			// 쿠키의 맨 앞에 있는 공백 제거
			while (c.charAt(0) === ' ') c = c.substring(1, c.length);
			// 현재 쿠키가 찾는 쿠키인지 확인하고 찾으면 "=" 다음부터 쿠기 값의 끝까지 반환
			if (c.indexOf(str) === 0) return c.substring(str.length, c.length);
		}
		return null;
	}
</script>
<%@ include file="../include/footer.jsp"%>