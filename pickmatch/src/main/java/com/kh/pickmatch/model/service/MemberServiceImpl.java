package com.kh.pickmatch.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.model.dao.MemberDao;
import com.kh.pickmatch.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Override
	public int insertMember(Member m) {
		return dao.update(m);
	}

	@Override
	public Member selectOne(Member m) {
		return dao.selectOne(m);
	}

	@Override
	public int update(Member m) {
		return dao.update(m);
	}

	@Override
	public int delete(Member m) {
		return dao.delete(m);
	}

}
