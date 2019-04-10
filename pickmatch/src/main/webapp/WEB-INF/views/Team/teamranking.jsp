<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<section id="teamranking-container">

<form action="${path }/team/search.do" method="post" onsubmit="return validate()">
 <div align="center" style=" margin-bottom: 100px; margin-top: 50px;">
       &nbsp;<input class="form-control" type="text" id="searchkey" placeholder="팀검색" name="search" style="display:inline-block; width: 300px;">&nbsp;
       		 <button type="submit" id="searchbtn" name="searchbtn" class="btn btn-secondary" style="display:inline-block; width:100px;">검색</button>
</div>
</form>

	
	
	
<div id="teamranking-div" style="margin-bottom: 50px;">
	<table id="teamranking-table"  class="table table-striped table-hover">
		<tr id="teamranking-table-info">
			<th id="teamranking-table-info-ranking">순위</th>
			<th id="teamranking-table-info-teamtitle">팀명</th>
			<th id="teamranking-table-info-teamscore">팀 점수</th>
			<th id="teamranking-table-info-total">전적</th>
			<th id="teamranking-table-info-teamloc">팀 소재지</th>
			<th id="teamranking-table-info-teaminfo">팀 정보</th>
		</tr>
		<c:forEach items="${list }" var="b">
		<tr>
			<td id="teamranking-table-info-ranking">${b.rank }</td>
			<td id="teamranking-table-info-teamtitle">${b.teamName }</td>
			<td id="teamranking-table-info-teamscore">${b.teamRating }</td>
			<td id="teamranking-table-info-total">${b.teamField }</td>
			<td id="teamranking-table-info-teamloc">${b.teamLocation }</td>
			<td id="teamranking-table-info-teaminfo">${b.teamContent }</td>
		</tr>
		</c:forEach>
		
	
	</table>
</div>	

<div class="pagecontainer" style="margin-top: 20px;">
     	${pageBar }
</div>
	
</section>

	<style>
	
	#teamranking-table{
		color:black;
		width:800px;
		border-collapse: collapse;
		margin: auto;
	}

	
	#teamranking-table tr,td{
		text-align:center;
		width:800px;
		height:20px;
	/* 	border:1px solid black; */
	}
	
	#teamranking-table tr,th{
		text-align:center;
		width:800px;
		height:20px;
		/* border:1px solid black; */
	}
	#teamranking-table-info-ranking{
		width:50px;
	}
	#teamranking-table-info-teamtitle{
		width:100px;
	}
	#teamranking-table-info-teamscore{
		width:100px;
	}
	#teamranking-table-info-total{
		width:100px;
	}
	#teamranking-table-info-teamloc{
		width:100px;
	}
	#teamranking-table-info-teaminfo{
		width:200px;
	}
	
	
	
	
	</style>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>