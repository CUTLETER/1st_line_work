<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>

<div id="wrapped">
    <div class="board-type">
        <p><c:out value="${boardType}" /> 게시판</p>
    </div>
    <div class="post">
        <div class="user-bigbox">
            <img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
            <div class="user-box flex-1">
                <div class="user">
                    <p>익명</p>
                    <p>10분전</p>
                </div>
            </div>
            <div class="dropdown">
				<button class="btn dropdown-toggle" type="button" data-toggle="dropdown">
					<span class="material-symbols-outlined">more_vert</span>
				</button>
				<ul class="dropdown-menu">
			    	<li><a href="updatePostPage.board?postNo=${dto.postNo}&boardId=${dto.boardId}">수정</a></li>
			    	<li><a href="deletePost.board?postNo=${dto.postNo}&boardId=${dto.boardId}">삭제</a></li>
			 	</ul>
			</div>
        </div>
        <h3>${dto.title}</h3>
        <p class="post-content" style="white-space: pre-wrap; word-wrap: break-word;">${dto.content}</p>

        <div class="post-info">
            <span class="icon">
                <span class="material-symbols-outlined" style="font-size:18px;">
                    visibility
                </span>
            </span>
            <span class="num">${dto.viewCount}</span>
            <a class="icon" href="increasePostLike.board?postNo=${dto.postNo}&boardId=${dto.boardId}">
                <span class="material-symbols-outlined" style="font-size:18px;">
                    thumb_up
                </span>
            </a>
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
    	<%-- 댓글 입력창 --%>
    	<form action="commentWrite.board" method="post">
	    	<span class="comment-input">
	    		<input type="hidden" name="boardId" value="${dto.boardId}">
	    		<input type="hidden" name="postNo" value="${dto.postNo}">
	            <input type="text"  name="commentContent"></input>
	            <button type="submit"><span class="material-symbols-outlined" style="font-size:18px;"> edit</span></button>
	        </span>
    	</form>
        <div class="comment-box">
       		<%-- 댓글 출력 --%>
		    <c:forEach var="comment" items="${commentList}">
		    	<div class="comment  ${comment.parentId != null ? 'reply' : ''}" style="margin-left: ${comment.parentId == null ? '0' : '20'}px;">
			        <div class="user-bigbox flex">
			        	<img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
			        	<div class="user-box flex flex-1">
                        	<div class="user flex flex-col">
	                            <p>${comment.regDate != null ? '익명' : '(삭제)'}
		                            <c:if test="${dto.userNo == comment.userNo}">
	            						<span>작성자</span>
	        						</c:if>
        						</p>
	                            <p>10분전</p>
	                        </div>
	                    </div>
	                    <div class="comment-icon">
	                    	<a class="icon" href="increaseCommentLike.board?commentNo=${comment.commentNo}&postNo=${dto.postNo}&boardId=${dto.boardId}">
				               	<span class="material-symbols-outlined" style="font-size:18px;">
				                   	thumb_up
				                </span>
			            	</a>	
			            	<span class="num">${comment.likeCount}</span>
			            	<a class="icon" href="deleteComment.board?commentNo=${comment.commentNo}&postNo=${dto.postNo}&boardId=${dto.boardId}">
				            	<span class="material-symbols-outlined"	style="font-size:18px;">
									delete
								</span>
			            	</a>
	                    </div>
	                </div>
	              	<p class="comment-content">
	                    ${comment.commentContent}
	                </p>
	                 <%-- 대댓글 입력창 --%>
                	<button class="reply-write-btn ${comment.parentId != null ? 'hidden' : ''}">
            			댓글 달기
            		</button>
            		<div class="reply-write reply hidden">
	            		<div class="flex">
	            			<div class=userImg>
			            		<img src="../resources/img/userCircle.png" alt="userCircle" style="width: 45px;">
	            			</div>
	            			<div class="flex-1">
			            		<form action="replyWrite.board" method="post">
			            			<input type="hidden" name="boardId" value="${comment.boardId}">
		    						<input type="hidden" name="postNo" value="${comment.postNo}">
		    						<input type="hidden" name="parentId" value="${comment.commentNo}">
			            			<textarea placeholder="댓글을 입력하세요"  name="commentContent"></textarea>
			            			<div class="flex justify-end reply-submit-cancel-btn">
				            			<button type="submit" class="reply-submit-btn"><span class="material-symbols-outlined" style="font-size:18px;"> edit</span></button>
			            				<button class=reply-cancel-btn>취소</button>
			            			</div>
			            		</form>
	            			</div>
	            		</div>
            		</div>
            	</div>
			</c:forEach>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('.reply-write-btn').on('click', function() {
    	if ( $(this).next('.reply-write').hasClass('hidden')){
    		$(this).text('댓글 취소');
    	}else{
    		$(this).text('댓글 달기');
    	}
        $(this).next('.reply-write').toggleClass('hidden');
    });
});
</script>

<%@ include file="../include/footer.jsp" %>
