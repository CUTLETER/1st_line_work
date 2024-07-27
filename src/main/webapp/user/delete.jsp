<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>


<div id="wrapped">
	<div class="delete-page">
		<div>
			<h3>탈퇴 안내</h3>
			<p class="light">회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해 주세요.</p>
		</div>
		<div class="delete-info">
			<p class="bold">
				<span class="glyphicon glyphicon-ok"></span> 사용하고 계신 아이디(ID)는 탈퇴할 경우
				재사용 및 복구가 불가능합니다.
			</p>
			<p class="light">
				<span style="color: #00AFB9;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구</span>가
				불가하오니 신중하게 선택하시기 바랍니다.
			</p>
			<p class="bold">
				<span class="glyphicon glyphicon-ok"></span> 탈퇴 후 회원정보 및 개인형 서비스
				이용기록은 모두 삭제됩니다.
			</p>
			<p class="light">회원정보 및 이메일, 전화번호 등 개인형 서비스 이용기록은 모두 다 삭제되며, 삭제된
				데이터는 복구되지 않습니다.</p>
			<p class="bold">
				<span class="glyphicon glyphicon-ok"></span> 탈퇴 후에도 게시판형 서비스에 등록한
				게시물은 그대로 남아 있습니다.
			</p>
			<p class="light">
				올린 게시물 및 댓글은 탈퇴 시 자동 삭제 되지 않고 그대로 남아있습니다. <br> 삭제를 원하는 게시글이 있다면
				<span style="color: #00AFB9;">반드시 탈퇴 전 비공개 처리하거나 삭제</span>하시기 바랍니다.
				<br> 탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수
				없습니다.
			</p>
		</div>
		<div class="warning-box">
			<p class="bold">
				탈퇴 후에는 같은 아이디(ID)로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.<br> 게시판형
				서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
			</p>
			<a href="#"> <input type="checkbox" name="check"
				style="accent-color: #ddd;"> 안내 사항을 모두 확인하였으며, 이에 동의합니다.
			</a>
		</div>
		<div class="delete-btn">
			<button type="button" onclick="location.href = '${pageContext.request.contextPath }/user/delete_check.user'" class="check-btn">확인</button>
		</div>
	</div>
</div>


<script type="text/javascript">
	var check = document.querySelector("input[name=check]");
	var checkBtn = document.querySelector(".check-btn");
	
	checkBtn.onclick = function() {
	
	if (!check.checked) {
		alert('동의해 주세요.');
		return false;
	} else {
		window.href='${pageContext.request.contextPath }/user/delete_check.user'; 
	}
}
</script>

<%@ include file="../include/footer.jsp"%>