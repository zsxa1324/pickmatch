package com.kh.pickmatch.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.EmailAuthkey;
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

	@Override
	public int insertAuthkey(EmailAuthkey ea) {
		return session.insert("member.insertAuthkey",ea);
	}

	
	@Override
	public String selectAuthkey(EmailAuthkey ea) {
		return session.selectOne("member.selectAuthkey",ea);
	}

	@Override
	public Member checkMail(String email) {
		return session.selectOne("member.checkMail",email);
	}

	@Override
	public int insertKakaoMember(Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertKakaoMember",m);
	}

	@Override
	public int updateKakaoMember(Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateKakaoMember",m);
	}

	@Override
	public Member checkNickname(String nickname) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkNickname",nickname);
	}

	@Override
	public int updateMember(Member result) {
		// TODO Auto-generated method stub
		return session.update("member.updateMember",result);
	}

	@Override
	public Member findMemberId(Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.findMemberId",m);
	}

	@Override
	public int updatePassword(Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updatePassword",m);
	}
	
	

}
