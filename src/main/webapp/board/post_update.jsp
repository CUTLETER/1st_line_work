<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>    
    <div id="wrapped">
        <form action="updatePost.board" method="post">
	        <input type="hidden" name="boardId" value="${dto.boardId}">
	        <input type="hidden" name="postNo" value="${dto.postNo}">
	        <div class="form-group title">
	            <label for="title">글 제목</label>
	            <div class="input-group">
	                    <input type="text" name=title class="form-control" value="${dto.title}" required>
	            </div>
	        </div>
	     
	        <div class="form-group contents">
	            <label for="content">글 내용</label>
	            <textarea class="form-control" rows="20" name="content" style="resize:none;" required>${dto.content}</textarea>
	        
	        </div>
	
	        <div class="btn-wrap btns">
	            <button type="submit" class="btn btn-default right" >수정</button>
	            <button type="button" class="btn btn-default right" onclick = "location.href='postList.board?boardId=${dto.boardId}'">취소</button>
	        </div> 
	    </form>    
    </div>  

<%@ include file="../include/footer.jsp" %>