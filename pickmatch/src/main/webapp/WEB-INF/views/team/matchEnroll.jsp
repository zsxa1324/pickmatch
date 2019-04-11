<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="" name="pageTitle"/>
</jsp:include>
<section id="matchEnroll">

	<div style="width: 830px; height: 780px; margin: 50px 100px;">
		<div id="home" style=" margin-top: 10px; text-align: center; float: left; display: inline-block;">
		
			<div style="width: 120px; height: 120px; background-color: gray; border-radius: 80px; margin: 10px 40px"></div>
			
			<div id='team' style="width: 200px; line-height: 40px; background-color: #2478FF; border-radius: 5px;">무적축구단</div>
			
			<div style="width: 80px; height: 40px; background-color: white; border-radius: 5px; margin: 10px 60px; padding-top: 10px;"></div>
			
			<div style="width: 200px; background-color: green; border-radius: 5px;">
			
				<div id='scroll'>
					<div class="goal" style="font-size: 20px;">1`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">7`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary goalDel">삭제</button></div>
					<div class="goal" style="font-size: 20px;">13`&nbsp;&nbsp;김동현<button onclick="del()" style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">24`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">45`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">88`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">88`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">88`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">88`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">88`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">88`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div class="goal" style="font-size: 20px;">88`&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<script>
						function add() {
							
							var homeTeam = $('#team').val();
							var min = $('#min').val();
							var name = $('#name').val();
							
							$.ajax({
								url: '${path}/team/teamMatchEnrollAjax',
								type: 'POST',
								data: {"min" : min, "name" : name, "team" : team},
								success: function(data) {
										
									var div = $('<div class="goal">');
									div.append(data[min]);
									div.append('nbsp;nbsp;');
									div.append(data[name]);
									div.append('<button class="btn btn-primary" onclick="del()" value='${goalNo}'>삭제</button>')
									
								}
							});
						}
					</script>
				</div>
				
				<select id="min" name="min" required style="width: 50px; vertical-align: bottom;">
					<c:forEach var="min" begin="0" end="99" step="1">
				    	<option value="${min}">${min}</option>
					</c:forEach>
			    </select>
			    <select id="min" name="min" required style="width: 80px; vertical-align: bottom;">
					<c:forEach var="name" begin="0" end="100" step="1">
				    	<option value="김동현">김동현</option>
					</c:forEach>
			    </select>
			    <button class="btn btn-primary" onclick = "add()" style="padding: 3px 10px; line-height: 20px; vertical-align: bottom;">추가</button>
			</div>
			
		</div>
		
		<div id="vs" style=" margin: 60px 0 0 30px; text-align: center; display: inline-block;">
		
			<input style="margin: 50px 55px; float: left; border-radius: 5px; width: 60px;" type="number" name="homescore" min="0" max="100"/>
			
			<div style="width: 40px; vertical-align: middle; line-height: 60px; background-color: white; border-radius: 5px; float: left; margin-top: 40px;">vs</div>
			
			<input style="float: left; border-radius: 5px; margin: 50px 55px; width: 60px;" type="number" name="awayscore" min="0" max="100"/>
			
			<div style="height: 80px; background-color: green; border-radius: 5px; margin-top: 170px; margin-left: -10px;">
			
				<p>2019-4-17(수) 15:00</p>
				<p>종합운동장</p>
				
			</div>
			
			<div style="width: 150px; line-height: 150px; background-color: white; margin: 40px 0 0 110px; border-radius: 30px;">
				득점
			</div>
			
		</div>
		
		<div id="away" style=" margin-top: 10px; text-align: center; float: right; display: inline-block;">
	
			<div style="width: 120px; height: 120px; background-color: gray; border-radius: 80px; margin: 10px 40px"></div>
			
			<div id='team' style="width: 200px; line-height: 40px; background-color: #2478FF; border-radius: 5px;">KH축구단</div>
			
			<div style="width: 80px; height: 40px; background-color: white; border-radius: 5px; margin: 10px 60px; padding-top: 10px;"></div>
			
			<div style=" width: 200px; background-color: green; border-radius: 5px;">
			
				<div id='scroll'>
					<div style="font-size: 20px;">1`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div style="font-size: 20px;">7`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div style="font-size: 20px;">13`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div style="font-size: 20px;">24`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div style="font-size: 20px;">45`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div style="font-size: 20px;">88`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div style="font-size: 20px;">88`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div style="font-size: 20px;">88`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					<div style="font-size: 20px;">88`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김동현<button style="float: right; padding: 0px 10px;" class="btn btn-primary">삭제</button></div>
					
					<script>
						function add() {
							
							var team = $('#team').val();
							var min = $('#min').val();
							var name = $('#').val();
							
							$.ajax({
								url: '${path}/team/teamMatchEnrollAjax',
								type: 'POST',
								data: {"min" : min, "name" : name, "team", team},
								success: function(data) {
									
								}
							});
						}
					</script>
				</div>
			
				<select id="min" name="min" required style="width: 50px; vertical-align: bottom;">
					<c:forEach var="min" begin="0" end="99" step="1">
				    	<option value="${min}">${min}</option>
					</c:forEach>
			    </select>
			    <select id="name" name="name" required style="width: 80px; vertical-align: bottom;">
					<c:forEach var="name" begin="0" end="100" step="1">
				    	<option value="${name}">${name}</option>
					</c:forEach>
			    </select>
			    <button class="btn btn-primary" onclick = "add()" style="padding: 3px 10px; line-height: 20px; vertical-align: bottom;">추가</button>
			
			</div>
			
		</div>
		<div style="margin-top: 90px;">경기내용 상세입력</div>
		<textarea style="border-radius:8px; width: 830px; height: 140px;"></textarea>
		<button style="float: right;" class="btn btn-primary" type="button" onclick="location.href='${path}/team/teamMatchEnrollEnd'">입력완료</button>
		<button style="margin-right: 15px; float: right;" class="btn btn-primary" type="button">취소</button>
	</div>
	

</section>

<script>

	$('.goal').on('click', '.goalDel', function() {
		$(this).parent().remove();
	});

	function del() {
		
		$.ajax({
			
			url: '${path}/team/teamMatchEnrollDelAjax'
			type: 'POST',
			data: {"min" : min, "name" : name, "team" : team},
			success: function(data) {
				$('goal').on()
			}
			
		});
			
			
			
		
		
		
	}
	
	
</script>














<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
