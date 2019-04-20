<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
    	section
    	{
    		position: relative;
    	}
    	
		.mypage-wrapper
        {
            width: 650px;
            height: auto;
            margin : auto;
            display: flex;
            flex-flow: column nowrap;
            align-self: center;
        }

        .mypage-header
        {
            height: 100px;
            display: flex;
            align-items: center;
        }

        .mypage-title
        {
            font-size: 35px;
            margin: auto;
            font-weight: bold;
            color: black;
        }
              
       
        .mypage-tab
        {
            width: 100%;
            height: 45px;
            display: flex;
            position: relative;
        }

        .mypage-tab > div
        {
            flex: 1 1 0;
            border: 1px solid #ccc;
            border-right: none;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }

        .mypage-tab > div:last-of-type
        {
            border-right: 1px solid #ccc;
        }

        .mypage-tab > span
        {
            position: absolute;
            bottom: 0;
            display: block;
            width: 20%;
            height: 2px;
            background-color: rgb(38, 85, 139);
        }

        .mypage-tab > div > a
        {
            text-decoration: none;
            color: black;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .member-update-wrapper
        {
            font-family: 'Noto Sans KR';
            width: 100%;
            
        }

        .member-update-header
        {
            font-size: 25px;
            margin: 30px 0;
            /* border-bottom: 2px solid rgb(42, 71, 114); */
            padding-bottom: 25px;
        }

        .member-update-wrapper input
        {
            font-family: 'Noto Sans KR';
            border: 1px solid #ccc;
            padding: 5px;
            box-sizing: border-box;
            border-radius: 2px;
        }

        #member-id
        {
            background-color: lightgray;
        }

        .member-update-wrapper input[type="submit"]
        {
            background-color: black;
            border: none;
            color: white;
        }

        .member-update-frm
        {
            width: 100%;
            display: flex;
            flex-flow: column nowrap;
        }

        .member-update-frm > div
        {
            display: flex;
            align-items: center;
            position: relative;
        }

        .member-update-frm > div > div
        {
            padding: 15px;
        }

        .member-update-frm > div > div:nth-of-type(1){flex: 1 1 0; align-self: flex-start;}
        .member-update-frm > div > div:nth-of-type(2){flex: 4 1 0;}
        

        .valid-msg
        {
            font-size: 13px;
			display:none;
			float:right;
        }

        .member-update-input-msg
        {
            display: block;
            font-size: 13px;
            color: rgb(38, 85, 139);
            margin: 10px 0;
        }

        .update-btn-set
        {
            width: 502px;
            display: flex;
            justify-content: center;
            margin: 30px 0;
        }
        
        #profile-container
        {
        	width : 150px;
        }
        
        #profile-container > img
        {
        	width : 150px;
        	height: 150px;
        	border-radius: 60px;
        }
        
        #profileClear
        {
        	vertical-align: top;
        }
</style>

<section>
	<div class="mypage-wrapper">
		<div class="mypage-header">
			<div class="mypage-title">회원 정보 수정</div>
		</div>
		<div class="mypage-body">
			<div class="member-update-wrapper">

				<form action="${path }/member/memberUpdateEnd.do" method="post" class="member-update-frm" onsubmit="valSubmit_update()" autocomplete="off" enctype="multipart/form-data" >
					<div>
						<div>아이디</div>
						<div>
							<input type="text" name="memberId" id="new-memberId" value="${loggedMember.memberId }" readonly="readonly">
						</div>
					</div>
					<div>
						<div>새 비밀번호</div>
						<div>
							<input type="password" name="password" id="new-password">
							<div class="signup-input-msg">
		                        <span>8자 이상 16자 이하 영문, 숫자, 특수문자 조합</span>
		                    <span id="val-pass-ok-up" class="valid-msg" style='color:green;'>안전</span>
							<span id="val-pass-no-up"class="valid-msg" style='color:crimson;'>위험</span>
		                    </div>
						</div>
					</div>
					<div>
						<div>새 비밀번호 확인</div>
						<div>
							<input type="password" name="password_" id="new-password-check">
							<span id="val-checkpass-no-up" class="valid-msg" style='color:crimson;'>비밀번호가 일치하지 않습니다.</span>
						</div>
					</div>
					<div>
						<div>이름</div>
						<div>
							<input type="text" name="memberName" id="new-memberName" value="${loggedMember.memberName }">
						</div>
					</div>
					<div>
						<div>닉네임</div>
						<div>
							<input type="text" name="nickname" id="new-nickname" value="${loggedMember.nickname }">
							<span id="val-nick-ok-up" class="valid-msg" style='color:green;'>사용가능한 닉네임입니다.</span>
							<span id="val-nick-no-up" class="valid-msg" style='color:crimson;'>사용할 수 없는 닉네임입니다.</span>
						</div>
					</div>
					<div>
						<div>전화번호</div>
						<div>
							<input type="tel" name="phone" id="new-phone" value="${loggedMember.phone }" maxlength="11">
						</div>
					</div>
					<div>
						<div>이메일</div>
						<div>
							<input type="email" name="email" id="new-email" value="${loggedMember.email }">
						</div>
					</div>
					<div>
						<div>출생년도</div>
						<div>
							<input type="text" name="birth" id="new-birth" value="${loggedMember.birth }년" readonly>
						</div>
					</div>
					<div>
						<div>성별</div>
						<div>
							<input type="text" name="gender" id="new-gender" value="${loggedMember.gender=='M'?'남자':'여자' }" readonly>
						</div>
					</div> 
					<div>
						<div><label for="position">포지션</label></div>
						<div>
						     <select class="select-control" name="position" id="new-position">
						        <option>선택</option>
						        <option <c:if test="${loggedMember.position == 'LWF'}">selected</c:if>>LWF</option>
						        <option <c:if test="${loggedMember.position == 'ST'}">selected</c:if>>ST</option>
						        <option <c:if test="${loggedMember.position == 'RWF'}">selected</c:if>>RWF</option>
						        <option <c:if test="${loggedMember.position == 'LWM'}">selected</c:if>>LWM</option>
						        <option <c:if test="${loggedMember.position == 'RWM'}">selected</c:if>>RWM</option>
						        <option <c:if test="${loggedMember.position == 'CAM'}">selected</c:if>>CAM</option>
						        <option <c:if test="${loggedMember.position == 'CDM'}">selected</c:if>>CDM</option>
						        <option <c:if test="${loggedMember.position == 'LM'}">selected</c:if>>LM</option>
						        <option <c:if test="${loggedMember.position == 'CM'}">selected</c:if>>CM</option>
						        <option <c:if test="${loggedMember.position == 'RM'}">selected</c:if>>RM</option>
						        <option <c:if test="${loggedMember.position == 'LWB'}">selected</c:if>>LWB</option>
						        <option <c:if test="${loggedMember.position == 'RWB'}">selected</c:if>>RWB</option>
						        <option <c:if test="${loggedMember.position == 'LB'}">selected</c:if>>LB</option>
						        <option <c:if test="${loggedMember.position == 'CB'}">selected</c:if>>CB</option>
						        <option <c:if test="${loggedMember.position == 'GK'}">selected</c:if>>GK</option>
						      </select>
						    </div>
					</div>
					<div>
						<div><label for="location">지역</label></div>
						<div>
					   		<select class="select-control" name="location" id="new-location">
						        <option>선택</option>
						        <option <c:if test="${loggedMember.location == '서울'}">selected</c:if>>서울</option>
						        <option <c:if test="${loggedMember.location == '경기'}">selected</c:if>>경기</option>
						        <option <c:if test="${loggedMember.location == '강원'}">selected</c:if>>강원</option>
						        <option <c:if test="${loggedMember.location == '충청'}">selected</c:if>>충청</option>
						        <option <c:if test="${loggedMember.location == '전라'}">selected</c:if>>전라</option>
						        <option <c:if test="${loggedMember.location == '경상'}">selected</c:if>>경상</option>
						        <option <c:if test="${loggedMember.location == '제주'}">selected</c:if>>제주</option>
						    </select>
						</div>
					</div>

					<div>
						<div>프로필</div>
						<div id="profile-container">
								<c:if test="${loggedMember.profile != null }">
									<input type="hidden" name="oldProfile" id="oldProfile" value="${loggedMember.profile }"/>
									<img id="profileImg" src="${path }/resources/upload/member-profile/${loggedMember.profile }"/>
								</c:if>
								<c:if test="${loggedMember.profile == null }">
									<img id="profileImg" src="${path }/resources/images/user.png"/>
								</c:if>
								<span id="profileClear" class="badge badge-pill badge-dark" onclick="profileClear()">&times;</span>
								<br/>
								<input type="file" name="profile" id="new-profile" accept=".jpg,.jpeg,.png,.gif" onchange="LoadImg(this)">
						</div>
					</div>
					
					<div class="update-btn-set">
						<input id="cancel" type="button" value="취소"> 
						<input id="leave" type="button" value="탈퇴"> 
						<input type="submit" value="수정">
					</div>
				</form>
			</div>
		</div>
	</div>

<script>
	var onsubmit_pass = 0;
	var onsubmit_nick = 0;
	

	
	$("#new-password").blur(function newpasswordCheck(){
		var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
		var newPassword = $('#new-password').val();

		if(!passwordCheck.test($('#new-password').val()))
		{
			$("#val-pass-ok-up").hide();
			$("#val-pass-no-up").show();
			onsubmit_pass = 0;
		}
		else
		{
			$("#val-pass-ok-up").show();
			$("#val-pass-no-up").hide();
			onsubmit_pass = 1;
		}
		if(newPassword=='')
		{
			console.log("password공란");
			$("#val-pass-ok-up").hide();
			$("#val-pass-no-up").hide();
			onsubmit_pass = 1;
		}
	})
	
	$('#new-password-check').blur(function newpassCheck(){
		if($('#new-password').val() == $('#new-password-check').val())
		{
			$('#val-checkpass-no-up').hide();
		}
		else
		{
			$('#val-checkpass-no-up').show();
			$('#new-password-check').val('');
			$('#new-password').focus();
		}
	})
	
	$('#new-nickname').blur(function newcheckNickname()
	{
		$.ajax({
        	url: '<%=request.getContextPath()%>/member/checkNickname.do?nickname='+$("#new-nickname").val()+'&memberId='+$("#new-memberId").val(),
        	type: 'get',
        	dataType: 'text',
        	success: data => {
        		if(data == 'true' && $("#new-nickname").val().trim().length>0 )
        		{
        			$("#val-nick-no-up").hide();
        			$("#val-nick-ok-up").show();
        			onsubmit_nick = 1;
        		}
        		else
        		{
        			$("#val-nick-ok-up").hide();
        			$("#val-nick-no-up").show();
        			onsubmit_nick = 0;
        		}
        	}
        });

	});
	
	$("#new-phone").keyup(function(event){

	    var inputVal = $(this).val();
	    $(this).val(inputVal.replace(/[^0-9]/gi,''));

	});
	
	
	//파일선택시 미리보기
	function LoadImg(value){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#profileImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	} 

	function profileClear(){
		$('#oldProfile').val('');
		$('#profileImg').attr('src', '${path }/resources/images/user.png');
		
	}
	
	function valSubmit_update()
	{
		console.log(onsubmit_nick);
		console.log(onsubmit_pass);
		if(onsubmit_nick!=1 || onsubmit_pass!=1)
		{
			return false;
		}
	}

</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</html>