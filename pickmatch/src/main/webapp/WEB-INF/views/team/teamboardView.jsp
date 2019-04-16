<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="team-board-view" >

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
       <button type="button" style="width:300px;"
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
  
  <c:if test="${loggedMember.memberId==teamboard.memberId }">
   <div>
  	<input type="submit" class="btn btn-outline-success" id="white_btn" value="수정" style="margin-right: 150px;">
	<input type="button" class="btn btn-outline-success" value="삭제" onclick="delete_btn()"> 
  </div>
  </c:if>

</form>




 <div class="freeboard-comment-wrapper" style="width:800px; margin-left: 10px;">
      <div class="comment-container">
         <c:if test="${tbclist != '[]' }">
            <div class="comment-box">
               <table class="table table-hover comment-table">
                  <c:forEach items="${tbclist }" var="c">
                     <tr>
                        <th scope="row" style="width:100px;">${c.memberId }</th>
                        <td colspan="5">${c.commentContent }</td>
                        <c:if test="${loggedMember.memberId==c.memberId||loggedMember.memberId=='admin' }">
                        <td style="width:100px;"><button value="${c.commentNo }" class="btn btn-outline-danger btn-sm" onclick="commentdelete_btn()">삭제</button>
                        </td>
                        </c:if>
                     </tr>
                  </c:forEach>
               </table>
            </div>
         </c:if>
      </div>
      
      <div class="comment-editor">
         <form name="commentFrm" action="${path }/team/insertTeamBoardComment.do" method="post">
            <input type="hidden" name="boardNoRef" value="${teamboard.boardNo }"/>
            <input type="hidden" name="memberId" value="${loggedMember.memberId }"/>
            <input type="hidden" name="commentNoRef" value="0"/>
               <label class="comment-lable" for="commentWriteBox">댓글 입력</label>
            <div class="form-group comment-write-div">
                 <div><textarea class="form-control" id="commentWriteBox" name="commentContent" rows="2"></textarea></div>
                 <div><button class="btn btn-primary" type="submit" id="btn-commentWrite" style="margin-left: 730px;">등록</button></div>
             </div>
         </form>
      </div>
   </div>


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

	function commentdelete_btn(){
		

		location.href="${path}/deletecomment.do?commentNo="+event.target.value+"&&boardNo=${teamboard.boardNo}"; 
		
	}
	
	function fileDownload(oName,rName)
	{
		oName = encodeURIComponent(oName);
		location.href='${path}/team/teamboard.do?oName='+oName+'&rName='+rName;
	}
</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>