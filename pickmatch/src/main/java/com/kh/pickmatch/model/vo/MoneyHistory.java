package com.kh.pickmatch.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MoneyHistory implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2301934653540993856L;
	private String teamName;
	private String memberId;
	private String inoutType;
	private int money;
	private Date inoutDate;
	private String content;
	
	public MoneyHistory() {}

	public MoneyHistory(String teamName, String memberId, String inoutType, int money, Date inoutDate, String content) {
		super();
		this.teamName = teamName;
		this.memberId = memberId;
		this.inoutType = inoutType;
		this.money = money;
		this.inoutDate = inoutDate;
		this.content = content;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getInoutType() {
		return inoutType;
	}

	public void setInoutType(String inoutType) {
		this.inoutType = inoutType;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public Date getInoutDate() {
		return inoutDate;
	}

	public void setInoutDate(Date inoutDate) {
		this.inoutDate = inoutDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "MoneyHistory [teamName=" + teamName + ", memberId=" + memberId + ", inoutType=" + inoutType + ", money="
				+ money + ", inoutDate=" + inoutDate + ", content=" + content + "]";
	}
	
}
