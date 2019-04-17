<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
	.freeboard-container
	{
		width:80%;
		margin : 30px auto 100px;
		display: flex;
		flex-flow: column;
	}
	
	.freeboard-container > div:nth-of-type(1) {}
	.freeboard-container > div:nth-of-type(2) {}
	.freeboard-container > div:nth-of-type(3) {}
	
	.freeboard-wrapper
	{
		width:100%;
		margin : 30px auto;
		display: flex;
		flex-flow: column;
	}
	
	.freeboard-title
	{
		border: 3px rgba(0,0,0,0.1) solid;
		border-radius: 5px;
		padding : 15px;
	}
	
	.freeboard-maintitle
	{
		font-size: 25px;
		font-weight: bold;
		
	}
	
	.freeboard-subtitle
	{
		display: flex;
		flex-flow: row;
		float: right;
		align-items: center;
		align-self: center;
	}
	
	.freeboard-subtitle-name
	{
		font-size: 11px;
		margin-left : 8px;
	}
	
	.freeboard-subtitle-name > span
	{
		margin-left : 4px;
		font-size: 18px;
	}
	
	.freeboard-content
	{
		min-height: 240px;
		padding : 15px 0;
	}

	.freeboard-attach-img
	{
		display : flex;
		justify-content: space-around;
		/* align-content: space-around; */
	}
	
	.freeboard-attach-img > div > img
	{
		width : 200px;
		border-radius: 5px;
		align-self: center;
	}
	
	.freeboard-attach-download
	{
		border : 1.5px rgba(0,0,0,0.1) solid;
		border-radius:10px;
		padding : 10px;
		margin : 5px 0;
		display: flex;
	}
	
	.freeboard-attach-download > div:nth-of-type(1){flex : 1 1 0; align-self: center; font-weight: bold;}
	.freeboard-attach-download > div:nth-of-type(2){flex : 8 1 0; display: flex; justify-content: flex-end;}
	
	.freeboard-attach-download > div:nth-of-type(2) > div
	{
		margin : 3px;
	}
	
	.comment-table
	{
		border-bottom: 1px solid rgba(0,0,0,0.1);
	}
	
	.comment-editor
	{
		margin : 10px;
	}
	
	.comment-lable
	{
		font-size: 15px;
		margin-bottom: 0;
	}
	
	.comment-write-div
	{
		display: flex;
	}
	
	.comment-write-div > div:nth-of-type(1){flex: 10 1 0; align-self: center;}
	.comment-write-div > div:nth-of-type(2){flex: 1 1 0; display: flex; justify-content: flex-end; align-self: center;}
	
	.button-box
	{
		border-top: 2px rgba(0,0,0,0.1) solid;
	}
	
	.button-box > button
	{
		margin : 5px 2px;
		float : right;
	}
	
	.freeboard-comment-wrapper
	{
		margin : 25px 0;
	}
	
	.btn-group
	{
		margin : 70px 0 0 0;
	}
</style>


<section>
<div class="freeboard-container">
	<div class="freeboard-wrapper">
		<div class="freeboard-title">
			<div class="freeboard-maintitle">${freeboard.boardTitle }</div>
			<div class="freeboard-subtitle">
				<div>
					<div class="freeboard-subtitle-name freeboard-subtitle-member">작성자<span>${freeboard.memberId }</span></div>
				</div>
				<div>
					<div class="freeboard-subtitle-name">작성일<span><fmt:formatDate value="${freeboard.boardDate }" pattern="yyyy.MM.dd"/></span></div>
				</div>
			</div>
		</div>		
		<div class="freeboard-content">
			<div>${freeboard.boardContent }</div>
		</div>
		<div class="freeboard-attach-img">
			<c:if test="${attachmentList !=null }">
				<c:forEach items="${attachmentList }" var="attach">
					<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'jpg'}">
						<div>
							<img src="${path }/resources/upload/community-freeboard/${attach.renamedFileName}" title="${attach.originalFileName }" width="70px">
						</div>
					</c:if>
					<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'jpeg'}">
						<div>
							<img src="${path }/resources/upload/community-freeboard/${attach.renamedFileName}" title="${attach.originalFileName }" width="70px">
						</div>
					</c:if>
					<c:if test="${fn:substringAfter(attach.renamedFileName,'.')== 'png'}">
						<div>
							<img src="${path }/resources/upload/community-freeboard/${attach.renamedFileName}" title="${attach.originalFileName }" width="70px">
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<c:if test="${attachmentList != '[]' }">
		<div class="freeboard-attach-download">
			<div>
				첨부파일 다운로드
			</div>
			<div>
				<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				<div>
			    	<button type="button" class="btn btn-outline-success" onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');"><%--  첨부파일${vs.count} -  --%>${a.originalFileName }
			        </button>
		   		</div>
		   		</c:forEach>
		   	</div>	
		</div>
	</c:if>
	<div class="freeboard-comment-wrapper">
		<div class="comment-container">
			<c:if test="${commentList != '[]' }">
				<div class="comment-box">
					<table class="table table-hover comment-table">
						<c:forEach items="${commentList }" var="c">
							<tr>
								<th scope="row" style="width:100px;">${c.memberId }</th>
								<td colspan="6">${c.commentContent }</td>
								<c:if test="${loggedMember.memberId == c.memberId || loggedMember.memberId == 'admin'}">
									<td style="width:76px;"><button class="btn btn-outline-danger btn-sm" value="${c.commentNo }" onclick="comment_delete();">삭제</button></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
		</div>
		
		<c:if test="${loggedMember != null }">
			<div class="comment-editor">
				<form name="commentFrm" action="${path }/community/insertFreeBoardComment.do" method="post">
					<input type="hidden" name="boardNoRef" value="${freeboard.boardNo }"/>
					<input type="hidden" name="memberId" value="${loggedMember.memberId }"/>
					<input type="hidden" name="commentNoRef" value="0"/>
			      	<label class="comment-lable" for="commentWriteBox">댓글 입력</label>
					<div class="form-group comment-write-div">
					  	<div><textarea class="form-control" id="commentWriteBox" name="commentContent" rows="2" required="required"></textarea></div>
					  	<div><button class="btn btn-primary " type="submit" id="btn-commentWrite">등록</button></div>
				    </div>
				</form>
			</div>
		</c:if>
	</div>
	<c:if test="${loggedMember.memberId==freeboard.memberId  || loggedMember.memberId == 'admin'}">
		<div class="button-box">
			<button class="btn btn-outline-danger" onclick="freeboard_delete();">삭제</button>
			<button class="btn btn-outline-primary" onclick="freeboard_update();">수정</button>
		</div>
	</c:if>
 	<div class="btn-group" role="group" aria-label="Basic example">
	  <button type="button" class="btn btn-secondary" onclick="location.href='${path}/community/freeboardView.do?boardNo=${prev}'">이전글</button>
	  <button type="button" class="btn btn-secondary" onclick="location.href='${path}/community/freeboard.do?'">목록</button>
	  <button type="button" class="btn btn-secondary" onclick="location.href='${path}/community/freeboardView.do?boardNo=${next}'">다음글</button>
	</div>
</div>

</section>
<script>
	function fileDownload(oName,rName)
	{
		oName = encodeURIComponent(oName);
		location.href='${path}/community/freeboardDown.do?oName='+oName+'&rName='+rName;
	}
	
	function freeboard_delete()
	{
		var flag = confirm("정말 삭제하시겠습니까?");		
		
		if(flag==true){
			location.href='${path}/community/freeboardDelete.do?boardNo=${freeboard.boardNo}';
		}
		else{
			return false;
		}
	}
	
	function freeboard_update()
	{
		location.href='${path}/community/freeboardUpdate.do?boardNo=${freeboard.boardNo}';
	}
	
	function comment_delete()
	{
		console.log(event.target.value);
		var flag = confirm("해당 댓글을 삭제하시겠습니까?");		
		if(flag==true){
			location.href='${path}/community/commentDelete.do?boardNo=${freeboard.boardNo}&&commentNo='+event.target.value;	
		}
		else{
			return false;
		}
	}
	
	

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>