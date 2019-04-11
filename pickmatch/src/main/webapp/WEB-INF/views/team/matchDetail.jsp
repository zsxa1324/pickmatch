<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="" name="pageTitle"/>
</jsp:include>
<section id="matchDetail" style="width: 100%; height: 800px;">

	<div style="width: 830px; height: 780px; margin: 50px 100px; background-color: yellow;">
		<div id="home" style=" margin-top: 10px; text-align: center; float: left; display: inline-block;">
		
			<div style="width: 120px; height: 120px; background-color: gray; border-radius: 80px; margin: 10px 40px"></div>
			
			<div style="width: 200px; height: 40px; background-color: blue; border-radius: 5px;">무적축구단</div>
			
			<div style="width: 80px; height: 40px; background-color: white; border-radius: 5px; margin: 10px 60px">승</div>
			
			<div style="width: 200px; height: 320px; background-color: green; border-radius: 5px;">
			
				<p>13` 왕찬웅</p>
				<p>42` 왕찬웅</p>
				<p>78` 왕찬웅</p>
			
			</div>
			
		</div>
		
		<div id="vs" style=" margin: 60px 0 0 30px; text-align: center; display: inline-block;">
		
			<div style="font-size: 3em; width: 80px; vertical-align: middel; line-height: 120px; float: left; background-color: gray; border-radius: 80px; margin: 10px 40px">3</div>
			
			<div style="width: 40px; vertical-align: middle; line-height: 60px; background-color: white; border-radius: 5px; float: left; margin-top: 40px;">vs</div>
			
			<div style="vertical-align: middle; font-size: 3em; width: 80px; line-height: 120px; float: left; background-color: gray; border-radius: 80px; margin: 10px 40px">1</div>
			
			<div style="width: 200px; height: 60px; background-color: green; border-radius: 5px; margin-top: 200px; margin-left: 80px;">
			
				<p>2019-4-17(수) 15:00</p>
				<p>종합운동장</p>
				
				<button class="btn btn-primary" type="button" onclick="location.href='${path}/team/teamMatchEnroll'">결과입력</button>
				<button class="btn btn-primary" type="button" onclick="location.href='${path}/team/teamMatchEnroll'">결과수정</button>
			
			</div>
			
		</div>
		
		<div id="away" style=" margin-top: 10px; text-align: center; float: right; display: inline-block;">
	
			<div style="width: 120px; height: 120px; background-color: gray; border-radius: 80px; margin: 10px 40px"></div>
			
			<div style="width: 200px; height: 40px; background-color: blue; border-radius: 5px;">KH축구단</div>
			
			<div style="width: 80px; height: 40px; background-color: white; border-radius: 5px; margin: 10px 60px">패</div>
			
			<div style="width: 200px; height: 320px; background-color: green; border-radius: 5px;">
			
				<p>13` 왕찬웅</p>
				<p>42` 왕찬웅</p>
				<p>78` 왕찬웅</p>
			
			</div>
			
		</div>
		<p style=" margin-top: 260px; background-color: red;">경기내용 상세입력</p>
		<div style=" border-radius:8px; width: 830px; height: 140px; background-color: aqua; margin: 0"></div>	
	</div>
	
	

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
