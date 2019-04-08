package com.kh.pickmatch.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.model.dao.CommunityDao;
import com.kh.pickmatch.model.vo.FreeBoard;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDao dao;

	@Override
	public List<FreeBoard> selectFreeBoardList(int cPage, int numPerPage) {
		return dao.selectFreeBoardList(cPage, numPerPage);
	}

	@Override
	public int selectFreeBoardCount() {
		return dao.selectFreeBoardCount();
	}

	@Override
	public Object selectOneFreeBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectOneFreeBoard(boardNo);
	}

	@Override
	public Object selectAttachment(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectAttachment(boardNo);
	}


}
