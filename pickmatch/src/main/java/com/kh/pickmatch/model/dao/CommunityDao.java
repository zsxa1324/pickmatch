package com.kh.pickmatch.model.dao;

import java.util.List;

import com.kh.pickmatch.model.vo.FreeBoard;
import com.kh.pickmatch.model.vo.FreeBoardAttachment;
import com.kh.pickmatch.model.vo.FreeBoardComment;

public interface CommunityDao {

	List<FreeBoard> selectFreeBoardList(int cPage, int numPerPage);

	int selectFreeBoardCount();

	Object selectOneFreeBoard(int boardNo);

	Object selectAttachment(int boardNo);

	int insertFreeBoard(FreeBoard fb);

	int insertFreeAttachment(FreeBoardAttachment a);

	int deleteFreeBoard(FreeBoard fb);

	int updateFreeBoard(FreeBoard result);

	int insertComment(FreeBoardComment comment);

	Object selectComment(int boardNo);

	int deleteComment(int commentNo);

	int deleteFreeBoardAttach(String rName);

}
