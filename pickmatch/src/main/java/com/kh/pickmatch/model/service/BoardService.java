package com.kh.pickmatch.model.service;

import java.util.List;

import com.kh.pickmatch.model.vo.Notice;
import com.kh.pickmatch.model.vo.NoticeAttachment;

public interface BoardService {

	List<Notice> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeCount();

	Notice selectOneNotice(int noticeNo);

	List<NoticeAttachment> selectAttachment(int noticeNo);

	int insertNotice(Notice n, List<NoticeAttachment> list);
	
	int updateNotice(Notice n);
	
	int deleteNotice(int noticeNo);
}
