package com.kh.pickmatch.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.pickmatch.model.vo.Message;

public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertMessage(Message msg) {
		// TODO Auto-generated method stub
		return session.insert("message.insertMessage");
	}

}
