<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_bootswatch.scss" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_variables.scss" />
  
     <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>

<div id="myteam"  style="margin-top: 50px; margin-bottom: 300px;">
<div id="team" style="margin-right: 20px;">
	<table id="team-info" >
	<tr id="team-info-img">
	<c:if test="${empty list[0].teamEmblem }">
		<td colspan="2"><img src="${path }/resources/upload/team-logo/기본팀로고.png" style="width:400px;height:300px;"> </td>
	</c:if>
	<c:if test="${!empty list[0].teamEmblem }">
		<td colspan="2"><img src="${path }/resources/upload/team-logo/${list[0].teamEmblem}"  style="width:400px;height:300px;"> </td>
	</c:if>
	</tr>
	<tr id="team-name">
		<td colspan="2">${list[0].teamName }</td>
	</tr>
		<tr>
			<td id="team-location">지역 :${list[0].teamLocation }</td>
			<td id="team-exercise">경기장 : ${list[0].teamField }</td>
		</tr>
		<tr>
			<td id="team-uh">팀유형 : ${list[0].teamType }</td>
			<td id="team-uniform">유니폼: ${list[0].teamColor }</td>
		</tr>
		<tr>
			<td id="team-membercount">팀원수 : ${memberCount }</td>
			<td id="team-open">팀 개설일 : ${list[0].openingDate }</td>
		</tr>
		<tr>
			<td id="team-introduce" colspan="2">팀소개 : ${list[0].teamContent }</td>
		</tr>
	
	</table>
</div>	


<div id="member">

<h2 align="center" style="margin-top: 20px;">팀 멤버 정보</h2>
<div id="ex">
<div id="team-member" style="overflow-y:scroll; width:600px; height:400px;">
	<table id="member-info" class="table table-striped table-hover">
		<tr id="member-info-int">
			<th id="member-info-int-no">no</th>
			<th id="member-info-int-name">name</th>
			<th id="member-info-int-position">position</th>
			<th id="member-info-int-goalcount">goalcount</th>
			<th id="member-info-int-management">management</th>
			<th id="member-info-int-value">value</th>
		</tr>
		<c:forEach  items="${result }" var="i">
		<tr>
			<td>${i.no }</td>
			<td>${i.memberId }</td>
			<td>${i.position }</td>
			<td>${i.goalCount }</td>
			<td>${i.authority }</td>
			<td>버튼</td>
		</tr>
		</c:forEach>
	</table>
	</div>
<div id="match-container" align="center">
	<button class="btn btn-primary" onclick="matchenroll_btn()">매치등록</button>
	<button class="btn btn-primary" onclick="match_check()" style="margin-left: 60px;">매치검색</button>
</div>
<script>
	function matchenroll_btn(){
		location.href="${path}/match/enrollForm";
	}
	function match_check(){
		location.href="${path}/match/matchList.do"
	}
</script>
	
</div>
<br><br><br>

<h2 align="center">팀 가입 신청현황</h2>

<div id="team-application" style="overflow-y:scroll; width:600px; height:400px;">

	<table id="team-application-table" class="table table-striped table-hover">
		<tr>
			<th id="team-application-table-no">no</th>
			<th id="team-application-table-name">name</th>
			<th id="team-application-table-position">position</th>
			<th id="team-application-table-date">date</th>
			<th id="team-application-table-others">비고</th>
		</tr>
		<tr>
			<td>1</td>
			<td>강도원</td>
			<td>mf</td>
			<td>19/04/21</td>
			<td id="team-application-table-btn">
				<button id="member-join" class="btn btn-primary">가입</button>
				<button id="member-cancle" class="btn btn-primary">취소</button>
			</td>
		</tr>
		<tr>
			<td>1</td>
			<td>강도원</td>
			<td>mf</td>
			<td>19/04/21</td>
			<td id="team-application-table-btn">
				<button id="member-join" class="btn btn-primary">가입</button>
				<button id="member-cancle" class="btn btn-primary">취소</button>
			</td>
		</tr>
		<tr>
			<td>1</td>
			<td>강도원</td>
			<td>mf</td>
			<td>19/04/21</td>
			<td id="team-application-table-btn">
				<button id="member-join" class="btn btn-primary">가입</button>
				<button id="member-cancle" class="btn btn-primary">취소</button>
			</td>
		</tr>
		<tr>
			<td>1</td>
			<td>강도원</td>
			<td>mf</td>
			<td>19/04/21</td>
			<td id="team-application-table-btn">
				<button id="member-join" class="btn btn-primary">가입</button>
				<button id="member-cancle" class="btn btn-primary">취소</button>
			</td>
		</tr>
		<tr>
			<td>1</td>
			<td>강도원</td>
			<td>mf</td>
			<td>19/04/21</td>
			<td id="team-application-table-btn">
				<button id="member-join" class="btn btn-primary">가입</button>
				<button id="member-cancle" class="btn btn-primary">취소</button>
			</td>
		</tr>
	</table>

</div>
</div>




</div>
</section>


<style>
 	li{
	/* float: left; */
    width: 200px; height:8%;
    /* border-top: 1px solid #e7e7e7; */
	} 
	
		
	#team{
		color:black;
		width:400px;
		height:775px;
		/* border:1px solid black; */
		display:inline-block;
	
	}
	#team-info{
	
		color:black;
		width:400px;
		height:700px;
		border-collapse: collapse;
	}
	

	#team-info-img{
		
		color:black;
		width:200px; 
		height:300px;
		display:block;
		margin-bottom: 20px;
	
	}
	#team-name{
	
	text-align:center;
		width:200px;
		height:80px;
		border:1px solid black;
	}
	
 	#team-location{
		text-align:center;
		width:200px;
		height:60px;
		border:1px solid black;
	
	}
	#team-exercise{
		text-align:center;
		width:200px;
		height:60px;
		border:1px solid black;
	
	} 
		#team-uh{
		text-align:center;
		width:200px;
		height:60px;
		border:1px solid black;
	
	} 
		#team-age{
		text-align:center;
		width:200px;
		height:60px;
		border:1px solid black;
	
	} 
		#team-style{
		text-align:center;
		width:200px;
		height:60px;
		border:1px solid black;
	
	} 
		#team-uniform{
		text-align:center;
		width:200px;
		height:60px;
		border:1px solid black;
	
	}
		#team-membercount{
		text-align:center;
		width:200px;
		height:60px;
		border:1px solid black;
	
	} 
		#team-open{
		text-align:center;
		width:200px;
		height:60px;
		border:1px solid black;
	
	}  
		#team-introduce{
		text-align:center;
		width:200px;
		height:150px;
		border:1px solid black;
	
	} 
	
	#member{
		color:black;
		width:600px;
		height:775px;
		/* border:1px solid black; */
		display:inline-block;
		position: absolute;
	
	}
	#member-info-int-name{
		width:300px;
	}
	
	#member-info-int{
		text-align:center;
		height:30px;
		color:black;
		width:600px;
		border-collapse: collapse;
		
	}

	#member-info-int tr,th{
		text-align:center;
		width:200px;
		height:60px;
	
	}
	
	#member-info-int tr,td{
		text-align:center;
		width:200px;
		height:30px;
		
	}
	
	#membercollect{
	
		color:black;
		width:600px;
		border:1px solid black;
		display:block;
	
	}
	#team-application-table tr,th{
		text-align:center;
		width:200px;
		height:60px;
	
	}
	#team-application-table tr,td{
		text-align:center;
		width:200px;
		height:35px;
	}
	#member-join{
		width: 70px;
		height:30px;
		

	}
	#member-cancle{
		width: 70px;
		height:30px;
	}
	#team-application-table-btn{
		width:400px;
	}



	
</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>