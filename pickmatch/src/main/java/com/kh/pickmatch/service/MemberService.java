package com.kh.pickmatch.service;

import com.kh.pickmatch.model.vo.Member;

public interface MemberService {

	Member selectOne(Member m);

	int insertMember(Member m);

}
