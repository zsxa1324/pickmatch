<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>
<style>
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}
.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
#tabcontent {
	display: block;
	padding: 6px 12px;
	border: 1px solid #EAEAEA;
}
a{
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
a:visited { 
	color: black; 
	text-decoration: none;
	
	}


li {
	float: left;
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
}

</style>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script>
	$(function() {
		// tab operation
		$('.tabmenu').click(function(event) {
			var activeTab = $(this).attr('data-tab');
			var url=$(this).children('a').attr("href");
			console.log(url);
			$('li').css('background-color', 'white');
			$(this).css('background-color', '#EAEAEA');
			$.ajax({
				type : 'GET',                 //get방식으로 통신
				url : "${path}/"+url ,    //탭의 data-tab속성의 값으로 된 html파일로 통신
				dataType : "html",            //html형식으로 값 읽기
				error : function() {          //통신 실패시
					alert('통신실패!');
				},
				success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
					$('#tabcontent').html(data);
				}
			});
		});
		$('#default').click();          
	});
	</script>

	<section>
		<article>
				<div id="container">
		<ul class="tab">
			<li data-tab="tab1" class="tabmenu" id="default"><a href="/admin/memberList.do">회원 정보</a></li>
			<li data-tab="tab2" class="tabmenu" ><a href="/admin/teamList.do">팀 정보</a></li>
		</ul>
		<div id="tabcontent"></div>
	</div>
		</article>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
