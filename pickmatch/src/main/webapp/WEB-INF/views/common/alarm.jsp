<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="alarm-container">
	<table id="alarm-table" class="table table-striped table-hover">
		<tr id="alarm-table-th">
			<th id="alarm-table-type">알림유형</th>
			<th id="alarm-table-no">No</th>
			<th id="alarm-table-content">알림내용</th>
			<th id="alarm-table-date">시간</th>
			
		</tr>
		<%-- <c:forEach items="${list }" var="b">
		<tr>
			<td id="team-freeboard-table-id">${b.memberId }</td>
			<td id="team-freeboard-table-title"><a href="${path}/team/teamView.do?boardNo=${b.boardNo}">${b.boardTitle }</a></td>
			<td id="team-freeboard-table-date">${b.boardDate }</td>
		</tr>
		</c:forEach> --%>
		<c:forEach  items="${list }" var="i" varStatus="vs">
		<tr>
			<td>${i.messageType }</td>
			<td>${vs.count }</td>
			<td>${i.messageContent }</td>
			<td>${i.time }</td>
		</tr>
		</c:forEach>
	
	</table>
</div>	
	    