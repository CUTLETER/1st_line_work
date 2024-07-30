package com.kkodamkkodam.board.model;

import java.sql.Timestamp;

public class VoteDTO {
	
	private Long voteId;
	private Long postNo;
	private Timestamp regdate;
	private Long userNo;	
	private Long yesVotes;
    private Long noVotes;
    private String BoardCategory;
    private String BoardType;

	public VoteDTO() {
	}

	public VoteDTO(Long voteId, Long postNo, Timestamp regdate, Long userNo, Long yesVotes, Long noVotes,
			String boardCategory, String boardType) {
		super();
		this.voteId = voteId;
		this.postNo = postNo;
		this.regdate = regdate;
		this.userNo = userNo;
		this.yesVotes = yesVotes;
		this.noVotes = noVotes;
		BoardCategory = boardCategory;
		BoardType = boardType;
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

	public Long getYesVotes() {
		return yesVotes;
	}

	public void setYesVotes(Long yesVotes) {
		this.yesVotes = yesVotes;
	}

	public Long getNoVotes() {
		return noVotes;
	}

	public void setNoVotes(Long noVotes) {
		this.noVotes = noVotes;
	}

	public String getBoardCategory() {
		return BoardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		BoardCategory = boardCategory;
	}

	public String getBoardType() {
		return BoardType;
	}

	public void setBoardType(String boardType) {
		BoardType = boardType;
	}
}
