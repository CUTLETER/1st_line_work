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
	            <textarea class="form-control" rows="10" name="content" style="resize:none;" required></textarea>
	        </div>
	        
	        
	        
	        <div class="form-group contents" >
	           <div class="btn-box" style="display: flex; justify-content: space-between; align-items: center;"> 
		            <label for="content">코드 작성란</label>
		            <div class="form-group title" style="margin-right: 3%; ">
		               <div class="title"></div>
		               <div class="input-group">
		            	 <div class="input-group-btn">
		                	<div class="dropdown">
		                    	<button id="dropdownButton" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="min-width : 100px; line-height: 20px; font-size : 12px; background-color: #00AFB9; border-color:#666; color: #fff; border-radius: 0;">사용한 언어
		                            <span class="caret"></span></button>
		                            <ul id="dropdownMenu" class="dropdown-menu" >
			                            <li><a href="#" data-value="C">C언어</a></li>
			                            <li><a href="#" data-value="JAVA">JAVA</a></li>
			                            <li><a href="#" data-value="Python">PYTHON</a></li>
			                            <li><a href="#" data-value="민석어">민석어</a></li>
			                            
		                        	</ul>
		                    </div>
		                  </div>
		            	<input type="hidden" id="boardCategory" name="boardCategory" value="">  
		                </div>
		             </div>
		        </div>     
	            <textarea class="form-control" rows="20" name="content" style="resize:none;" required></textarea>
	        </div>
	        
	        <div class="btn-wrap btns" style="overflow:hidden;">
	            <button type="submit" class="btn btn-default right" style="float: right; margin:0 10px;">등록</button>
	            <button type="button" class="btn btn-default right" style="float: right; margin:0 10px;" onclick = "location.href='postList.board?boardId=${boardId}'">취소</button>
	        </div> 
	    </form>    
    </div>  

<script>
	document.addEventListener('DOMContentLoaded', function() {
	  var dropdownMenu = document.getElementById('dropdownMenu');
	  var dropdownButton = document.getElementById('dropdownButton');
	  var boardCategory = document.getElementById('boardCategory');
	
	  dropdownMenu.addEventListener('click', function(e) {
		 if (e.target && e.target.nodeName == 'A') {
		 	e.preventDefault();
		    var selectedValue = e.target.getAttribute('data-value');
		    dropdownButton.textContent = e.target.textContent;
		    boardCategory.value = selectedValue;
		 }
	  });
	});
</script>

<%@ include file="../include/footer.jsp" %>