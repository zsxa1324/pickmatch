<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="team-board-view">

<form action="${pageContext.request.contextPath}/team/updateteamboard" method="post" onsubmit="return validate();">


  <div class="form-group form-group-sm">
   <input type="hidden" name="memberId" value="${loggedMember.memberId}"/>
   <input type="hidden" name="teamName" value="${loggedMember.teamName}"/>
   <input type="hidden" name="boardNo" value="${teamboard.boardNo }"/>

   <div style="display: block;">
    <label for="memberId" style="display: inline-block; margin-right: 30px; margin-left: 20px;">작성자</label>
    <input type="text" class="form-control" id="memberId" value="${teamboard.memberId }" style="display: inline-block; width: 300px;" readonly >
   </div>
   <div style="display: block;">
    <label for="boardTitle" style="display: inline-block; margin-right: 30px; margin-left: 20px;">제목</label>
    <input type="text" class="form-control" id="boardTitle" value="${teamboard.boardTitle }" name="boardTitle" style="display: inline-block; width: 300px;" readonly >
   </div>
  </div>
  <div class="form-group form-group-sm">
    <label for="stadium" style="margin-right: 45px; margin-left: 20px;">파일</label>
    <c:forEach items="${attachmentList}" var="a" varStatus="vs">
       <button type="button" 
               class="btn btn-outline-success btn-block"
               onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');"> 첨부파일${vs.count} - ${a.originalFileName }
        </button>
    </c:forEach>
  </div>

  <div class="form-group">
  	<label style="margin-right: 30px; margin-left: 20px; display:inline-block;">내용</label>
  	<textarea class="form-control" name="boardContent" rows="10" style="width:600px; margin-right: 30px; margin-left: 20px" readonly>${teamboard.boardContent }</textarea>
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
	<input type="button" class="btn btn-outline-success" value="삭제" onclick="delete_btn()"> 
  </div>
  

</form>
</section>

<script>
	function delete_btn(){
	
		var flag = confirm("정말 삭제하시겠습니까?");		
		
		if(flag==true){
			location.href="${path}/deleteTeamBoard.do?boardNo=${teamboard.boardNo}";
		}
		else{
			return false;
		}
}

</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>