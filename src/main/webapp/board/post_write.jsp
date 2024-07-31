<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>    
    <div id="wrapped">
        <form action="post_regi.board" method="post">
	        <input type="hidden" name="boardId" value="${boardId}">
	        <div class="form-group title">
	            <label for="title">글 제목</label>
	            <div class="input-group">
	            	<input type="text" name=title class="form-control" placeholder="글제목을 입력해주세요" required>
	            </div>
	        </div>
	     
	        <div class="form-group contents">
	            <label for="content">글 내용</label>
	            <textarea class="form-control" rows="20" name="content" style="resize:none; " required></textarea>
	        </div>

	        <div class="btn-wrap btns"> <!-- css 수정을 위해 각 버튼의 클래스명 추가 -->
	            <button type="submit" class="btn btn-default right btn-insert" >등록</button>
	            <button type="button" class="btn btn-default right btn-back" onclick = "location.href='postList.board?boardId=${boardId}'">취소</button>
	        </div> 
	    </form>    
    </div>  

<%@ include file="../include/footer.jsp" %>