<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅창 구현</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<input type="text" id="msg"/>
	<input type="button" id="btn" value="전송"/>
	<input type="file" id="file" name="upfile"/>
	<input type="button" id="filebtn" value="전송"/>
	<div id="container"></div>
	
	<script>
		var socket;
		var nickname = prompt("닉네임을 입력하세요");
		$(function(){
			$("#filebtn").click(function(){
				var file = $("#file")[0].files[0];
				console.log(file);
				socket.binaryType = "arraybuffer";
				var reader = new FileReader();
				
				reader.onload = function(e) {
					console.log(e);
					var msg = {"nickname" : nickname, "msg" : file.name, "flag" : "file"};
					socket.send(JSON.stringify(msg));
					socket.send(e.target.result);
				}
				// 파일 ArrayBuffer 형식으로 변환해서 읽어들임, local 웹브라우저가 함부로 접근못하게막음, 운영체제 파일시스템까지 접근하면 위험, 내가 가진 정보 공유하기 위해 통신하는 수단
				<!-- 웹브라우저가 임시경로에 저장하고 거기에서 읽어올 수 있게함. FileReader 읽어올때 url 엄청김-->
				reader.readAsArrayBuffer(file);
			});
			
			socket = new WebSocket("ws://" + document.location.host +"/spring/chatting"); 
			/* socket = new WebSocket("ws:192.168.20.20:9090/spring/chatting");  */
			/* 
				웹소켓 객체안의 메소드를 구현하면됨
				onopen, onmessage, onclose, onerror 속성~ 이벤트 받아들임
				구현함수를 해당 속성에 대입하면됨!
				소켓 메세지를 서버로 전송할 때 사용하는 send()가 있음
			*/
				// 소켓세션이 연결되면 실행되는 함수
				socket.onopen = function(e){
					console.log(e);
				}
			
				socket.onmessage= function(e) {
					console.log(e);
					var msg = JSON.parse(e.data);
					console.log(msg);
					$("#container").append("<p>" + msg["nickname"] + " : " + msg["msg"] + "</p>");
				}
				/* socket.onmessage= message;
				
				function message(e) {
					console.log(e);
				} */
				
				socket.onclose = function(e) {
					console.log(e);
				}
				
				$("#btn").click(function(){
					// whisper : 선택한 사람한테만 보냄
					var msg = {"nickname" : nickname, "msg" : $("#msg").val()};
					// 자바스크립트 객체를 스트링형식으로 바꿈
					socket.send(JSON.stringify(msg));
					$("#msg").val("");
				});
		});
		
		$("#msg").keyup(function(){
			if (event.key == "Enter") {
				$("#btn").trigger("click");
			}
		})
		
	</script>
</body>
</html>