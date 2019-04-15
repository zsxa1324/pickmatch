<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<section>
<div id="freeboard-write">
	 <form name="freeboardFrm" action="${pageContext.request.contextPath}/board/freeboardWrite.do" method="post" onsubmit="return validate();"  enctype="multipart/form-data" >
     <input type="hidden" name="memberId" value="${loggedMember.memberId}"/>
     <input type="hidden" name="teamName" value="${loggedMember.teamName}"/>
     
<div class="form-group form-group-sm" style="margin-top: 50px;">
    <label for="title" style="display: inline-block; margin-right: 30px; margin-left: 20px;">제목</label>
    <input type="text" class="form-control" id="title" name="boardTitle"  style="display: inline-block; width: 300px;">
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


<div class="form-group ">
	<label style="margin-right: 30px; margin-left: 20px; margin-top: 30px;">내용</label>
	<textarea class="form-control" rows="10" name="boardContent" style="width:600px; margin-right: 30px; margin-left: 20px;"></textarea>
</div>
         
<div id="freeboard-btn" style="margin-left: 50px;">
	 <input type="submit" class="btn btn-outline-success" value="저장" style="margin-right: 150px;">
	 <input type="button" class="btn btn-outline-success" value="취소" >
</div>
  
  
</form>

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





<style>
	#upload1{
		width:600px;
		/* height:40px; */
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
	
	#delete{
		width:70px;
		height:40px;
	}
	
	#addfile{
		width:70px;
		height:40px;
	}
	

</style>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>