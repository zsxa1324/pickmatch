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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.common.PageBarFactory;
import com.kh.pickmatch.model.service.BoardService;
import com.kh.pickmatch.model.vo.FreeBoardAttachment;
import com.kh.pickmatch.model.vo.Notice;
import com.kh.pickmatch.model.vo.NoticeAttachment;

@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired
	BoardService service;

	@RequestMapping("/board/notice")
	public ModelAndView notice(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		int numPerPage = 10;
		ModelAndView mv = new ModelAndView();
		List<Notice> list = service.selectNoticeList(cPage, numPerPage);
		int totalList = service.selectNoticeCount();
	
		mv.addObject("list", list);
		mv.addObject("totalList", totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/pickmatch/board/notice"));
		mv.setViewName("board/notice");
		return mv;
	}
	
	@RequestMapping("/board/noticeView.do")
	public ModelAndView noticeView(@RequestParam(value="noticeNo", defaultValue="1") int noticeNo) {
		ModelAndView mv = new ModelAndView();
	    mv.addObject("notice", service.selectOneNotice(noticeNo));
	    mv.addObject("attachmentList", service.selectAttachment(noticeNo));
	    mv.setViewName("board/noticeView");
	    return mv;
	}
	
	@RequestMapping("/board/noticeForm.do")
	public String freeboardForm() {
		return "board/noticeForm";
	}
	
	@RequestMapping("/board/noticeFormEnd.do")
	public ModelAndView insertNotice(Notice n, MultipartFile[] upFile, HttpServletRequest re) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
		String saveDir = re.getSession().getServletContext().getRealPath("/resources/upload/notice");
		File dir = new File(saveDir);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
		List<NoticeAttachment> list = new ArrayList<>();
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
				NoticeAttachment a = new NoticeAttachment();
				a.setOriginalFileName(oriFileName);
				a.setRenamedFileName(renamedFile);
				list.add(a);
			}
		}
		int result = service.insertNotice(n,list);
		logger.debug("insertNotice Result :::" + result);
		if(result>0)
		{
			msg = "게시글이 등록되었습니다.";
			loc = "/board/notice";
		}
		else
		{
			msg = "게시글 등록이 실패했습니다. 다시 등록해주세요.";
			loc = "/board/notice";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/board/noticeDown.do")
	public void fileDown(String oName, String rName, HttpServletRequest request, HttpServletResponse response)
	{
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/notice");
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
	
	@RequestMapping("/board/noticeUpdate")
	public ModelAndView updateNotice(int noticeNo) {
		logger.debug("up");
		ModelAndView mv = new ModelAndView();
		mv.addObject("notice", service.selectOneNotice(noticeNo));
		mv.addObject("attachmentList", service.selectAttachment(noticeNo));
		mv.setViewName("board/noticeUpdate");
		return mv;
	}
	
	@RequestMapping("/board/noticeUpdateEnd")
	public ModelAndView updateNoticeEnd(Notice n) {
		ModelAndView mv = new ModelAndView();
		int result = service.updateNotice(n);
		String msg = "";
		String loc = "/board/notice";
		if (result > 0)
			msg = "게시물이 수정되었습니다";
		else
			msg = "게시물 수정에 실패하였습니다";
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/board/noticeDelete")
	public ModelAndView deleteNotice(int noticeNo) {
		ModelAndView mv = new ModelAndView();
		int result = service.deleteNotice(noticeNo);
		String msg = "";
		String loc = "/board/notice";
		if (result > 0)
			msg = "게시물이 삭제되었습니다.";
		else
			msg = "게시물 삭제에 실패하였습니다.";
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	/*@RequestMapping("/board/recruit")
	public ModelAndView recruit(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		int numPerPage = 10;
		ModelAndView mv = new ModelAndView();
		List<Notice> list = service.selectNoticeList(cPage, numPerPage);
		int totalList = service.selectNoticeCount();
	
		mv.addObject("list", list);
		mv.addObject("totalList", totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/pickmatch/board/notice"));
		mv.setViewName("board/notice");
		return mv;
	}*/
	
}
