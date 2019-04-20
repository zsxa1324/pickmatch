package com.kh.pickmatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.model.service.AdminService;
import com.kh.pickmatch.model.vo.StatusMember;

@Controller
public class AdminController {

@Autowired
private AdminService service;

private Logger logger=LoggerFactory.getLogger(AdminController.class);

@RequestMapping("/admin/adminPage")
public ModelAndView adminPage() {
	ModelAndView mv=new ModelAndView();
	
	mv.setViewName("admin/adminPage");
	return mv;
			
	
}
@RequestMapping("/admin/memberList.do")
@ResponseBody
public Map<String,Object> memberList() {
	ModelAndView mv=new ModelAndView();
	List<Map> list=service.memberList();
	Map<String,Object> map=new HashMap<>();
	map.put("list",list);
	return map;
}
@RequestMapping("/admin/memberActive")
public String memberActive(String[] memberList) {
	
	int result=service.memberActive(memberList);
	return "/admin/adminPage";
}
@RequestMapping("/admin/teamActive")
public String teamActive(String[] teamList) {
	int result=service.teamActive(teamList);
	return "/admin/adminPage";
}

@RequestMapping("/admin/memberUnActive")
public String memberUnActive(String[] memberList) {
	int result=service.memberUnActive(memberList); 
	
	return "/admin/adminPage";
}
@RequestMapping("/admin/teamList.do")
@ResponseBody
public Map<String,Object> tetamList(){
	ModelAndView mv=new ModelAndView();
	List<Map> list=service.teamList();
	Map<String,Object> map=new HashMap<>();
	map.put("list",list);
	return map;
}

@RequestMapping("/admin/teamUnActive")
public String teamUnActive(String[] teamList) {
	int result=service.teamUnaCTIVE(teamList);
	return "/admin/adminPage";
}

	
}
