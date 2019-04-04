<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="team-create-container">

<form style="margin-top: 20px;">
  <div class="form-group form-group-sm">
    <label for="memberId" style="display: inline-block; margin-right: 30px; margin-left: 20px;">작성자</label>
    <input type="text" class="form-control" id="memberId" value="${teamboard.memberId }"  style="display: inline-block; width: 300px;" readonly >
  </div>
  <div class="form-group form-group-sm">
    <label for="stadium" style="margin-right: 45px; margin-left: 20px;">파일</label>
    <input type="text" class="form-control" id="stadium" style="display: inline-block; width: 300px;">
  </div>

  <div class="form-group">
  	<label style="margin-right: 30px; margin-left: 20px; display:inline-block;">내용</label>
  	<textarea class="form-control" rows="3" style="width:300px; margin-right: 30px; margin-left: 20px" readonly>${teamboard.boardContent }</textarea>
  </div>




</form>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>