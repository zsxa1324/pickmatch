<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<style>
      div#enroll-container{width:400px; margin:0 auto; text-align:center;}
      div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
      </style>
<section>
	<div id="enroll-container">
	   <form name="memberUpdateFrm" action="${pageContext.request.contextPath}/memberUpdateEnd.do" method="post" onsubmit="return validate();" >
	      <input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="userId" id="userId_" readonly value="${m.userId }">
	      <input type="text" class="form-control" placeholder="이름" name="userName" id="userName" required value="${m.userName }">
	      <input type="number" class="form-control" placeholder="나이" name="age" id="age" value="${m.age }">
	      <input type="email" class="form-control" placeholder="이메일" name="email" id="email" required value="${m.email }">
	      <input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" required value="${m.phone }">
	      <input type="text" class="form-control" placeholder="주소" name="address" id="address" value="${m.address }">
	      <select class="form-control" name="gender" required>
	         <option value="" disabled selected>성별</option>
	         <option value="M" ${m.gender eq 'M' ? 'selected' : '' }>남</option>
	         <option value="F" ${m.gender eq 'F' ? 'selected' : '' }>여</option>
	      </select>
	      
	      <br />
	      <input type="submit" class="btn btn-outline-success" value="수정" >&nbsp;
	      <input type="reset" class="btn btn-outline-success" value="탈퇴">
	   </form>
	</div>
	<!-- 패스워드 일치 여부, 아이디 4자리이상 -->
	<script>
		$(function(){
			$("#password2").blur(function(){
				var pw = $("#password_").val();
				var pwck = $("#password2").val();
				
				if (pw != pwck) {
					alert("패스워드가 일치하지 않습니다");
					$("#password2").val("");
					$("#password_").focus();
				}
			});
		});
		
		function validate() {
			var id = $("#userId_").val().trim();
			if (id.length < 4) {
				alert("아이디 4글자 이상 입력하세요");
				return false;
			}
		}
	</script>

</body>
</html>