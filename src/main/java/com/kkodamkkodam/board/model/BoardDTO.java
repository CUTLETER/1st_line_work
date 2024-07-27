package com.kkodamkkodam.board.model;

import java.sql.Timestamp;

public class BoardDTO {
	
	//테이블의 컬럼명과 동일하게 멤버변수 선언합니다.
	private int postNo;
	private int userNo;
	private int boardId;
	private String title;
	private int viewCount;
	private Timestamp regdate;
	private int likeCount;
	private String content;
	private String codeLanguage;
	private String codeContent;
	private String boardType;
	private String boardCategory;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int postNo, int userNo, int boardId, String title, int viewCount, Timestamp regdate, int likeCount,
			String content, String codeLanguage, String codeContent, String boardType, String boardCategory) {
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
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
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
}
