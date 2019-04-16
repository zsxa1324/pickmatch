package com.kh.pickmatch.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.FreeBoard;
import com.kh.pickmatch.model.vo.FreeBoardAttachment;
import com.kh.pickmatch.model.vo.FreeBoardComment;

@Repository
public class CommunityDaoImpl implements CommunityDao {
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<FreeBoard> selectFreeBoardList(int cPage, int numPerPage) {
		return session.selectList("community.selectFreeBoard", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectFreeBoardCount() {
		// TODO Auto-generated method stub
		return session.selectOne("community.selectFreeBoardCount");
	}

	@Override
	public Object selectOneFreeBoard(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("community.selectOneFreeBoard", boardNo);
	}

	@Override
	public Object selectAttachment(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("community.selectAttachment", boardNo);
	}

	@Override
	public int insertFreeBoard(FreeBoard fb) {
		// TODO Auto-generated method stub
		return session.insert("community.insertFreeBoard",fb);
	}

	@Override
	public int insertFreeAttachment(FreeBoardAttachment a) {
		// TODO Auto-generated method stub
		return session.insert("community.insertFreeAttachment",a);
	}

	@Override
	public int deleteFreeBoard(FreeBoard fb) {
		// TODO Auto-generated method stub
		return session.delete("community.deleteFreeBoard", fb);
	}

	@Override
	public int updateFreeBoard(FreeBoard result) {
		// TODO Auto-generated method stub
		return session.update("community.updateFreeBoard", result);
	}

	@Override
	public int insertComment(FreeBoardComment comment) {
		// TODO Auto-generated method stub
		return session.insert("community.insertComment", comment);
	}

	@Override
	public Object selectComment(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("community.selectComment", boardNo);
	}

	@Override
	public int deleteComment(int commentNo) {
		// TODO Auto-generated method stub
		return session.delete("community.deleteComment", commentNo);
	}

}
