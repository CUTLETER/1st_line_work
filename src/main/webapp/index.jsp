<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>


<div id="wrapped">
    <div class="home-list">
    	<form action="searchPostIndex.board" method="post" style="display: contents;">
	        <input type="text" name="search" class="home-search" placeholder="검색하실 내용을 입력해주세요">
		    <button type="submit" class="btn-srch">
				<span class="material-symbols-outlined" style="font-size: 40px;">search</span>
		    </button>
		</form>
        <div class="best-list">
            <h2>베스트</h2>
            <c:forEach var="dto" items="${bastList}">
            	<div class="post flex">
            		<div class="flex-1">
		                <span class="board-type"><a href="#">${dto.boardType}</a></span>
		                <a href="getContent.board?postNo=${dto.postNo}&boardId=${dto.boardId}" class="best-content"><c:out value="${dto.title}"/></a>
		                
            		</div>
	                <div>
	                	<span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;"> visibility</span>
		                </span>
		                <span class="num">${dto.viewCount}</span>
		                <span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;">
		                        chat
		                    </span>
		                </span>
		                <span class="num">${dto.commentCount}</span>
	                </div>
            	</div>
            </c:forEach>
        </div>
        <div class="home-board">
            <h2>자유</h2>


            <c:forEach var="dto" items="${freeList}">
            	<div class="post flex">
            		<div class="flex-1">
		                <a href="getContent.board?postNo=${dto.postNo}&boardId=${dto.boardId}" class="post-content"><c:out value="${dto.title}"/></a>
		                
            		</div>
	                <div>
	                	<span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;"> visibility</span>
		                </span>
		                <span class="num">${dto.viewCount}</span>
		                <span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;">
		                        chat
		                    </span>
		                </span>
		                <span class="num">${dto.commentCount}</span>
	                </div>
            	</div>
            </c:forEach>
        </div>
        <div class="home-board">
            <h2>질문</h2>

            <c:forEach var="dto" items="${QuestionList}">
            	<div class="post flex">
            		<div class="flex-1">
		                <a href="getContent.board?postNo=${dto.postNo}&boardId=${dto.boardId}" class="post-content"><c:out value="${dto.title}"/></a>
		                
            		</div>
	                <div>
	                	<span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;"> visibility</span>
		                </span>
		                <span class="num">${dto.viewCount}</span>
		                <span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;">
		                        chat
		                    </span>
		                </span>
		                <span class="num">${dto.commentCount}</span>
	                </div>
            	</div>
            </c:forEach>
        </div>
        <div class="home-board">
            <h2>코드 리뷰</h2>
            <c:forEach var="dto" items="${codeReviewList}">
            	<div class="post flex">
            		<div class="flex-1">
		                <a href="getContent.board?postNo=${dto.postNo}&boardId=${dto.boardId}" class="post-content"><c:out value="${dto.title}"/></a>
		                
            		</div>
	                <div>
	                	<span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;"> visibility</span>
		                </span>
		                <span class="num">${dto.viewCount}</span>
		                <span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;">
		                        chat
		                    </span>
		                </span>
		                <span class="num">${dto.commentCount}</span>
	                </div>
            	</div>
            </c:forEach>
        </div>
        <div class="home-board">
            <h2>정보 공유</h2>
            <c:forEach var="dto" items="${informationList}">
            	<div class="post flex">
            		<div class="flex-1">
		                <a href="getContent.board?postNo=${dto.postNo}&boardId=${dto.boardId}" class="post-content"><c:out value="${dto.title}"/></a>
		                
            		</div>
	                <div>
	                	<span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;"> visibility</span>
		                </span>
		                <span class="num">${dto.viewCount}</span>
		                <span class="icon">
		                    <span class="material-symbols-outlined" style="font-size:18px;">
		                        chat
		                    </span>
		                </span>
		                <span class="num">${dto.commentCount}</span>
	                </div>
            	</div>
            </c:forEach>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
    