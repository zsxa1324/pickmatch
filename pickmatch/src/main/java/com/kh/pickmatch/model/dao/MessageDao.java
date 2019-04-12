package com.kh.pickmatch.model.dao;

import java.util.List;

import com.kh.pickmatch.model.vo.Message;

public interface MessageDao {

	public int insertMessage(Message msg);
	public List<Message> selectMessageList(String memberId);
	public int selectMessageTotalcount(String memberId);
}
