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
height:200px;
margin : 15px auto;
}
section#section-matchContent article#article-matchContent{
margin: 0 auto;
text-align: center;
}
section#section-matchContent{
margin-top: 100px;
}
section#section-matchContent article#article-matchContent div.div-away,section#section-matchContent article#article-matchContent div.div-home{
display: inline-block;
}
section#section-matchContent article#article-matchContent div.div-matchVersus{
height: 100px;
}
section#section-matchContent article#article-matchContent .div-matchButton button{
display: block;
margin: 0 auto;
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
<div class="div-matchContent">
<div class="div-matchTime">
<H5>${c['MATCHTIME'] }</H5>
</div>
<div class="div-matchVersus">
<div class="div-home">
${c['TEAMHOME'] }</div> vs <div class="div-away">${c['TEAMAWAY'] }</div>
</div>
</div>
</c:if>
</c:forEach>


<c:forEach items="${list }" var="c">
<c:if test="${c['TEAMAWAY']==null}">
<div class="div-matchContent">
<div class="div-matchTime">
<H5>${c['MATCHTIME'] }</H5>
</div>
<div>
<div class="div-matchVersus">
<div class="div-home">${c['TEAMHOME'] }</div> vs
</div>
<div class="div-matchButton">
<button type="button">상세보기</button>
<button type="button">매치신청</button>
</div>
</div>
</div>
</c:if>
</c:forEach>
</article>
</section>
</body>
</html>