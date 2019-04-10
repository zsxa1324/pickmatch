<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Baloo|Baloo+Chettan|Changa|Concert+One|Cuprum|Days+One|Fredoka+One|Fugaz+One|Iceberg|Maven+Pro:700|Mitr|Passion+One|Permanent+Marker|Racing+Sans+One|Righteous|Viga|ZCOOL+XiaoWei" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/team.css" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>메인화면</title>

<style>
	.form-control
	{
		margin:3px auto;
	}
    html,
    body 
    {
       margin: 0;
       padding: 0;
       scroll-behavior: smooth;
    }
	body
	{
		margin :0;
		width : 100%;
		background-image : url("${path}/resources/images/stadium.jpg"); 
	}
	#header-container
	{
		display : flex;
		flex-flow: nowrap;
		align-items: center;
		min-width: 1024px;
	}
	#header-container > div
	{
		display : flex;
		align-items: center;
	}
	#header-container > div:nth-of-type(1){flex: 4 1 0;}
	#header-container > div:nth-of-type(2){flex: 1 1 0;}
	
	.navbar-nav
	{
		width:100%;
		text-align: center;
	}
	.header-nav-bar
	{
		display : flex;
	}
	.navbar-nav > li {display : inline-block;}
	.navbar-nav > li:nth-of-type(1){flex: 1 1 0;}
	.navbar-nav > li:nth-of-type(2){flex: 1 1 0;}
	.navbar-nav > li:nth-of-type(3){flex: 1 1 0;}
	.navbar-nav > li:nth-of-type(4){flex: 1 1 0;}
	.navbar-nav > li:nth-of-type(5){flex: 1 1 0;}
	.nav-item:hover .dropdown
	{
		display : block;
	}
	.dropdown
	{
		display : none;
		position : absolute;
		background-color: white;
		min-width:20%;
		z-index:1;
	}
	.dropdown a
	{
		color : gray;
		padding : 12px 16px;
		text-decoration : none;
		display : block;
	}
	.dropdown a:hover
	{
		color:black;
	}
	.dropdown a
	{
		color : gray;
		padding : 12px 16px;
		text-decoration : none;
		display : block;
	}
	
	#alarm {
		background-color : red;
		color : white;
		width : 35px;
		height : 35px;
		/* border: 1px solid black; */
		border-radius : 30px;
		margin-right : 5px;
		text-align : center
	}
</style>
</head>
<body>
<header>
	<div id="header-container">
		<img src="${path }/resources/images/logo.jpg"/>
		<div>
			<h2>Pick Match</h2>
		</div>
		<c:if test="${loggedMember==null }">
		<div id="login-modal" data-toggle="modal" data-target="#loginModal">
			<img src="${path }/resources/images/user.png" width='35px' height='35px'/>
			<span>로그인</span>
		</div>
		</c:if>
		
		<c:if test="${loggedMember!=null }">
		<div id="login-modal">
			<div id="alarm">1</div>
			<a href="${path }/member/mypage.jsp">
			<c:if test="${loggedMember.profile!=null }">
				<img src="${path }/resources/upload/member-profile/${loggedMember.profile }" width='35px' height='35px' style="border-radius: 18px;-moz-border-radius: 18px;-khtml-border-radius: 18px;-webkit-border-radius: 18px;"/>
			</c:if>
			<c:if test="${loggedMember.profile==null }">
				<img src="${path }/resources/images/user.png" width='35px' height='35px' title="마이페이지"/>
			</c:if>
			</a>
			<span onclick="location.href='${path}/member/logout.do'">로그아웃</span>
		</div>
		</c:if>
		
	</div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse header-nav-bar" id="navbarColor03">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#">내팀정보
							<span class="sr-only">(current)</span>
						</a>
						<div class="dropdown">
						<c:if test="${!empty loggedMember}">
							<a href="${path}/teamcreate.do">팀 개설</a>
							<a href="${path }/team.do">팀 정보</a>
							<a href="${path}/freeboard.do">팀 자유게시판</a>
							<a href="${path}/teamnotice.do">팀 공지사항</a>
							<a href="${path}/teammercenary.do">내 용병팀 정보</a>
						</c:if>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">공지사항</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${path }/match/matchList.do">매치보드</a>
						<div class="dropdown">
							<a href="${path }/match/matchList.do">매치 조회</a>
							<a href="${path }/match/enrollForm">매치 등록</a>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a>
						<div class="dropdown">
							<a href="${path }/community/freeboard.do">자유게시판</a>
							<a href="#">모집게시판</a>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">랭킹</a>
						<div class="dropdown">
							<a href="${path}/teamranking.do">팀 랭킹</a>
							<a href="${path}/mercenaryranking.do">용병 랭킹</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</header>
		
	<!-- 로그인 회원가입 모달창 -->
	<div class="modal" id="loginModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
					<!-- <ol class="breadcrumb">
					  <li class="breadcrumb-item" onclick="fn_login()">로그인</li>
					  <li class="breadcrumb-item active" onclick="fn_enroll()">회원가입</li>
					</ol> -->
					<span id="click-login" onclick="fn_login()">로그인</span>  <span id="click-enroll" onclick="fn_enroll()">회원가입</span>
					</h5>					
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="login-login">
					<form action="${path }/member/login.do" method="post">
						<div class="modal-body">
							<input type="text" class="form-control"	name="memberId" placeholder="아이디" required/>
							<input type="password" class="form-control" name="password" placeholder="비밀번호" required/>
						</div>
						<div class="modal-footer">
							<a id="kakao-login-btn"></a>
							<a href="http://developers.kakao.com/logout"></a>
							<button type="submit" class="btn btn-primary">로그인</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
				<div id="login-enroll" style="display:none;">
					<form action="${path }/member/memberEnroll.do" method="post" enctype="multipart/form-data">
						<div class="modal-body">
							<input type="text" class="form-control"	name="memberId" id="memberId" placeholder="아이디" required/>
							<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required/>
							<input type="password" class="form-control" id="password_" placeholder="비밀번호확인" required/>
							<input type="text" class="form-control" name="memberName" placeholder="이름" required/>
							<input type="text" class="form-control" name="nickname" placeholder="닉네임" required/>
							<input type="tel" class="form-control" name="phone" placeholder="전화번호(예:01012345678)" maxlength="11" required/>
							<input type="email" class="form-control" name="email" id ="email" placeholder="이메일" required/>
							<button type="button" class="btn btn-outline-secondary" onclick="checkMail()">인증메일발송</button>
							<input type="text" class="form-control" name="authkey" id="authkey" placeholder="인증번호입력"/>
							<button type="button" class="btn btn-outline-secondary" onclick="checkAuthkey()">인증번호확인</button>
							<span id='checkAuthkeySpan'style='color:green;font-size:12px;display:none;'>인증완료</span>
							<input type="text" class="form-control" name="birth" placeholder="출생년도(예:2019)" maxlength="4" required/>
							성별
							<label><input type="radio" name="gender" value="M" > 남 </label>
					        <label><input type="radio" name="gender" value="F" > 여 </label>
					        <br>
							<div>
						      <label for="position">포지션</label>
						      <select class="select-control" name="position" id="exampleSelect1">
						        <option>선택</option>
						        <option>LWF</option>
						        <option>ST</option>
						        <option>RWF</option>
						        <option>LWM</option>
						        <option>RWM</option>
						        <option>CAM</option>
						        <option>CDM</option>
						        <option>LM</option>
						        <option>CM</option>
						        <option>RM</option>
						        <option>LWB</option>
						        <option>RWB</option>
						        <option>LB</option>
						        <option>CB</option>
						        <option>GK</option>
						      </select>
						    </div>
							<div>
						      <label for="location">지역</label>
						      <select class="select-control" name="location" id="exampleSelect1">
						        <option>선택</option>
						        <option>서울</option>
						        <option>경기</option>
						        <option>강원</option>
						        <option>충청</option>
						        <option>전라</option>
						        <option>경상</option>
						        <option>제주</option>
						    </select>
						    </div>
							프로필사진<input type="file" name="profile"/> 
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">회원가입</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="alarmModal" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	      	<!-- header title -->
	        <h4 class="modal-title">알림</h4>
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	            <div id="AlarmResult"></div>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>


<script>

	$(function(){
		$("#alarm").click(function(){
			$.ajax({
				url:"${path}/alarm/view",
				dataType:"html",
				type:"POST",
				success:function(data){
					$("#AlarmResult").html(data);
				}
				
			});
			
			$("#alarmModal").modal();
		})
		
	});

	function fn_login()
	{
		$("#login-enroll").hide();
		$("#login-login").show();
	}
	function fn_enroll()
	{
		$("#login-login").hide();
		$("#login-enroll").show();
	}
	
	//가입되어있는 메일인지 확인 후 인증메일 발송
	function checkMail()
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
	function sendMail(){
		$.ajax({
			url: '${path}/member/sendMail.do?memberId='+$("#memberId").val()+'&email='+$('#email').val(),
			type: 'get',
			dataType: 'json',
			success: data => {
        		if(data == true)
        		{
        			alert("메일이 전송되었습니다. 인증번호를 확인해주세요.");
        		}
        		else
        		{
        			alert("메일전송에 실패했습니다.");	
        		}
        	}			
		});
	}

	function checkAuthkey(){
		$.ajax({
			url: '${path}/member/checkAuthkey.do?memberId='+$("#memberId").val()+'&authkey='+$('#authkey').val(),
			type: 'get',
			dataType: 'json',
			success: data => {
				if(data == true)
				{
					alert("인증번호가 일치합니다.");
					$('#checkAuthkeySpan').show();
					
				}
				else
				{
					alert('인증번호가 일치하지 않습니다.');
				}
			}
				
		});
	}
	

	/* 카카오 로그인 */
	   /*Kakao.init('c4f0aaa7f32ad43a59ff52dd744b1a3e'); */
	   /*  */
	   Kakao.init('80c61b3cc013a89e11c9aeb7ce11b541');
	   Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj){
	         Kakao.API.request({
	            url: '/v1/user/me',
	            success:function(res){
	               console.log(res);
	               console.log(res.id);
	               console.log(res.properties.nickname);
	               console.log(res.properties.profile_image);
	               console.log(res.properties.thumbnail_image);


	            }
	         })      
	      },
	      fail:function(err){ alert(JSON.stringify(err));}
	   });




</script>
		
		
		
		
		
		
