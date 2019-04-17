<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono"
	rel="stylesheet">

<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
div.main_contents {
	background-color: white;
	margin: 0 0 70px 0;
	min-height: 500px;
	font-size: 1.05em;
	padding-top: 30px;
}

div.match_info_view {
	overflow: hidden;
}

div.lt {
	/* float:left; */
	width: 61%;
	margin: 0 auto;
}

div.vs_box {
	height: 360px;
}

div.vs_info ul li {
	background-size: 42px;
	border: 1px solid #e7e7e7;
	margin-top: -1px;
	color: #4c4c4c;
	font-size: 15px;
	padding: 20px 25px 20px 77px;
	list-style: none;
}
/* li.list01{
background: url('${path }/resources/images/mapIcon.jpg');
} */
div.icondiv {
	display: inline-block;
	border-radius: 50px;
	background-color: black;
	padding: 10px 10px;
	text-align: center;
}

ul.vs_info li {
	border: 1px solid #e7e7e7;
	margin-top: -1px;
	color: #4c4c4c;
	font-size: 20px;
	padding: 10px 25px 20px 17px;
	font-weight: bold;
}

ul.vs_info li span {
	display: inline-block;
	/* position: relative;
bottom: 15px; */
	padding-left: 13px;
}

div.vs_box {
	background: url("${path}/resources/images/soccer.jpeg");
}

div.team_wrap dt, div.team_wrap dd {
	color: white;
}

div.team_wrap dd {
	background-color: #ffffff;
	background-color: rgba(255, 255, 255, 0.5);
}

p.vs {
	float: left;
	margin: 40px 0 0 5%;
	text-align: center;
	background: #eb3b04;
	color: #fff;
	border-radius: 50px;
	font-size: 18px;
	font-weight: bold;
	width: 50px;
	height: 50px;
	font-family: 'Roboto Mono', monospace;
	padding: 10px;
}
.imimgdiv{
display: inline-block; 
overflow: hidden; 
border-radius: 50px;
}
</style>
<script>
	var matchDate = "${matchDate}";
	var matchTime = "${m.matchTime}";
	var date = new Date(matchDate);
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();

	var data = "날짜 : " + year + "년 " + month + "월 " + day + "일 " + matchTime
			+ "시";

	$(function() {
		//var text=$(".list03").html(); 
		$(".lilist03").html(data);

	});
</script>
<section>
	<article>
		<div class="main_contents">
			<div class="match_info_view">
				<div class="lt">
					<div class="vs_box">
						<div class="team_wrap"
							style="padding: 60px 30px; overflow: hidden;">
							<dl style="float: left; width: 40%; text-align: center;">
								<div class="imimgdiv">
								<c:choose>
								<c:when test="${m.homeEmblem!=null }">
								<img src="${path }/resources/upload/team-logo/${m.homeEmblem}" width="120px;" height="120px;">
								</c:when>
								<c:when test="${m.homeEmblem==null }">
								<img src="${path }/resources/upload/team-logo/기본팀로고.png" width="120px;" height="120px;">
								</c:when>
								</c:choose>
								</div>
								<dt
									style="font-size: 17px; font-weight: bold; padding: 12px 0 7px 0;">${m.teamHome }</dt>
								<dd
									style="height: 35px; margin-left: 1px; line-height: 35px; border-radius: 50px;">${m.totalPlayCount }전
									${m.win}승 ${m.draw}무 ${m.lose}패</dd>
							</dl>
							<p class="vs">VS</p>
							<dl style="float: right; width: 40%; text-align: center;">
								<div class="imimgdiv">
								<c:choose>
								<c:when test="${sm.awayEmblem!=null }">
								<img src="${path }/resources/upload/team-logo/${sm.awayEmblem}" width="120px;" height="120px;"/>
								</c:when>
								<c:when test="${sm.awayEmblem==null }">
								<img src="${path }/resources/upload/team-logo/기본팀로고.png" width="120px;" height="120px;"/>
								</c:when>
								</c:choose>
								</div>
								<dt
									style="font-size: 17px; font-weight: bold; padding: 12px 0 7px 0;">${sm.teamAway }</dt>
								<dd
									style="height: 35px; margin-left: 1px; line-height: 35px; border-radius: 50px;">${sm.totalPlayCount }전
									${sm.win}승 ${sm.draw}무 ${sm.lose}패</dd>
							</dl>
						</div>
					</div>
					<ul class="vs_info" style="list-style-type: none;">
						<li class="list01"><div class="icondiv">
								<img src="${path }/resources/images/mapIcon.png" width="50px;"
									height="50px;">
							</div>
							<span class="lilist01">지역 : ${m.location }</span></li>
						<li class="list02"><div class="icondiv">
								<img src="${path }/resources/images/soccerIcon.png"
									width="50px;" height="50px;">
							</div>
							<span class="lilist02">구장 : ${m.playGround }</span></li>
						<li class="list03"><div class="icondiv">
								<img src="${path }/resources/images/calendar.jpg" width="50px;"
									height="50px;" />
							</div>
							<span class="lilist03"></span></li>
						<li class="list04"><div class="icondiv">
								<img src="${path }/resources/images/money.jpg" width="50px;"
									height="50px;">
							</div>
							<span class="lilist04">비용 : ${m.cost }</span></li>
						<li class="list05"><div class="icondiv">
								<img src="${path }/resources/images/human.png" width="50px;"
									height="50px;">
							</div>
							<span class="lilist05">개설자 : ${m.jobgrade }</span></li>
						<li class="list06"><div class="icondiv">
								<img src="${path }/resources/images/soccerBall.jpg"
									width="50px;" height="50px;" />
							</div>
							<span class="lilist06">경기유형 : ${m.matchType }</span></li>
						<li class="list06"><div class="icondiv">
								<img src="${path }/resources/images/spbubble.png" width="50px;"
									height="50px;">
							</div>
							<span class="lilist07">${m.matchContent }</span></li>
					</ul>
				</div>
			</div>
			<div class="bbs_area_view" style="padding:30px 50 40px 0; border-top:0 solid #ddd; overflow: hidden;">
				<div class="fr" style="float: right;">
					<a style="text-decoration: none;" href="${path }/match/matchList.do"><div style="display: inline-block; zoom:1; text-align: center; border: 1px solid black; background-color: white; color: black; padding:0 25px; min-width: 35px; line-height: 35px; margin:0 1px; cursor: pointer;" class="bbs_btn02">목록으로</div></a>
				</div>
			</div>
			<h1></h1>
		</div>
	</article>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
