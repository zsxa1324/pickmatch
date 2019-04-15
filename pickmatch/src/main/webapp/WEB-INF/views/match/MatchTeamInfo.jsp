<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>
<style>
.snip1535 {
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
	background-color: #5A8DF3;
	cursor: pointer;
}

.snip1535:hover:before, .snip1535.hover:before, .snip1535:hover:after,
	.snip1535.hover:after {
	height: 100%;
	width: 100%;
}

section#matchTeamInfo-section td {
	width: 150px;
	height: 50px;
}

section#matchTeamInfo-section table tr td a:hover {
	text-decoration: underline;
	cursor: pointer;
}
</style>

<section id="matchTeamInfo-section">
	<article id="matchTeamInfo-article" style="background-color: white;">
		<div id="matchTeamInfo-div">
			<div class="MatchTeamInfoTitle" style="margin: 0 auto;">
				<h1>팀 정보</h1>
			</div>
			<div class="teamTbl-div"
				style="display: inline-block; margin-left: 15px; float: left;">
				<table border="1"
					style="text-align: center; width: 370px; height: 600px; table-layout: fixed;">

					<tr>
						<td colspan="2">
						<c:choose>
						<c:when test="${match.emblem !=null}">
						<img
							src="${path }/resources/upload/team-logo/${match.emblem }" width="150px;" height="150px;" />
						</c:when>
						
						<c:when test="${match.emblem == null }">
						<img src="${path }/resources/upload/team-logo/기본팀로고.png" width="150px;" height="150px;"/>
						</c:when>
						</c:choose>	
							</td>
					</tr>
					<tr>
						<td colspan="2">${match.teamHome}<input type="hidden"
							id="homeTeamName" value="${match.teamHome}" />
						</td>
					</tr>
					<tr>
						<td>지역 : ${match.location }</td>
						<td>활동구장 : ${match.playGround}</td>
					</tr>
					<tr>
						<td>팀유형 : ${match.matchType}</td>
						<td>평균연령 : ${match.teamType}</td>
					</tr>
					<tr>
						<td>경기유형 : ${match.matchType}</td>
						<td>유니폼 : ${match.uniform }</td>
					</tr>
					<tr>
						<td>팀원수 : ${match.teamCount }</td>
						<td>경기날짜 : ${match.matchDate} ${match.matchTime } <input
							type="hidden" id="hiddenMatchDate" value="${match.matchDate }" />
							<input type="hidden" id="hiddenMatchTime"
							value="${match.matchTime }" />
						</td>
					</tr>
					<tr>
						<td>팀소개 : ${match.introduce }</td>
						<td
							style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"><a
							style="color: black;" href="#" data-toggle="modal"
							data-target="#myModalTwo">내용 : ${match.matchContent }</a></td>
					</tr>

				</table>
			</div>
			<div class="membertbl-div"
				style="display: inline-block; float: left; margin-left: 60px; padding: 0px 0px 333px 0px;">
				<table class="table table-striped" style="width: 550px;">
					<tr>
						<th scope="col">No.</th>
						<th scope="col">Name</th>
						<th scope="col">position</th>
						<th scope="col">value</th>

					</tr>
					<c:forEach var="m" items="${member }" varStatus="vs">
						<tr>
							<th scope="row">${vs.count }</th>
							<td>${m['MEMBERNAME'] }</td>
							<td>${m['POSITION'] }</td>
							<td>${m['AUTHORITY'] }</td>
						</tr>
					</c:forEach>
				</table>
				<button type="button" class="snip1535" id="matchRequest"
					style="float: right;" onclick="textareabtn()">매치신청</button>
				<div class="modal fade" id="layerpop">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- header -->
							<div class="modal-header">
								<!-- 닫기(x) 버튼 -->
								<h4 class="modal-title">메모</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
								<!-- header title -->

							</div>
							<!-- body -->
							<div class="modal-body">
								<textarea class="form-control" id="memo"
									style="width: 100%; height: 150px; resize: none;"
									maxlength="500"></textarea>
							</div>
							<!-- Footer -->
							<div class="modal-footer">
								<button type="button" onclick="matchRequest()"
									class="btn btn-primary">매치신청</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="myModalTwo" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">매치 내용</h4>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>
							<div class="modal-body">
								<p>${match.matchContent }</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
							</div>
						</div>

					</div>
				</div>





			</div>
			<div class="matchResponse-div"
				style="width: 65%; margin: 0 auto; margin-top: 50px; padding: 530px 10px 10px 10px;">

				<table id="matchResponse-tbl" style="margin-top: 50px;"
					class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>신청팀</th>
							<th colspan="2">메모</th>
						</tr>
					</thead>
					<c:forEach var="mr" items="${matchResponse }" varStatus="vs">
						<tr>
							<td>${vs.count }</td>
							<td>${mr['TEAMNAME']}</td>
							<td>${mr['MEMO'] }</td>
							<td><c:if test="${match.teamHome==loggedMember.teamName}">
									<button type="button" onclick="matchOk()"
										value="${mr['MATCHNO'] }" class="btn btn-primary">매치수락</button>
								</c:if> <input type="hidden" id="awayTeamName"
								value="${mr['TEAMNAME']}" /></td>
						</tr>
					</c:forEach>


				</table>
			</div>
		</div>
	</article>
</section>
<script>
	function textareabtn() {
		var matchDate = $("#hiddenMatchDate").val();
		var matchTime = $("#hiddenMatchTime").val();
		var today = new Date();
		var y = today.getFullYear();
		var m = today.getMonth() + 1;
		var zero = 0;
		if (m < 10) {
			m = "0" + m;
		}

		var d = today.getDate();
		if (d < 10) {
			d = "0" + d;
		}
		var date = y + "-" + m + "-" + d;
		var flag = date > matchDate;
		var id = "${loggedMember.memberId }";
		var btn = $("#matchRequest");
		var teamName = "${loggedMember.teamName}";
		var away = $("#awayTeamName").val();

		/* data-target="#layerpop" data-toggle="modal" */
		if (id.length == 0) {
			alert("로그인을 하셔야 합니다.");
		} else if (id == teamName) {
			alert("같은 팀에게는 매치신청을 하실 수 없습니다.");
		} else if (teamName == away) {
			alert("이미 매치 신청하셨습니다.");
		} else if (date > matchDate) {
			alert("지난 매치는 신청하실 수 없습니다.");
		} else if (teamName.length == 0) {
			alert("팀이 없으면 매치 신청을 하실 수 없습니다.");
		} else {
			btn.attr("data-target", "#layerpop");
			btn.attr("data-toggle", "modal");
		}
		var memo = $("#memo");
		memo.val("");
		memo.focus();

	}

	function matchRequest() {
		var matchNo = ${match.matchNo};
		
		var id = "${loggedMember.memberId }";
		var teamName = "${loggedMember.teamName}";
		console.log(matchNo);
		console.log(id);
		console.log(teamName);
		var content = $("#memo").val();
		location.href = "${path}/match/matchRequest.do?matchNo=" + matchNo
				+ "&&id=" + id + "&&memo=" + content;
	}

	function matchOk() {
		var matchNo = event.target.value;
		var awayTeam = $("#awayTeamName").val();
		location.href = "${path}/match/matchOk.do?matchNo=" + matchNo
				+ "&&awayTeam=" + awayTeam;
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
