<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>

<div id="wrapped">
	<div class="board-type">
		<p>
			<c:out value="${boardType}" />
			게시판
		</p>
	</div>
	<div class="post">
		<div class="user-bigbox">
			<img src="../resources/img/userCircle.png" alt="userCircle"
				style="width: 45px;">
			<div class="user-box flex-1">
				<div class="user">
					<p>익명</p>
					<p>10분전</p>
				</div>
			</div>
			<div class="dropdown">
				<button class="btn dropdown-toggle" type="button"
					data-toggle="dropdown">
					<span class="material-symbols-outlined">more_vert</span>
				</button>
				<ul class="dropdown-menu">
					<li><a
						href="updatePostPage.board?postNo=${dto.postNo}&boardId=${dto.boardId}">수정</a></li>
					<li><a
						href="deletePost.board?postNo=${dto.postNo}&boardId=${dto.boardId}">삭제</a></li>
				</ul>
			</div>
		</div>


		<h3>${dto.title}</h3>
		<p class="post-content"
			style="white-space: pre-wrap; word-wrap: break-word;">${dto.content}</p>

		<!-- 코드 하이라이트 시작 -->
		<pre>
			<code class="language-${dto.codeLanguage} codebox">${dto.codeContent}</code>
		</pre>
		<!-- 코드 하이라이트 끝 -->


		<div class="post-info">
			<span class="icon"> <span class="material-symbols-outlined"
				style="font-size: 18px;"> visibility </span>
			</span> <span class="num">${dto.viewCount}</span> <a class="icon"
				href="increasePostLike.board?postNo=${dto.postNo}&boardId=${dto.boardId}">
				<span class="material-symbols-outlined" style="font-size: 18px;">
					thumb_up </span>
			</a> <span class="num">${dto.likeCount}</span> <span class="icon">
				<span class="material-symbols-outlined" style="font-size: 18px;">
					chat </span>
			</span> <span class="num">${dto.commentCount}</span>
		</div>
	</div>
	<div class="comment-bigbox">
		<%-- 댓글 입력창 --%>
		<form action="commentWrite.board" method="post">
			<span class="comment-input"> <input type="hidden"
				name="boardId" value="${dto.boardId}"> <input type="hidden"
				name="postNo" value="${dto.postNo}"> <input type="text"
				name="commentContent"></input>
				<button type="submit">
					<span class="material-symbols-outlined" style="font-size: 18px;">
						edit</span>
				</button>
			</span>
		</form>
		<div class="comment-box">
			<%-- 댓글 출력 --%>
			<c:forEach var="comment" items="${commentList}">
				<div class="comment  ${comment.parentId != null ? 'reply' : ''}"
					style="margin-left: ${comment.parentId == null ? '0' : '20'}px;">
					<div class="user-bigbox flex">
						<img src="../resources/img/userCircle.png" alt="userCircle"
							style="width: 45px;">
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
							<a class="icon"
								href="increaseCommentLike.board?commentNo=${comment.commentNo}&postNo=${dto.postNo}&boardId=${dto.boardId}">
								<span class="material-symbols-outlined" style="font-size: 18px;">
									thumb_up </span>
							</a> <span class="num">${comment.likeCount}</span> <a class="icon"
								href="deleteComment.board?commentNo=${comment.commentNo}&postNo=${dto.postNo}&boardId=${dto.boardId}">
								<span class="material-symbols-outlined" style="font-size: 18px;">
									delete </span>
							</a>
						</div>
					</div>
					<p class="comment-content">${comment.commentContent}</p>
					<%-- 대댓글 입력창 --%>
					<button
						class="reply-write-btn ${comment.parentId != null ? 'hidden' : ''}">
						댓글 달기</button>
					<div class="reply-write reply hidden">
						<div class="flex">
							<div class=userImg>
								<img src="../resources/img/userCircle.png" alt="userCircle"
									style="width: 45px;">
							</div>
							<div class="flex-1">
								<form action="replyWrite.board" method="post">
									<input type="hidden" name="boardId" value="${comment.boardId}">
									<input type="hidden" name="postNo" value="${comment.postNo}">
									<input type="hidden" name="parentId"
										value="${comment.commentNo}">
									<textarea placeholder="댓글을 입력하세요" name="commentContent"></textarea>
									<div class="flex justify-end reply-submit-cancel-btn">
										<button type="submit" class="reply-submit-btn">
											<span class="material-symbols-outlined"
												style="font-size: 18px;"> edit</span>
										</button>
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
			if ($(this).next('.reply-write').hasClass('hidden')) {
				$(this).text('댓글 취소');
			} else {
				$(this).text('댓글 달기');
			}
			$(this).next('.reply-write').toggleClass('hidden');
		});
	});
	document.addEventListener('DOMContentLoaded', (event) => {
		  document.querySelectorAll('pre code').forEach((block) => {
		    const language = block.className.replace('language-', '');
		    block.parentNode.setAttribute('data-language', language);
		    hljs.highlightBlock(block);
		  });
		});
	
	
	
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

	document.addEventListener('DOMContentLoaded', function() {
	    const cancelButtons = document.querySelectorAll('.reply-cancel-btn');
	    
	    cancelButtons.forEach(button => {
	        button.addEventListener('click', function(event) {
	            event.preventDefault(); // 폼 제출 방지
	            
	            // 가장 가까운 .reply-write 클래스를 가진 상위 요소를 찾습니다
	            const replyWriteDiv = this.closest('.reply-write');
	            
	            // .reply-write 요소가 존재하면 hidden 클래스를 추가합니다
	            if (replyWriteDiv) {
	                replyWriteDiv.classList.add('hidden');
	            }
	        });
	    });
	});

	document.addEventListener('DOMContentLoaded', function() {
	    const commentForm = document.querySelector('form[action="commentWrite.board"]');
	    
	    if (commentForm) {
	        commentForm.addEventListener('submit', function(event) {
	            const commentInput = this.querySelector('input[name="commentContent"]');
	            
	            if (!commentInput || commentInput.value.trim() === '') {
	                event.preventDefault(); // 폼 제출 방지
	                // 선택적: 사용자에게 시각적 피드백을 제공할 수 있습니다.
	                // 예: commentInput.classList.add('error');
	                // 또는 alert("댓글 내용을 입력해주세요.");
	            }
	        });
	    }
	 	const replyForms = document.querySelectorAll('form[action="replyWrite.board"]');
	    
	    replyForms.forEach(form => {
	        form.addEventListener('submit', function(event) {
	            const textarea = this.querySelector('textarea[name="commentContent"]');
	            
	            if (!textarea || textarea.value.trim() === '') {
	                event.preventDefault(); // 폼 제출 방지
	                // 선택적: 사용자에게 시각적 피드백을 제공할 수 있습니다.
	                // 예: textarea.classList.add('error');
	                // 또는 alert("댓글 내용을 입력해주세요.");
	            }
	        });
	    });
	});
</script>

<%@ include file="../include/footer.jsp"%>
