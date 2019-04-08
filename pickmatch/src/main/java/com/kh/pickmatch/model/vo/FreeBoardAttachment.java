package com.kh.pickmatch.model.vo;

public class FreeBoardAttachment {
	
	private int attachmentNo;
	private String originamFileName;
	private String renamedFileName;
	private int boardNoRef;

	public FreeBoardAttachment() {
		// TODO Auto-generated constructor stub
	}

	public FreeBoardAttachment(int attachmentNo, String originamFileName, String renamedFileName, int boardNoRef) {
		super();
		this.attachmentNo = attachmentNo;
		this.originamFileName = originamFileName;
		this.renamedFileName = renamedFileName;
		this.boardNoRef = boardNoRef;
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
		return "FreeBoardAttachment [attachmentNo=" + attachmentNo + ", originamFileName=" + originamFileName
				+ ", renamedFileName=" + renamedFileName + ", boardNoRef=" + boardNoRef + "]";
	}
	
	
}
