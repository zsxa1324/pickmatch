package com.kh.pickmatch.model.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.pickmatch.common.MailHandler;
import com.kh.pickmatch.controller.MemberController;
import com.kh.pickmatch.model.dao.MemberDao;
import com.kh.pickmatch.model.vo.EmailAuthkey;
import com.kh.pickmatch.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {

	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private BCryptPasswordEncoder bcEncoder;
	
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

	@Override
	public Member checkNickname(String nickname) {
		return dao.checkNickname(nickname);
	}

	@Override
	public int updateMember(Member result, String oldProfile, MultipartFile profile, HttpServletRequest re) {
		
		int updateResult = 0;
		
		String saveDir = re.getSession().getServletContext().getRealPath("/resources/upload/member-profile");

		File dir = new File(saveDir);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
		
		//원래 프로필사진이 지정되어 있는 경우
		if(result.getProfile() != null)
		{
			//input file로 새로 지정한 프로필이 없을 때
			if(profile.isEmpty())
			{	
				//X로 프로필사진을 삭제해서 넘겨줄 경우
				if(oldProfile.equals("") || oldProfile==null)
				{
					//회원db에 저장된 원래 프로필사진을 resource에서 삭제하고
					String filename = result.getProfile();
					File deleFile = new File(saveDir+"/"+filename);
					boolean deleteResult = deleFile.delete();
					logger.info("파일삭제 : "+deleteResult);
					//회원db에 profile지워줌.
					result.setProfile("");
				}
				//oldprofile이 지정되어 있을 때 => 프로필변경 없음
			}
			//input file로 새로 지정한 프로필이 있을 때
			else
			{
				//회원db에 저장된 원래 프로필사진을 resource에서 삭제하고
				String filename = result.getProfile();
				File deleFile = new File(saveDir+"/"+filename);
				boolean deleteResult = deleFile.delete();
				logger.info("파일삭제 : "+deleteResult);
				
				//회원db에 profile지워줌.
				result.setProfile("");
				
				//input file로 넘어온 새로운 프로필 저장.
				String oriFileName = profile.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.indexOf("."));
				String renamedFile = result.getMemberId()+ext;
				result.setProfile(renamedFile);
				try {
					profile.transferTo(new File(saveDir + "/" + renamedFile));
				}catch(IOException e)
				{
					e.printStackTrace();
				}		
			}
		}
		
		//원래 프로필사진이 없었던 경우 
		else
		{
			if(!profile.isEmpty())
			{
				String oriFileName = profile.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.indexOf("."));
				String renamedFile = result.getMemberId()+ext;
				result.setProfile(renamedFile);
				try {
					profile.transferTo(new File(saveDir + "/" + renamedFile));
				}catch(IOException e)
				{
					e.printStackTrace();
				}
			}
			else
			{
				result.setProfile("");
			}
		}
				
		updateResult = dao.updateMember(result);
		return updateResult;
	}

	@Override
	public Member findMemberId(Member m) {
		// TODO Auto-generated method stub
		return dao.findMemberId(m);
	}

	@Override
	public boolean findPassMail(String memberId, String email) throws Exception {

		boolean flag = false;
		
		char pwCollection[] = new char[] { 
                '1','2','3','4','5','6','7','8','9','0', 
                'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
                '!','@','#','$','%','^','&','*','(',')'};//배열에 선언 

		String ranPw = ""; 

		for (int i = 0; i < 8; i++) 
		{ 
			int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다. 
			ranPw += pwCollection[selectRandomPw]; 
		} 
		
		String encodeRanPw = bcEncoder.encode(ranPw);
		Member m = new Member();
		m.setMemberId(memberId);
		m.setPassword(encodeRanPw);
		m.setEmail(email);
			
		// mail 작성 관련 
		MailHandler sendMail = new MailHandler(mailSender);

		sendMail.setSubject("[pickmatch] 임시비밀번호입니다.");
		sendMail.setText(new StringBuffer().append("<h1>[임시 비밀번호]</h1>")
				.append("<p>임시 비밀번호를 보내드립니다. 로그인 후 수정해야 안전합니다.</p>")
				.append("<p>[")
				.append(ranPw)
				.append("]</p>")
				.append("<br/>")
				.append("<p>8자리를 정확하게 입력해주세요. 비밀번호는 대소문자를 구분합니다.</p>")
				.toString());
		sendMail.setFrom("na.sunghee1@gmail.com", "pickmatch");
		sendMail.setTo(email);
		sendMail.send();
		
		int result = dao.updatePassword(m);
		if(result>0) flag = true;
		return flag;
	}

	@Override
	public Member loginSelectOne(Member m) {
		return dao.loginSelectOne(m);
	}

	
	
}
