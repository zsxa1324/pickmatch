<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="team-create-container">
<style>
	.form-group {
		margin : auto 30px;
	}
</style>
<form style="margin-top: 20px;" action="${pageContext.request.contextPath}/board/noticeUpdate"
			method="post" enctype="multipart/form-data">
	<input type="hidden" name="noticeNo" value="${notice.noticeNo }"/>
  <div class="form-group form-group-sm">
    <label for="noticeTitle" style="display: inline-block; margin-right: 30px; margin-left: 20px;">제목</label>
    <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle }"  style="display: inline-block; width: 300px;"  readonly>
  </div>
  <div class="form-group form-group-sm">
    <label for="memberId" style="display: inline-block; margin-right: 30px; margin-left: 20px;">작성자</label>
    <label for="memberId" style="display: inline-block; margin-right: 30px;">${notice.memberId }</label>
    <input type="hidden" name="memberId" value="${notice.memberId }"/>
  </div>
  <div class="form-group form-group-sm">
    <label for="stadium" style="margin-right: 45px; margin-left: 20px;">파일</label>
    <c:forEach items="${attachmentList}" var="a" varStatus="vs">
       <button type="button" 
               class="btn btn-outline-success"
               onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');"> 첨부파일${vs.count} - ${a.originalFileName }
        </button>
    </c:forEach>
  </div>
  		
  <div class="form-group">
  	<label style="margin-right: 30px; margin-left: 20px; display:inline-block;">내용</label>
  	<textarea name="noticeContent" class="form-control" rows="10" style="width:600px; margin-right: 30px; margin-left: 20px" readonly>${notice.noticeContent }</textarea>
  </div>
  
  <div class="attach-file-console">
  	<c:if test="${attachmentList !=null }">
  		<c:forEach items="${attachmentList }" var="attach">
  			<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'jpg'
  			}">
  			<img src="${path }/resources/upload/notice/${attach.renamedFileName}" width="70px">
  			</c:if> 
  			<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'jpeg'}">
  			<img src="${path }/resources/upload/notice/${attach.renamedFileName}" width="70px">
  			</c:if> 
  			<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'png' || fn:substringAfter(attach.renamedFileName,'.')== 'PNG'}">
  			<img src="${path }/resources/upload/notice/${attach.renamedFileName}" width="70px">
  			</c:if> 
  			
  		</c:forEach>
  	</c:if>
  </div>
  
  <div id="freeboard-btn" style="margin-left: 50px;">
				<input type="submit" class="btn btn-outline-success" value="수정"
					style="margin-right: 150px;"> <input type="button"
					class="btn btn-outline-success" value="삭제">
  </div>




</form>
</section>
<script>
	function fileDownload(oName,rName)
	{
		oName = encodeURIComponent(oName);
		location.href='${path}/board/noticeDown.do?oName='+oName+'&rName='+rName;
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>