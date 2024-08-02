<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<div id="wrapped">
	<article id="my-slide">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			
			<!-- Wrapper for slides 
                 이미지 크기는 항상 똑같아야함-->
            <div class="carousel-inner">
              <div class="item active">
                <img src="../resources/img/slide1.jpg" alt="슬라이드1">
              </div>
          
              <div class="item">
                <img src="../resources/img/slide2.jpg" alt="슬라이드2">
              </div>
          
              <div class="item">
                <img src="../resources/img/slide3.jpg" alt="슬라이드3">
              </div>

              <div class="item">
                <img src="../resources/img/slide4.jpg" alt="슬라이드4">
              </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
      </article>
			

	<section id="board-title" class="title">
		<div class="wrap">
			<div class="left">
				<h4 class="board-connected">
					<c:out value="${boardType}"/>
					게시판
				</h4>
			</div>
			<form action="searchPost.board" method="post">
				<input type="hidden" name="boardId" value="${boardId}">
				<div class="input-group right">
					<input type="text" name="search" class="form-control" placeholder="Search">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</section>

	<table id="board-list">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td><c:out value="${dto.postNo}"/></td>
					<td>
						<a href="getContent.board?postNo=${dto.postNo}&boardId=${dto.boardId}"><c:out value="${dto.title}"/></a>
					</td>
					<td><fmt:formatDate value="${dto.regdate}" pattern="MM-dd" /></td>
					<td>${dto.viewCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div style="text-align: right;">
		<button type="button" class="btn btn-info"
			style="margin-right: 25px; margin-top: 15px; min-width: 70px"
			onclick="selectPage()">글쓰기</button>
	</div>
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

<script>
    function selectPage() {
      var boardId = '<c:out value="${boardId}"/>'; 
      var url = (boardId == 3) ? '/kkodamkkodam/board/post_code_write.board' : '/kkodamkkodam/board/post_write.board';
      window.location.href = url + '?boardId=' + boardId;
    }
  </script>