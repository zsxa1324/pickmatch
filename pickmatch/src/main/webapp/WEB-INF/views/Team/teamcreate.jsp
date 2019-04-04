<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_bootswatch.scss" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_variables.scss" />
 
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<section id="team-create-container">

<form style="margin-top: 20px;">
  <div class="form-group form-group-sm">
    <label for="teamname" style="display: inline-block; margin-right: 30px; margin-left: 20px;">팀명</label>
    <input type="text" class="form-control" id="teamname"  style="display: inline-block; width: 300px;">
  </div>
  <div class="form-group form-group-sm">
    <label for="stadium" style="margin-right: 30px; margin-left: 20px;">구장</label>
    <input type="text" class="form-control" id="stadium" style="display: inline-block; width: 300px;">
  </div>
  <div id="ageavg">
  <label style="margin-right: 30px; margin-left: 20px; display: inline-block;">평균연령</label>
  	<select class="form-control" style="display: inline-block; width:150px;">
		 <option>10대</option>
		 <option>20대</option>
		 <option>30대</option>
		 <option>40대</option>
		 <option>50대</option>
		 <option>50대이상</option>
	</select>
  </div>
  
   <div id="tempertype" style="margin-top:10px;">
  <label style="margin-right: 30px; margin-left: 20px; display: inline-block;">소속유형</label>
  	<select class="form-control" style="display: inline-block; width:150px;">
		 <option>청소년</option>
		 <option>대학생</option>
		 <option>직장인</option>
		 <option>백수</option>
	</select>
  </div>
  
  <div class="form-group"  style="margin-top:10px;">
  	<label for="activityloc" style="margin-right: 30px; margin-left: 20px;">활동지역</label>
  	<input type="text" class="form-control" id="activityloc" style="display: inline-block; width: 300px;">
  </div>
  
  <div class="form-group ">
    <label for="teamlogo" style="margin-right: 30px; margin-left: 20px;">팀로고</label>
    <input type="file" id="teamlogo">
   <!--  <p class="help-block">여기에 블록레벨 도움말 예제</p> -->
  </div>
  
  <div class="form-group ">
  	<label style="margin-right: 30px; margin-left: 20px;">팀 소개</label>
  	<textarea class="form-control" rows="3" style="width:300px; margin-right: 30px; margin-left: 20px;"></textarea>
  </div>
  
  <div id="btn-container">
  <button type="submit" class="btn btn-primary">팀 생성</button>
  <button type="submit" class="btn btn-primary" style="margin-left: 100px;">취소</button>
  </div>
  
  
</form>

</section>
<style>


 
</style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>