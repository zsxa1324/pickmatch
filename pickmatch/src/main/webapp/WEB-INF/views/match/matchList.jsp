<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>matchboard</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		$("#matchEnrollBtn").click(function(){
			location.href = "${path}/match/enrollForm";
		});
	});
	
</script>
</head>
<body>
	<button id="matchEnrollBtn">매치 등록</button>
</body>
</html>