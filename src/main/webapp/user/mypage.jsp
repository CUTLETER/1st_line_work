<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>




  <div id="wrapped">
    <section class="toggle-list">
      <ul class="toggle">
          <li data-id="#toggle1" tabindex="0">내가 쓴 글</li>
          <li data-id="#toggle2" tabindex="0">내가 쓴 댓글</li>
      </ul>

      <div class="toggle-wrap">
          <div class="toggle-menu active" id="toggle1">
            <table class="board">
              <thead>
                <tr>
                  <th>선택</th>
                  <th>글 번호</th>
                  <th>글 제목</th>
                  <th>작성일</th>
                  <th>조회수</th>
                  <th>좋아요</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="hits">99</td>
                  <td class="likes">3</td>
                </tr>
              </tbody>
              <button type="button" id="select-all">전체 선택</button>
              <button type="button" id="delete-btn">삭제</button>
            </table>
            <div class="pagination-wrap">
              <ul class="pagination page-number">
                <li><a href="#">이전</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">다음</a></li>
              </ul>
            </div>
          </div>



          <div class="toggle-menu" id="toggle2">
            <table class="comment-page">
              <thead>
                <tr>
                  <th>선택</th>
                  <th>댓글 번호</th>
                  <th>댓글 내용</th>
                  <th>작성일</th>
                  <th>좋아요</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
                <tr>
                  <td class="td_check"><input type="checkbox"></td>
                  <td class="num">253</td>
                  <td class="subject"><a href="#">요즘, 제가 즐겨듣는 노래입니다.</a></td>
                  <td class="date">01-19</td>
                  <td class="likes">3</td>
                </tr>
              </tbody>
              <button type="button" id="select-all">전체 선택</button>
              <button type="button" id="delete-btn">삭제</button>
            </table>
            <div class="pagination-wrap">
              <ul class="pagination page-number">
                <li><a href="#">이전</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">다음</a></li>
              </ul>
            </div>
          </div>
      </div>
   </section>
</div>

        <script>    
            var toggle = document.querySelector(".toggle");
            toggle.addEventListener('click', function(e) {
    
                if (e.target.tagName != ("LI")) return;
    
                var active = document.querySelector(".toggle-menu.active");
                active.classList.remove("active");
    
                var value = event.target.dataset.id;
                var tag = document.querySelector(value); // 클릭한 대상에 연결되는 태그
                tag.classList.add("active");
            })
        </script>




<%@ include file="../include/footer.jsp"%>