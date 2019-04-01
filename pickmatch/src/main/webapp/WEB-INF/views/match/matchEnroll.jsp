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
<script>

	Date.prototype.toDateInputValue = (function() {
	    var local = new Date(this);
	    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
	    return local.toJSON().slice(0,10);
	});
	$(function(){
		
		$("input[name=matchDate]").val(new Date().toDateInputValue());
	});
</script>
</head>
<body>
<style>
      div#enroll-container{width:400px; margin:0 auto;}
      div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
      </style>
<section>
	<div id="enroll-container">
	   <form name="matchEnrollForm" action="${pageContext.request.contextPath}/match/enroll" method="post" onsubmit="return validate();" >
	      날짜 <input type="date" placeholder="날짜" name="matchDate"  required> <br>
	      구장 <input type="text" class="form-control" placeholder="구장" name="playground"> <br>
	    매치유형   <!-- <input type="text" class="form-control" placeholder="축구/풋살" name="matchType" list="playType">  -->
	    <select name="matchType">
	    	<option>축구</option>
	    	<option>풋살</option>
	    </select>
	    <br>
	     회비 <input type="number" class="form-control" placeholder="회비" name="email" id="email" value="${m.email }"> <br>
	     유니폼색 <input type="text" class="form-control" placeholder="유니폼색" name="email" id="email" value="${m.email }"> <br>
	     경기가능지역 <input type="text" class="form-control" placeholder="경기가능지역" name="email" id="email" value="${m.email }"> <br>
	     내용 <textarea name="memo" cols="50" rows=6" style="resize:none"></textarea>
	      
	      <br />
	      <input type="submit" class="btn btn-outline-success" value="등록" >&nbsp;
	      <input type="reset" class="btn btn-outline-success" value="취소">
	   </form>
	</div>
	<!-- 패스워드 일치 여부, 아이디 4자리이상 -->
	<script>
		$(function(){
		
		});
		
		function validate() {
			var memo = $("[name=memo]").val().trim();
			if (memo.length == 0) {
				alert("내용 입력");
				return false;
			}
		}
	</script>

</body>
</html>