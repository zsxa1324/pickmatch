<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>    

<section>
	<article>
		<div class="main_contents">
			<div class="match_info_view">
				<div class="lt">
					<div class="vs_box">
						<div class="team_wrap">
							<dl>
							<dt>${m.teamhome }</dt>
							</dl>
							<p></p>
							<dl>
							
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
