package com.kh.pickmatch.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.pickmatch.common.MessageException;
import com.kh.pickmatch.model.dao.MessageDao;
import com.kh.pickmatch.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao dao;
	
	@Override
	public int insertMessage(Message msg) {
		// TODO Auto-generated method stub
		return dao.insertMessage(msg);
	}

	@Override
	public List<Message> selectMessageList(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectMessageList(memberId);
	}

	@Override
	public int selectMessageTotalcount(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectMessageTotalcount(memberId);
	}

	@Override
	public List<String> selectMemberList(String teamHome) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(teamHome);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor=Exception.class)
	public int insertTeamMessage(Message msg) {
		// TODO Auto-generated method stub
		int result = 0;
		String teamName = msg.getSender();
		List<String> memberList = dao.selectMemberList(teamName);
		if (memberList.size() == 0)
			throw new MessageException();
		for (String mName : memberList) {
			msg.setReceiver(mName);
			result = dao.insertMessage(msg);
			if (result == 0)
				throw new MessageException();
		}
		return result;
	}

	
	
	
	
}
