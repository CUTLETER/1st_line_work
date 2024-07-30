package com.kkodamkkodam.board.model;

import java.sql.Timestamp;

public class CommentDTO {
	
	private Long commentNo;
    private Long userNo;
    private Long boardId;
    private Long postNo;
    private String commentContent;
    private Timestamp regDate;
    private Integer likeCount;
    private Long parentId;
    private Integer commentCount;
    private String boardType;
    
    public CommentDTO() {
		// TODO Auto-generated constructor stub
	}

	public CommentDTO(Long commentNo, Long userNo, Long boardId, Long postNo, String commentContent, Timestamp regDate,
			Integer likeCount, Long parentId, Integer commentCount, String boardType) {
		super();
		this.commentNo = commentNo;
		this.userNo = userNo;
		this.boardId = boardId;
		this.postNo = postNo;
		this.commentContent = commentContent;
		this.regDate = regDate;
		this.likeCount = likeCount;
		this.parentId = parentId;
		this.commentCount = commentCount;
		this.boardType = boardType;
	}

	public Long getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(Long commentNo) {
		this.commentNo = commentNo;
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

	public Long getPostNo() {
		return postNo;
	}

	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	

    
}
