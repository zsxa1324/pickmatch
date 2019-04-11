package com.kh.pickmatch.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.pickmatch.common.MailHandler;
import com.kh.pickmatch.model.dao.MemberDao;
import com.kh.pickmatch.model.vo.EmailAuthkey;
import com.kh.pickmatch.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public Member selectOne(Member m) {
		return dao.selectOne(m);
	}

	@Override
	@Transactional
	public int insertMember(Member m) {
		int result = dao.insertMember(m);
		
		if(result>0)
		{
			//임의의 authkey생성
			/*String authkey = new TempKey().getKey(50, false);
			
			m.setAuthkey(authkey);
			result = dao.updateAuthkey(m);
	
			// mail 작성 관련 
			MailHandler sendMail = new MailHandler(mailSender);
	
			sendMail.setSubject("[pickmatch] 회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost:9090/pickmatch/enrollConfirm?memberId=")
					.append(m.getMemberId())
					.append("&email=")
					.append(m.getEmail())
					.append("&authkey=")
					.append(authkey)
					.append("' target='_blank'>이메일 인증 확인</a>")
					.toString());
			sendMail.setFrom("na.sunghee1@gmail.com", "관리자");
			sendMail.setTo(m.getEmail());
			sendMail.send();*/
		}
		return result;
	}

	@Override
	public Member checkMail(String email) {
		return dao.checkMail(email);
	}

	
	@Override
	public boolean sendMail(String memberId, String email) throws Exception {
	
		boolean flag = false;
		/*String authkey = new TempKey().getKey(50, false);*/
		String authkey = ""+(int)((Math.random()*9)+1)+""+(int)((Math.random())*10000)+1;
		EmailAuthkey ea = new EmailAuthkey();
		ea.setMemberId(memberId);
		ea.setEmail(email);
		ea.setAuthkey(authkey);
		
		// mail 작성 관련 
		MailHandler sendMail = new MailHandler(mailSender);

		sendMail.setSubject("[pickmatch] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 인증번호를 회원가입란에 입력해주세요.</p>")
				.append("<p>[")
				.append(authkey)
				.append("]</p>")
				.toString());
		sendMail.setFrom("na.sunghee1@gmail.com", "pickmatch");
		sendMail.setTo(ea.getEmail());
		sendMail.send();
		
		int result = dao.insertAuthkey(ea);
		if(result>0) flag = true;
		return flag;
	}

	@Override
	public String selectAuthkey(EmailAuthkey ea) {
		return dao.selectAuthkey(ea);
	}

	@Override
	public int insertKakaoMember(Member m) {
		// TODO Auto-generated method stub
		return dao.insertKakaoMember(m);
	}

	@Override
	public int updateKakaoMember(Member m) {
		// TODO Auto-generated method stub
		return dao.updateKakaoMember(m);
	}

	
}
