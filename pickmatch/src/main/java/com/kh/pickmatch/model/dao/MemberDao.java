package com.kh.pickmatch.model.dao;

import com.kh.pickmatch.model.vo.Member;

public interface MemberDao {

	Member selectOne(Member m);

	int insertMember(Member m);

}
