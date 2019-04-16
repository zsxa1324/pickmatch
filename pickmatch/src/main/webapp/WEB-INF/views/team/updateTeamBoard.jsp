<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
      <jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="team-board-view">

<form action="${pageContext.request.contextPath}/team/whiteTeamBoard.do" method="post" onsubmit="return validate();">
<input type="hidden" name="boardNo" value="${teamboard.boardNo }"/>

  <div class="form-group form-group-sm">
    <div style="display: block;">
    <label for="memberId" style="display: inline-block; margin-right: 30px; margin-left: 20px;">작성자</label>
    <input type="text" class="form-control" id="memberId" value="${teamboard.memberId }" style="display: inline-block; width: 300px;" readonly >
   </div>
   <div style="display: block;">
    <label for="boardTitle" style="display: inline-block; margin-right: 30px; margin-left: 20px;">제목</label>
    <input type="text" class="form-control" id="boardTitle" value="${teamboard.boardTitle }" name="boardTitle" style="display: inline-block; width: 300px;">
   </div>
  </div>
  <div class="form-group form-group-sm">
    <label for="stadium" style="margin-right: 45px; margin-left: 20px;">파일</label>
    <c:forEach items="${attachmentList}" var="a" varStatus="vs">
       <button type="button" style="width:300px;"
               class="btn btn-outline-success btn-block"
               onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');"> 첨부파일${vs.count} - ${a.originalFileName }
        </button>
    </c:forEach>
  </div>
  
<div style="width:450px;">
<h2><b>파일</b></h2>
<div id="fileDiv">
		<p>
			<input type="file" class="form-control form-control-sm" id="file_0" name="upFile">
			<a href="#this" class="btn btn-primary btn-sm" id="delete" name="delete">삭제</a>
		</p>
	</div>
</div>
<a href="#this" class="btn btn-primary btn-sm" id="addFile">파일추가</a>
  
  

  <div class="form-group">
  	<label style="margin-right: 30px; margin-left: 20px; display:inline-block;">내용</label>
  	<textarea class="form-control" name="boardContent" rows="10" style="width:600px; margin-right: 30px; margin-left: 20px">${teamboard.boardContent }</textarea>
  </div>


  <div class="attach-file-console">
  	<c:if test="${attachmentList !=null }">
  		<c:forEach items="${attachmentList }" var="attach">
  			<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'jpg'}">
  			<img src="${path }/resources/upload/team-freeboard/${attach.renamedFileName}" width="70px">
  			</c:if> 
  			<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'jpeg'}">
  			<img src="${path }/resources/upload/team-freeboard/${attach.renamedFileName}" width="70px">
  			</c:if> 
  			<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'png'}">
  			<img src="${path }/resources/upload/team-freeboard/${attach.renamedFileName}" width="70px">
  			</c:if> 
  		</c:forEach>
  	</c:if>
  </div>
  
   <div>
  	<input type="submit" class="btn btn-outline-success" id="white_btn" value="수정" style="margin-right: 150px;">
	<input type="button" class="btn btn-outline-success" value="취소" onclick="cancel_btn()"> 
  </div>
  

</form>
</section>


<script>
 	function cancel_btn(){
 		location.href="${path}/freeboard.do";
	} 
 	

 	var attach_count = 1;
 	$(document).ready(function(){
 		$("#addFile").on("click", function(e){
 			e.preventDefault();
 			fn_addFile();
 		});
 		$("a[name='delete']").on("click", function(e){
 			e.preventDefault();
 			fn_deleteFile($(this));
 		});
 	});

 	function fn_addFile(){
 		var str = "<p><input type='file' name='upFile' id='file_"+(attach_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
 		$("#fileDiv").append(str);
 		$("a[name='delete']").on("click",function(e){
 			e.preventDefault();
 			fn_deleteFile($(this));
 		})
 	}

 	function fn_deleteFile(obj){
 		obj.parent().remove();
 	}

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>