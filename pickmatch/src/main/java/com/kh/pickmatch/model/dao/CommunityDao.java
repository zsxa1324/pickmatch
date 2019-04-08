package com.kh.pickmatch.model.dao;

import java.util.List;

import com.kh.pickmatch.model.vo.FreeBoard;

public interface CommunityDao {

	List<FreeBoard> selectFreeBoardList(int cPage, int numPerPage);

	int selectFreeBoardCount();

	Object selectOneFreeBoard(int boardNo);

	Object selectAttachment(int boardNo);

}
