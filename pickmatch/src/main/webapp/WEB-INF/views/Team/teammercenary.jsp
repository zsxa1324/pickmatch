<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<section id="myteammercenary">

	
	<h1 style="text-align: center;margin-top:50px; margin-bottom: 50px;">내 용병 팀정보</h1>
	
	
<div id="teammercenary-div">
	<table id="teammercenary-table" class="table table-striped table-hover">
		<tr id="teammercenary-table-info">
			<th id="teammercenary-table-info-ranking">순위</th>
			<th id="teammercenary-table-info-teamtitle">팀명</th>
			<th id="teammercenary-table-info-teamscore">팀 점수</th>
			<th id="teammercenary-table-info-teamloc">팀 소재지</th>
			<th id="teammercenary-table-info-teamintroduce">팀 정보</th>
		</tr>
		<tr>
			<td id="teammercenary-table-info-ranking">1</td>
			<td id="teammercenary-table-info-teamtitle">무적축구단</td>
			<td id="teammercenary-table-info-teamscore">1030</td>
			<td id="teammercenary-table-info-teamloc">경기도 안양시</td>
			<td id="teammercenary-table-info-teamintroduce">팀장 : 문장현 <br>경기유형 : 축구 <br> 팀원 : 20명</td>
		</tr>
		<tr>
			<td id="teammercenary-table-info-ranking">1</td>
			<td id="teammercenary-table-info-teamtitle">무적축구단</td>
			<td id="teammercenary-table-info-teamscore">1030</td>
			<td id="teammercenary-table-info-teamloc">경기도 안양시</td>
			<td id="teammercenary-table-info-teamintroduce">팀장 : 문장현 <br>경기유형 : 축구 <br> 팀원 : 20명</td>
		</tr>
		
	
	</table>
</div>	
	
	
	
</section>

	<style>
	
	#teammercenary-table{
		color:black;
		margin:auto;
		border-collapse: collapse;
	}
	#teammercenary-table{
		color:black;
		width:800px;
		
		border-collapse: collapse;
	}
	
	#teammercenary-table tr,td{
		text-align:center;
		width:800px;
		height:60px;
		/* border:1px solid black; */
	}
	
	#teammercenary-table tr,th{
		text-align:center;
		width:800px;
		height:30px;
		/* border:1px solid black; */
	}
	
	#teammercenary-table-info-ranking{
		width:100px;
	}
	
	#teammercenary-table-info-teamtitle{
		width:250px;
	}
	#teammercenary-table-info-teamscore{
		width:80px;
	}
	#teammercenary-table-info-teamloc{
		width:300px;
	}
	#teammercenary-table-info-teamintroduce{
		width:300px;
	}
	
	
	
	</style>
	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>