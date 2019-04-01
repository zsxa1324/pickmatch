<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_bootswatch.scss" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_variables.scss" />
<meta charset="UTF-8">
<title>메인화면</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<div id="container">
		<header>
			<div id="header-container">
				<h2>${param.title }</h2>
			</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">match</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
		</header>
		
		
		<!-- 로그인 모달 만들기 -->
		<div class="modal fade" id="loginModal" 
		tabindex="-1" role="dialog" 
		aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
						<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="${path }/member/memberLogin.do" method="post">
					<div class="modal-body">
						<input type="text" class="form-control" 
						name="userId" 
						placeholder="아이디" required/>
						<br/>
						<input type="password" class="form-control"
						name="password" placeholder="비밀번호" required/>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-success">
						로그인</button>
						<button type="button" class="btn btn-outline-success"
						data-dismiss="modal">취소</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		