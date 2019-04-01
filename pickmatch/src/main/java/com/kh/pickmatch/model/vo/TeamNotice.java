package com.kh.pickmatch.model.vo;

import java.util.Date;

public class TeamNotice {

	private int noticeNo;
	private String noticeTitle;
	private String memberId;
	private String noticeContent;
	private Date noticeDate;
	private int noticeReadCount;
	private String teamName;
	
	
	public TeamNotice() {
		// TODO Auto-generated constructor stub
	}


	public TeamNotice(int noticeNo, String noticeTitle, String memberId, String noticeContent, Date noticeDate,
			int noticeReadCount, String teamName) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.memberId = memberId;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadCount = noticeReadCount;
		this.teamName = teamName;
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public Date getNoticeDate() {
		return noticeDate;
	}


	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}


	public int getNoticeReadCount() {
		return noticeReadCount;
	}


	public void setNoticeReadCount(int noticeReadCount) {
		this.noticeReadCount = noticeReadCount;
	}


	public String getTeamName() {
		return teamName;
	}


	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}


	@Override
	public String toString() {
		return "TeamNotice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", memberId=" + memberId
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticeReadCount="
				+ noticeReadCount + ", teamName=" + teamName + "]";
	}
	
	
	
}
