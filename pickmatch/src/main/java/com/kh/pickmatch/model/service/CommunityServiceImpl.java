package com.kh.pickmatch.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pickmatch.common.exception.BoardException;
import com.kh.pickmatch.model.dao.CommunityDao;
import com.kh.pickmatch.model.vo.FreeBoard;
import com.kh.pickmatch.model.vo.FreeBoardAttachment;
import com.kh.pickmatch.model.vo.FreeBoardComment;

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

	@Override
	public int insertFreeBoard(FreeBoard fb, List<FreeBoardAttachment> list) {
		int result = 0;
		result = dao.insertFreeBoard(fb);
		if(result == 0 ) throw new BoardException();
		if(list.size() > 0 )
		{
			for(FreeBoardAttachment a : list)
			{
				a.setBoardNoRef(fb.getBoardNo());
				System.out.println(a);
				result = dao.insertFreeAttachment(a);
				if(result == 0) throw new BoardException();
			}
		}
		return result;
	}

	@Override
	public int insertFreeBoardAttach(FreeBoard fb, List<FreeBoardAttachment> list) {
		int result = 0;
		
		if(list.size() > 0 )
		{
			for(FreeBoardAttachment a : list)
			{
				a.setBoardNoRef(fb.getBoardNo());
				System.out.println(a);
				result = dao.insertFreeAttachment(a);
				if(result == 0) throw new BoardException();
			}
		}
		return result;
	}

	@Override
	public int deleteFreeBoard(FreeBoard fb) {
		// TODO Auto-generated method stub
		return dao.deleteFreeBoard(fb);
	}

	@Override
	public int updateFreeBoard(FreeBoard result) {
		// TODO Auto-generated method stub
		return dao.updateFreeBoard(result);
	}

	@Override
	public int insertComment(FreeBoardComment comment) {
		// TODO Auto-generated method stub
		return dao.insertComment(comment);
	}

	@Override
	public Object selectComment(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectComment(boardNo);
	}

	@Override
	public int deleteComment(int commentNo) {
		// TODO Auto-generated method stub
		return dao.deleteComment(commentNo);
	}

	@Override
	public int deleteFreeBoardAttach(String rName) {
		// TODO Auto-generated method stub
		return dao.deleteFreeBoardAttach(rName);
	}


}
