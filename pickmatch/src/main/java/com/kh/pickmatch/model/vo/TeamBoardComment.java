package com.kh.pickmatch.model.vo;

public class TeamBoardComment {

	private int commentNo;
	private String memberId;
	private String commentContent;
	private int boardNoRef;
	private int commentNoRef;
	
	public TeamBoardComment() {
		// TODO Auto-generated constructor stub
	}

	public TeamBoardComment(int commentNo, String memberId, String commentContent, int boardNoRef, int commentNoRef) {
		super();
		this.commentNo = commentNo;
		this.memberId = memberId;
		this.commentContent = commentContent;
		this.boardNoRef = boardNoRef;
		this.commentNoRef = commentNoRef;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getBoardNoRef() {
		return boardNoRef;
	}

	public void setBoardNoRef(int boardNoRef) {
		this.boardNoRef = boardNoRef;
	}

	public int getCommentNoRef() {
		return commentNoRef;
	}

	public void setCommentNoRef(int commentNoRef) {
		this.commentNoRef = commentNoRef;
	}

	@Override
	public String toString() {
		return "TeamBoardComment [commentNo=" + commentNo + ", memberId=" + memberId + ", commentContent="
				+ commentContent + ", boardNoRef=" + boardNoRef + ", commentNoRef=" + commentNoRef + "]";
	}
	
}
