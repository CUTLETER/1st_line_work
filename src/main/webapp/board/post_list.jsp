<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ include file="../include/header.jsp" %>    

  <div id="wrapped">
      <article id="my-slide">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
              <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
          
            <!-- Wrapper for slides 
                 이미지 크기는 항상 똑같아야함-->
            <div class="carousel-inner">
              <div class="item active">
                <img src="img/slide01.jpg" alt="슬라이드1">
              </div>
          
              <div class="item">
                <img src="img/slide02.png" alt="슬라이드2">
              </div>
          
              <div class="item">
                <img src="img/slide03.jpg" alt="슬라이드3">
              </div>

              <div class="item">
                <img src="img/slide04.png" alt="슬라이드4">
              </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
      </article>

      <section id="board-title" class="title">
        <div class="wrap" >
          <div class="left">
          <h4 class="board-connected">현재 게시판</h4>
        </div>
        <div class="input-group right">
            <input type="text" class="form-control" placeholder="Search">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit">
                <i class="glyphicon glyphicon-search"></i>
              </button>
            </div>
          </div>
        </div>  
      </section>

      <table id="board-list">
      <thead>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
        </tr>
      </thead>
      <tbody>
        <tr class="bo_notice">
          <td class="td_num"><strong class="notice_icon">공지</strong></td>
          <td class="td_subject"><a href="#">QA는 중단하겠습니다.</a> </td>
          <td class="td_name sv_use">관리자</td>
          <td class="td_datetime">02-13</td>
          <td class="td_hits">99</td>
        </tr>
        <tr class="">
          <td class="td_num">253</td>
          <td class="td_subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a> </td>
          <td class="td_name sv_use">신비</td>
          <td class="td_datetime">01-19</td>
          <td class="td_hits">99</td>
        </tr>
        <tr class="">
          <td class="td_num">253</td>
          <td class="td_subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a> </td>
          <td class="td_name sv_use">신비</td>
          <td class="td_datetime">01-19</td>
          <td class="td_hits">99</td>
        </tr>
        <tr class="">
          <td class="td_num">253</td>
          <td class="td_subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a> </td>
          <td class="td_name sv_use">신비</td>
          <td class="td_datetime">01-19</td>
          <td class="td_hits">99</td>
        </tr>
        <tr class="">
          <td class="td_num">253</td>
          <td class="td_subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a> </td>
          <td class="td_name sv_use">신비</td>
          <td class="td_datetime">01-19</td>
          <td class="td_hits">99</td>
        </tr>
        <tr class="">
          <td class="td_num">253</td>
          <td class="td_subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a> </td>
          <td class="td_name sv_use">신비</td>
          <td class="td_datetime">01-19</td>
          <td class="td_hits">99</td>
        </tr>
        <tr class="">
          <td class="td_num">253</td>
          <td class="td_subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a> </td>
          <td class="td_name sv_use">신비</td>
          <td class="td_datetime">01-19</td>
          <td class="td_hits">99</td>
        </tr>

      </tbody>
      </table>

      <div class="numlist">
      <ul class="pagination num">
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
      </ul>
      </div>
  </div>
  
  <%@ include file="../include/footer.jsp" %>