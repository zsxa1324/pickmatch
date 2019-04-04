package com.kh.pickmatch.model.service;

import com.kh.pickmatch.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	Member selectOne(Member m);
	int update(Member m);
	int delete(Member m);
	
}
