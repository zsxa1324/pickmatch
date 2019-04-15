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
    		/* height: 500px; */
    	}
    	
		.mypage-wrapper
        {
            width: 90%;
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
            font-size: 25px;
            margin: auto;
            font-weight: bold;
            color: black;
        }
              
       
        .mypage-span
        {
            width: 100%;
            
            /* margin-bottom : 70px; */
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

		.mypage-section-wrapper
		{
			width : 100%;
			display : flex;
			flex-flow: row;
			align-content: center;
		}
		.mypage-section-wrapper > div:nth-of-type(1){flex: 1 1 0;}
		.mypage-section-wrapper > div:nth-of-type(2){flex: 1 1 0;}
		
		.mypage-section
		{
			width : 45%;
		}
		
		.mypage-body
		{
			margin : 40px auto;
		}
		
</style>

<section>
	<div class="mypage-wrapper">
		<div class="mypage-header">
			<div class="mypage-title">아이디/비밀번호 찾기</div>
		</div>
		<div class="mypage-section-wrapper">
		<div class="mypage-section">
			<div class="mypage-span">아이디를 찾기 위해 이름과 이메일을 입력해주세요.</div>
			<div class="mypage-body">
				<div class="member-update-wrapper">
					<form action="${path }/member/findId.do" method="post" class="member-update-frm" autocomplete="off">
						<div class="form-group">
							<input type="text" class="form-control" name="memberName"
								placeholder="이름">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email"
								placeholder="이메일">
						</div>
						<div class="update-btn-set">
							<input type="submit" class="btn btn-primary" value="찾기">
						</div>
					</form>
					
				</div>
			</div>
		</div>
		<div class="mypage-section">
			<div class="mypage-span">비밀번호를 찾기 위해 아이디를 입력해주세요.</div>
			<div class="mypage-body">
				<div class="member-update-wrapper">
					<form action="${path }/member/findPass.do" method="post" class="member-update-frm" autocomplete="off">
						<div class="form-group">
							<input type="text" class="form-control" name="memberId"
								placeholder="아이디">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email"
								placeholder="이메일">
						</div>
						<div class="update-btn-set">
							<input type="submit" class="btn btn-primary" value="찾기">
						</div>
					</form>
				</div>
			</div>

		</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</html>