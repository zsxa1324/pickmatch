<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Baloo|Baloo+Chettan|Changa|Concert+One|Cuprum|Days+One|Fredoka+One|Fugaz+One|Iceberg|Maven+Pro:700|Mitr|Passion+One|Permanent+Marker|Racing+Sans+One|Righteous|Viga|ZCOOL+XiaoWei" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>메인화면</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	.form-control
	{
		margin:0 0 10px 0;
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
	#header-container > div:nth-of-type(1){flex: 7 1 0;}
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
			<a href="${path }/member/mypage.jsp"><img src="${path }/resources/images/user.png" width='35px' height='35px' title="마이페이지"/></a>
			<span onclick="location.href='${path}/member/logout.do'">로그아웃</span>
		</div>
		</c:if>
		
	</div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse header-nav-bar" id="navbarColor03">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="${pageContext.request.contextPath }/team.do">내팀정보
							<span class="sr-only">(current)</span>
						</a>
						<div class="dropdown">
							<a href="${pageContext.request.contextPath }/teamcreate.do">팀 개설</a>
							<a href="${pageContext.request.contextPath }/freeboard.do">팀 자유게시판</a>
							<a href="${pageContext.request.contextPath }/teamnotice.do">팀 공지사항</a>
							<a href="${pageContext.request.contextPath }/teammercenary.do">내 용병팀 정보</a>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">공지사항</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">매치보드</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a>
						<div class="dropdown">
							<a href="#">자유게시판</a>
							<a href="#">모집게시판</a>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">랭킹</a>
						<div class="dropdown">
							<a href="${pageContext.request.contextPath }/teamranking.do">팀 랭킹</a>
							<a href="${pageContext.request.contextPath }/mercenaryranking.do">용병 랭킹</a>
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
					<form action="${path }/member/memberEnroll.do" method="post">
						<div class="modal-body">
							<input type="text" class="form-control"	name="memberId" placeholder="아이디" required/>
							<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required/>
							<input type="password" class="form-control" id="password_" placeholder="비밀번호확인" required/>
							<input type="text" class="form-control" name="memberName" placeholder="이름" required/>
							<input type="text" class="form-control" name="nickName" placeholder="닉네임" required/>
							<input type="tel" class="form-control" name="phone" placeholder="전화번호(예:01012345678)" maxlength="11" required/>
							<input type="email" class="form-control" name="email" placeholder="이메일" required/><button type="button" class="btn btn-outline-secondary">인증메일발송</button>
							<input type="number" class="form-control" name="birth" placeholder="출생년도" required/>
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


<script>
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
	
	/* 카카오 로그인 */
	   /*Kakao.init('c4f0aaa7f32ad43a59ff52dd744b1a3e'); */
	   /*  */
	   Kakao.init('2cc490669f217fdbbf6bcdce998539c2');
	   Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj){
	         Kakao.API.request({
	            url: '/v1/user/me',
	            success:function(res){
	               console.log(res);
	               
	               $('#kakaoId').val(res.id);
	               $('#kakaoNick').val(res.properties['memberNickname']);
	            
	              $('#kakaoLoginForm').submit();
	            }
	         })      
	      },
	      fail:function(err){ alert(JSON.stringify(err));}
	   });

</script>
		
		
		
		
		
		
