package com.kh.pickmatch.model.vo;

public class MatchGoalResult {

	
	private int goalSeqNo;
	private String teamName;
	private int matchNo;
	private String memberId;
	private int goalTime;
	
	public MatchGoalResult() {
		// TODO Auto-generated constructor stub
	}

	public MatchGoalResult(int goalSeqNo, String teamName, int matchNo, String memberId, int goalTime) {
		super();
		this.goalSeqNo = goalSeqNo;
		this.teamName = teamName;
		this.matchNo = matchNo;
		this.memberId = memberId;
		this.goalTime = goalTime;
	}

	public int getGoalSeqNo() {
		return goalSeqNo;
	}

	public void setGoalSeqNo(int goalSeqNo) {
		this.goalSeqNo = goalSeqNo;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public int getMatchNo() {
		return matchNo;
	}

	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getGoalTime() {
		return goalTime;
	}

	public void setGoalTime(int goalTime) {
		this.goalTime = goalTime;
	}

	@Override
	public String toString() {
		return "MatchGoalResult [goalSeqNo=" + goalSeqNo + ", teamName=" + teamName + ", matchNo=" + matchNo
				+ ", memberId=" + memberId + ", goalTime=" + goalTime + "]";
	}
	
	
	
	
}
