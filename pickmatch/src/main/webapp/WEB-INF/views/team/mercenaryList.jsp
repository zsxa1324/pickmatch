<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
	
	section#mercenaryList {
		height: 750px;
	}
	
	section#mercenaryList div#scroll1 {
		width: 90%;
		height: 350px;
		overflow: auto;
	}
	
	section#mercenaryList div#scroll2 {
		width: 90%;
		height: 200px;
		overflow: auto;
	}
	
	section#mercenaryList table.mercenary {
		text-align: center;
		margin-left: 50px;
		clear: both;
		line-height: 1.5;
	}
	
	section#mercenaryList table.mercenary thead th {
		padding: 10px;
		vertical-align: top;
		color: #369;
		border-bottom: 3px solid #036;
		background-color: #faf9f8;
	}
	
	section#mercenaryList table.mercenary thead th:nth-child(1),  section#mercenaryList table.mercenary thead th:nth-child(4){
		width: 70px;
	}
	
	section#mercenaryList table.mercenary thead th:nth-child(3),  section#mercenaryList table.mercenary thead th:nth-child(6){
		width: 110px;
	}
	
	section#mercenaryList table.mercenary thead th:nth-child(2) {
		width: 140px;
	}
	
	section#mercenaryList table.mercenary thead th:nth-child(7) {
		width: 120px;
	}
	
	section#mercenaryList table.mercenary thead th:nth-child(5) {
		width: 219px;
	}
	
	section#mercenaryList table.mercenary tbody th {
		width: 720;
		height: 255px;
	}
	
	section#mercenaryList table.mercenary tbody tr td:nth-child(1), section#mercenaryList table.mercenary tbody tr td:nth-child(4) {
		width: 70px;
		padding: 5px 0;
		border-bottom: 1px solid #e2e2e2;
	}
	
	section#mercenaryList table.mercenary tbody tr td:nth-child(3), section#mercenaryList table.mercenary tbody tr td:nth-child(6) {
		width: 110px;
		padding: 5px 0;
		border-bottom: 1px solid #e2e2e2;
	}
	
	section#mercenaryList table.mercenary tbody tr td:nth-child(2) {
		width: 140px;
		padding: 5px 0;
		border-bottom: 1px solid #e2e2e2;
	}
	
	section#mercenaryList table.mercenary tbody tr td:nth-child(5) {
		width: 230px;
		padding: 5px 0;
		border-bottom: 1px solid #e2e2e2;
		/* overflow: hidden; */
		text-overflow: ellipsis;
	}
	
	section#mercenaryList table.mercenary tbody tr:last-child {
		border-bottom: 3px solid #036;
	}

</style>





<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="" name="pageTitle"/>
</jsp:include>
<section id="mercenaryList">
	
	<div style="padding-left: 60px; margin: 40px 0 5px 50px; width: 837px; font-size: 22px; background-color: rgba(1, 16, 84, 0.6); color: white;">내 팀 용병관리</div>
	<div id='scroll1'>
		<table class='mercenary'>
			<thead>
				<tr>
					<th>NO</th>
					<th>이름(닉네임)</th>
					<th>POSITION</th>
					<th>성별</th>
					<th>소개</th>
					<th>번호</th>
					<th>비고</th>
				</tr>
			</thead>
			<c:if test="${empty mList}">
				<tbody>
					<tr>
						<th colspan="7"><h4>등록된 용병이 없습니다.</h4></th>
					</tr>
				</tbody>
			</c:if>
			<c:if test="${!empty mList}">
				<c:forEach var="map" items="${mList}" varStatus="vs">
					<tbody>
						<tr>
							<td>${vs.index + 1}</td>
							<td>${map['MEMBERNAME']}(${map['NICKNAME']})</td>
							<td>${map['POSITION']}</td>
							<td><c:if test="${map['GENDER'] eq 'M'}">남</c:if><c:if test="${map['GENDER'] eq 'F'}">여</c:if></td>
							<td>${map['INTRODUCE']}</td>
							<td>${map['PHONE']}</td>
							<td>
								<c:if test="${loggedMember['authority'] eq '팀장' || loggedMember['authority'] eq '매니저'}">
									<button style="padding: 5px 10px;" type="button" class="btn btn-outline-success" onclick="location.href='${path}/team/teamMercenarydelete?teamName=${loggedMember['teamName']}&memberId=${map['MEMBERID']}'">추방</button>
								</c:if>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div style="padding-left: 60px; margin: 40px 0 5px 50px; width: 837px; font-size: 22px; background-color: rgba(1, 16, 84, 0.6); color: white;">용병 신청 현황</div>
	<div id='scroll2'>
		<table class='mercenary'>
			<thead>
				<tr>
					<th>NO</th>
					<th>이름(닉네임)</th>
					<th>POSITION</th>
					<th>성별</th>
					<th>소개</th>
					<th>번호</th>
					<th>비고</th>
				</tr>
			</thead>
			<c:if test="${empty mrList}">
				<tbody>
					<tr>
						<th colspan="7"><h4>용병 신청현황이 없습니다.</h4></th>
					</tr>
				</tbody>
			</c:if>
			<c:if test="${!empty mrList}">
				<c:forEach var="map" items="${mrList}" varStatus="vs">
					<tbody>
						<tr>
							<td>${vs.index + 1}</td>
							<td>${map['MEMBERNAME']}(${map['NICKNAME']})</td>
							<td>${map['POSITION']}</td>
							<td><c:if test="${map['GENDER'] eq 'M'}">남</c:if><c:if test="${map['GENDER'] eq 'F'}">여</c:if></td>
							<td>${map['INTRODUCE']}</td>
							<td>${map['PHONE']}</td>
							<td>
								<c:if test="${loggedMember['authority'] eq '팀장' || loggedMember['authority'] eq '매니저'}">
									<button style="padding: 5px 10px;" type="button" class="btn btn-outline-success" onclick="location.href='${path}/team/teamMercenaryYes?teamName=${loggedMember['teamName']}&memberId=${map['MEMBERID']}'">승인</button>
									<button style="padding: 5px 10px;" type="button" class="btn btn-outline-success" onclick="location.href='${path}/team/teamMercenaryNo?teamName=${loggedMember['teamName']}&memberId=${map['MEMBERID']}'">거절</button>
								</c:if>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</c:if>
		</table>
	</div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
