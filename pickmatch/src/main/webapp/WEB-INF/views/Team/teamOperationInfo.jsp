<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="" name="pageTitle"/>
</jsp:include>

<section id='operationInfo'>
	<!-- 계좌 정보보기 -->
	<div class='operation_left'>
		<c:forEach var="map" items="${listTMember}">
			<c:if test="${memberId eq map['MEMBERID']}">
				<c:if test="${map['AUTHORITY'] ne '팀원'}">
					<c:set var="auth" value="posible"/>
				</c:if>
			</c:if>
		</c:forEach>
	
		<c:if test="${!empty account && auth eq 'posible'}">
			<button id="accountBtn" class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#accountReviseModal">계좌수정</button>
		</c:if>
		<c:if test="${!empty account && auth ne 'posible'}">
			<button id="accountBtn" onclick='reviseBtn()' class="btn btn-outline-secondary" type="button">계좌수정</button>
		</c:if>
		<table class='account'>
			<thead>
				<tr>
					<th>정보</th>
					<th>내용</th>
				</tr>
			</thead>
			<c:if test="${!empty account}">
				<tbody>
					<tr>
						<th>예금주</th>
						<td>${account['accountHolder']}</td>
					</tr>
					<tr>
						<th>은행명</th>
						<td>${account['bankName']}</td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td>${account['accountNumber']}</td>
					</tr>
					<tr>
						<th>회비</th>
						<td>${account['money']}원(인당)</td>
					</tr>
				</tbody>
			</c:if>
			<c:if test="${empty account}">
				<tbody>
					<tr>
						<td colspan="2" style="width: 300px;">팀원들에게 계좌정보를 알려주세요!
							<button id='accountEnrollBtn' class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#accountEnrollModal">계좌등록</button>
						</td>
					</tr>
				</tbody>
			</c:if>
		</table>
		
		<!-- 입출금 내역보기 -->
		<div id='scroll1'>
			<table class='moneyHistory'>
				<thead>
					<tr>
						<th>입/출금</th>
						<th>이름(닉네임)</th>
						<th>금액(원)</th>
						<th>입/출금 내용</th>
						<th>기입날짜</th>
					</tr>
				</thead>
				<c:if test="${empty listMHistory}">
					<tbody>
						<tr>
							<th colspan="5"><h4>입/출금 내역이 없습니다.</h4></th>
						</tr>
					</tbody>
				</c:if>
				<c:if test="${!empty listMHistory}">
					<c:forEach var="map" items="${listMHistory}">
						<tbody>
							<tr>
								<td>${map['INOUTTYPE']}</td>
								<td>${map['MEMBERNAME']}(${map['NICKNAME']})</td>
								<td><c:if test="${map['INOUTTYPE']} eq '입금'">(+)</c:if><c:if test="${map['INOUTTYPE']} eq '출금'">(-)</c:if>${map['MONEY']}</td>
								<td>${map['CONTENT']}</td>
								<td>${map['INOUTDATE']}</td>
							</tr>
						</tbody>
					</c:forEach>
				</c:if>
			</table>
		</div>
		
		<c:if test="${!empty account && auth eq 'posible'}">
			<button id="historyBtn" class="btn btn-outline-secondary" type="button" data-toggle="modal" data-target="#moneyHistoryModal">내역작성</button>
		</c:if>
		<c:if test="${!empty account && auth ne 'posible'}">
			<button id="historyBtn" onclick='reviseBtn()' class="btn btn-outline-secondary" type="button">내역작성</button>
		</c:if>
		
		<input style="margin-left: 180px;" id='totalMoney' type="number" readonly value="${account['totalMoney']}"/>원
	</div>
	
	<!-- 개인당 회비여부 -->
	<div class='operation_right'>
		<input id="month" type="month" min="2019-01" max='2025-01' value="${currentDate.substring(0, 7)}"/>
		<div id='scroll2'>
			<table class='moneyCheck'>
				<thead>
					<tr>
						<th>NO</th>
						<th>이름(닉네임)</th>
						<th>position</th>
						<th>직위</th>
					</tr>
				</thead>
				<c:forEach var="map" items="${listTMember}" varStatus="no">
					<tbody>
						<tr>
							<td>${no.index+1}</td>
							<th>${map['MEMBERNAME']}(${map['NICKNAME']})</th>
							<td>${map['POSITION']}</td>
							<td>${map['AUTHORITY']}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</section>


	
	<!-- 계좌등록 모달창 구현 -->
	<div id='accountEnrollModal' class="modal">
		<div class="modal-dialog" role="document">
	  		<div class="modal-content">
	    		<div class="modal-header">
	        		<h5 class="modal-title">계좌등록</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        			<span aria-hidden="true">&times;</span>
	      			</button>
	      		</div>
	      		<div class="modal-body">
	      			<form action="${path}/team/teamaccountEnroll" method="post">
				      	<label>예금주</label class="col-sm-2 col-form-label"><input type='text' name="accountHolder" required/><br/>
						<label>은행명</label class="col-sm-2 col-form-label"><input type='text' name="bankName" required/><br/>
						<label>계좌번호</label class="col-sm-2 col-form-label"><input type='text' name="accountNumber" required/><br/>
						<label>회비(금액)</label class="col-sm-2 col-form-label"><input type='number' name="money" min="0" step="1000" required/><br/>
						<input type="hidden" name="teamName" value="${teamName}">
						<div class="modal-footer">
					    	<input type="submit" class="btn btn-primary" value="완료"></button>
					    	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			    		</div>
					</form>
		    	</div>
	    	</div>
		</div>
	</div>
	
	<!-- 계좌수정 모달창 구현 -->
	<div id='accountReviseModal' class="modal">
		<div class="modal-dialog" role="document">
	  		<div class="modal-content">
	    		<div class="modal-header">
	        		<h5 class="modal-title">계좌수정</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        			<span aria-hidden="true">&times;</span>
	      			</button>
	      		</div>
	      		<div class="modal-body">
	      			<form action="${path}/team/teamaccountRevise" method="post">
				      	<label>예금주</label class="col-sm-2 col-form-label"><input type='text' name="accountHolder" value="${account['accountHolder']}" required/><br/>
						<label>은행명</label class="col-sm-2 col-form-label"><input type='text' name="bankName" value="${account['bankName']}" required/><br/>
						<label>계좌번호</label class="col-sm-2 col-form-label"><input type='text' name="accountNumber" value="${account['accountNumber']}" required/><br/>
						<label>회비(금액)</label class="col-sm-2 col-form-label"><input type='number' name="money" min="0" step="1000" value="${account['money']}" required/><br/>
						<input type="hidden" name="teamName" value="${teamName}">
						<div class="modal-footer">
					    	<input type="submit" class="btn btn-primary" value="완료"></button>
					    	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			    		</div>
					</form>
		    	</div>
	    	</div>
		</div>
	</div>
	
	<!-- 입/출금 내역 모달창 구현 -->
	<div id='moneyHistoryModal' class="modal">
		<div class="modal-dialog" role="document">
	  		<div class="modal-content">
	    		<div class="modal-header">
	        		<h5 class="modal-title">입/출금 내역작성</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        			<span aria-hidden="true">&times;</span>
	      			</button>
	      		</div>
	      		<div class="modal-body">
	      			<form action="${path}/team/MoneyHistoryEndroll" method="post">
				      	<label>입/출금 유형</label class="col-sm-2 col-form-label">
						    <select id="inoutType" name="inoutType" required>
						    	<option value="입금" selected>입금</option>
						    	<option value="출금">출금</option>
						    </select>
						<br/>
						<label>아이디</label class="col-sm-2 col-form-label"><input type='text' name="memberId" value="${memberId}" readonly/><br/>
						<label>금액(원)</label class="col-sm-2 col-form-label"><input type='number' name="money" min="0" step="1000" required/><br/>
						<label>입/출금 내용</label class="col-sm-2 col-form-label"><input type='text' name="content" required placeholder="10자 내외로 입력가능" maxlength="13"/><br/>
						<input type="hidden" name="teamName" value="${teamName}">
						<div class="modal-footer">
					    	<input type="submit" class="btn btn-primary" value="완료"></button>
					    	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			    		</div>
					</form>
		    	</div>
	    	</div>
		</div>
	</div>
	
	<script>
	
		$('#month').on('change', function() {
			location.href='${path}/team/teamOperationInfo?selectDate=' + $(this).val();
		});
		
		function reviseBtn() {
			alert('권한이 없습니다.');
			console.log('${listTMember}');
		}
	
	</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
