<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꼬담꼬담</title>


<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css">
<!--highlight Start  -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/styles/default.min.css">
<!-- 구문 강조 CSS호출 -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/highlight.min.js"></script>
<!-- 구문 강조 js 호출 -->
<script>
	hljs.highlightAll();
</script>
<!-- 코드 구문 강조 호출 -->
<!--highlight End  -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/highlightjs-line-numbers.js/2.8.0/highlightjs-line-numbers.min.js"></script>
<!-- 코드 줄넘버 js -->
<script>
	hljs.initLineNumbersOnLoad();
</script>


<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet">
<!--폰트어썸-->
<script src="https://kit.fontawesome.com/79986a0df7.js" crossorigin="anonymous"></script>

</head>
<body>
	<header class="header">
		<div class="logo">
			<img src="${pageContext.request.contextPath }/resources/img/logo.png" alt="로고">
		</div>
		<div class="header-menu">
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/list.board'" class="menu-btn">자유
				게시판</button>
			<button type="button" onclick="location.href = '#'" class="menu-btn">질문
				게시판</button>
                <button type="button"  onclick="location.href = '#'" class="menu-btn">코드 리뷰</button>
                <button type="button"  onclick="location.href = '#'" class="menu-btn">정보 공유</button>
			<div class="dropdown drop-btn">
				<button type="button" class="menu-btn dropdown-toggle"
					data-toggle="dropdown">미니 게시판</button>
				<ul class="dropdown-menu drop-menu">
					<li><a class="dropdown-item drop-list" href="#">개설 신청</a></li>
					<li><a class="dropdown-item drop-list" href="#">목록</a></li>
				</ul>
			</div>
		</div>

		 <!-- 로그인 유무에 따라 변하는 버튼 -->
		 <c:choose>
           	<c:when test="${sessionScope.id == null }">
				<div class="right-btn">
					<button type="button" onclick="location.href = '${pageContext.request.contextPath }/user/join.jsp'" class="btn-join">회원가입</button>
					<button type="button" onclick="location.href = '${pageContext.request.contextPath }/user/login.jsp'" class="btn-login">로그인</button>
				</div>
           	</c:when> 
            <c:otherwise>
				<div class="user-btn">
           			<div class="dropdown drop-btn">
						<button type="button" class="dropdown-toggle btn-my" data-toggle="dropdown">내 정보</button>
						<ul class="dropdown-menu drop-menu2" style="min-width: 65px;">
							<li><a class="dropdown-item drop-list2" href="${pageContext.request.contextPath }/user/modify.user">정보 수정</a></li>
							<li><a class="dropdown-item drop-list2" href="${pageContext.request.contextPath }/user/mypage.user">활동 내역</a></li>
							<li><a class="dropdown-item drop-list2" href="${pageContext.request.contextPath }/user/delete.user">회원 탈퇴</a></li>
						</ul>
					</div>			
           			 <button type="button" onclick="location.href = '${pageContext.request.contextPath }/user/logout.user'" class="btn-logout">로그아웃</button>
				</div>
            </c:otherwise>
         </c:choose>

	</header>
	<div class="empty"></div>

	<script type="text/javascript">
		var uri = '${pageContext.request.requestURI}';
		var pages = uri.split('/');
		var page = pages[pages.length - 1];
		var cssFile = page.substring(0, page.length - 3);
		var folder = pages[pages.length - 2];
		var link = document.createElement("link");
		link.rel = "stylesheet";
		link.href = "${pageContext.request.contextPath }/resources/css/"
				+ cssFile + "css";
	
		document.querySelector("head").appendChild(link);
		
		
	</script>
	
	<script type="text/javascript">
		<@ if (request.getAttribute("error") != null) { %>
			alert('<@ request.getAttribute("error") @>');
		<@ } @>	
	</script>