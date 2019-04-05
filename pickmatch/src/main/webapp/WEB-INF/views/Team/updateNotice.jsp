<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section id="team-notice-update">

<form>

<div id="updateNotice-container">
  <div class="form-group form-group-sm">
    <label for="memberId" style=" margin-top: 50px;">작성자</label>
    <input type="text" class="form-control" id="memberId" value="${teamNotice.memberId }"  style="width:300px;" readonly >
  </div>


  <div class="form-group">
  	<label style="display:inline-block;">내용</label>
  	<textarea rows=10px  class="form-control" id="title-area">${teamNotice.noticeContent }</textarea>
  </div>
  
  
  <div>
  	<input type="submit" class="btn btn-outline-success" id="white_btn" value="수정" style="margin-right: 150px;">
	<input type="button" class="btn btn-outline-success" value="취소" onclick="cancel_btn()"> 
  </div>
    
</div>

</form>
</section>


<script>
 	function cancel_btn(){
 		location.href="${path}/teamnotice.do";
	} 

</script>


<style>
	#updateNotice-container{
		margin:0 auto;
		width:600px;
	}
	
	#title-area{
		width:600px; 
		
	}

</style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>