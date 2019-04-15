package com.kh.pickmatch.model.vo;

public class TeamBoardAttachment {

	
	private int attachmentNo;
	private String originalFileName;
	private int boardNoRef;
	private String renamedFileName;
	
	public TeamBoardAttachment() {
		// TODO Auto-generated constructor stub
	}

	public TeamBoardAttachment(int attachmentNo, String originalFileName, int boardNoRef, String renamedFileName) {
		super();
		this.attachmentNo = attachmentNo;
		this.originalFileName = originalFileName;
		this.boardNoRef = boardNoRef;
		this.renamedFileName = renamedFileName;
	}

	public int getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
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
		return "TeamBoardAttachment [attachmentNo=" + attachmentNo + ", originalFileName=" + originalFileName
				+ ", boardNoRef=" + boardNoRef + ", renamedFileName=" + renamedFileName + "]";
	}
	
}
