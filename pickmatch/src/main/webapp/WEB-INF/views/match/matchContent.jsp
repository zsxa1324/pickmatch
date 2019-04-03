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
<title>Insert title here</title>
<style>
section#section-matchContent article#article-matchContent div.div-matchContent{
text-align:center;
border: 1px solid red;
width: 600px;
margin : 15px auto;

}
section#section-matchContent article#article-matchContent{
margin:auto;
text-align: center;
}
section#section-matchContent{
margin-top: 100px;
}
</style>
</head>
<body>
<script>
var listD = '<c:out value="${list[0]['MATCHDATE']}"/>';
var date = listD.substring(0,10);
$("#dateP").text(date);
</script>
<section id="section-matchContent">
<article id="article-matchContent">
<h1 id="dateP"></h1>
<c:forEach items="${list }" var="c">

<c:if test="${c['TEAMAWAY']!=null }">
<div class="div-matchContent" style="margin-bottom: 20px;">
<H5>${c['MATCHTIME'] }</H5>
<h1>${c['TEAMHOME'] } vs ${c['TEAMAWAY'] }</h1>
</div>
</c:if>
</c:forEach>


<c:forEach items="${list }" var="c">
<c:if test="${c['TEAMAWAY']==null}">
<div class="div-matchContent">
<H5>${c['MATCHTIME'] }</H5>
<h1>${c['TEAMHOME'] } vs</h1>
<button type="button">매치신청</button>
</div>
</c:if>
</c:forEach>
</article>
</section>
</body>
</html>