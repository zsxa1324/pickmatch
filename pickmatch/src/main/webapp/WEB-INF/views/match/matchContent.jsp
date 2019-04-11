<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Indie+Flower" />
<link href="https://fonts.googleapis.com/css?family=Cute+Font" rel="stylesheet">	
<link href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
section#section-matchContent article#article-matchContent div.div-matchContent
	{
	text-align: center;
	border: 1px solid rgba(0, 0, 0, 0.1);
	width: 900px;
	margin: 15px auto;
	padding-bottom: 15px;
}
section#section-matchContent article#article-matchContent div.div-matchContent2
	{
	text-align: center;
	border: 1px solid rgba(0, 0, 0, 0.1);
	width: 900px;
	height: 140px;
	margin: 15px auto;
}

section#section-matchContent article#article-matchContent {
	margin: 0 auto;
	text-align: center;
}

section#section-matchContent {
	margin-top: 100px;
}

section#section-matchContent article#article-matchContent div.div-away,
	section#section-matchContent article#article-matchContent div.div-home
	{
	display: inline-block;
}

section#section-matchContent article#article-matchContent div.div-matchVersus{
	
}

section#section-matchContent article#article-matchContent .div-matchButton button
	{
	display: block;
	margin: 0 auto;
}

@font-face {
	font-family: 'BenchNine';
	src: url('https://fonts.googleapis.com/css?family=BenchNine:700');
}

section#section-matchContent article#article-matchContent button.snip1535
	{
	background-color: #5A8DF3;
	border: none;
	cursor: pointer;
	font-family: 'BenchNine', arial, sans-serif;
	font-size: 14px;
	line-height: 1em;
	outline: none;
	padding: 8px 20px 8px;
	position: relative;
	text-transform: uppercase;
	font-weight: 700;
}

.snip1535:before, .snip1535:after {
	border-color: transparent;
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
	border-style: solid;
	border-width: 0;
	content: "";
	height: 24px;
	position: absolute;
	width: 24px;
}

.snip1535:before {
	border-color: #5A8DF3;
	border-right-width: 2px;
	border-top-width: 2px;
	right: -5px;
	top: -5px;
}

.snip1535:after {
	border-bottom-width: 2px;
	border-color: #5A8DF3;
	border-left-width: 2px;
	bottom: -5px;
	left: -5px;
}

.snip1535:hover, .snip1535.hover {
	background-color: #c47135;
	cursor: pointer;
}

.snip1535:hover:before, .snip1535.hover:before, .snip1535:hover:after,
	.snip1535.hover:after {
	height: 100%;
	width: 100%;
}

 section#section-matchContent article#article-matchContent div.div-vs {
	color: white;
	background-color: black;
	font-family: IndieFlower;
	font-size: 30px;
	display: inline-block;
	border-radius: 30px;
	width: 50px;
	height: 50px;
	margin: 0 40px; 
	
}
 
section#section-matchContent article#article-matchContent div.div-vsWrapper
	{
	display: inline-block;
	width: 350px;
}

section#section-matchContent article#article-matchContent img {
	width: 50px;
	height: 50px;
}

section#section-matchContent article#article-matchContent div.div-playGround
	{
	padding-top: 9px;
}

section#section-matchContent article#article-matchContent div.div-homeTwo
	{
	display: inline-block;
	position: relative;
	right: 180px;
}

section#section-matchContent div.match_list_team, section#section-matchContent div.match_list_date
	{
	display: inline-block;
}

.match_list_team, .match_list_date, .match_list_info, .match_list_txt,
	.match_list_btn {
	margin-right: 15px;
	margin-top: 15px;
}


</style>
</head>
<body>
	<script>
		var listD = '<c:out value="${list[0]['MATCHDATE']}"/>';
		var date = listD.substring(0, 10);
		$("#dateP").text(date);
	</script>
	<section id="section-matchContent">
		<article id="article-matchContent">
			<h1 id="dateP"></h1>
			<c:forEach items="${list }" var="c">

				<c:if test="${c['TEAMAWAY']!=null }">
					 <div class="div-matchContent">
						<div class="div-matchTime">
							<H5>${c['MATCHTIME'] }</H5>
						</div>
						<div class="div-matchVersus">
							<div class="div-home">
							<input type="hidden" value="${c['TEAMHOME'] }" id="matchHome"/>
							
								<img alt="" src="${c['HOMEEMBLEM'] }"> ${c['TEAMHOME'] }
							</div>
							<div class="div-vsWrapper">
								<c:if test="${c['HOMESCORE']!=null }">${c['HOMESCORE'] }</c:if>
								<div class="div-vs">vs</div>
								<c:if test="${c['AWAYSCORE']!=null }">${c['AWAYSCORE'] }</c:if>
							</div>
							<div class="div-away">
							<input type="hidden" value="${c['TEAMAWAY'] }" id="matchAway"/>
							<img alt="" src="${c['AWAYEMBLEM'] }">${c['TEAMAWAY'] }</div>
							<div class="div-playGround" style="padding-bottom: 15px;">${c['PLAYGROUND'] }</div>
							<div class="infoMatch">
								<button class="btn btn-primary" value="${c['MATCHNO'] }" onclick="matchSa()">상세보기</button>
							</div>
						</div>
						<%-- <div class="div-matchButton">
							<button class="snip1535 detailBtn" type="button"
								onclick="detailMatch()" value="${c['MATCHNO'] }">상세보기</button>
						</div> --%>
					</div> 
					<%-- <div style="margin-bottom: 33px;">
					<div id="scoreboard">
						<div id="left-team">
							<img src="${path}/${c['HOMEEMBLEM']}" height="36">
							<div class="space"></div>
							<h1 class="team-name">${c['TEAMHOME'] }</h1>
						</div>
						<div id="middle-score">
							<h2 class="time"><time>${c['MATCHTIME'] }</time></h2>
							<h2 class="score">${c['HOMESCORE'] }</h2>
							<h3 class="seperator">-</h3>
							<h2 class="score">${c['AWAYSCORE'] }</h2>
							<h2 class="place"><span>${c['MATCHTYPE']}</span></h2>
						</div>
						<div id="right-team">
							<img src="${path }/${c['AWAYEMBLEM']}" height="36">
							<div class="space"></div>
							<h1 class="team-name">${c['TEAMAWAY']}</h1>
						</div>
					</div>
					</div> --%>
				</c:if>
			</c:forEach>

			<ul>
				<c:forEach items="${list }" var="c">
					<c:if test="${c['TEAMAWAY']==null}">
						<script>
							var listD = '<c:out value="${list[0]['MATCHDATE']}"/>';
							var date1 = listD.substring(0, 10);
							var fromDate = new Date(date1);
							var date = new Date(fromDate);
							console.log(date);
							var year = date.getFullYear();
							var month = date.getMonth() + 1;
							var day = date.getDate();
							var matchDay = year + "-" + month + "-" + day;
							console.log(matchDay);
							$(".wrap").html(
									"<strong>"+year + "년" + month + "월" + " " + day
											+ "일" + " " + "${c['MATCHTIME'] }"+"</strong>"
											+ "<br>" + " 매치요청합니다.");
						</script>
						<li>
							<div class="div-matchContent2">
								<div class="match_list_team"
									style="width: 20%; font-size: 20px; font-weight: bolder; float: left;">
									<img alt=""
										src="${path}/${c['HOMEEMBLEM']}">
									${c['TEAMHOME'] }
								</div>
								<div class="match_list_date" style="float: left;">
									<div class="wrap"></div>
								</div>
								<div class="match_list_info"
									style="display: inline-block; float: left;">
									<p>경기 유형 :<strong>${c['MATCHTYPE'] }</strong></p>
									<p>지역 : <strong>${c['LOCATION'] }</strong></p>
									<p>장소 : <strong>${c['PLAYGROUND'] }</strong></p>
								</div>
								<div class="match_list_txt"
									style="display: inline-block; float: left;">
									<p class="bold" style="display: inline-block;">남기는 한마디 :</p>
									<p style="display: inline-block;" class="msg">${c['MATCHCONTENT'] }</p>
								</div>

								<div class="div-matchButton"
									style="position: relative; top: 100px;">
									<button class="snip1535 detailBtn" data-target="#layerpop"
										data-toggle="modal" type="button" onclick="matchInfo()"
										value="${c['MATCHNO'] }">매치신청</button>
									<input type="hidden" id="hiddenMatchNo"
										value="${c['MATCHNO'] }" /> <input type="hidden"
										id="hiddenMatchTeam" value="${loggedMember.memberId }" />
										<input type="hidden" id="hiddenMatchTeam" value="${c['TEAMHOME'] }"/>
								</div>
							</div>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</article>
	</section>
	<script>
		/* function detailMatch() {
			var a = event.target.value;
			var a = $("#hiddenMatchTeam").val();
			var b = $("#hiddenMatchNo").val();
			var c = $("#matchMemo").val();
			location.href = "${path}/match.matchRequest?team=" + a + '&&no='
					+ b + '&&memo=' + c;
		} */

		function matchInfo() {
			var matchNo=event.target.value;
			console.log(matchNo);
			location.href = "${path}/match/matchInfo?matchNo="+matchNo;
		}
		function matchSa(){
			var matchNo=event.target.value;
			var matchHome=$(event.target).parent().prevAll(".div-home").children('input[type=hidden]').val();
			var matchAway=$(event.target).parent().prevAll(".div-away").children('input[type=hidden]').val();
			console.log(matchHome);
			console.log(matchAway);
			location.href = "${path}/match/matchSa.do?matchNo="+matchNo+"&&matchHome="+matchHome+"&&matchAway="+matchAway;
		
		}
	</script>
</body>
</html>