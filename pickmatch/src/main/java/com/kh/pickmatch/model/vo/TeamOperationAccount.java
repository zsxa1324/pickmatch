package com.kh.pickmatch.model.vo;

import java.io.Serializable;

public class TeamOperationAccount implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6948063990051372591L;
	private String teamName;
	private String accountHolder;
	private String bankName;
	private String accountNumber;
	private int money;
	private int totalMoney;
	
	public TeamOperationAccount() {}

	public TeamOperationAccount(String teamName, String accountHolder, String bankName, String accountNumber, int money,
			int totalMoney) {
		super();
		this.teamName = teamName;
		this.accountHolder = accountHolder;
		this.bankName = bankName;
		this.accountNumber = accountNumber;
		this.money = money;
		this.totalMoney = totalMoney;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	@Override
	public String toString() {
		return "TeamOperationAccount [teamName=" + teamName + ", accountHolder=" + accountHolder + ", bankName="
				+ bankName + ", accountNumber=" + accountNumber + ", money=" + money + ", totalMoney=" + totalMoney
				+ "]";
	}
}