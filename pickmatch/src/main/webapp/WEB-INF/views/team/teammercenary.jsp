<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>

	section#mercenaryList {
		height: 750px;
	}
	
	section#mercenaryList div#scroll1 {
		width: 90%;
		height: 350px;
		overflow: auto;
	}
	
	section#mercenaryList table.mercenary {
		text-align: center;
		margin-left: 150px;
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
	
	section#mercenaryList table.mercenary thead th:nth-child(1), section#mercenaryList table.mercenary thead th:nth-child(3), section#mercenaryList table.mercenary thead th:nth-child(5), section#mercenaryList table.mercenary thead th:nth-child(6), section#mercenaryList table.mercenary thead th:nth-child(8) {
		width: 75px;
	}
	
	section#mercenaryList table.mercenary thead th:nth-child(2), section#mercenaryList table.mercenary thead th:nth-child(4), section#mercenaryList table.mercenary thead th:nth-child(7) {
		width: 120px;
	}
	
	section#mercenaryList table.mercenary tbody th {
		width: 720;
		height: 255px;
	}
	
	section#mercenaryList table.mercenary tbody tr td:nth-child(1), section#mercenaryList table.mercenary tbody tr td:nth-child(3), section#mercenaryList table.mercenary tbody tr td:nth-child(5), section#mercenaryList table.mercenary tbody tr td:nth-child(6), section#mercenaryList table.mercenary tbody tr td:nth-child(8) {
		width: 75px;
		padding: 5px 0;
		border-bottom: 1px solid #e2e2e2;
	}
	
	section#mercenaryList table.mercenary tbody tr td:nth-child(2), section#mercenaryList table.mercenary tbody tr td:nth-child(4), section#mercenaryList table.mercenary tbody tr td:nth-child(7) {
		width: 120px;
		padding: 5px 0;
		border-bottom: 1px solid #e2e2e2;
	}
	
	
	section#mercenaryList table.mercenary tbody tr:last-child {
		border-bottom: 3px solid #036;
	}

</style>

<section id="mercenaryList">

	
	<h1 style="text-align: center;margin-top:50px; margin-bottom: 50px;">내 용병 팀정보</h1>
	
	<div id='scroll1'>
		<table class='mercenary'>
			<thead>
				<tr>
					<th>NO</th>
					<th>팀명</th>
					<th>팀 점수</th>
					<th>활동지역</th>
					<th>팀 유형</th>
					<th>유니폼</th>
					<th>팀 개설일</th>
					<th>비고</th>
				</tr>
			</thead>
			<c:if test="${empty mercenaryList}">
				<tbody>
					<tr>
						<th colspan="8"><h4>용병으로 가입된 팀이 없습니다.</h4></th>
					</tr>
				</tbody>
			</c:if>
			<c:forEach var="list" items="${mercenaryList}" varStatus="vs">
				<tr>
					<td>${vs.index + 1}</td>
					<td>${list['TEAMNAME']}</td>
					<td>${list['TEAMRATING']}</td>
					<td>${list['TEAMLOCATION']}</td>
					<td>${list['TEAMTYPE']}</td>
					<td>${list['TEAMCOLOR']}</td>
					<td>${list['OPENINGDATE']}</td>
					<td>
						<button style="padding: 5px 10px;" type="button" class="btn btn-outline-success" onclick="location.href='${path}/team/teamMercenarySelfdelete?teamName=${list['TEAMNAME']}&memberId=${list['MEMBERID']}'">탈퇴</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
</section>

	
	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>