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
    <input type="text" class="form-control" id="memberId" value="${freeboard.memberId }"  style="display: inline-block; width: 300px;" readonly >
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
  	<textarea class="form-control" rows="10" style="width:600px; margin-right: 30px; margin-left: 20px" readonly>${freeboard.boardContent }</textarea>
  </div>
  
  <div class="attach-file-console">
  	<c:if test="${attachmentList !=null }">
  		<c:forEach items="${attachmentList }" var="attach">
  			<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'jpg'}">
  			<img src="${path }/resources/upload/community-freeboard/${attach.renamedFileName}" width="70px">
  			</c:if> 
  			<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'jpeg'}">
  			<img src="${path }/resources/upload/community-freeboard/${attach.renamedFileName}" width="70px">
  			</c:if> 
  			<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'png'}">
  			<img src="${path }/resources/upload/community-freeboard/${attach.renamedFileName}" width="70px">
  			</c:if> 
  		</c:forEach>
  	</c:if>
  </div>

</form>

<div id="comment-container">
		<div class="comment-editor">
			<form name="commentFrm" action="<%=request.getContextPath()%>/board/boardCommentInsert" method="post">
				<input type="hidden" name="boardRef" value="${freeboard.boardNo }"/>
				<input type="hidden" name="boardCommentWriter" value="${loggedMember }"/>
				<input type="hidden" name="boardCommentLevel" value="1"/>
				<input type="hidden" name="boardCommentRef" value="0"/>
				<textarea name="boardCommentContent" cols="60" rows="2"></textarea>
				<button type="submit" id="btn-insert">등록</button>
			</form>
		</div>
		<table id="tbl-comment">
<%-- 		<%if(comments!=null) {
			for(BoardComment bc : comments){
			if(bc.getBoardCommentLevel()==1){%>
			<tr class="level1">
				<td>
					<sub class="comment-writer"><%=bc.getBoardCommentWriter() %></sub>
					<sub class="comment-date"><%=bc.getBoardCommentDate() %></sub>
					<br/>
					<%=bc.getBoardCommentContent() %>
				</td>
				<td>
					<button class="btn-reply" value="<%=bc.getBoardCommentNo()%>">답글</button>
				<%if(LoginMember!=null&&(bc.getBoardCommentWriter().equals(LoginMember.getUserId())||LoginMember.getUserId().equals("admin"))) {%>
					<button class="btn-delete" value="<%=bc.getBoardCommentNo()%>">삭제</button>
				<%} %>
				</td>
			</tr>
		<%}else if(bc.getBoardCommentLevel()==2){%>
			<tr class='level2'>
				<td>
					<sub><%=bc.getBoardCommentWriter()%></sub>
					<sub><%=bc.getBoardCommentDate()%></sub><br/>
					<sub><%=bc.getBoardCommentContent()%></sub>
				</td>
				<td>
				</td>
			</tr>
			<%}}} %> --%>
		</table>
	</div>
</section>
<script>
	function fileDownload(oName,rName)
	{
		oName = encodeURIComponent(oName);
		location.href='${path}/community/freeboardDown.do?oName='+oName+'&rName='+rName;
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>