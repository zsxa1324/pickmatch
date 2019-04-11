<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_bootswatch.scss" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_variables.scss" />
 
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>



<section id="team-create-container">
<form id="team-create-frm" name="teamcreatefrm" action="${path }/team/teamCreate.do"  method="post" onsubmit="return validate();"  enctype="multipart/form-data" style="margin-top: 20px;">

  <input type="hidden" name="memberId" value="${loggedMember.memberId}">
  <div class="form-group form-group-sm" id="team-container">
    <label for="teamName" style="display: inline-block; margin-right: 30px; margin-left: 20px;">팀명</label>
    <input type="text" class="form-control" id="teamName" name="teamName" style="display: inline-block; width: 300px;">
    <span class="guide ok">이 팀명은 사용할 수 있습니다</span>
    <span class="guide error">이 팀명은 사용할 수 없습니다</span>
    <input type="hidden" name="checkteam" id="checkteam"/>
  </div>
  
  
  <div class="form-group form-group-sm">
    <label for="teamField" style="margin-right: 30px; margin-left: 20px;">구장</label>
    <input type="text" class="form-control" id="teamField" name="teamField" style="display: inline-block; width: 300px;">
  </div>
 <!--  <div id="ageavg">
  <label style="margin-right: 30px; margin-left: 20px; display: inline-block;">평균연령</label>
  	<select class="form-control" style="display: inline-block; width:150px;">
		 <option>10대</option>
		 <option>20대</option>
		 <option>30대</option>
		 <option>40대</option>
		 <option>50대</option>
		 <option>50대이상</option>
	</select>
  </div> -->
  
   <div id="tempertype" style="margin-top:10px;">
  <label style="margin-right: 30px; margin-left: 20px; display: inline-block;">팀 유형</label>
  	<select class="form-control" name="teamType" id="teamType" style="display: inline-block; width:150px;">
		 <option value="청소년">청소년</option>
		 <option value="대학생">대학생</option>
		 <option value="일반인">일반인</option>
		 <!-- <option>백수</option> -->
	</select>
  </div>
  
  <div class="form-group"  style="margin-top:10px;">
  	<label for="teamLocation" style="margin-right: 30px; margin-left: 20px;">활동지역</label>
  	<input type="text" class="form-control" id="teamLocation" name="teamLocation"  style="display: inline-block; width: 300px;">
  </div>
  
  <div class="form-group"  style="margin-top:10px;">
  	<label for="teamColor" style="margin-right: 30px; margin-left: 20px;">유니폼 색</label>
  	<input type="text" class="form-control" id="teamColor" name="teamColor"  style="display: inline-block; width: 300px;">
  </div>
  
  <div class="form-group ">
    <label for="teamEmblem" style="margin-right: 30px; margin-left: 20px;">팀로고</label>
    <input type="file"  id="teamEmblem" name="teamEmblem" id="teamEmblem">
    <p class="help-block">여기에 블록레벨 도움말 예제</p>
  </div>
  
  <div class="form-group ">
  	<label style="margin-right: 30px; margin-left: 20px;">팀 소개</label>
  	<textarea class="form-control" id="teamContent" name="teamContent" rows="7" style="width:500px; margin-right: 30px; margin-left: 20px;" placeholder="200자 이하로  작성해주세요"></textarea>
  </div>
  
  <div id="btn-container">
  <button type="submit" class="btn btn-primary">팀 생성</button>
  <button type="button" class="btn btn-primary" style="margin-left: 100px;">취소</button>
  </div>
  
  
</form>

</section>
<script>
var flag = true;
function validate()
{
	
	var teamName=$("#teamName").val().trim();
	if(teamName.length<1){
		alert("팀 명을 입력해 주세요")
		return false;
	}
	
	var teamField=$("#teamField").val().trim();
	if(teamField.length<1){
		alert("팀 구장을 입력해주세요")
		return false;
	}
	
	var teamType=$("#teamType").val().trim();
	if(teamType.length<1){
		alert("팀 유형을 선택해주세요")
		return false;
	}
	
	if(flag){
		alert("팀명이 중복되었습니다!");
		return false;
		
	}
	

}


$(function(){
	$('#teamName').keyup(function(){
		var teamName = $('#teamName').val().trim();

		
		console.log(teamName);
		if(teamName.length < 1){
			$(".guide").hide();
			return;
		}
	 	$.ajax({
			url:"${path}/team/checkteamname.do",
			data : {"teamname":$("#teamName").val()},
			success : function(data)
			{
				if(data.isOk){
					$(".guide.ok").show();
					$(".guide.error").hide();
					console.log("성공");
					flag = false;
				
				}else{
					$(".guide.ok").hide();
					$(".guide.error").show();
					console.log("실패");
					flag = true;
				} 
			} 
			
	}); 
})
})

</script>
 <%--   function checkMail()
   {
      $.ajax({
           url: '<%=request.getContextPath()%>/member/checkMail.do?email='+$("#email").val(),
           type: 'get',
           dataType: 'text',
           success: data => {
              if(data == 'true')
              {
                 sendMail();
              }
              else
              {
                 alert("이미 가입된 회원입니다.");
              }
           }
        });

   }
 --%>


<style>
    /*중복아이디체크관련*/

    div#team-container span.guide {display:none;font-size: 12px;position:relative; top:12px; right:10px; margin-left: 15px;}
    div#team-container span.ok{color:green;}
    div#team-container span.error{color:red;}
</style>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>