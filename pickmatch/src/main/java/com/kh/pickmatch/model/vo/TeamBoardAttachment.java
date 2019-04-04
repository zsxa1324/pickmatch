package com.kh.pickmatch.model.vo;

public class TeamBoardAttachment {

	
	private int attachmentNo;
	private String originamFileName;
	private int boardNoRef;
	private String renamedFileName;
	
	public TeamBoardAttachment() {
		// TODO Auto-generated constructor stub
	}

	public TeamBoardAttachment(int attachmentNo, String originamFileName, int boardNoRef, String renamedFileName) {
		super();
		this.attachmentNo = attachmentNo;
		this.originamFileName = originamFileName;
		this.boardNoRef = boardNoRef;
		this.renamedFileName = renamedFileName;
	}

	public int getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public String getOriginamFileName() {
		return originamFileName;
	}

	public void setOriginamFileName(String originamFileName) {
		this.originamFileName = originamFileName;
	}

	public int getBoardNoRef() {
		return boardNoRef;
	}

	public void setBoardNoRef(int boardNoRef) {
		this.boardNoRef = boardNoRef;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	@Override
	public String toString() {
		return "TeamBoardAttachment [attachmentNo=" + attachmentNo + ", originamFileName=" + originamFileName
				+ ", boardNoRef=" + boardNoRef + ", renamedFileName=" + renamedFileName + "]";
	}
	
}
