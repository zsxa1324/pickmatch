package com.kh.pickmatch.model.vo;

public class FreeBoardAttachment {
	
	private int attachmentNo;
	private String originalFileName;
	private String renamedFileName;
	private int boardNoRef;

	public FreeBoardAttachment() {
		// TODO Auto-generated constructor stub
	}

	public FreeBoardAttachment(int attachmentNo, String originalFileName, String renamedFileName, int boardNoRef) {
		super();
		this.attachmentNo = attachmentNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.boardNoRef = boardNoRef;
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

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	public int getBoardNoRef() {
		return boardNoRef;
	}

	public void setBoardNoRef(int boardNoRef) {
		this.boardNoRef = boardNoRef;
	}

	@Override
	public String toString() {
		return "FreeBoardAttachment [attachmentNo=" + attachmentNo + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + ", boardNoRef=" + boardNoRef + "]";
	}

	
}