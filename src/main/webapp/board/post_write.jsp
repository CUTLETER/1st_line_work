<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>    
    <div id="wrapped">
        <div class="form-group title">
            <label for="title">글 제목</label>
            <div class="input-group">
                    <input type="text" class="form-control" placeholder="글제목을 입력해주세요">
                    <div class="input-group-btn">
                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="line-height: 20px; font-size : 12px;">게시판을 선택해주세요
                            <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                            <li><a href="#">자유게시판</a></li>
                            <li><a href="#">질문게시판</a></li>
                            <li><a href="#">정보게시판</a></li>
                            <li><a href="#">코드공유게시판</a></li>
                            </ul>
                    </div>
                </div>
            </div>
        </div>
     
        <div class="form-group contents">
            <label for="content">글 내용</label>
            <textarea class="form-control" rows="20" id="content" style="resize:none;"></textarea>
        
        </div>

        <div class="btn-wrap btns">
            <button type="button" class="btn btn-default right" onclick = "location.href='#'">등록</button>
            <button type="button" class="btn btn-default right" onclick = "location.href='#'">취소</button>
        </div>
    </div>  

<%@ include file="../include/footer.jsp" %>