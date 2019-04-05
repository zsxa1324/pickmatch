package com.kh.pickmatch.model.service;

import com.kh.pickmatch.model.vo.Member;

public interface MemberService {

	Member selectOne(Member m);

	int insertMember(Member m);

}
