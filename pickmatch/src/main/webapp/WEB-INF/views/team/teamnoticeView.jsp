<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section id="team-notice-view">

<form action="${pageContext.request.contextPath}/team/updateNotice" method="post" onsubmit="return validate();">
<input type="hidden" name="noticeNo" value="${teamnotice.noticeNo}">
<div id="teamnoticeView-container">
  <div class="form-group form-group-sm">
    <label for="memberId" style=" margin-top: 50px;">작성자</label>
    <input type="text" class="form-control" id="memberId" value="${teamnotice.memberId }"  style="width:300px; margin-left: 3px;" readonly >
  </div>
  
  <div class="form-group form-group-sm">
    <label for="title">제목</label>
    <input type="text" class="form-control" id="memberId" value="${teamnotice.noticeTitle }"  style="width:600px;" readonly >
  </div>


  <div class="form-group">
  	<label style="display:inline-block;">내용</label>
  	<textarea rows=10px  class="form-control" id="title-area" readonly>${teamnotice.noticeContent }</textarea>
  </div>
  
  
  <div>
  	<input type="submit" class="btn btn-outline-success" id="white_btn" value="수정" style="margin-right: 150px;">
	<input type="button" class="btn btn-outline-success" value="삭제" onclick="delete_btn()"> 
  </div>
    
</div>

</form>
</section>


<script>
	function delete_btn(){
		
		var flag = confirm("정말 삭제하시겠습니까?");		
		
		if(flag==true){
			location.href="${path}/deleteNotice.do?noticeNo=${teamnotice.noticeNo}";
		}
		else{
			return false;
		}
	}

</script>


<style>
	#teamnoticeView-container{
		margin:0 auto;
		width:600px;
	}
	
	#title-area{
		width:600px; 
		
	}

</style>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>