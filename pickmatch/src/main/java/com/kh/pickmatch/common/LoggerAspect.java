package com.kh.pickmatch.common;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.pickmatch.model.service.MatchService;
import com.kh.pickmatch.model.service.MessageService;
import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.Member;
import com.kh.pickmatch.model.vo.Message;



@Component
@Aspect
public class LoggerAspect {
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private MatchService matchService;

	private Logger logger = LoggerFactory.getLogger(LoggerAspect.class);
	
	@Pointcut("execution(* com.kh.pickmatch.model.service.MatchService.insertMatch(..)) ||"
			+ "execution(* com.kh.pickmatch.model.service.MatchService.matchOk(..))")
	public void matchPointcut() {}
	
	@Pointcut("execution(* com.kh.pickmatch.model.service.TeamService.InsertTeam(..))")
	public void teamPointcut() {}
	
	@Pointcut("execution(* com.kh.pickmatch.controller.MemberController.login(..))")
	public void loginPointcut() {}
	
	// 어드바이스를 적용할 조인포인트를 선별하는 기능을 정의한 모듈, * : 리턴 타입, 현재 모든 타입 리턴 가능 | .. : pickmatch 아래 모든 클래스 | (..) : 인자 타입, 현재 모든 타입 인자 허용
	@Pointcut("execution(* com.kh.pickmatch..Team*.*(..))")
	public void myPointcut() {}
	
	/*@AfterReturning("loginPointcut()")
	public void afterLogin(JoinPoint joinPoint) {
		Signature sig = joinPoint.getSignature();
		String type = sig.getDeclaringTypeName(); // 클래스 이름
		String method = sig.getName(); // 메소드 이름, 넘어가는 String 시점의 메소드
		Member m = (Member) joinPoint.getArgs()[0];
		HttpSession session = (HttpSession) joinPoint.getArgs()[2];
		int messageTotalcount = messageService.selectMessageTotalcount(m.getMemberId());
		session.setAttribute("messageTotalcount", messageTotalcount);
		logger.warn("[afterLogin : aspect ::::]" + type + "." + method + "()");
		logger.warn("[afterLogin : aspect ::::]" + session);
		
	}*/
	
	@AfterReturning("matchPointcut()")
	public void afterWork(JoinPoint joinPoint) {
		Signature sig = joinPoint.getSignature();
		String type = sig.getDeclaringTypeName(); // 클래스 이름
		String method = sig.getName(); // 메소드 이름, 넘어가는 String 시점의 메소드
		Message msg = new Message();
		int result = 0;
		if (method.contains("insertMatch")) {
			Match match = (Match) joinPoint.getArgs()[0];
			logger.warn("[afterWork : aspect : insertMatch ::::]" + type + "." + method + "()");
			logger.debug("afterWork : joinPoint.getArgs()[0] ::::" + joinPoint.getArgs()[0]);
			String teamHome = match.getTeamHome();
			msg.setSender(teamHome);
			msg.setMessageContent(teamHome + "팀의 " + match.getMatchDate() + " 매치가 등록되었습니다");
			msg.setMessageType("팀");
			messageService.insertTeamMessage(msg);
		} else if (method.contains("matchOk")) {
			logger.warn("[afterWork : aspect : matchOk ::::]" + type + "." + method + "()");
			logger.debug("afterWork : joinPoint.getArgs()[0] ::::" + joinPoint.getArgs()[0]);
			Map arguments = (HashMap) joinPoint.getArgs()[0];
			logger.debug("afterWork : arguments : matchNo ::::" + arguments.get("matchNo"));
			int matchNo = (int) arguments.get("matchNo");
			Match match = matchService.selectOneMatch(matchNo);
			logger.debug("afterWork : matchOk : match ::::" + match);
			String teamHome = match.getTeamHome();
			String teamAway = match.getTeamAway();
			Date matchDate = match.getMatchDate();
			msg.setSender(teamHome);
			msg.setMessageContent(teamAway + "팀과의 " + matchDate + " 매치가 성사되었습니다.");
			msg.setMessageType("팀");
			messageService.insertTeamMessage(msg);
			msg.setSender(teamAway);
			msg.setMessageContent(teamHome + "팀과의 " + matchDate + " 매치가 성사되었습니다.");
			messageService.insertTeamMessage(msg);
			List<Map> matchRequestList = matchService.matchResponse(matchNo);
			for (Map m : matchRequestList) {
//				logger.debug("afterWork : matchRequest :: Teamname :" + m.get("TEAMNAME"));
				String canceledTeamname = (String) m.get("TEAMNAME");
				if (!canceledTeamname.equals(teamAway)) {
					msg.setSender(canceledTeamname);
					msg.setMessageContent(teamHome + "팀과의 " + matchDate + " 매치가 실패하였습니다.");
					messageService.insertTeamMessage(msg);
				}
			}
		}
	}
	
	@AfterReturning("teamPointcut()")
	public void afterWorkTeam(JoinPoint joinPoint) {
		Signature sig = joinPoint.getSignature();
		String type = sig.getDeclaringTypeName(); // 클래스 이름
		String method = sig.getName(); // 메소드 이름, 넘어가는 String 시점의 메소드
		Message msg = new Message();
		logger.warn("[afterWorkTeam beforeFilter:::::]" + type + "." + method + "()");
		if (method.contains("InsertTeam")) {
			logger.warn("[afterWork : aspect : InsertTeam ::::]" + type + "." + method + "()");
//			logger.debug("afterWork : team ::::" + team);
			logger.debug("afterWork : joinPoint.getArgs()[0] ::::" + joinPoint.getArgs()[0]);
		} 
	}
	
	// 어드바이스 : 실행시점 지정, 부가기능 모듈인 aspect가 무엇을 언제 할 지 정의 ex) Around : 메소드 실행 전 후 
	// joinPoint : 어드바이스가 적용될 수 있는 위치
	@Around("myPointcut()")
	public Object loggerAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		
		Signature sig = joinPoint.getSignature();
		String type = sig.getDeclaringTypeName(); // 클래스 이름
		String method = sig.getName(); // 메소드 이름, 넘어가는 String 시점의 메소드
		
		String componentType = "";
		if (type.indexOf("Controller") > -1) {
			componentType = "Controller \t: ";
		} else if(type.indexOf("Service") > -1){
			componentType = "Service \t: ";
		} else if(type.indexOf("Dao") > -1){
			componentType = "Dao \t: ";
		}
		logger.warn("[before]" + componentType + type + "." + method + "()");
		// proceed 가지고 잇는 정보를 받음, proceed 하기 전에 먼저 잡음, proceed 기점 전처리 후처리 수행
		Object obj = joinPoint.proceed();
		logger.warn("[after]" + componentType + type + "." + method + "()");
		return obj;
	}
	
	@Pointcut("execution(* com.kh.pickmatch..MemberDao.*(..))")
	public void beforePoint() {
		
	}
	
	@Before("beforePoint()")
	public void beforeLogger(JoinPoint joinPoint) throws Exception {
		
		/*HttpSession session = (HttpSession) RequestContextHolder.currentRequestAttributes().resolveReference(RequestAttributes.REFERENCE_SESSION);
		HttpRequest request = (HttpRequest) RequestContextHolder.currentRequestAttributes().resolveReference(RequestAttributes.REFERENCE_REQUEST);*/
		/*
		 
		 * */
		Signature sig = joinPoint.getSignature();
		Object[] objs = joinPoint.getArgs();
		for (Object o : objs) {
			logger.warn("매개변수 : " + o);
			Member m = null;
			if (o instanceof Member) {
				m = (Member) o;
			}
			/*if (m!=null && !"admin".equals(m.getUserId())) {
//				throw new Exception();
				System.out.println("----admin------");
				System.out.println(m);
			}*/
		}
		
		logger.warn("before : " + sig.getDeclaringType());
	}
	
	@After("execution(* com.kh.pickmatch..Member*.*(..))")
	public void afterLogger(JoinPoint joinPoint) {
		logger.warn("After : 한방에!");
	}
}
