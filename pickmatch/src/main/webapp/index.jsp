<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>    



	<a href="${pageContext.request.contextPath }/team.do">내팀정보</a>
	<a href="${pageContext.request.contextPath }/teammercenary.do">내팀용병정보</a>
	<a href="${pageContext.request.contextPath }/teamcreate.do">팀 생성</a>
	<a href="${pageContext.request.contextPath }/teamnotice.do">팀 공지사항</a>
	<a href="${pageContext.request.contextPath }/freeboard.do">팀 자유게시판</a>
	<a href="${pageContext.request.contextPath }/teamranking.do">팀 랭킹</a>
	<a href="${pageContext.request.contextPath }/mercenaryranking.do">용병랭킹</a>
	<a href="${pageContext.request.contextPath }/freeboardView.do">팀자유게시판 상세보기</a>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



