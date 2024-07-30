<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<div id="wrapped">
	<article id="my-slide">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides 
                 이미지 크기는 항상 똑같아야함-->
			<div class="carousel-inner">
				<div class="item active">
					<img src="../resources/img/slide1.jpg" alt="슬라이드1">
				</div>

				<div class="item">
					<img src="../resources/img/slide2.png" alt="슬라이드2">
				</div>

				<div class="item">
					<img src="../resources/img/slide3.jpg" alt="슬라이드3">
				</div>

				<div class="item">
					<img src="../resources/img/slide4.png" alt="슬라이드4">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</article>

	<section id="board-title" class="title">
		<div class="wrap">
			<div class="left">
				<h4 class="board-connected">
					<strong style="font-size: 1.3rem"><c:out value="${search}"/></strong>
					검색결과
				</h4>
			</div>	
		</div>
	</section>

	<table id="board-list">
		<thead>
			<tr>
                  <th style="width : 15%;">게시판</th>
                  <th style="width : 40%;">글 제목</th>
                  <th style="width : 25%;">작성일</th>
                  <th style="width : 10%;">조회수</th>
                  <th style="width : 10%;">좋아요</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="post" items="${posts}">
				<tr>
                	<td>${post.boardType}</td>
                    <td><a href="${pageContext.request.contextPath }/board/getContent.board?postNo=${post.postNo}&boardId=${post.boardId}">${post.title }</a></td>
                    <td><fmt:formatDate value="${post.regdate}" pattern="yyyy-MM-dd"/></td>
                    <td>${post.viewCount}</td>
                	<td>${post.likeCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="pagination-wrap">
		<ul class="pagination page-number">
			<li><a href="#">이전</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">다음</a></li>
		</ul>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>