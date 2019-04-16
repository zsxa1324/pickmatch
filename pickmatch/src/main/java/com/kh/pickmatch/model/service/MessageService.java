package com.kh.pickmatch.model.service;

import java.util.List;

import com.kh.pickmatch.model.vo.Message;

public interface MessageService {

	public int insertMessage(Message msg);
	public List<Message> selectMessageList(String memberId);
	public List<Message> selectMessageList(String memberId, int cPage, int numPerPage);
	public int selectMessageTotalcount(String memberId);
	public int selectMessageTotalcountNotRead(String memberId);
	public List<String> selectMemberList(String teamHome);
	public int insertTeamMessage(Message msg);
	public int updateMessageRead(String memberId);
	
}
