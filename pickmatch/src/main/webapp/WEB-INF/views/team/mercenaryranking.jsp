<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_bootswatch.scss" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_variables.scss" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<form action="${path }/mercenary/search.do" method="post" onsubmit="return validate()">
 <div align="center" style="margin-bottom: 100px; margin-top: 50px;">
       &nbsp;<input class="form-control" type="text" id="searchkey" placeholder="닉네임, 팀명 입력" name="search" style="display:inline-block; width: 300px;">&nbsp;
       		 <button type="submit" id="searchbtn" name="searchbtn" class="btn btn-secondary" style="display:inline-block; width:100px;">검색</button>
</div>
</form>

<div align="center">
<c:forEach items="${top3 }" begin="0" end="2" var="r">
<div class="card" style="display: inline-block; margin-left: 20px; margin-right:20px; margin-bottom: 50px; ">
<h5>${r.rank}</h5> 
<div id="rankimg" style="margin-bottom: 20px;">
<c:if test="${r.profile==null }">
	<img src="https://data.ac-illust.com/data/thumbnails/78/7877e8c81ac0a942265a9b65a049b784_t.jpeg" class="img-circle" style="width:250px; height:200px;">
</c:if>
<c:if test="${r.profile!=null }">
  <img src="${path }/resources/upload/member-profile/${r.profile}" class="img-circle" style="width:250px; height:200px;">
 </c:if>
  </div>
  <h5 style="margin-bottom: 10px;">${r.memberId }</h5>
  <p style="height: 100px; width:250px;">${r.introduce }</p>
 
</div>

</c:forEach>
</div>
<h4 style="margin-bottom: 30px; text-align: center;">용병 랭킹</h4>

<div id="mercenaryranking-div" style="margin-bottom: 50px;">
	<table id="mercenaryranking-table"  class="table table-striped table-hover">
		<tr id="mercenaryranking-info">
			<th id="mercenaryranking-table-info-ranking">순위</th>
			<th id="mercenaryranking-table-info-membername">회원명</th>
			<th id="mercenaryranking-table-info-score">득점</th>
			<th id="mercenaryranking-table-info-teamname">팀명</th>
			<th id="mercenaryranking-table-info-introduce">소개</th>
		</tr>

		<c:if test="${!empty list}">
			<c:forEach items="${list }" var="b">
			<tr>
				<td id="mercenaryranking-table-info-ranking">${b.rank }</td>
				<td id="mercenaryranking-table-info-membername">${b.memberId}</td>
				<td id="mercenaryranking-table-info-score">${b.goalCount }</td>
				<td id="mercenaryranking-table-info-teamname">${b.teamName }</td>
				<td id="mercenaryranking-table-info-introduce">${b.introduce }</td>
			</tr>
			</c:forEach>
		</c:if>
	
	</table>
</div>	


<div>${pageBar }</div>


<style>

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
}





#mercenaryranking-table{
		color:black;
		width:800px;
		border-collapse: collapse;
		margin: auto;
	}

	
#mercenaryranking-table tr,td{
	/* text-align:center; */
	width:800px;
	height:20px;
 	/* border:1px solid black;  */
}

#mercenaryranking-table tr,th{
	text-align:center;
	width:800px;
	height:20px;
	/*  border:1px solid black;  */
}
#mercenaryranking-table-info-ranking{
	width:80px;
}
#mercenaryranking-table-info-membername{
	width:100px;
}
#mercenaryranking-table-info-score{
	width:100px;
}
#mercenaryranking-table-info-introduce{
	width:550px;
}
#mercenaryranking-table-info-teamname{
	width:200px;
}





</style>


<script>
	function validate(){
		
		var search=$("#searchkey").val().trim();
		if(search.length<1){
			alert("검색어를 입력하세요!");
			return false;
		}
		
	}
	
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>