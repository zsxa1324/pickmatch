<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script>
var date=new Date();
var y=date.getFullYear();
var m=date.getMonth()+1;
if (m < 10) {
	m = "0" + m;
}
if (d<10){
	d="0"+d;
}
var d=date.getDate();
var today=y+"-"+m+"-"+d;
$(function(){
	    $.ajax({
		url:"${path}/match/matchIndexContent",
		dataType:"html",
		Type:"Post",
		data:{"today":today},
		success:function(data){
			$(".index-div").html(data);
		},
		error:function(){
			alert("gg");
		}
			
		
	});;  
})
</script>

<section style="height: 800px;" >
	<article class="index-article">
		<div class="index-div" style="background-color:white;">
		
		</div>
	</article>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



