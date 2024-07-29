<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   

<%@ include file="../include/header.jsp" %>    

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
                <img src="img/slide01.jpg" alt="슬라이드1">
              </div>
          
              <div class="item">
                <img src="img/slide02.png" alt="슬라이드2">
              </div>
          
              <div class="item">
                <img src="img/slide03.jpg" alt="슬라이드3">
              </div>

              <div class="item">
                <img src="img/slide04.png" alt="슬라이드4">
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
        <div class="wrap" >
          <div class="left">
          <h4 class="board-connected"><c:out value="${boardType}" /> 게시판</h4>
        </div>
        <div class="input-group right">
            <input type="text" class="form-control" placeholder="Search">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit">
                <i class="glyphicon glyphicon-search"></i>
              </button>
            </div>
          </div>
        </div>  
      </section>

      <table id="board-list">
      <thead>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.postNo}</td>
				<td>
					<a href="getContent.board?postNo=${dto.postNo}&boardId=${dto.boardId}">${dto.title }</a>
				</td>
				<td>${dto.userNo}</td>
				<td><fmt:formatDate value="${dto.regdate}" pattern="MM-dd"/></td>
				<td>${dto.viewCount}</td>
				</tr>
		</c:forEach>
      </tbody>
      </table>

      <div class="numlist">
      <ul class="pagination num">
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
      </ul>
      </div>
  </div>
  
  <%@ include file="../include/footer.jsp" %>