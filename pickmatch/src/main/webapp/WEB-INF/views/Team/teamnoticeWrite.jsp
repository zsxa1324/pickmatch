<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>



<section>
<div id="teamnotice-write">
	 <form name="teamnoticeFrm" action="${pageContext.request.contextPath}/board/teamnotice.do" method="post" onsubmit="return validate();"  enctype="multipart/form-data" >
          
<div class="form-group form-group-sm" style="margin-top: 50px;">
    <label for="title" style="display: inline-block; margin-right: 30px; margin-left: 20px;">제목</label>
    <input type="text" class="form-control" id="title"  style="display: inline-block; width: 300px;">
</div>
            
<div class="form-group ">
	<label style="margin-right: 30px; margin-left: 20px; margin-top: 10px;">내용</label>
	<textarea class="form-control" rows="3" style="width:380px; margin-right: 30px; margin-left: 20px;"></textarea>
</div>
         
<div id="freeboard-btn" style="margin-left: 50px;">
	 <input type="submit" class="btn btn-outline-success" value="저장" style="margin-right: 150px;">
	 <input type="button" class="btn btn-outline-success" value="취소" >
</div>
  
  
</form>

</div>

</section>
<style>


</style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>