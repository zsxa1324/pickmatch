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
    		height: 500px;
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
            height: 120px;
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
              
       
        .mypage-span
        {
            width: 100%;
            
            margin-bottom : 70px;
            position: relative;
            text-align: center;
            align-self: center;
        }
        
        .mypage-span > span
        {
        	font-size: 22px;
        	color : #4582EC;
        }

        .mypage-span
        {
            flex: 1 1 0;
            align-items: center;
            justify-content: center;
        }
        
        .member-update-wrapper
        {
            font-family: 'Noto Sans KR';
            width: 100%;
            position: relative;
            
        }

        .member-update-header
        {
            font-size: 25px;
            margin: 30px 0;
            /* border-bottom: 2px solid rgb(42, 71, 114); */
            padding-bottom: 25px;
        }

     	.member-update-frm
        {
            width: 100%;
            display: flex;
            flex-flow: column nowrap;
        }
        
        .form-group
        {
        	width : 50%;
        	align-self: center;
        	margin : 0 0 7px 0;
        }
        
        .update-btn-set
        {
        	margin-top : 25px;
        	position : relative;
        	align-self: center;
        }

</style>

<section>
	<div class="mypage-wrapper">
		<div class="mypage-header">
			<div class="mypage-title">마이페이지</div>
		</div>
		<div class="mypage-span">
			<span>${loggedMember.memberId }</span>님의 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 입력해주세요.
		</div>
		<div class="mypage-body">
			<div class="member-update-wrapper">
				<form action="${path }/member/mypage.do" method="post" class="member-update-frm" autocomplete="off" enctype="multipart/form-data" >
					<div class="form-group">
						<input type="text" class="form-control" value="${loggedMember.memberId }" name="memberId" readonly="readonly">
					</div>
					<div class="form-group">
				      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
				    </div>

					<div class="update-btn-set">
						<input type="button" id="cancel" class="btn btn-secondary" value="취소"> 
						<input type="submit" class="btn btn-primary" value="확인">
					</div>
				</form>
			</div>
		</div>
	</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</html>