package com.kh.pickmatch.model.vo;

import java.util.Date;

public class FreeBoard {
	
	private int boardNo;
	private String boardTitle;
	private String memberId;
	private String boardContent;
	private Date boardDate;
	private int boardReadCount;

	public FreeBoard() {
		// TODO Auto-generated constructor stub
	}

	public FreeBoard(int boardNo, String boardTitle, String memberId, String boardContent, Date boardDate,
			int boardReadCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.memberId = memberId;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardReadCount = boardReadCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardReadCount() {
		return boardReadCount;
	}

	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}

	@Override
	public String toString() {
		return "FreeBoard [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", memberId=" + memberId
				+ ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", boardReadCount=" + boardReadCount
				+ "]";
	}
	
	
}
