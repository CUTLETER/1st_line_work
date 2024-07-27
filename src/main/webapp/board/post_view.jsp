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
        <span class="comment-input">
            <input type="text"></input>
            <button onclick="location.href='commentWrite.board'"><span class="material-symbols-outlined" style="font-size:18px;"> edit</span></button>
        </span>
        <div class="comment-box">
            <div class="comment">
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
                    가가가가가가가가가
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
            <div class="comment">
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
                    가가가가가가가가가
                </p>
            </div>
            <div class="comment">
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
                    가가가가가가가가가
                </p>
            </div>

        </div>
    </div>
</div>


<%@ include file="../include/footer.jsp" %>
