<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Baloo|Baloo+Chettan|Changa|Concert+One|Cuprum|Days+One|Fredoka+One|Fugaz+One|Iceberg|Maven+Pro:700|Mitr|Passion+One|Permanent+Marker|Racing+Sans+One|Righteous|Viga|ZCOOL+XiaoWei" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Acme|Amaranth:700i|Amatic+SC:700|Cuprum:700|Dosis:800|Francois+One|Fredoka+One|Jua|Lobster|Passion+One:400,700|Paytone+One|Yanone+Kaffeesatz:700" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/team.css" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>메인화면</title>

<style>
	@font-face{
		font-family: 'Bloomer';
		src : url('${path}/resources/css/BloomerDEMO.otf');
	}
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
		width : 100%;
		/* background-image : url("${path}/resources/images/stadium.jpg");  */
	}
	#mypage-container
	{
		display : flex;
		flex-flow : column;
		position : absolute;
		background-color: white;
		width : 120px;
		height: 60px;
		float: right;
		margin: 80px 0 0 0;
		z-index: 10;
	}
	#header-container
	{
		display : flex;
		flex-flow: nowrap;
		align-items: center;
		width: 100%;
		height:90px;
		background-image : url("${path}/resources/images/stadium.jpg"); 
		background-size: cover;
	}
	
	
	#header-container > div
	{
		display : flex;
		align-items: center;
	}
	#header-container > div:nth-of-type(1){flex: 5 1 0;}
	#header-container > div:nth-of-type(2){flex: 1 1 0;}
	
	#header-logo
	{
		margin : 0 0 0 20px;
	}
	
	#header-logo > img
	{
		margin : 0 0 0 10px;
	}
	
	#header-logo > a
	{
		font-family: Bloomer;
		letter-spacing:0.08em;
		font-size:50px;
		cursor: default;
		margin : 1.5px;
	}
	
	#login-modal > span
	{
		color : black;
		font-size:15px;
		font-weight: bold;
	}
	
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
	.span-modal-title, .span-modal-title-bar
	{
		color : gray;
	}
	.span-modal-title:hover
	{
		color : black;
		cursor: pointer;
	}
	.a-main, .a-main:hover
	{
		color : black;
		text-decoration: none;
	}
	.validation-msg
	{
		font-size:12px;
		display:none;
		float:right;
	}
	.signup-input-msg
	{
		font-size:13px;
		margin: -1px 0 9px 0;
	}
	
	.modal-footer
	{
		padding-bottom: 3px;
	}
	
	#searchMember
	{
		float : right;
		font-size: 14px;
		padding-right: 16px;
		padding-bottom: 10px;
		color : #adb5bd;
	}
	#searchMember > a
	{
		color : #adb5bd;
	}
</style>
<script>
	function valSubmit()
	{
		console.log(onsubmit_id);
		console.log(onsubmit_mail);
		console.log(onsubmit_pass);
		console.log(onsubmit_nick);
		
		if(onsubmit_id !=1 || onsubmit_mail!=1 || onsubmit_pass!=1 || onsubmit_nick!=1)
		{
			alert('회원가입양식을 맞춰주세요.');
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<header>
	<div id="header-container">
		<div id="header-logo">
			<img src="${path }/resources/images/trophy.png" width="38px" height="41.5px"/>
			<a class="a-main" href="${path }/">pickmatch</a>
		</div>
		<c:if test="${loggedMember==null }">
		<div id="login-modal" data-toggle="modal" data-target="#loginModal">
			<img src="${path }/resources/images/user2.png" width='35px' height='35px'/>
			<span style="cursor: pointer; margin-left: 5px;">로그인</span>
		</div>
		</c:if>
		<c:if test="${loggedMember!=null and loggedMember.memberId!='admin'}">
		<div id="login-modal">
			<div id="alarm">0</div>
			<c:if test="${loggedMember.memberId=='admin' }">
			<a href="${path }/member/adminpage.do">
				<img src="${path }/resources/images/settings.png" width='35px' height='35px' style="border-radius: 18px;-moz-border-radius: 18px;-khtml-border-radius: 18px;-webkit-border-radius: 18px;"/>
			</a>
			</c:if>
			<c:if test="${loggedMember.memberId!='admin' }">
			<a href="${path }/member/mypageCheck.do">
				<c:if test="${loggedMember.status=='Y' }">
				<%-- <c:out value="${loggedMember }"/> --%>
					<c:if test="${loggedMember.profile!=null && loggedMember.profile!=''}">
						<img src="${path }/resources/upload/member-profile/${loggedMember.profile }" width='35px' height='35px' title="마이페이지" style="border-radius: 18px;-moz-border-radius: 18px;-khtml-border-radius: 18px;-webkit-border-radius: 18px;"/>
					</c:if>
					<c:if test="${loggedMember.profile==null || loggedMember.profile==''}">
						<img src="${path }/resources/images/user2.png" width='35px' height='35px' title="마이페이지"/>
					</c:if>
				</c:if>
			</a>
				<c:if test="${loggedMember.status=='K' }">
					<c:if test="${loggedMember.profile!=null }">
						<img src="${loggedMember.profile}" width='35px' height='35px' style="border-radius: 18px;-moz-border-radius: 18px;-khtml-border-radius: 18px;-webkit-border-radius: 18px;"/>
					</c:if>
					<c:if test="${loggedMember.profile==null }">
						<img src="${path }/resources/images/user2.png" width='35px' height='35px' title="마이페이지"/>
					</c:if>
				</c:if>
			</c:if>
			<span onclick="location.href='${path}/member/logout.do'" style="cursor: pointer; margin-left: 5px;">로그아웃</span>
		</div>
		</c:if>
		
		<c:if test="${loggedMember!=null and loggedMember.memberId=='admin'}">
		<div id="login-modal">
			<div id="alarm">1</div>
			<a href="${path }/admin/adminPage">
			<c:if test="${loggedMember.profile!=null }">
				<img src="${path }/resources/upload/member-profile/${loggedMember.profile }" width='35px' height='35px' style="border-radius: 18px;-moz-border-radius: 18px;-khtml-border-radius: 18px;-webkit-border-radius: 18px;"/>
			</c:if>
			<c:if test="${loggedMember.profile==null }">
				<img src="${path }/resources/images/user.png" width='35px' height='35px' title="관리자페이지"/>
			</c:if>
			</a>
			<span onclick="location.href='${path}/member/logout.do'">로그아웃</span>
		</div>
		</c:if>
		
		
		
	</div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">		
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
			<div class="collapse navbar-collapse header-nav-bar" id="navbarColor03">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#">내팀정보
							<span class="sr-only">(current)</span>
						</a>
						<div class="dropdown">
						<c:if test="${!empty loggedMember}">
							<c:if test="${loggedMember.teamName==null }">
							<a href="${path}/teamcreate.do">팀 개설</a>
							</c:if>
							<c:if test="${loggedMember.teamName!=null }">
							<a href="${path }/team.do?teamName=${loggedMember.teamName}">팀 정보</a>
							<a href="${path}/team/teamMatchList">팀 매치정보</a>
                    		<a href="${path}/team/teamOperationInfo">팀 운영정보</a>
							</c:if>
							<c:if test="${loggedMember.teamName!=null }">
							<a href="${path}/freeboard.do">팀 자유게시판</a>
							</c:if>
							<c:if test="${loggedMember.teamName!=null }">
							<a href="${path}/teamnotice.do?teamName=${loggedMember.teamName}">팀 공지사항</a>
							</c:if>
							<a href="${path}/teammercenary.do">내 용병팀 정보</a>
							
						</c:if>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="${path }/board/notice">공지사항</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="${path }/match/matchList.do">매치보드</a>
						<div class="dropdown">
							<a href="${path }/match/matchList.do">매치 조회</a>
						<c:if test="${!empty loggedMember}">
							<c:if test="${loggedMember.teamName!=null && (loggedMember.authority == '팀장' || loggedMember.authority == '매니저')}">
							<a href="${path }/match/enrollForm">매치 등록</a>
							</c:if>
						</c:if>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a>
						<div class="dropdown">
							<a href="${path }/community/freeboard.do">자유게시판</a>
							<%-- <a href="${path }/board/recruit">모집게시판</a> --%>
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
					<span id="click-login" class="span-modal-title" onclick="fn_login()">로그인</span><span class="span-modal-title-bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span><span id="click-enroll" class="span-modal-title" onclick="fn_enroll()">회원가입</span>
					</h5>					
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- 로그인 모달 -->
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
						<span id="searchMember"><a href="${path }/member/findpage.do">아이디/비밀번호 찾기</a></span>
					</form>
				</div>
				
				<!-- 회원가입 모달 -->
				<div id="login-enroll" style="display:none;">
					<form action="${path }/member/memberEnroll.do" method="post" enctype="multipart/form-data" onsubmit="return valSubmit();" class="enroll-frm">
						<div class="modal-body">
							<input type="text" class="form-control"	name="memberId" id="memberId" placeholder="아이디" required/>
							<div class="signup-input-msg">
		                        <span>4-12자 사이의 숫자와 영문자 조합</span>
		                    	<span id="val-id-ok" class="validation-msg" style='color:green;'>사용가능한 아이디입니다.</span>
								<span id="val-id-no" class="validation-msg" style='color:crimson;'>사용할 수 없는 아이디입니다.</span>
		                    </div>
		                    
							<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required/>
							<div class="signup-input-msg">
		                        <span>8자 이상 16자 이하 영문, 숫자, 특수문자 조합</span>
			                    <span id="val-pass-ok" class="validation-msg" style='color:green;'>안전</span>
								<span id="val-pass-no"class="validation-msg" style='color:crimson;'>위험</span>
		                    </div>
							<input type="password" class="form-control" id="password_" placeholder="비밀번호확인" required/>
							<div class="signup-input-msg">
								<span id="val-checkpass-no" class="validation-msg" style='color:crimson;'>비밀번호가 일치하지 않습니다.</span>
							</div>
							<input type="text" class="form-control" name="memberName" id="memberName" placeholder="이름" required/>
							<input type="text" class="form-control" name="nickname" id="nickname" placeholder="닉네임" required/>
							<div class="signup-input-msg">
								<span id="val-nick-ok" class="validation-msg" style='color:green;'>사용가능한 닉네임입니다.</span>
								<span id="val-nick-no" class="validation-msg" style='color:crimson;'>사용할 수 없는 닉네임입니다.</span>
							</div>
							<input type="tel" class="form-control" name="phone" id="phone" placeholder="전화번호(예:01012345678)" maxlength="11" required/>
							<input type="email" class="form-control" name="email" id ="email" placeholder="이메일" required/>
							<button type="button" class="btn btn-outline-secondary" onclick="checkMail()">인증메일발송</button>
							<input type="text" class="form-control" name="authkey" id="authkey" placeholder="인증번호입력"/>
							<button type="button" class="btn btn-outline-secondary" onclick="checkAuthkey()">인증번호확인</button>
							<span class="validation-msg" id='checkAuthkeySpan' style='color:green;'>인증완료</span>
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
	
	var onsubmit_id = 0;
	var onsubmit_pass = 0;
	var onsubmit_mail = 0;
	var onsubmit_nick = 0;
	
	$(function(){
		
		$.ajax({
			url:"${path}/alarm/messageTotalcount",
			data: {"memberId" : '${loggedMember.memberId}'},
			type:"POST",
			success:function(data){
				$("#alarm").html(data.messageTotalcount);
			}
		});
		
		$("#alarm").click(function(){
			$.ajax({
				url:"${path}/alarm/view",
				data: {"memberId" : '${loggedMember.memberId}', "cPage" : 1},
				dataType:"html",
				type:"POST",
				success:function(data){
					$("#AlarmResult").html(data);
					$("#alarm").html(0);
				}
				
			});
			
			$("#alarmModal").modal();
		})
		
	});
	
	function fn_paging(cPage){
		$.ajax({url: '/pickmatch/alarm/view',
			data: {'memberId' : '${loggedMember.memberId}', 'cPage' : cPage},
			dataType:'html',type:'POST',
			success:function(data){
				$('#AlarmResult').html(data);
				$("#alarm").html(0);
				}
			});
	}
	
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
					onsubmit_mail = 1;
				}
				else
				{
					alert('인증번호가 일치하지 않습니다.');
					onsubmit_mail = 0;
				}
			},
			error: data =>{
				alert('일치하는 인증번호가 아닙니다.');
			}
				
		});
	}
	

	/* 카카오 로그인 */
	   Kakao.init('dcc74509e1b7a54ac08acc0b2626252c');
	   Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj){
	    	  console.log(JSON.stringify(authObj));
	         Kakao.API.request({
	            url: '/v2/user/me',
	            success:function(res){
	               console.log(res);
	               console.log(res.id);
	               console.log(res.properties.nickname);
	               console.log(res.properties.profile_image);
	               console.log(res.properties.thumbnail_image);
	               console.log(res.kakao_account.email);
	               console.log(authObj.access_token);
	               console.log(JSON.stringify(res.kakao_account.email));
	               console.log(JSON.stringify(res.id));
	               console.log(JSON.stringify(res.properties.profile_image));
	               console.log(JSON.stringify(res.properties.nickname));
	               /* var sendData = JSON.stringify({memberId:res.id, nickname:res.properties.nickname, email:res.kakao_account.email, profile:res.properties.profile_image}); */
	               
	               kakaoAjax(res);
	               
	            }
	         })      
	      },
	      fail:function(err){ alert(JSON.stringify(err));}	       
	   });
	   
	   function kakaoAjax(res){
		   var profile = res.properties['profile_image'];
		   if(profile==null) {profile="";}
		   console.log(profile);
			
		   $.ajax({
				url: '${path}/member/kakaoLogin.do',
				type: 'post',
				data: {"memberId":res.id, "nickname":res.properties['nickname'], "email":res.kakao_account['email'], "profile":profile},
				dataType: 'text',
				success : function(data){
					console.log('success : ' + data);
					if(data=='true'){
						location.href='${path}/';
					}
					else
					{
						location.href='${path}/';
						alert('해당 아이디로 로그인할 수 없습니다.');
					}
				},
				error : function(request,status,error){
					alert('code:'+request.status+"\n"+"message:"+request.responseTest+"\n"+"error:"+error);
				}
			});
		};
	   

	 //회원가입 유효성 검사
	const signupFrm = $('.enroll-frm');
	const password = $('#password').val();
	const password_ = $('#password_').val();
	const signupId = $('.enroll-frm #memberId');
	const signupName = $('.enroll-frm #memberName');
	const signupEmail = $('.enroll-frm #email');
	const signupPhone = $('.enroll-frm #phone');
		
	const validationMsg = $('.validation-msg');
	const signupInputs = $('.validation-msg').prev();
	const idAvail = $('#idAvail')


	$("#memberId").keyup(function(e) { 
		if (!(e.keyCode >=37 && e.keyCode<=40)) {
			var v = $(this).val();
			$(this).val(v.replace(/[^a-z0-9]/gi,''));
		}
	});
	
	
	
	$('#memberId').blur(function idCheckAjax(){
		
		$.ajax({
           	url: '<%=request.getContextPath()%>/member/checkId.do?memberId='+signupId.val(),
           	type: 'get',
           	dataType: 'text',
           	success: data => {
           		if(data == 'true'|| $('#memberId').val().trim().length<4 || $('#memberId').val().trim().length>12 ) 
           			//가입된 아이디가 존재하거나 id길이가 짧거나 긴 경우
           		{
           			console.log($('#memberId').val())
           			$('#val-id-ok').hide();
        			$('#val-id-no').show();
        			onsubmit_id = 0;
           		}
           		else
           			//가입된 아이디가 존재하지 않을 경우
           		{
					$('#val-id-ok').show();
					$('#val-id-no').hide();
					onsubmit_id = 1;
           		}
           	}
           });
	});
	
	$("#password").blur(function passwordCheck(){
		var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
		if(!passwordCheck.test($('#password').val()))
		{
			$("#val-pass-ok").hide();
			$("#val-pass-no").show();
			onsubmit_pass = 0;
		}
		else
		{
			$("#val-pass-ok").show();
			$("#val-pass-no").hide();
			onsubmit_pass = 1;
		}
	})
	
	$('#password_').blur(function passCheck(){
		if($('#password').val() == $('#password_').val())
		{
			$('#val-checkpass-no').hide();
		}
		else
		{
			$('#val-checkpass-no').show();
			$('#password_').val('');
			$('#password').focus();
		}
	})
	
	$("#phone").keyup(function(event){
	    var inputVal = $(this).val();
    	$(this).val(inputVal.replace(/[^0-9]/gi,''));
	});
	
	$('#nickname').blur(function checkNickname()
	{
		$.ajax({
        	url: '<%=request.getContextPath()%>/member/checkNickname.do?nickname='+$("#nickname").val()+'&memberId='+$("#memberId").val(),
        	type: 'get',
        	dataType: 'text',
        	success: data => {
        		if(data == 'true' && $("#nickname").val().trim().length>0 )
        		{
        			$("#val-nick-no").hide();
        			$("#val-nick-ok").show();
        			onsubmit_nick = 1;
        		}
        		else
        		{
        			$("#val-nick-ok").hide();
        			$("#val-nick-no").show();
        			onsubmit_nick = 0;
        		}
        	}
        });

	});
	
	
</script>
		
		
		
		
		
		
