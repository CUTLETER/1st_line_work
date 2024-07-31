package com.kkodamkkodam.board.model;

import java.sql.Timestamp;

public class VoteDTO {
	
	private Long voteId;
	private Long postNo;
	private Timestamp regdate;
	private Long userNo;	

	public VoteDTO() {
	}

	public VoteDTO(Long voteId, Long postNo, Timestamp regdate, Long userNo) {
		super();
		this.voteId = voteId;
		this.postNo = postNo;
		this.regdate = regdate;
		this.userNo = userNo;
	}

	public Long getVoteId() {
		return voteId;
	}

	public void setVoteId(Long voteId) {
		this.voteId = voteId;
	}

	public Long getPostNo() {
		return postNo;
	}

	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Long getUserNo() {
		return userNo;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}

	
}
