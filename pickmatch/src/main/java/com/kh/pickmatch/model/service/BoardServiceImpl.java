package com.kh.pickmatch.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.common.BoardException;
import com.kh.pickmatch.model.dao.BoardDao;
import com.kh.pickmatch.model.vo.FreeBoardAttachment;
import com.kh.pickmatch.model.vo.Notice;
import com.kh.pickmatch.model.vo.NoticeAttachment;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Override
	public List<Notice> selectNoticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectNoticeList(cPage, numPerPage);
	}

	@Override
	public int selectNoticeCount() {
		// TODO Auto-generated method stub
		return dao.selectNoticeCount();
	}

	@Override
	public Notice selectOneNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectOneNotice(noticeNo);
	}

	@Override
	public List<NoticeAttachment> selectAttachment(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectAttachment(noticeNo);
	}

	@Override
	public int insertNotice(Notice n, List<NoticeAttachment> list) {
		
		int result = 0;
		result = dao.insertNotice(n);
		if(result == 0 ) throw new BoardException();
		if(list.size() > 0 )
		{
			for(NoticeAttachment a : list)
			{
				a.setNoticeNo(n.getNoticeNo());
				result = dao.insertNoticeAttachment(a);
				if(result == 0) throw new BoardException();
			}
		}
		return result;
	}

}
