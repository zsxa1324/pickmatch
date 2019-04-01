package com.kh.pickmatch.model.vo;

import java.util.Date;

public class MemberByTeam {

	
	private String memberId;
	private String teamName;
	private String authority;
	private Date enrollDate;
	private Date exitDate;
	private int playCount;
	private int goalCount;
	
	public MemberByTeam() {
		// TODO Auto-generated constructor stub
	}

	public MemberByTeam(String memberId, String teamName, String authority, Date enrollDate, Date exitDate,
			int playCount, int goalCount) {
		super();
		this.memberId = memberId;
		this.teamName = teamName;
		this.authority = authority;
		this.enrollDate = enrollDate;
		this.exitDate = exitDate;
		this.playCount = playCount;
		this.goalCount = goalCount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getExitDate() {
		return exitDate;
	}

	public void setExitDate(Date exitDate) {
		this.exitDate = exitDate;
	}

	public int getPlayCount() {
		return playCount;
	}

	public void setPlayCount(int playCount) {
		this.playCount = playCount;
	}

	public int getGoalCount() {
		return goalCount;
	}

	public void setGoalCount(int goalCount) {
		this.goalCount = goalCount;
	}

	@Override
	public String toString() {
		return "MemberByTeam [memberId=" + memberId + ", teamName=" + teamName + ", authority=" + authority
				+ ", enrollDate=" + enrollDate + ", exitDate=" + exitDate + ", playCount=" + playCount + ", goalCount="
				+ goalCount + "]";
	}
	
	
	
	
	
	
	
	
}
