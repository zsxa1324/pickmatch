package com.kh.pickmatch.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertMember(Member m) {
		return 0;
	}

	@Override
	public Member selectOne(Member m) {
		return session.selectOne("member.selectOne", m);
	}

	@Override
	public int update(Member m) {
		return session.update("member.update", m);
	}

	@Override
	public int delete(Member m) {
		return session.delete("member.delete", m);
	}

	
	
}
