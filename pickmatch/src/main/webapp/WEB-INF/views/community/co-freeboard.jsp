<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>





<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
section {
	display: block;
	padding: 0;
	margin: 0;
}
#title-container > div{
	margin : 20px auto;
	text-align: center;
	font-size: 37px;
	font-weight: bold;
}
#main-container {
	width : 80%;
	margin: 0 auto 50px;
	min-height: 500px;
	font-size: 1.05em;
}
#main-top-info{
	/* padding : 0 0 10px 0; */
	overflow: hidden;	
}
#main-top-info > p{
	padding : 0 0 5px 0;
	margin : 0 0 7px 0;
	font-size : 15px;
}

.list_table_head {
	display : flex;
	overflow: hidden;
	text-align : center;
	color : white;
	font-weight: bold;
	line-height: 40px;
	background-color: #888;
}

.list_table_head > div, .list_table_content > div{
	display : flex;
	align-items: center;
}
.list_table_head > div:nth-of-type(1){flex: 1 1 0;}
.list_table_head > div:nth-of-type(2){flex: 8 1 0;}
.list_table_head > div:nth-of-type(3){flex: 2 1 0;}
.list_table_head > div:nth-of-type(4){flex: 2 1 0;}
.list_table_head > div:nth-of-type(5){flex: 1 1 0;}

.list_table_content{
	display : flex;
	overflow: hidden;
	text-align : center;
	line-height: 30px;
	background-color: white;
}
.list_table_content > div:nth-of-type(1){flex: 1 1 0;}
.list_table_content > div:nth-of-type(2){flex: 8 1 0;}
.list_table_content > div:nth-of-type(3){flex: 2 1 0;}
.list_table_content > div:nth-of-type(4){flex: 2 1 0;}
.list_table_content > div:nth-of-type(5){flex: 1 1 0;}


</style>
<section>
	<div id="title-container">
		<div>자유게시판</div>
	</div>

	<div id="main-container">
		<div id="main-top-info">
			<p>전체 ${totalList }건</p>
		</div>
		<div id="co-freeboard">
			<div class="table table-striped table-hover">
				<div class="list_table_head" id="co-freeboard">
					<div class="no">번호</div>
					<div class="title" id="co-freeboard-table-title">제목</div>
					<div class="nickname" id="co-freeboard-table-id">글쓴이</div>
					<div class="date" id="co-freeboard-table-date">작성일</div>
				</div>
				<ul>
					<c:forEach items="${list }" var="b" varStatus="vs">
						<a href="${path }/community/freeboardView.do?boardNo=${b.boardNo}">
							<li class="list_table_content">
								<div class="no">${b.boardNo }</div>
								<div class="title">${b.boardTitle }</div>
								<div class="nickname">${b.memberId }</div>
								<div class="date"><fmt:formatDate type="date" dateStyle="short" value="${b.boardDate }"/></div>
							</li>
						</a>
					</c:forEach>
				</ul>
			</div>


		</div>

		<div class="pagecontainer" style="margin-top: 50px;">${pageBar }
		</div>

		<c:if test="${loggedMember != null}">
			<div id="freeboard-write" align="right">
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-primary" onclick="fn_write();" />
			</div>
		</c:if>


	</div>

	<script>
		function fn_write() {
			location.href = "${path}/community/freeboardForm.do";
		}
	</script>



</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>