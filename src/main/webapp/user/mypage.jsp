<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>




<div id="wrapped">
    <section class="toggle-list">
      <ul class="toggle">
          <li data-id="#toggle1" tabindex="0"><%-- <a href="${pageContext.request.contextPath }/board/mypost.board"> --%>내가 쓴 글</a></li>
          <li data-id="#toggle2" tabindex="0"><%-- <a href="${pageContext.request.contextPath }/board/mycomment.board"> --%>내가 쓴 댓글</a></li>
      </ul>

<!--====================== 내가 쓴 글========================-->
      <div class="toggle-wrap">
          <div class="toggle-menu active" id="toggle1">
            <table class="board">
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
                           <td><a href="getContent.board?postNo=${post.postNo}&boardId=${post.boardId}">${post.title }</a></td>
                           <!-- <a href="getContent.board?postNo=${post.postNo}&boardId=${dto.boardId}">${post.title }</a> -->
                           <td><fmt:formatDate value="${post.regdate}" pattern="yyyy-MM-dd"/></td>
                           <td>${post.viewCount}</td>
                           <td>${post.likeCount}</td>
                         </tr>
                     </c:forEach>
					
              </tbody>
            </table>
            
            
<!-- =================페이지 넘기기=============== -->   
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
          
          
<!--====================== 내가 쓴 댓글========================-->
          <div class="toggle-menu" id="toggle2">
            <table class="comment-page">
              <thead>
                <tr>
                  <th>게시판</th>
                  <th>댓글 내용</th>
                  <th>작성일</th>
                  <th>좋아요</th>
                </tr>
              </thead>
              <tbody>
                  <c:forEach var="comment" items="${comments}">
                       <tr>
                         <td>${comment.boardType}</td>
                         <td><a href="getContent.board?postNo=${comment.postNo}&boardId=${comment.boardId}">${comment.commentContent}</a></td>
                         <td><fmt:formatDate value="${comment.regDate}" pattern="yyyy-MM-dd"/></td>
                         <td>${comment.likeCount}</td>
                       </tr>
                  </c:forEach>
	
              </tbody>
            </table>
       
<!-- =================페이지 넘기기=============== -->   
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
      </div>
   </section>
</div>

<script type="text/javascript">  
	// 토글 기능 구현 스크립트
    var toggle = document.querySelector(".toggle");
    toggle.addEventListener('click', function(e) {

        if (e.target.tagName != ("LI")) return;

        var active = document.querySelector(".toggle-menu.active");
        active.classList.remove("active");

        var value = event.target.dataset.id;
        var tag = document.querySelector(value); // 클릭한 대상에 연결되는 태그
        tag.classList.add("active");
    })
</script>

<script type="text/javascript">
	// 전체 선택 기능 구현 스크립트 (완성했으나 삭제 버튼 구현 못해서 의미없어짐)
	function selectAll(all) {
	    var checkbox = document.querySelectorAll(`#${toggleId} table tbody input[type=checkbox]`);
	    var selectAllButton = document.querySelector(`#${toggleId} #select-all`); // 버튼의 id
	
		for (var i=0; i<checkbox.length; i++) {
			checkbox[i].checked = selectAllButton.checked;
		}
	}
</script>




<%@ include file="../include/footer.jsp"%>