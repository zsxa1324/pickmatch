<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="매치 결과입력" name="pageTitle"/>
</jsp:include>
<section id="matchEnroll">

<form name='frm_matchResult' action="${path}/team/teamMatchEnrollEnd?matchNo=${matchNo}" method="post">
	
	<input type="hidden" name='homeTeam' value="${homeTeam['teamName']}"/>
	<input type="hidden" name='awayTeam' value="${awayTeam['teamName']}"/>
	
	<input type="hidden" name='homeMinarr'/>
	<input type="hidden" name='awayMinarr'/>
	<input type="hidden" name='homeNamearr'/>
	<input type="hidden" name='awayNamearr'/>
	
	<div id='container'>
		<div id="home">
		
			<div class='emblem'>
				<c:if test="${homeEmblemArr ne null}"><img style="width: 120px; height: 120px; border-radius: 80px;" src="${path}/resources/upload/team-logo/${homeEmblemArr}"/></c:if>
				<c:if test="${homeEmblemArr eq null}"><img width="120px;" height="120px;" src="${path}/resources/upload/team-logo/기본팀로고.png"/></c:if>
			</div>
			
			<div id='hometeam'>${homeTeam['teamName']}</div>
			
			<div class='score'></div>
			
			<div class='field'>
			
				<div id='homescroll'>
				</div>
				
				<select id="homemin" name="homemin" required>
					<c:forEach var="min" begin="0" end="99" step="1">
				    	<option value="${min}">${min}</option>
					</c:forEach>
			    </select>
			    <select id="homememberName" name="homememberName" required>
					<c:forEach var="homeList" items="${homeList}">
				    	<option value="${homeList['MEMBERID']}">${homeList['MEMBERNAME']}</option>
					</c:forEach>
					<c:forEach var="homemercenaryList" items="${homemercenaryList}">
				    	<option value="${homemercenaryList['MEMBERID']}">${homemercenaryList['MEMBERNAME']}</option>
					</c:forEach>
			    </select>
			    <button id='addbtn' type="button" class="btn btn-primary" onclick="homeadd()">추가</button>
			</div>
			
		</div>
		
		<div id="vs">
		
			<input id="leftscore" type="number" name="homescore" min="0" max="100" required/>
			
			<div id="inputOn">vs</div>
			
			<input id="rightscore" type="number" name="awayscore" min="0" max="100" required/>
			
			
			<div id='placeinfo'>
			
				<p style="font-size: 21px;">${m['matchDate']}&nbsp;&nbsp;&nbsp;${m['matchTime']}</p>
				<p style="font-size: 21px;">${m['playGround']}</p>
				
			</div>
			
			<div id="point">
				득점
			</div>
			
		</div>
		
		<div id="away">
	
			<div class='emblem'>
				<c:if test="${awayEmblemArr ne null}"><img style="width: 120px; height: 120px; border-radius: 80px;" src="${path}/resources/upload/team-logo/${awayEmblemArr}"/></c:if>
				<c:if test="${awayEmblemArr eq null}"><img width="120px;" height="120px;" src="${path}/resources/upload/team-logo/기본팀로고.png"/></c:if>
			</div>
			
			<div id='awayteam'>${awayTeam['teamName']}</div>
			
			<div class='score'></div>
			
			<div class='field'>
			
				<div id='awayscroll'>
				</div>
			
				<select id="awaymin" name="awaymin" required>
					<c:forEach var="min" begin="0" end="99" step="1">
				    	<option value="${min}">${min}</option>
					</c:forEach>
			    </select>
			    <select id="awaymemberName" name="awaymemberName" required>
					<c:forEach var="awayList" items="${awayList}">
				    	<option value="${awayList['MEMBERID']}">${awayList['MEMBERNAME']}</option>        <%-- ${awayList['MEMBERID']} --%>
					</c:forEach>
					<c:forEach var="awaymercenaryList" items="${awaymercenaryList}">
				    	<option value="${awaymercenaryList['MEMBERID']}">${awaymercenaryList['MEMBERNAME']}</option>
					</c:forEach>
			    </select>
			    <button id='addbtn' type="button" class="btn btn-primary" onclick="awayadd()">추가</button>
			
			</div>
			
		</div>
		<div id="ta">경기내용 상세입력</div>
		<textarea id="textarea" name="textarea"></textarea>
		<input id="input" class="btn btn-primary" type="button" onclick="re_confirm()" value="결과저장"/>
		<button id="cancel" class="btn btn-primary" type="button" onclick="location.href='${path}/team/teamMatchList'">취소</button>
	</div>
	
</form>

</section>

<script>

	$('[name=homescore]').attr('required', true);
	$('[name=awayscore]').attr('required', true);
	
	var awayscore = $('[name=awayscore]').val();
	var homescore = $('[name=homescore]').val();
	var homeNum = 0;
	var awayNum = 0;
	var homeMinarr = [];
	var awayMinarr = [];
	var homeNamearr = [];
	var awayNamearr = [];
	var hma;
	var ama;
	var hna;
	var ana;
	
 	function re_confirm() {
 		
		var result = confirm("결과를 입력하면 수정할 수 없습니다. 결과를 저장하시겠습니까?");
		
		if($('[name=homescore]').val() == '' || $('[name=awayscore]').val() == '') {
			alert('골점수를 입력바랍니다.');
			return false;
		}
		
		if(result) {
			
			for(var i = 0; i < homeNum; i++) {
				homeMinarr.push((document.getElementsByClassName('homegoal')[i].innerHTML).split('`')[0]);
				homeNamearr.push((document.getElementsByClassName('homegoal')[i].innerHTML).split('<')[0].split('&nbsp;&nbsp;')[1]);
			}
			
			for(var i = 0; i < awayNum; i++) {
				awayMinarr.push((document.getElementsByClassName('awaygoal')[i].innerHTML).split('`')[0]);
				awayNamearr.push((document.getElementsByClassName('awaygoal')[i].innerHTML).split('<')[0].split('&nbsp;&nbsp;')[1]);
			}
			
			for(var i in homeMinarr) {
				if(i == 0) hma = homeMinarr[i];
				else hma += "," + homeMinarr[i];
			}
			
			for(var i in awayMinarr) {
				if(i == 0) ama = awayMinarr[i];
				else ama += "," + awayMinarr[i];
			}
			
			for(var i in homeNamearr) {
				if(i == 0) hna = homeNamearr[i];
				else hna += "," + homeNamearr[i];
			}
			
			for(var i in awayNamearr) {
				if(i == 0) ana = awayNamearr[i];
				else ana += "," + awayNamearr[i];
			}

			$('[name=homeMinarr]').val(hma);
			$('[name=awayMinarr]').val(ama);
			$('[name=homeNamearr]').val(hna);
			$('[name=awayNamearr]').val(ana);

			console.log(homeMinarr);
			console.log(awayMinarr);
			console.log(homeNamearr);
			console.log(awayNamearr);
			
			
			$('[name = frm_matchResult]').submit();
			
		}
		
		
	}

	$(document).on('click', '.homedelbtn', function() {
		$(this).parent().remove();
		homeNum -= 1;
	});
	
	$(document).on('click', '.awaydelbtn', function() {
		$(this).parent().remove();
		awayNum -= 1;
	});
	
	function homeadd() {
		var team = $('#hometeam').html();
		var min = $('#homemin').val();
		var memberName = $('select[name=homememberName]').val();
		var memberId = $('select[name=homememberId]').val();
		var matchNo = ${matchNo};
		
		var html = min + '`&nbsp;&nbsp;' + memberName;
		var div = $('<div class="homegoal"></div>');
		div.append(html);
		div.append('<button class="btn btn-primary homedelbtn">삭제</button>');
		
		$('#homescroll').append(div);
		homeNum += 1;
	}
	
	function awayadd() {
		var team = $('#awayteam').html();
		var min = $('#awaymin').val();
		var memberName = $('select[name=awaymemberName]').val();
		var matchNo = ${matchNo};
		
		var html = min + '`&nbsp;&nbsp;' + memberName;
		var div = $('<div class="awaygoal"></div>');
		div.append(html);
		div.append('<button class="btn btn-primary awaydelbtn">삭제</button>');
		
		$('#awayscroll').append(div);
		awayNum += 1;
	}
	
</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
