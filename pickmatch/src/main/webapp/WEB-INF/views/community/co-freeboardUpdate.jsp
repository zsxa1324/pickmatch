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
		margin : 4px 15px;
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
	
	.freeboard-attach-dele-box
	{
		display: flex;
		flex-flow: row;
	}
	
	.freeboard-attach-dele-box > div
	{
		margin : 3px;
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
	
	.freeboard-btn-box
	{
		margin : 30px auto;
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
						<div class="freeboard-content-element freeboard-attach-download">
							<div>
								파일 삭제
							</div>
							<div id="freeboard-attach-delete-box" class="freeboard-attach-dele-box">
						   	</div>	
						</div>
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
					<input type="button" class="btn btn-secondary"  onclick="location.href='${path}/community/freeboardView.do?boardNo=${freeboard.boardNo }'" value="취소"/>
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
	
	$(function(){
		selectAttachAjax(${freeboard.boardNo});
	});

	function selectAttachAjax(boardNo){
		$('#freeboard-attach-delete-box').children().remove();
		$.ajax({
           	url: '${path}/community/freeboardSelectAttach.do?boardNo='+boardNo,
           	type: 'get',
           	dataType: 'json',
           	success: data => {
           		appendData(data);
           	},
           	error : data => { console.log('에러');}
           });
	}
	
	function appendData(data){
		if(data.length==0)
		{
			var nofileStr = "<div>해당 게시물에 첨부한 파일이 없습니다.</div>";
			$('#freeboard-attach-delete-box').append(nofileStr);
		}
		else{
		for(var i=0 ; i<data.length ; i++)
		{
			console.log("'fileDelete(\'"+data[i].originalFileName+"\',\'"+data[i].renamedFileName+"\');'");
			var fileStr = "<div><button type='button' class='btn btn-outline-success' onclick='fileDelete(\""+data[i].originalFileName+"\",\""+data[i].renamedFileName+"\");'>"+data[i].originalFileName+"</button></div>";
			$('#freeboard-attach-delete-box').append(fileStr);
		}
		}
	}
	
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
		var flag = confirm("해당 게시물에서 선택한 파일을 정말 삭제하시겠습니까?");		
		
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
           		console.log("되나?");
           		if(data=='true')
           		{
           			selectAttachAjax(${freeboard.boardNo});
           		}
           	}
           });
	};
	
	

 </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>