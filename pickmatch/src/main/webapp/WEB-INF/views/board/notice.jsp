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
		<div>공지사항</div>
	</div>

	<div id="main-container">
		
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
						<a href="${path}/board/noticeView.do?noticeNo=${b.noticeNo}">
							<li class="list_table_content">
								<div class="no">${b.noticeNo }</div>
								<div class="title">${b.noticeTitle }</div>
								<div class="nickname">${b.memberId }</div>
								<div class="date"><fmt:formatDate type="date" dateStyle="short" value="${b.noticeDate }"/></div>
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
			location.href = "${path}/board/noticeForm.do";
		}
	</script>



</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>