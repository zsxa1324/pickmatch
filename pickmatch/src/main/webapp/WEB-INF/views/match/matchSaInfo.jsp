<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>    
<style>
div.main_contents{
background-color:white;
margin: 0 0 70px 0;
min-height:500px;
font-size:1.05em;
}
div.match_info_view{
overflow:hidden;
}
div.lt{
float:left;
width:49%;
}
div.vs_box{
height:360px;
}
</style>
<section>
	<article>
		<div class="main_contents">
			<div class="match_info_view">
				<div class="lt">
					<div class="vs_box">
						<div class="team_wrap">
							<dl style="float: left; width: 40%; text-align:center;">
							<dt style="font-size: 17px; font-weight: bold; padding: 12px 0 7px 0;">${m.teamHome }</dt>
							<dd style="height:35px; line-height: 35px; border-radius: 50px;">${m.totalPlayCount }전 ${m.win}승 ${m.draw}무 ${m.lose}패</dd>
							</dl>
							<p style="float:left; margin: 50px 0 0 5%; text-align:center;">vs</p>
							<dl>
							<dt>${sm.teamAway }</dt>
							<dd>${sm.totalPlayCount }전 ${sm.win}승 ${sm.draw}무 ${sm.lose}패</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
