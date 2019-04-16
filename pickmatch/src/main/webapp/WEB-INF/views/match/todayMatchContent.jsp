<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Cute+Font"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css'
	rel='stylesheet' type='text/css'>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE htm>
<html>
<head>
<style>
div.div-matchContent {
	text-align: center;
	border: 1px solid rgba(0, 0, 0, 0.1);
	width: 900px;
	margin: 15px auto;
	padding-bottom: 15px;
}

div.div-matchContent2 {
	text-align: center;
	border: 1px solid rgba(0, 0, 0, 0.1);
	width: 900px;
	height: 140px;
	margin: 15px auto;
}

article#article-matchContent {
	margin: 0 auto;
	text-align: center;
}

section#section-matchContent {
	margin-top: 100px;
}

div.div-away, div.div-home {
	display: inline-block;
}

.div-matchButton button {
	display: block;
	margin: 0 auto;
}

@font-face {
	font-family: 'BenchNine';
	src: url('https://fonts.googleapis.com/css?family=BenchNine:700');
}

button.snip1535 {
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

div.div-vs {
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

div.div-vsWrapper {
	display: inline-block;
	width: 300px;
}

div.div-playGround {
	padding-top: 9px;
}

div.div-homeTwo {
	display: inline-block;
	position: relative;
	right: 180px;
}

div.match_list_team, div.match_list_date {
	display: inline-block;
}

.match_list_team, .match_list_date, .match_list_info, .match_list_txt,
	.match_list_btn {
	margin-right: 15px;
	margin-top: 15px;
}

div.logodiv {
	display: inline-block;
	overflow: hidden;
	border-radius: 100px;
}

.div-home, .div-away {
	font-weight: bold;
	font-size: 24px;
}

.div-vsWrapper {
	font-weight: bold;
	font-size: 25px;
}
#remo{
font-size:19px;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<div class="section-div" style="background-color: white;">
		<h2>오늘의 매치</h2>
		<c:forEach items="${list }" var="c">

			<c:if test="${c['TEAMAWAY']!=null }">
				<div class="div-matchContent">
					<div class="div-matchTime">
						<H5>${c['MATCHTIME'] }</H5>
					</div>
					<div class="div-matchVersus">

						<%-- <div class="logodiv">
							<c:choose>
								<c:when test="${c['HOMEEMBLEM']!=null }">
									<img alt="" src=" ${path }/resources/upload/team-logo/${c['HOMEEMBLEM'] }" width="150px;" height="150px;">
								</c:when>
								
								<c:when test="${c['HOMEEMBLEM']==null }">
								<img alt="" src=" ${path }/resources/upload/team-logo/기본팀로고.png" width="110px;" height="110px;">
								</c:when>
							</c:choose>
							</div> --%>

						<div class="div-home" style="width: 290px;">
							<input type="hidden" value="${c['TEAMHOME'] }" id="matchHome" />
							<c:choose>
								<c:when test="${c['HOMEEMBLEM']!=null }">
									<img alt=""
										src=" ${path }/resources/upload/team-logo/${c['HOMEEMBLEM'] }"
										width="150px;" height="150px;">
								</c:when>

								<c:when test="${c['HOMEEMBLEM']==null }">
									<img alt=""
										src=" ${path }/resources/upload/team-logo/기본팀로고.png"
										width="110px;" height="110px;">
								</c:when>
							</c:choose>
							${c['TEAMHOME'] }

						</div>

						<div class="div-vsWrapper">

							<c:if test="${c['HOMESCORE']!=null }">${c['HOMESCORE'] }</c:if>
							<div class="div-vs">vs</div>
							<c:if test="${c['AWAYSCORE']!=null }">${c['AWAYSCORE'] }</c:if>

						</div>
						<div class="div-away" style="width: 290px;">
							<input type="hidden" value="${c['TEAMAWAY'] }" id="matchAway" />
							${c['TEAMAWAY'] }
							<c:choose>

								<c:when test="${c['AWAYEMBLEM']!=null }">
									<img alt=""
										src="${path }/resources/upload/team-logo/${c['AWAYEMBLEM']}"
										width="150px;" height="150px;">
								</c:when>
								<c:when test="${c['AWAYEMBLEM']==null }">
									<img alt="" src="${path }/resources/upload/team-logo/기본팀로고.png"
										width="110px;" height="110px;">

								</c:when>
							</c:choose>
						</div>
						<!-- <div class="logodiv">
								<c:choose>
								
								<c:when test="${c['AWAYEMBLEM']!=null }">
								<img alt="" src="${path }/resources/upload/team-logo/${c['AWAYEMBLEM']}" width="150px;" height="150px;">
								</c:when>
								<c:when test="${c['AWAYEMBLEM']==null }">
								<img alt="" src="${path }/resources/upload/team-logo/기본팀로고.png" width="110px;" height="110px;">
								
								</c:when>
								</c:choose>
								
								
								</div> -->
						<div class="div-playGround" style="padding-bottom: 15px;">${c['PLAYGROUND'] }</div>
						<div class="infoMatch">
							<button class="btn btn-primary" value="${c['MATCHNO'] }"
								onclick="matchSa()">상세보기</button>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<script>
		function matchInfo() {
			var matchNo = event.target.value;
			console.log(matchNo);
			location.href = "${path}/match/matchInfo?matchNo=" + matchNo;
		}
		function matchSa() {
			var matchNo = event.target.value;
			var matchHome = $(event.target).parent().prevAll(".div-home")
					.children('input[type=hidden]').val();
			var matchAway = $(event.target).parent().prevAll(".div-away")
					.children('input[type=hidden]').val();
			console.log(matchNo);
			console.log(matchHome);
			console.log(matchAway);
			location.href = "${path}/match/matchSa.do?matchNo=" + matchNo
					+ "&&matchHome=" + matchHome + "&&matchAway=" + matchAway;

		}
	</script>
</body>
</html>