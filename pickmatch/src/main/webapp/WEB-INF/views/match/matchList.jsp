<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.kh.pickmatch.model.vo.Match" %>
<%@ page import="java.text.*" %>
<%
List<Match> list=(List)request.getAttribute("list");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title"/>
</jsp:include>    
    

<link href='${path }/resources/packages/core/main.css' rel='stylesheet' />
<link href='${path }/resources/packages/daygrid/main.css' rel='stylesheet' />
<script src='${path }/resources/packages/core/main.js'></script>
<script src='${path }/resources/packages/interaction/main.js'></script>
<script src='${path }/resources/packages/daygrid/main.js'></script>
<script src='${path }/resources/packages/core/locales-all.js'></script>
<c:set var="goguma" value="${list }"></c:set>

<script>
var d = new Date();
var fYear = d.getFullYear();
var pMonth = d.getMonth()+1;
var gDate = d.getDate();
var today1 =fYear+"-"+pMonth+"-"+gDate; 

$(document).ready(function(){
	
	

	var eventData=[
		<%--  <%
		for(Match m:list){	
		%> 
		{
		/* "title":'ㅎㅎㅎㅎ', */
		<%if(m.getTeamHome()!=null&&m.getTeamAway()!=null){%>
		
		"title":'매치완료경기',
		
		<%}else if(m.getTeamAway()==null){%>
		
		"title":'미매치경기',
		
		<%}%>
		"start":'<%=new SimpleDateFormat("yyyy-MM-dd").format(m.getMatchDate())%>'
		},
		
		 <%
		}
		%>  --%>
	
		
		<c:forEach items="${ofMatch}" var="c" varStatus="vs">
		{
			"id" : '1',
			"title":'매치완료경기(${c.C})',
			"start":'${c.CC}'
		},

		</c:forEach>
		
		<c:forEach items="${icMatch}" var="f">
		{
			"id":'2',
			"color":"#FF0000",
			"title":'미매치경기(${f.F})',
			"start":'${f.FF}',
			
		},
	
		</c:forEach>
		
		
	]
	 var calendarEl = document.getElementById('calendar');
     var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      defaultDate: today1,
      lang:"ko",
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: eventData,
	  eventClick:function(event){
		
			console.log(event.event);
			var d2=new Date(event.event.start);
			var fYear2 = d2.getFullYear();
			var pMonth2 = d2.getMonth()+1;
			var gDate2 = d2.getDate();
			var today3 =fYear2+"-"+pMonth2+"-"+gDate2;
			var id=event.event.id;
			console.log(id);
			console.log(today3);
			
			$.ajax({
				url:"${path}/match/matchContent",
				dataType:"html",
				type:"POST",
				data:{"matchDate":today3,"id":id},
				success:function(data){
					$("#result").html(data);
					$("html,section").scrollTop(document.body.scrollHeight);
				}
				
			});
		
	}
    });

    calendar.render();
});




</script>
 <style>
 #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
</style> 
<section>
 <div id='calendar'></div>
 
 <div id="result"></div>
</section>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
