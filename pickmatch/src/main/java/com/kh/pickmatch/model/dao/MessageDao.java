package com.kh.pickmatch.model.dao;

import java.util.List;

import com.kh.pickmatch.model.vo.Message;

public interface MessageDao {

	public int insertMessage(Message msg);
	public List<Message> selectMessageList(String memberId);
	List<Message> selectMessageList(String memberId, int cPage, int numPerPage);
	public int selectMessageTotalcount(String memberId);
	public int selectMessageTotalcountNotRead(String memberId);
	public List<String> selectMemberList(String teamHome);
	int insertTeamMessage(Message msg);
	public int updateMessageRead(String memberId);
	
}
