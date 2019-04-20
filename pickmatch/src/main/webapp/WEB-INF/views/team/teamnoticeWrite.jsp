<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>



<section>
<div id="teamnotice-write">
	 <form name="teamnoticeFrm" action="${pageContext.request.contextPath}/team/teamnotice" method="post" onsubmit="return validate();">
     <input type="hidden" name="memberId" value="${loggedMember.memberId}">
     
<div class="form-group form-group-sm" style="margin-top: 50px;">
    <label for="title" style="display: inline-block; margin-right: 30px; margin-left: 20px;">제목</label>
    <input type="text" name="noticeTitle" class="form-control" id="title"  style="display: inline-block; width: 300px;">
</div>
            
<div class="form-group ">
	<label style="margin-right: 30px; margin-left: 20px; margin-top: 10px;">내용</label>
	<textarea class="form-control" name="noticeContent" rows="10" style="width:600px; margin-right: 30px; margin-left: 20px;"></textarea>
</div>
         
<div id="freeboard-btn" style="margin-left: 50px;">
	 <input type="submit" class="btn btn-outline-success" id="success_btn" value="저장" style="margin-right: 150px;">
	 <input type="button" class="btn btn-outline-success" value="취소" onclick="cancel_btn()">
</div>
  
  
</form>

</div>

</section>


<script>
	function cancel_btn(){
		location.href="${path}/teamnotice.do";
	}
	
	function validate(){
		var title=$("#title").val().trim();
		if(title.length<1){
			alert("제목을 입력하세요!")
			return false;
		}
	}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>