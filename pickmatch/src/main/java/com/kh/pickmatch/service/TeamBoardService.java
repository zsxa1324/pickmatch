package com.kh.pickmatch.service;

import java.util.List;

import com.kh.pickmatch.model.vo.TeamBoard;

public interface TeamBoardService {

	List<TeamBoard> selectList(int cPage, int numPerPage);

	int selectCount();

	Object selectTeamBoard(int boardNo);

	Object selectAttachment(int boardNo);

}
