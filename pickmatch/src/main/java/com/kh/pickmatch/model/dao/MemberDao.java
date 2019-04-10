package com.kh.pickmatch.model.dao;

import com.kh.pickmatch.model.vo.EmailAuthkey;
import com.kh.pickmatch.model.vo.Member;

public interface MemberDao {

	Member selectOne(Member m);

	int insertMember(Member m);

	int insertAuthkey(EmailAuthkey ea);

	Member checkMail(String email);

	String selectAuthkey(EmailAuthkey ea);

}
