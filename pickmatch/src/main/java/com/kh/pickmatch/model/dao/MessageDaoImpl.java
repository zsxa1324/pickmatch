package com.kh.pickmatch.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertMessage(Message msg) {
		// TODO Auto-generated method stub
		return session.insert("message.insertMessage", msg);
	}

	@Override
	public List<Message> selectMessageList(String memberId) {
		// TODO Auto-generated method stub
		return session.selectList("message.selectMessageList", memberId);
	}

	@Override
	public int selectMessageTotalcount(String memberId) {
		// TODO Auto-generated method stub
		return session.selectOne("message.selectMessageTotalcount", memberId);
	}

	@Override
	public List<String> selectMemberList(String teamHome) {
		// TODO Auto-generated method stub
		return session.selectList("message.selectMemberList", teamHome);
	}

	@Override
	public int insertTeamMessage(Message msg) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
