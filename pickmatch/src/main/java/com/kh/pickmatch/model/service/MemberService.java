package com.kh.pickmatch.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.pickmatch.model.vo.EmailAuthkey;
import com.kh.pickmatch.model.vo.Member;

public interface MemberService {

	Member selectOne(Member m);

	int insertMember(Member m);

	Member checkMail(String email);

	boolean sendMail(String memberId, String email) throws Exception;

	String selectAuthkey(EmailAuthkey ea);

	int insertKakaoMember(Member m);

	int updateKakaoMember(Member m);

	Member checkNickname(String nickname);

	int updateMember(Member result, String oldProfile, MultipartFile profile, HttpServletRequest re);

	Member findMemberId(Member m);

	boolean findPassMail(String memberId, String email) throws Exception;

	Member loginSelectOne(Member m);








}
