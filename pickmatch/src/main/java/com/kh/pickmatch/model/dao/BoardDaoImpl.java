package com.kh.pickmatch.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.Notice;
import com.kh.pickmatch.model.vo.NoticeAttachment;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectNoticeList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectNoticeCount() {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectNoticeCount");
	}

	@Override
	public Notice selectOneNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectOneNotice", noticeNo);
	}

	@Override
	public List<NoticeAttachment> selectAttachment(int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectAttachment", noticeNo);
	}

	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return session.insert("board.insertNotice", n);
	}

	@Override
	public int insertNoticeAttachment(NoticeAttachment a) {
		// TODO Auto-generated method stub
		return session.insert("board.insertNoticeAttachment", a);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return session.update("board.updateNotice", n);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return session.delete("board.deleteNotice", noticeNo);
	}
	
}
