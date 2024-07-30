package com.kkodamkkodam.board.model;

import java.sql.Timestamp;

public class MiniDTO {
	
	private Long postNo;
	private String boardType;
	private String boardCategory;
	private String content;
	private Timestamp regdate;
	private Long viewCount;
	private Long userNo;
	private Long likeCount;

	public MiniDTO() {
	}

	public MiniDTO(Long postNo, String boardType, String boardCategory, String content, Timestamp regdate,
			Long viewCount, Long userNo, Long likeCount) {
		super();
		this.postNo = postNo;
		this.boardType = boardType;
		this.boardCategory = boardCategory;
		this.content = content;
		this.regdate = regdate;
		this.viewCount = viewCount;
		this.userNo = userNo;
		this.likeCount = likeCount;
		
	}

	public Long getpostNo() {
		return postNo;
	}

	public void setPostNo(Long postNo) {
		this.postNo = postNo;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Long getViewCount() {
		return viewCount;
	}

	public void setViewCount(Long viewCount) {
		this.viewCount = viewCount;
	}
	
	public Long getuserNo() {
		return userNo;
	}
	
	public void setuserNo(Long userNo) {
		this.userNo = userNo;
	}
	
	public Long getlikeCount() {
		return likeCount;
	}
	
	public void setlikeCount(Long likeCount) {
		this.likeCount = likeCount;
	}

}
