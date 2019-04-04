package com.kh.pickmatch.model.dao;

import com.kh.pickmatch.model.vo.Member;

public interface MemberDao {
	
	int insertMember(Member m);
	Member selectOne(Member m);
	int update(Member m);
	int delete(Member m);
}
