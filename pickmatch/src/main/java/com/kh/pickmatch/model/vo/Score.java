package com.kh.pickmatch.model.vo;

public class Score {
	
	
	private String teamName;
	private int totalPlayCount;
	private int win;
	private int draw;
	private int lose;
	
	public Score() {
		// TODO Auto-generated constructor stub
	}

	public Score(String teamName, int totalPlayCount, int win, int draw, int lose) {
		super();
		this.teamName = teamName;
		this.totalPlayCount = totalPlayCount;
		this.win = win;
		this.draw = draw;
		this.lose = lose;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public int getTotalPlayCount() {
		return totalPlayCount;
	}

	public void setTotalPlayCount(int totalPlayCount) {
		this.totalPlayCount = totalPlayCount;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getLose() {
		return lose;
	}

	public void setLose(int lose) {
		this.lose = lose;
	}

	@Override
	public String toString() {
		return "Score [teamName=" + teamName + ", totalPlayCount=" + totalPlayCount + ", win=" + win + ", draw=" + draw
				+ ", lose=" + lose + "]";
	}
	
	
	
	
	
	
	
	
	

}
