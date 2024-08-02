package com.kkodamkkodam.board.model;

import java.util.ArrayList;
import java.util.Map;

public interface BoardMapper {
	
	public ArrayList<BoardDTO> getList(Long boardId); 					//글 목록 조회
	public String getboardType(Long boardId);							//게시판 타입 조회
  
	public void postWrite(Map<String, Object> params); //글작성 화면
	public void postRegi(BoardDTO postregi); //글 작성 등록
	public void postCodeRegi(BoardDTO dto);								//코드 질문글 등록
	public void updatePost(BoardDTO dto); 								//글 수정
	public void deletePost(BoardDTO dto);								//글 삭제
	public Long commentCount(BoardDTO dto);								//댓글 수 세기
	
	public BoardDTO getContent(Map<String, Object> params); 			//글 보기
	public ArrayList<CommentDTO> getComment(Map<String, Object> params);//댓글 보기
	public void increaseView(Map<String, Object> params); 				//조회수
	public void increasePostLike(BoardDTO dto); 						//글 좋아요
	public int findReply(CommentDTO dto);								//대댓글 개수반환
	public void commentWrite(CommentDTO dto); 							//댓글작성
	public void increaseCommentLike(CommentDTO dto); 					//댓글 좋아요
	public void replyWrite(CommentDTO dto); 							//대댓글작성
	public void miniWrite(MiniDTO dto); // 미니 게시판 신설 요청 작성
	public ArrayList<MiniDTO> getMiniList(); 	 // 미니 요청 목록
	public MiniDTO voteContent(Long postNo); // 미니 신설 요청 글
	public void miniListView(Long postNo);  // 미니 글 조회수
	public void increaseVoteLike(MiniDTO dto); // 미니 신설 요청 글 좋아요 수
	//////////////// 나린 /////////////
	public void addVote(VoteDTO dto);
	public void insertVoteYes(MiniDTO vote);
	public void insertVoteNo(MiniDTO vote);
	public void insertVote(VoteDTO vote);
	public MiniDTO getMiniVote(MiniDTO vote);
	public int hasUserVoted(Map<String, Object> params);


	
	// 내가 쓴 글 목록 조회
	public ArrayList<BoardDTO> getPostsByUser(Long userNo);
	public ArrayList<BoardDTO>searchPost(BoardDTO dto); 				//글검색
	public ArrayList<BoardDTO>searchPostIndex(BoardDTO dto); 				//메인페이지 글검색

	// 내가 쓴 댓글 목록 조회
	public ArrayList<CommentDTO> getCommentsByUser(Long userNo);
	public void deleteComment(CommentDTO dto);							//댓글 삭제
	public void updateDeleteComment(CommentDTO dto);					//댓글 삭제 - 대댓글 있는경우
	
	public ArrayList<BoardDTO> getBestList(); //베스트 게시판
} 

