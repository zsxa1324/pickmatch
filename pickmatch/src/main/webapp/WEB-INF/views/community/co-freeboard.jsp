<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<br><br>
<div>
	<h1 style="text-align: center;">자유게시판</h1>
</div>
<br><br>

<div id="co-freeboard">
	<!-- <div class="list_table_head" class="table table-striped table-hover"> -->
	<table id="co-freeboard-table" class="table table-striped table-hover">
		<tr id="co-freeboard">
			<th id="co-freeboard-table-id">아이디</th>
			<th id="co-freeboard-table-title">제목</th>
			<th id="co-freeboard-table-date">날짜</th>
			
		</tr>
		<c:forEach items="${list }" var="b">
		<tr>
			<td id="co-freeboard-table-id">${b.memberId }</td>
			<td id="co-freeboard-table-title"><a href="${path}/community/freeboardView.do?boardNo=${b.boardNo}">${b.boardTitle }</a></td>
			<td id="co-freeboard-table-date">${b.boardDate }</td>
		</tr>
		</c:forEach>
		<!-- <tr>
			<td id="team-freeboard-table-id">아이디</td>
			<td id="team-freeboard-table-title">제목</td>
			<td id="team-freeboard-table-date">날짜</td>
		</tr> -->
	
	</table>
	
</div>	

<div class="pagecontainer" style="margin-top: 50px;">
     	${pageBar }
</div>

<c:if test="${loggedMember != null}">
	<div id="freeboard-write" align="right" style="margin-right: 200px; margin-top: 30px;">
		<input type="button" value="글쓰기" id="btn-add" class="btn btn-primary" onclick="fn_write();"/>
	</div>
</c:if>

<script>
	function fn_write(){
		location.href="${path}/community/freeboardForm.do";
	}
</script>

<style>
	#co-freeboard-table{
		color:black;
		width:800px;
		border-collapse: collapse;
		margin: auto;
	}
	#co-freeboard-table tr,td{
		text-align:left;
		width:800px;
		height:20px;
		
	}
	
	#co-freeboard-table tr,th{
		text-align:center;
		width:800px;
		height:20px;
	
	}
	#co-freeboard-table-id{
		
		width:150px;
	
	}
	#co-freeboard-table-title{
		
		width:450px;

	}
	#co-freeboard-table-date{
		
		width:200px;
	}

</style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>