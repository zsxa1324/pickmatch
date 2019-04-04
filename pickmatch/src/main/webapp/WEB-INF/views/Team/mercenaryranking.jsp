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

 <div style="margin-left: 300px; margin-bottom: 100px; margin-top: 50px;">
	         &nbsp;<input class="form-control" type="text" id="searchkey" name="searchkey"  placeholder="용병검색" style="display:inline-block; width: 300px;">&nbsp;
	         <button type="submit" id="searchbtn1" name="searchbtn1" class="btn btn-secondary" style="display:inline-block; width:100px;">검색</button>
     </div>



<c:forEach begin="1" end="3" var="i">
<div class="card" style="display: inline-block; margin-left: 60px; margin-bottom: 50px;">
<h5>${i}</h5> 
<div id="rankimg" style="margin-bottom: 20px;">
  <img src="https://image.fmkorea.com/files/attach/new/20180417/486616/41170129/1021006724/554449902566a4417eee09a4fdb7bd79.jpg" class="img-circle" style="width:250px; height:200px;">
  </div>
  <h5 style="margin-bottom: 10px;">이름</h5>
  <p style="height: 100px; width:250px;">소개</p>
 
</div>
</c:forEach>

<h4 style="margin-bottom: 30px; text-align: center;">용병 랭킹</h4>

<div id="mercenaryranking-div" style="margin-bottom: 50px;">
	<table id="mercenaryranking-table"  class="table table-striped table-hover">
		<tr id="mercenaryranking-info">
			<th id="mercenaryranking-table-info-ranking">순위</th>
			<th id="mercenaryranking-table-info-membername">회원명</th>
			<th id="mercenaryranking-table-info-score">득점</th>
			<th id="mercenaryranking-table-info-introduce">소개</th>
		</tr>
		<tr>
			<td id="mercenaryranking-table-info-ranking">1</td>
			<td id="mercenaryranking-table-info-membername">문장현</td>
			<td id="mercenaryranking-table-info-score">53</td>
			<td id="mercenaryranking-table-info-introduce">안녕하세요 1등입니다~!~!~!!!~!!</td>
		</tr>
		<tr>
			<td id="mercenaryranking-table-info-ranking">1</td>
			<td id="mercenaryranking-table-info-membername">문장현</td>
			<td id="mercenaryranking-table-info-score">53</td>
			<td id="mercenaryranking-table-info-introduce">안녕하세요 1등입니다~!~!~!!!~!!</td>
		</tr>
		
	
	</table>
</div>	





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





</style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>