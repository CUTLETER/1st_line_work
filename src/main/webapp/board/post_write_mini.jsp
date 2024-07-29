<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>    

<body>
    <div id="wrapped">
        <div class="detailed description">
            <div class="detail-first">신설 요청 조건</div>
            <p>1. 같은 주제의 신설 요청이 있는지 먼저 검색하시고, 7일 내 중복되면 신청해도 반려됩니다.</p>
            <p>2. 투표는 통틀어 7일 이내 한 표만 가능하고 비회원은 참여가 불가능합니다.</p>

            <div class="detail">신설 요청 가능 대상</div>
            <p>1. 연예인 또는 방송인, 연예계와 관련된 모든 주제에 대해 신설 요청 가능합니다.</p>
            <p>2. 또한 인물, 회사, 사물, 동물 등 모든 주제에 관해서도 신설 요청이 가능합니다.</p>
            <p>3. 타인에게 반감을 줄 수 있는 카테고리는 요청이 불가합니다. <span class="remarks">(안티성 목적의 요청 등)</span></p>
            <p>데뷔 예정 그룹의 경우 데뷔명이 확정되지 않아도 신청이 가능합니다.</p>

            <div class="detail">신설 요청 방법</div>
            <p>1. '새 글'을 누르고 게시물 제목을 신설하시고 싶은 게시물 이름으로 적습니다.</p>
            <p>2. 내용란 하단에 양식이 준비되어 있으며, 요청 사유를 적습니다. <span class="remarks">(투표는 자동으로 생성됩니다)</span></p>
            <p>3. 투표는 7일 간 진행되며, 20명 이상이 투표를 하고 찬성이 60%를 넘으면 신설을 검토합니다.</p>
            <p>데뷔 예정 그룹의 경우 데뷔명이 확정되지 않아도 신청이 가능합니다.</p>
        </div>

        <div class="form-group title">
            <div class="title">게시물 제목</div>
            <div class="input-group">
                    <input type="text" class="title-name" placeholder="게시물 이름"> 
            </div>
        </div>

        <div class="form-group title">
            <div class="title">카테고리</div>
            <div class="input-group">
                    <div class="input-group-btn">
                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="line-height: 20px; font-size : 12px;">게시판을 선택해주세요
                            <span class="caret"></span></button>
                            <ul class="dropdown-menu" style="width: 180px;">
                            <li><a href="#">연예</a></li>
                            <li><a href="#">게임</a></li>
                            <li><a href="#">취미</a></li>
                            <li><a href="#">방송</a></li>
                            <li><a href="#">만화/애니</a></li>
                            <li><a href="#">스포츠</a></li>
                            <li><a href="#">건강/심리</a></li>
                            <li><a href="#">생활</a></li>
                            <li><a href="#">금융/재테크</a></li>
                            <li><a href="#">디지털/IT</a></li>
                            <li><a href="#">패션/장터</a></li>
                            <li><a href="#">성공/계발</a></li>
                            <li><a href="#">기타</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
     
        <div class="form-group contents">
            <div class="content">요청 사유</div>
            <textarea class="form-control" rows="10" id="content"></textarea>
        </div>

        <div class="btn-wrap btns">
            <button type="button" class="btn btn-default right" onclick="location.href = '${pageContext.request.contextPath }/board/post_list.jsp'">등록</button>
            <button type="button" class="btn btn-default right" onclick="location.href = '${pageContext.request.contextPath }/board/post_list.jsp'">취소</button>
        </div>
    </div>  
<%@ include file="../include/footer.jsp"%>