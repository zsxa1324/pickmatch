package com.kh.pickmatch.model.dao;

import java.util.List;

import com.kh.pickmatch.model.vo.FreeBoardAttachment;
import com.kh.pickmatch.model.vo.Notice;
import com.kh.pickmatch.model.vo.NoticeAttachment;

public interface BoardDao {
	
	List<Notice> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeCount();

	Notice selectOneNotice(int noticeNo);

	List<NoticeAttachment> selectAttachment(int noticeNo);

	int insertNotice(Notice n);
	
	int insertNoticeAttachment(NoticeAttachment a);
}
