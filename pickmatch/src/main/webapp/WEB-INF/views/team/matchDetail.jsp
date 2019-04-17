<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="매치 상세보기" name="pageTitle"/>
</jsp:include>
<section id="matchEnroll">

	<div id='container'>
		<div id="home">
		
			<div class='emblem'>
				<c:if test="${homeEmblemArr ne null}"><img style="width: 120px; height: 120px; border-radius: 80px;" src="${path}/resources/upload/team-logo/${homeEmblemArr}"/></c:if>
				<c:if test="${homeEmblemArr eq null}"><img width="120px;" height="120px;" src="${path}/resources/upload/team-logo/기본팀로고.png"/></c:if>
			</div>
			
			<div id='hometeam'>${match['teamHome']}</div>
			
			<div class='score'>${match['homeScore']}</div>
			
			<div class='field'>
			
				<div id='homescroll'>
					<c:forEach var="list" items="${goalList}">
						<c:if test="${list['TEAMNAME'] eq match['teamHome']}"><div class='goal'>${list['GOALTIME']}'`&nbsp;&nbsp;'${list['MEMBERNAME']}</div></c:if>
					</c:forEach>
				</div>
				
			</div>
			
		</div>
		
		<div id="vs">
		
			<input style="visibility: hidden;" id="leftscore" type="number" name="homescore" min="0" max="100" required/>
			
			<div style="visibility: hidden;" id="inputOn">vs</div>
			
			<input style="visibility: hidden;" id="rightscore" type="number" name="awayscore" min="0" max="100" required/>
			
			
			<div id='placeinfo'>
			
				<p style="font-size: 21px;">${match['matchDate']}&nbsp;&nbsp;&nbsp;${match['matchTime']}</p>
				<p style="font-size: 21px;">${match['playGround']}</p>
				
			</div>
			
			<div id="point">
				득점
			</div>
			
		</div>
		
		<div id="away">
	
			<div class='emblem'>
				<c:if test="${awayEmblemArr ne null}"><img style="width: 120px; height: 120px; border-radius: 80px;" src="${path}/resources/upload/team-logo/${awayEmblemArr}"/></c:if>
				<c:if test="${awayEmblemArr eq null}"><img width="120px;" height="120px;" src="${path}/resources/upload/team-logo/기본팀로고.png"/></c:if>
			</div>
			
			<div id='awayteam'>${match['teamAway']}</div>
			
			<div class='score'>${match['awayScore']}</div>
			
			<div class='field'>
			
				<div id='awayscroll'>
					<c:forEach var="list" items="${goalList}">
						<c:if test="${list['TEAMNAME'] eq match['teamAway']}"><div class='goal'>${list['GOALTIME']}'`&nbsp;&nbsp;'${list['MEMBERNAME']}</div></c:if>
					</c:forEach>
				</div>
			
			</div>
			
		</div>
		<div id="ta">경기내용 상세입력</div>
		<textarea style="outline: none;" id="textarea" name="textarea" readonly>${matchContent}</textarea>
	</div>
	

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
