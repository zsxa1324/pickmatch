<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<table>
		<thead class="thead-light">
			<tr>
				<th scope="col"></th>
				<th scope="col">번호</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">상태</th>
			</tr>

			<c:forEach items="${list }" var="l" varStatus="vs">
				
				<tbody>
					<tr>
						<td><input type="checkbox"/></td>
						<th scope="row">${vs.count }</th>
						<td>${l['MEMBERID'] }</td>
						<td>${l['MEMBERNAME'] }</td>
						<td>${l['STATUS']=='Y'?'활성화':'비활성화' }</td>
						</button></td>
					</tr>
				</tbody>
			</c:forEach>
		</thead>
	</table>
</body>
</html>