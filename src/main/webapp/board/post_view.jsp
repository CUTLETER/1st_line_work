<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>

<div id="wrapped">
    <div class="board-type">
        <p>게시판 종류</p>
    </div>
    <div class="post">
        <div class="user-bigbox">
            <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
            <div class="user-box">
                <div class="user">
                    <p>익명</p>
                    <p>10분전</p>
                </div>
            </div>
        </div>

        <h3>${dto.title}</h3>
        <p class="post-content">${dto.content}</p>

        <div class="post-info">
            <span class="icon">
                <span class="material-symbols-outlined" style="font-size:18px;">
                    visibility
                </span>
            </span>
            <span class="num">${dto.viewCount}</span>
            <span class="icon">
                <span class="material-symbols-outlined" style="font-size:18px;">
                    thumb_up
                </span>
            </span>
            <span class="num">${dto.likeCount}</span>
            <span class="icon">
                <span class="material-symbols-outlined" style="font-size:18px;">
                    chat
                </span>
            </span>
            <span class="num">2</span>
        </div>
    </div>
    <div class="comment-bigbox">
    	<form action="commentWrite.board" method="post">
	    	<span class="comment-input">
	    		<input type="hidden" name="boardId" value="${dto.boardId}">
	    		<input type="hidden" name="postNo" value="${dto.postNo}">
	            <input type="text"  name="commentContent"></input>
	            <button type="submit"><span class="material-symbols-outlined" style="font-size:18px;"> edit</span></button>
	        </span>
    	</form>
        <div class="comment-box">
		    <c:forEach var="comment" items="${commentList}">
		    	<div class="comment" style="margin-left: ${comment.parentId == null ? '0' : '20'}px;">
			        <div class="user-bigbox">
			        	<img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
			        	<div class="user-box">
	                        <div class="user">
	                            <p>익명</p>
	                            <p>10분전</p>
	                        </div>
	                    </div>
	                </div>
	              	<p class="comment-content">
	                    ${comment.commentContent}
	                </p>
            	</div>
			</c:forEach>
            <div class="comment">
                <div class="user-bigbox flex">
                    <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
                    <div class="user-box flex flex-1">
                        <div class="user flex flex-col">
                        	<p>익명</p>
                            <div>10분전</div>
                        </div>
                    </div>
                    <div class="flex">
                    	<div class="comment-icon">
                    		<span class="icon">
			               		<span class="material-symbols-outlined" style="font-size:18px;">
			                    	thumb_up
			                	</span>
		            		</span>	
		            		<span class="num">23</span>
                    	</div>
                    </div>
                </div>
                <p class="comment-content">
                    가가가가가가가가가
                </p>
                <button class="commentWrite">
            		댓글 달기
            	</button>
            	<div class="reply-write reply">
	            	<div class="flex">
	            		<div>
			            	<img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
	            		</div>
		            	<form action="">
		            		<textarea></textarea>
		            	</form>
	            	</div>
            	</div>
            </div>

            <div class="comment reply">
                <div class="user-bigbox">
                    <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
                    <div class="user-box">
                        <div class="user">
                            <p>익명 <span>작성자</span></p>
                            <p>10분전</p>
                        </div>
                    </div>
                </div>
                <p class="comment-content">
                    나나나나나나나나나나나나나나나나나나나나나나나
                </p>
            </div>
            <div class="comment reply">
                <div class="user-bigbox">
                    <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
                    <div class="user-box">
                        <div class="user">
                            <p>익명 <span>작성자</span></p>
                            <p>10분전</p>
                        </div>
                    </div>
                </div>
                <p class="comment-content">
                    나나나나나나나나나나나나나나나나나나나나나나나
                </p>
            </div>
        </div>
    </div>
</div>

<script>
	$(".commentWrite").click(function(event) {
	    $(event.target).toggleClass("hidden");
	    if ($(event.target).hasClass("hidden")) {
            $(event.target).text("댓글 작성");
        } else {
            $(event.target).text("댓글 취소");
        }
	})
</script>

<%@ include file="../include/footer.jsp" %>
