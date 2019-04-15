package com.kh.pickmatch.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
