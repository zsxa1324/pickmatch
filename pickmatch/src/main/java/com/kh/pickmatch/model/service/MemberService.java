package com.kh.pickmatch.model.service;

import com.kh.pickmatch.model.vo.EmailAuthkey;
import com.kh.pickmatch.model.vo.Member;

public interface MemberService {

	Member selectOne(Member m);

	int insertMember(Member m);

	Member checkMail(String email);

	boolean sendMail(String memberId, String email) throws Exception;

	String selectAuthkey(EmailAuthkey ea);



}
