package com.kh.pickmatch.model.vo;

import java.sql.Date;

public class Message {
	
	private int messageNo;
	private String sender, receiver;
	private Date time;
	private String messageContent, messageType;
	
	public Message() {}

	public Message(int messageNo, String sender, String receiver, Date time, String messageContent,
			String messageType) {
		super();
		this.messageNo = messageNo;
		this.sender = sender;
		this.receiver = receiver;
		this.time = time;
		this.messageContent = messageContent;
		this.messageType = messageType;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", sender=" + sender + ", receiver=" + receiver + ", time=" + time
				+ ", messageContent=" + messageContent + ", messageType=" + messageType + "]";
	}
	
	
}
