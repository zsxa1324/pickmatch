<!--<section>
	<div id="freeboard-write">
		<form name="freeboardFrm"
			action="${pageContext.request.contextPath}/community/freeboardUpdateEnd.do"
			method="post" onsubmit="return validate();"
			enctype="multipart/form-data">
			<input type="hidden" name="boardNo" value="${freeboard.boardNo}"/>
			<input type="hidden" name="memberId" value="${loggedMember.memberId}"/>
			<div class="form-group form-group-sm" style="margin-top: 50px;">
				<label for="title"
					style="display: inline-block; margin-right: 30px; margin-left: 20px;">제목</label>
				<input type="text" class="form-control" id="title" name="boardTitle"
					style="display: inline-block; width: 300px;" value="${freeboard.boardTitle }">
			</div>


			<div class="form-group ">
				<label
					style="margin-right: 30px; margin-left: 20px; margin-top: 30px;">내용</label>
				<textarea class="form-control" rows="3"
					style="width: 380px; margin-right: 30px; margin-left: 20px;" name="boardContent">${freeboard.boardContent }</textarea>
			</div>

			<div>
				<h2><b>파일</b></h2>
				<div id="fileDiv">
					<p>
						<input type="file" class="form-control form-control-sm" id="file_0" name="upFile">
						<a href="#this" class="btn btn-primary btn-sm" id="delete" name="delete">삭제</a>
					</p>
				</div>
			</div>
			<a href="#this" class="btn btn-primary btn-sm" id="addFile">파일추가</a>

			<div id="freeboard-btn" style="margin-left: 50px;">
				<input type="submit" class="btn btn-outline-success" value="저장"
					style="margin-right: 150px;"> <input type="button"
					class="btn btn-outline-success" onclick="location.href='${path}/community/freeboardView.do?boardNo='+${freeboard.boardNo}" value="취소"/>
			</div>
			

		</form>

	</div>

</section>
<style>
	#upload1{
		width:400px;
		height:40px;
		margin-right: 50px;
	}
	
	#upload2{
		width:400px;
		height:40px;
		margin-top: 5px;
	}
	
	#upload3{
		width:400px;
		height:40px;
		margin-top: 5px;
	}

</style>

<script>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> 
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
	.freeboard-write-header
	{
		margin : 20px auto;
		text-align: center;
		font-size: 37px;
		font-weight: bold;
	}
	
	.freeboard-write-wrapper
	{
		display:flex;
		width : 80%;
		flex-flow: column;
		margin : 30px auto 100px;
	}
	
	.freeboard-write-form
	{
		margin : 20px 0;
	}
	
	.freeboard-content-element
	{
		display: flex;
		flex-flow: row;
	}
	
	.freeboard-content-element > div
	{
		margin : 3px 15px;
	}
	
	.freeboard-content-element > div:nth-of-type(1)
	{
		flex : 1 0 0; 
		align-self: center;
		text-align: right;
		margin-right: 8px;
		
	}
	.freeboard-content-element > div:nth-of-type(2)
	{
		flex : 7 0 0;
	}
	
	.form-control[readonly]
	{
		opacity: 0.8;
		width : 50%;
		margin-left: 0;
	}
	
	.freeboard-attach
	{
		display: flex;
		flex-direction: column;
	}
	

	.attach-file
	{
		display: flex;
		flex-flow: row;
		align-items: center;
	}
	
	.attach-file > div:nth-of-type(1)
	{
		flex : 5 1 0;
	}
	
	.attach-file > div:nth-of-type(2)
	{ 
		text-align : right;
		margin-right: 35px;
		flex : 1 1 0;
	}

	.attah-add
	{
		text-align: right;
		margin-right: 50px;	
	}
	
	.freeboard-btn-box > input:nth-of-type(1)
	{
		margin-left:340px;
	}
	
</style>

<section>
	<div class="freeboard-write-wrapper">
		<div class="freeboard-write-header">
			<span>자유게시판 글 수정</span>
		</div>
		<div class="freeboard-write-form">
			<form name="freeboardFrm" action="${pageContext.request.contextPath}/community/freeboardUpdateEnd.do"	method="post" onsubmit="return validate();"	enctype="multipart/form-data">
				<input type="hidden" name="boardNo" value="${freeboard.boardNo}"/>
				<div class="freeboard-write-body">
					<div class="freeboard-write-content">
						<div class="freeboard-content-element">
							<div>작성자</div>
							<div>
								<input type="text" name="memberId" class="form-control"
									value="${freeboard.memberId }" readonly />
							</div>
						</div>
						<div class="freeboard-content-element">
							<div>제목</div>
							<div>
								<input type="text" name="boardTitle" class="form-control"
									required="required" value="${freeboard.boardTitle }"/>
							</div>
						</div>
						<div class="freeboard-content-element">
							<div>내용</div>
							<div>
								<textarea class="form-control" name="boardContent"
									required="required" rows="7">${freeboard.boardContent }</textarea>
							</div>
						</div>
	<c:if test="${attachmentList != '[]' }">
		<div class="freeboard-attach-download">
			<div>
				첨부파일 수정
			</div>
			<div>
				<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				<div>
			    	<button type="button" class="btn btn-outline-success" onclick="fileDelete('${a.originalFileName}','${a.renamedFileName }');"><%--  첨부파일${vs.count} -  --%>${a.originalFileName }
			        </button>
		   		</div>
		   		</c:forEach>
		   	</div>	
		</div>
	</c:if>
					<div class="freeboard-content-element">
							<div>파일 첨부</div>
							<div class="freeboard-attach"  id="fileDiv">
								<div class="attach-file">
									<div>
										<input type="file" class="form-control form-control-sm" id="file_0" name="upFile">
									</div>
									<div>
										<a href="#this" class="btn btn-primary btn-sm" id="delete" name="delete">삭제</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="attah-add">
					<a href="#this" class="btn btn-primary btn-sm" id="addFile">파일추가</a>
				</div>
				
				<div class="freeboard-btn-box">
					<input type="submit" class="btn btn-warning" value="수정"/> 
					<input type="button" class="btn btn-secondary"  onclick="location.href='${path}/community/freeboard.do'" value="취소"/>
				</div>
			</form>
		</div>
	</div>


</section>

<script>
	var attach_count = 1;
	$(document).ready(function(){
		$("#addFile").on("click", function(e){
			e.preventDefault();
			fn_addFile();
		});
		$("a[name='delete']").on("click", function(e){
			e.preventDefault();
			console.log('dele');
			fn_deleteFile($(this));
			console.log($(this));
		});
	});
	
	function fn_addFile(){
		var str = "<div class='attach-file'><div><input type='file' name='upFile' class='form-control form-control-sm' id='file_"+(attach_count++)+"'></div><div><a href='#this' class='btn btn-primary btn-sm' name='delete'>삭제</a></div></div>";
		$("#fileDiv").append(str);

		$("a[name='delete']").on("click",function(e){
			e.preventDefault();
			console.log('dele2');
			fn_deleteFile($(this));
		})
		
	}
	
	function fn_deleteFile(obj){
		obj.parent().parent().remove();
	}
	
	function fileDelete(oName,rName)
	{
		var flag = confirm("정말 삭제하시겠습니까?");		
		
		if(flag==true){
			
			fileDeleteAjax(oName,rName);
		}
		else{
			return false;
		}
	}
	
	function fileDeleteAjax(oName,rName){
		
		oName = encodeURIComponent(oName);
		
		$.ajax({
           	url: '${path}/community/freeboardAttachDelete.do?oName='+oName+'&rName='+rName,
           	type: 'get',
           	dataType: 'text',
           	success: data => {
           		
           	}
           });
	});
	
	

 </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>