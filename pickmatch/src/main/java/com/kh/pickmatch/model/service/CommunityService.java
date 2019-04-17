package com.kh.pickmatch.model.service;

import java.util.List;

import com.kh.pickmatch.model.vo.FreeBoard;
import com.kh.pickmatch.model.vo.FreeBoardAttachment;
import com.kh.pickmatch.model.vo.FreeBoardComment;

public interface CommunityService {

	List<FreeBoard> selectFreeBoardList(int cPage, int numPerPage);

	int selectFreeBoardCount();

	Object selectOneFreeBoard(int boardNo);

	Object selectAttachment(int boardNo);

	int insertFreeBoard(FreeBoard fb, List<FreeBoardAttachment> list);

	int deleteFreeBoard(FreeBoard fb);

	int updateFreeBoard(FreeBoard result);

	int insertComment(FreeBoardComment comment);

	Object selectComment(int boardNo);

	int deleteComment(int commentNo);

	

}
