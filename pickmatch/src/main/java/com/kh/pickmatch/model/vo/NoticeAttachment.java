package com.kh.pickmatch.model.vo;

public class NoticeAttachment {

	
	private int attachmentNo;
	private String originalFileName;
	private String renamedFileName;
	private int noticeNo;
	
	public NoticeAttachment() {}

	public NoticeAttachment(int attachmentNo, String originalFileName, String renamedFileName, int noticeNo) {
		super();
		this.attachmentNo = attachmentNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.noticeNo = noticeNo;
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

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	@Override
	public String toString() {
		return "NoticeAttachment [attachmentNo=" + attachmentNo + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + ", noticeNo=" + noticeNo + "]";
	}

}
