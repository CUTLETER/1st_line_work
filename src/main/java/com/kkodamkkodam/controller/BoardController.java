package com.kkodamkkodam.controller;

import java.io.IOException;

import com.kkodamkkodam.board.service.BoardService;
import com.kkodamkkodam.board.service.BoardServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("*.board") // .board 끝나는 모든 요청은 서블릿으로 연결
public class BoardController extends HttpServlet {

	public BoardController() {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청 분기
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI(); //ip, port번호 제외된 주소
		String path = request.getContextPath(); //프로젝트 식별 이름
		String command = uri.substring( path.length() );
		
		
		BoardService service =new BoardServiceImpl();
		
		if(command.equals("/board/index.board")) { //메인 페이지
			service.getIndex(request, response);
		}
		else if(command.equals("/board/postList.board")) { //글 목록
			service.getList(request, response);
		}
		else if(command.equals("/board/getContent.board")) { //글 내용 보기
			service.getContent(request, response);
		}
		else if(command.equals("/board/increasePostLike.board")) { //글 좋아요 증가
			service.increasePostLike(request, response);
		}
		else if(command.equals("/board/post_write.board")) { //글 작성 화면
			service.postWrite(request, response);
		}
		else if(command.equals("/board/post_regi.board")) { //글 등록
			service.postRegi(request, response);
		}
		else if(command.equals("/board/post_code_write.board")) { // 코드 작성 화면
			service.postCodeWrite(request, response);
		}
		else if(command.equals("/board/post_code_regi.board")) { //코드 질문글 등록
			service.postCodeRegi(request, response);
		}
		else if(command.equals("/board/updatePostPage.board")) { //글 수정페이지 이동
			service.updatePostPage(request, response);
		}
		else if(command.equals("/board/updatePost.board")) { //글 수정
			service.updatePost(request, response);
		}
		else if(command.equals("/board/deletePost.board")){ //글 삭제
			service.deletePost(request, response);
		}
		else if(command.equals("/board/commentWrite.board")) { //댓글 작성
			service.commentWrite(request, response);
		}
		else if(command.equals("/board/replyWrite.board")) { //대댓글 작성
			service.replyWrite(request, response);
		}
		else if(command.equals("/board/deleteComment.board")) { //댓글 삭제
			service.deleteComment(request, response);
		}
		else if(command.equals("/board/increaseCommentLike.board")) { //댓글 좋아요 증가
			service.increaseCommentLike(request, response);
		}
		else if(command.equals("/board/miniWrite.board")) {  // 미니 게시판 신설 요청
	        request.getRequestDispatcher("/board/post_write_mini.jsp").forward(request, response);
		}
		else if(command.equals("/board/postMiniList.board")) { //  미니 요청 목록
		    service.getMiniList(request, response);
		}
		else if(command.equals("/board/miniWriteForm.board")) { // 미니 신설 요청 등록
	        service.miniWrite(request, response);
		}    
		else if(command.equals("/board/voteContent.board")) { // 신청글 내용
			service.voteContent(request, response);
		}
		else if(command.equals("/board/increaseVoteLike.board")) { // 신청글 좋아요
			service.increaseVoteLike(request, response);
		}
		/////
		else if(command.equals("/board/voteForm.board")) { // 투표 결과
			service.addVote(request, response);
		}
		else if(command.equals("/board/mypage.board")) {         //내 글, 내 댓글 보기
			service.getUserActivityLog(request, response);
		}
		
		else if(command.equals("/board/searchPost.board")) {  	//게시판안에서  글 찾기
			service.searchPost(request, response);
		}
		else if(command.equals("/board/searchPostIndex.board")) {	//메인페이지 글 찾기
			service.searchPostIndex(request, response);
		}
	}
}