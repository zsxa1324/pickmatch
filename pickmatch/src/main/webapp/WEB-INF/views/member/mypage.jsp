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
            width: 1024px;
            
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
</style>

<section>
	<div class="mypage-wrapper">
		<div class="mypage-header">
			<div class="mypage-title">마이페이지</div>
		</div>
		<div class="mypage-tab">
			
		</div>
		<div class="mypage-body">
			<div class="member-update-wrapper">
				<div class="member-update-header">회원 정보 수정</div>
				<form action="${path }/member/memberUpdateEnd.do"
					method="post" class="member-update-frm" autocomplete="off">
					<div>
						<div>아이디</div>
						<div>
							<input type="text" name="memberId" id="member-id" value="${loggedMember.memberId }" readonly="readonly">
						</div>
					</div>
					<div>
						<div>현재 비밀번호</div>
						<div>
							<input type="hidden" name="checkPw" id="check-pw"> 
							<input type="password" name="memberPw" id="member-pw">
							<div class="valid-msg"></div>
						</div>
					</div>
					<div>
						<div>새 비밀번호</div>
						<div>
							<input type="hidden" name="checkPwDif" id="check-pw-dif">
							<input type="password" name="memberPwNew" id="member-pw-new">
							<div class="valid-msg"></div>
							<span class="member-update-input-msg"> 
								현재 비밀번호와 다르게 입력<br>
								8자 이상 16자 이하 영문, 숫자, 특수문자 조합
							</span>
						</div>
					</div>
					<div>
						<div>새 비밀번호 확인</div>
						<div>
							<input type="password" name="memberPwNewCk" id="member-pw-new-ck">
							<div class="valid-msg"></div>
						</div>

					</div>
					<div>
						<div>이름</div>
						<div>
							<input type="text" name="memberName" id="member-name" value="${loggedMember.memberName }">
							<div class="valid-msg"></div>
						</div>
					</div>
					<div>
						<div>이메일</div>
						<div>
							<input type="email" name="memberEmail" id="member-email" value="${loggedMember.email }">
							<div class="valid-msg"></div>
						</div>
					</div>
					<div>
						<div>휴대폰</div>
						<div>
							<input type="tel" name="memberPhone" id="memberPhone" value="${loggedMember.phone }">
							<div class="valid-msg"></div>
						</div>
					</div>
					<!-- <div class="update-btn-set">
						<input id="cancel" type="button" value="취소"> 
						<input id="leave" type="button" value="탈퇴"> 
						<input type="submit" value="수정">
					</div> -->
				</form>
			</div>
		</div>
	</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</html>