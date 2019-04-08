<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Indie+Flower"
	rel="stylesheet">
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
	border: 1px solid rgba(0, 0, 0, 0.1); width : 600px;
	height: 210px;
	margin: 15px auto;
	width: 600px;
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

section#section-matchContent article#article-matchContent div.div-matchVersus
	{
	padding-top: 25px;
	height: 130px;
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
	width: 100px;
	height: 100px;
}

section#section-matchContent article#article-matchContent div.div-playGround
	{
	padding-top: 9px;
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
								<img alt="" src="${c['HOMEEMBLEM'] }"> ${c['TEAMHOME'] }
							</div>
							<div class="div-vsWrapper">
								<c:if test="${c['HOMESCORE']!=null }">${c['HOMESCORE'] }</c:if>
								<div class="div-vs">vs</div>
								<c:if test="${c['AWAYSCORE']!=null }">${c['AWAYSCORE'] }</c:if>
							</div>
							<div class="div-away">
								<img alt="" src="${c['AWAYEMBLEM'] }">${c['TEAMAWAY'] }</div>
							<div class="div-playGround">${c['PLAYGROUND'] }</div>
						</div>
						<%-- <div class="div-matchButton">
							<button class="snip1535 detailBtn" type="button"
								onclick="detailMatch()" value="${c['MATCHNO'] }">상세보기</button>
						</div> --%>
					</div>
				</c:if>
			</c:forEach>


			<c:forEach items="${list }" var="c">
				<c:if test="${c['TEAMAWAY']==null}">
					<div class="div-matchContent">
						<div class="div-matchTime">
							<H5>${c['MATCHTIME'] }경기번호:${c['MATCHNO'] }</H5>

						</div>
						<div>
							<div class="div-matchVersus">
								<div class="div-home">
									<img alt="" src="${c['HOMEEMBLEM'] }" width="50px"
										height="30px">${c['TEAMHOME'] }</div>
								<div class="div-vsWrapper">
									<div class="div-vs">vs</div>
								</div>
								&nbsp;&nbsp;
								<div class="div-playGround">${c['PLAYGROUND'] }</div>
							</div>
							<div class="div-matchButton">
								<button class="snip1535 detailBtn" onclick="detailMatch()"
									value="${c['TEAMHOME'] }" type="button">매치신청</button>
									<input type="hidden" id="hiddenMatchNo" value="${c['MATCHNO'] }"/>
									<input type="hidden" id="hiddenMatchTeam" value="${loggedMember.memberId }"/>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</article>
	</section>
	<script>
		function detailMatch() {
			/* var a = event.target.value; */
			var a = $("#hiddenMatchTeam").val();
			var b = $("#hiddenMatchNo").val();
			location.href="${path}/match.matchRequest?team="+a+'&&no='+b;
		}
	</script>
</body>
</html>