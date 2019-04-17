package com.kh.pickmatch.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.common.PageBarFactory;
import com.kh.pickmatch.model.service.CommunityService;
import com.kh.pickmatch.model.vo.FreeBoard;
import com.kh.pickmatch.model.vo.FreeBoardAttachment;
import com.kh.pickmatch.model.vo.FreeBoardComment;

@Controller
public class CommunityController {

	private Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	private List<Integer> boardNoList=new ArrayList();
	private int prev=0;
	private int next=0;
	@Autowired
	CommunityService service;
	
	@RequestMapping("/community/freeboard.do")
	public ModelAndView freeboard(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		
		int numPerPage = 10;
		ModelAndView mv = new ModelAndView();
		List<FreeBoard> list = service.selectFreeBoardList(cPage, numPerPage);
		int totalList = service.selectFreeBoardCount();
			
		mv.addObject("list", list);
		mv.addObject("totalList", totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/pickmatch/community/freeboard.do"));
		mv.setViewName("community/co-freeboard");
		boardNoSetting();
		return mv;
	}
	private void boardNoSetting()
	{
		boardNoList.clear();
		List<FreeBoard> list=service.selectFreeBoardListAll();
		for(int i=0;i<list.size();i++) {
			boardNoList.add(list.get(i).getBoardNo());
		}
	}
	@RequestMapping("/community/freeboardView.do")
	public ModelAndView freeboardView(@RequestParam(value="boardNo", defaultValue="1") int boardNo) {
		ModelAndView mv = new ModelAndView();
	    mv.addObject("freeboard", service.selectOneFreeBoard(boardNo));
	    mv.addObject("attachmentList", service.selectAttachment(boardNo));
	    mv.addObject("commentList", service.selectComment(boardNo));
	    logger.info(service.selectComment(boardNo)+"");
	    for(int i=0;i<boardNoList.size();i++)
	    {
	    	if(boardNo==boardNoList.get(i))
	    	{
	    		if(i!=0) { next=boardNoList.get(i-1);}
	    		else { next=boardNoList.get(i);}
	    		if(i!=(boardNoList.size()-1)) {prev=boardNoList.get(i+1);}
	    		else {prev=boardNoList.get(i);}
	    	}
	    }
	    mv.addObject("prev",prev);
	    mv.addObject("next",next);
	    mv.setViewName("community/co-freeboardView");
	    return mv;
	}
	
	@RequestMapping("/community/freeboardSelectAttach.do")
	@ResponseBody
	public Object freeboardSelectAttach(int boardNo) {
		Object list = new ArrayList<>();
		list = service.selectAttachment(boardNo);
		return list;
	}
	
	@RequestMapping("/community/freeboardForm.do")
	public String freeboardForm() {
		return "community/co-freeboardForm";
	}
	
	@RequestMapping("/community/freeboardFormEnd.do")
	public ModelAndView insertFreeboard(FreeBoard fb, MultipartFile[] upFile, HttpServletRequest re) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
		String saveDir = re.getSession().getServletContext().getRealPath("/resources/upload/community-freeboard");
		File dir = new File(saveDir);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
		List<FreeBoardAttachment> list = new ArrayList<>();
		for(MultipartFile f : upFile)
		{
			if(!f.isEmpty())
			{
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				int rndNum = (int)(Math.random()*1000);
				String renamedFile = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + ext;
				try
				{
					f.transferTo(new File(saveDir + "/" + renamedFile));
				}catch(IOException e)
				{
					e.printStackTrace();
				}
				FreeBoardAttachment a = new FreeBoardAttachment();
				a.setOriginalFileName(oriFileName);
				a.setRenamedFileName(renamedFile);
				list.add(a);
			}
		}
		int result = service.insertFreeBoard(fb,list);
		if(result>0)
		{
			msg = "게시글이 등록되었습니다.";
			loc = "/community/freeboardView.do?boardNo="+fb.getBoardNo();
		}
		else
		{
			msg = "게시글 등록이 실패했습니다. 다시 등록해주세요.";
			loc = "/community/freeboard.do";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/community/freeboardDown.do")
	public void fileDown(String oName, String rName, HttpServletRequest request, HttpServletResponse response)
	{
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/community-freeboard");
		try
		{
			FileInputStream fis = new FileInputStream(new File(saveDir+"/"+rName));
			bis = new BufferedInputStream(fis);
			sos = response.getOutputStream();
			String resFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;
			if(isMSIE)
			{
				resFilename = URLEncoder.encode(oName, "UTF-8");
				resFilename = resFilename.replaceAll("\\+", "%20");
			}
			else
			{
				resFilename = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.addHeader("Content-Disposition", "attachment;filename=\""+resFilename+"\"");
			
			int read = 0;
			while((read = bis.read()) != -1)
			{
				sos.write(read);
			}
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				bis.close();
				sos.close();
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		}
	}
	
	//게시판 글 수정시 첨부파일 클릭 삭제
	@RequestMapping("/community/freeboardAttachDelete.do")
	@ResponseBody
	public boolean fileDelete(String oName, String rName, HttpServletRequest request, HttpServletResponse response)
	{
		int result = 0;
		boolean deleteResult = false;
		
		//DB attachment delete
		result = service.deleteFreeBoardAttach(rName);
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/community-freeboard");

		File dir = new File(saveDir);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
		if(result>0) {
			File deleFile = new File(saveDir+"/"+rName);
			deleteResult = deleFile.delete();
			logger.info("파일삭제 : "+deleteResult);
		}
		return deleteResult;
	}
	
	@RequestMapping("/community/freeboardDelete.do")
	public ModelAndView freeboardDelete(int boardNo)
	{
		ModelAndView mv = new ModelAndView();
		FreeBoard fb = new FreeBoard();
		fb.setBoardNo(boardNo);
		
		int result = 0;
		String msg = "";
		String loc = "/community/freeboard.do";
		
		result = service.deleteFreeBoard(fb);
		if(result>0)
		{
			msg = "게시물이 삭제되었습니다.";
		}
		else
		{
			msg = "게시물 삭제에 실패했습니다.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/community/freeboardUpdate.do")
	public ModelAndView freeboardUpdate(int boardNo)
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("freeboard", service.selectOneFreeBoard(boardNo));
	    /*mv.addObject("attachmentList", service.selectAttachment(boardNo));*/
	    mv.addObject("commentList", service.selectComment(boardNo));
	    logger.info(service.selectComment(boardNo)+"");
		mv.setViewName("community/co-freeboardUpdate");
		
		return mv;
	}
	
	@RequestMapping("/community/freeboardUpdateEnd.do")
	public ModelAndView freeBoardUpdateEnd(FreeBoard fb, MultipartFile[] upFile, HttpServletRequest re)
	{
		ModelAndView mv = new ModelAndView();
		FreeBoard result = (FreeBoard)service.selectOneFreeBoard(fb.getBoardNo());
		result.setBoardTitle(fb.getBoardTitle());
		result.setBoardContent(fb.getBoardContent());
		
		String msg = "";
		String loc = "";
		
		String saveDir = re.getSession().getServletContext().getRealPath("/resources/upload/community-freeboard");
		File dir = new File(saveDir);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
		List<FreeBoardAttachment> list = new ArrayList<>();
		for(MultipartFile f : upFile)
		{
			if(!f.isEmpty())
			{
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				int rndNum = (int)(Math.random()*1000);
				String renamedFile = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + ext;
				try
				{
					f.transferTo(new File(saveDir + "/" + renamedFile));
				}catch(IOException e)
				{
					e.printStackTrace();
				}
				FreeBoardAttachment a = new FreeBoardAttachment();
				a.setOriginalFileName(oriFileName);
				a.setRenamedFileName(renamedFile);
				list.add(a);
			}
		}
		
		logger.info("updateEnd fb : " + fb);
		logger.info(""+result);
		
		int Updateresult = service.updateFreeBoard(result);
		service.insertFreeBoardAttach(fb, list);
		if(Updateresult > 0)
		{
			msg = "게시물이 수정되었습니다.";
			loc = "/community/freeboardView.do?boardNo=" + result.getBoardNo();
		}
		else
		{
			msg = "게시글 수정에 실패했습니다.";
			loc = "/community/freeboardUpdate.do?boardNo=" + result.getBoardNo();
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}

	
	//댓글입력
	@RequestMapping("/community/insertFreeBoardComment.do")
	public ModelAndView insertComment(FreeBoardComment comment) 
	{
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "/community/freeboardView.do?boardNo=" + comment.getBoardNoRef();
		
		logger.info("comment : " + comment);
		logger.info(comment.getMemberId());
		int result = service.insertComment(comment);
		if(result > 0)
		{
			msg = "댓글이 입력되었습니다.";
		}
		else
		{
			msg = "댓글입력 실패";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/community/commentDelete.do")
	@ResponseBody
	public ModelAndView deleteComment(int boardNo, int commentNo) 
	{
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "/community/freeboardView.do?boardNo="+boardNo;
		
		logger.info("commentNo : " + commentNo);
		int result = service.deleteComment(commentNo);
		if(result > 0 )
		{
			msg = "해당 댓글이 삭제되었습니다.";
		}
		else
		{
			msg = "댓글 삭제에 실패했습니다.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}

}
