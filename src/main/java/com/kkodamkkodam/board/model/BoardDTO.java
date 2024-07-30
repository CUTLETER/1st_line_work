package com.kkodamkkodam.board.model;

import java.sql.Timestamp;

public class BoardDTO {
	
	//테이블의 컬럼명과 동일하게 멤버변수 선언합니다.
	private Long postNo;
	private Long userNo;
	private Long boardId;
	private String title;
	private Long viewCount;
	private Timestamp regdate;
	private Long likeCount;
	private String content;
	private String codeLanguage;
	private String codeContent;
	private String boardType;
	private String boardCategory;
	private Long commentCount;
	
	public BoardDTO() {
	}

	public BoardDTO(Long postNo, Long userNo, Long boardId, String title, Long viewCount, Timestamp regdate,
			Long likeCount, String content, String codeLanguage, String codeContent, String boardType,
			String boardCategory, Long commentCount) {
		super();
		this.postNo = postNo;
		this.userNo = userNo;
		this.boardId = boardId;
		this.title = title;
		this.viewCount = viewCount;
		this.regdate = regdate;
		this.likeCount = likeCount;
		this.content = content;
		this.codeLanguage = codeLanguage;
		this.codeContent = codeContent;
		this.boardType = boardType;
		this.boardCategory = boardCategory;
		this.commentCount = commentCount;
	}

	public Long getPostNo() {
		return postNo;
	}

	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}

	public Long getUserNo() {
		return userNo;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}

	public Long getBoardId() {
		return boardId;
	}

	public void setBoardId(Long boardId) {
		this.boardId = boardId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getViewCount() {
		return viewCount;
	}

	public void setViewCount(Long viewCount) {
		this.viewCount = viewCount;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Long getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Long likeCount) {
		this.likeCount = likeCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCodeLanguage() {
		return codeLanguage;
	}

	public void setCodeLanguage(String codeLanguage) {
		this.codeLanguage = codeLanguage;
	}

	public String getCodeContent() {
		return codeContent;
	}

	public void setCodeContent(String codeContent) {
		this.codeContent = codeContent;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public Long getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Long commentCount) {
		this.commentCount = commentCount;
	}
	
	
}
