package com.kh.pickmatch.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Member selectOne(Member m) {
		return session.selectOne("member.selectOne",m);
	}

	@Override
	public int insertMember(Member m) {
		return session.insert("member.insertMember",m);
	}

}
