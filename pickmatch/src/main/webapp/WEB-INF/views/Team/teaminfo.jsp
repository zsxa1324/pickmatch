<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_bootswatch.scss" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_variables.scss" />
  
     <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>

<%-- <div id="main-content">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> -->
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">팀 정보 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">팀 매치정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">팀 자유게시판</a>
      </li>
      <li class="nav-item">
        <a class="nav-lin" href="#">팀 운영정보</a>
        <a class="nav-link" href="${path }/team/teamOperationInfo">팀 운영정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">팀 관리</a>
      </li>
    </ul>
  </div>
</nav>
	</div> --%>


<div id="myteam"  style="margin-top: 50px;">
<div id="team" style="margin-right: 20px;">
	<table id="team-info" >
	<tr id="team-info-img">
		<td><img src="https://image.fmkorea.com/files/attach/new/20180417/486616/41170129/1021006724/554449902566a4417eee09a4fdb7bd79.jpg"></td>
	</tr>
	<tr id="team-name">
		<td colspan="2">kh축구단 10승</td>
	</tr>
		<tr>
			<td id="team-location">지역 :안양</td>
			<td id="team-exercise">경기장 : 공설운동장</td>
		</tr>
		<tr>
			<td id="team-uh">팀유형</td>
			<td id="team-age">평균연령</td>
		</tr>
		<tr>
			<td id="team-style">축구유형</td>
			<td id="team-uniform">유니폼</td>
		</tr>
		<tr>
			<td id="team-membercount">팀원수</td>
			<td id="team-open">팀 개설일</td>
		</tr>
		<tr>
			<td id="team-introduce" colspan="2">팀소개</td>
		</tr>
	
	</table>
</div>	


<div id="member">

<h2 align="center" style="margin-top: 20px;">팀 멤버 정보</h2>
<div id="ex">
	<table id="member-info" class="table table-striped table-hover">
		<tr id="member-info-int">
			<th id="member-info-int-no">no</th>
			<th id="member-info-int-name">name</th>
			<th id="member-info-int-position">position</th>
			<th id="member-info-int-playcount">playcount</th>
			<th id="member-info-int-goalcount">goalcount</th>
			<th id="member-info-int-value">value</th>
			<th id="member-info-int-management">management</th>
		</tr>
		<tr>
			<td>1</td>
			<td>김동현</td>
			<td>st</td>
			<td>100</td>
			<td>90</td>
			<td>value</td>
			<td>매니저</td>
		</tr>
		<tr>
			<td>no</td>
			<td>name</td>
			<td>position</td>
			<td>playcount</td>
			<td>goalcount</td>
			<td>value</td>
			<td>management</td>
		</tr>
		<tr></tr>
		<tr></tr>
	
	
	</table>
	
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

<div id="team-application">
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
		border:1px solid black;
		display:block;
	
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