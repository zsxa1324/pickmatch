package com.kh.pickmatch.dao;

import java.util.List;

import com.kh.pickmatch.model.vo.TeamBoard;


public interface TeamBoardDao {

	int selectCount();
	List<TeamBoard> selectList(int cPage, int numPerPage);
	Object selectTeamBoard(int boardNo);
	Object selectAttachment(int boardNo);

}
