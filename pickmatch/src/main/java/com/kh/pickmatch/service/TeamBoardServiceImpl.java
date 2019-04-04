package com.kh.pickmatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.dao.TeamBoardDao;
import com.kh.pickmatch.model.vo.TeamBoard;

@Service
public class TeamBoardServiceImpl implements TeamBoardService {

	@Override
	public Object selectTeamBoard(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectTeamBoard(boardNo);
	}


	@Override
	public Object selectAttachment(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectAttachment(boardNo);
	}


	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return dao.selectCount();
	}


	@Autowired
	private TeamBoardDao dao;
	
	
	@Override
	public List<TeamBoard> selectList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectList(cPage, numPerPage);
	}

}
