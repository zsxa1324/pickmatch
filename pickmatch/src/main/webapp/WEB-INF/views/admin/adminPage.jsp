<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Hello Spring" name="title" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

#tabcontent {
	display: block;
	padding: 6px 12px;
	border: 1px solid #EAEAEA;
}

a {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}

a:visited {
	color: black;
	text-decoration: none;
}

li {
	float: left;
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
}

.listth {
	background-color: #212121;
	color: white;
}

.clickable {
	cursor: pointer;
}

.hover {
	text-decoration: underline;
}
/* .odd{ background: #FFC;}
.even{ background: #FF9;} */
.active {
	width: 10px;
	height: 10px;
	background: #f60;
	color: white;
}
table.paginated{
width: 75%px;
height:500px;
}
table.paginated tr{
height: 43px;
border-bottom: 1px solid #D8D8D8;
}
</style>
<style type="text/css">
</style>

<c:set var="path" value="${pageContext.request.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	$(function() {
		// tab operation
		$('.tabmenu').click(function(event) {
						
			var activeTab = $(this).attr('data-tab');
			var url=$(this).children('a').attr("href");
			console.log(this);
			flag=$(this).attr("data-tab");
			var path="${path}";
			console.log(path+url);
			$('li').css('background-color', 'white');
			$(this).css('background-color', '#EAEAEA');
			
			$.ajax({
				type : 'GET',				//get방식으로 통신
				cache : false,
				url : "${path}"+url ,    //탭의 data-tab속성의 값으로 된 html파일로 통신
				dataType : "JSON",            //html형식으로 값 읽기
				error : function() {          //통신 실패시
					alert('통신실패!');
				},
				headers:{"cache-control":"no-cache"},
				success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.					
					/* $('#tabcontent').html(data); */
					if(url=='/admin/memberList.do'){
						console.log("분기처리성공");
					
					var lists=data.list;
					console.log(lists);
					
					var temp="<thead><tr><td class='listth' style='width:150px;' ><input type='checkbox' id='allCheck'  name='checkAll'></td>"+
					"<td class='listth' style='width:115px;'>번호</td>"+
					"<td class='listth' style='width:130px' >아이디</td>"+
					"<td class='listth' style='width:150px' >이름</td>"+
					"<td class='listth' style='width:100px' >상태</td></tr></thead>";
					for (var i=0; i< lists.length; i++) {
						temp += '<tr><td class="listtd" >' + '<input name="checkOne" onclick="setBg(this)" value="'+ lists[i].MEMBERID +'"type="checkbox"/>' +'</td>' +
						'<td class="listtd" >' + (i+1) +'</td>' +
						'<td class="listtd" >' + lists[i].MEMBERID +'</td>' +
						'<td class="listtd" >' + lists[i].MEMBERNAME +'</td>' +
						'<td class="listtd" >' + (lists[i].STATUS == "Y" ? "활성화" : "비활성화") + '</td>' ;
						
						}
					}else if(url=='/admin/teamList.do'){
						var lists=data.list;
						console.log(lists);
						var temp="<thead><tr><td class='listth' style='width:150px;' ><input type='checkbox' name='checkAll' id='allcheck'/></td>"+
						"<td class='listth' style='width:115px;'>번호</td>"+
						"<td class='listth' style='width:130px' >팀명</td>"+
						"<td class='listth' style='width:150px' >팀 개설일</td>"+
						"<td class='listth' style='width:100px' >상태</td></tr></thead>";
						for (var i=0; i< lists.length; i++) {
							temp += '<tr><td class="listtd" >' + '<input onclick="setBg(this)" name="checkOne" value="'+ lists[i].TEAMNAME +'"type="checkbox"/>' +'</td>' +
							'<td class="listtd" >' + (i+1) +'</td>' +
							'<td class="listtd" >' + lists[i].TEAMNAME +'</td>' +
							'<td class="listtd" >' + lists[i].OPENINGDATA +'</td>' +
							'<td class="listtd" >' + (lists[i].TEAMSTATUS=='Y' ? "활성화" : "비활성화") + '</td>' ;
						}
					}
					$("#tbl").html(temp);
					page();
				}
			
			});
		});
		$('#default').click();          
		
		function page(){ 
			var reSortColors = function($table) {
			  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
			  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
			 };
			 $('table.paginated').each(function() {
			  var pagesu = 10;  //페이지 번호 갯수
			  var currentPage = 0;
			  var numPerPage = 10;  //목록의 수
			  var $table = $(this);    
			  
			  //length로 원래 리스트의 전체길이구함
			  var numRows = $table.find('tbody tr').length;
			  //Math.ceil를 이용하여 반올림
			  var numPages = Math.ceil(numRows / numPerPage);
			  //리스트가 없으면 종료
			  if (numPages==0) return;
			  //pager라는 클래스의 div엘리먼트 작성
			  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
			  
			  var nowp = currentPage;
			  var endp = nowp+10;
			  
			  //페이지를 클릭하면 다시 셋팅
			  $table.bind('repaginate', function() {
			  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
			  
			   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
			   $("#remo").html("");
			   
			   if (numPages > 1) {     // 한페이지 이상이면
			    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
			     nowp = 0;     // 1부터 
			     endp = pagesu;    // 10까지
			    }else{
			     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
			     endp = nowp+pagesu;   // 10까지
			     pi = 1;
			    }
			    
			    if (numPages < endp) {   // 10페이지가 안되면
			     endp = numPages;   // 마지막페이지를 갯수 만큼
			     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
			    }
			    if (nowp < 1) {     // 시작이 음수 or 0 이면
			     nowp = 0;     // 1페이지부터 시작
			    }
			   }else{       // 한페이지 이하이면
			    nowp = 0;      // 한번만 페이징 생성
			    endp = numPages;
			   }
			   // [처음]
			   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
			          currentPage = 0;   
			          $table.trigger('repaginate');  
			          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
			      }).appendTo($pager).addClass('clickable');
			    // [이전]
			      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
			          if(currentPage == 0) return; 
			          currentPage = currentPage-1;
			    $table.trigger('repaginate'); 
			    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			    // [1,2,3,4,5,6,7,8]
			   for (var page = nowp ; page < endp; page++) {
			    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
			     currentPage = event.data['newPage'];
			     $table.trigger('repaginate');
			     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			     }).appendTo($pager).addClass('clickable');
			   } 
			    // [다음]
			      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
			    if(currentPage == numPages-1) return;
			        currentPage = currentPage+1;
			    $table.trigger('repaginate'); 
			     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			    // [끝]
			   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
			           currentPage = numPages-1;
			           $table.trigger('repaginate');
			           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			     
			     $($(".page-number")[2]).addClass('active');
			reSortColors($table);
			  });
			   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
			   $pager.appendTo($table);
			   $table.trigger('repaginate');
			 });
			}
		
	});
	</script>

<section>
	<article>
		<div id="container">
			<ul class="tab">
				<li data-tab="tab1" class="tabmenu" style="border: solid 1px lightgray;" id="default"><a class="tabmenua" 
					href="/admin/memberList.do">회원 정보</a></li>
				<li data-tab="tab2" style="border: solid 1px lightgray;" class="tabmenu"><a class="tabmenua"
					href="/admin/teamList.do">팀 정보</a></li>
			</ul>
			<form id="activeForm" name="activeForm" action="${path }/admin/memberActive">
				<div id="tabcontent">
				<button onclick="beactive()" type="button" class="btn btn-danger"
						style="float: right;">비활성화</button>
					<button onclick="active()" type="button" class="btn btn-primary"
						style="float: right;">활성화</button>
					
					<table class="tbl paginated" id="tbl"></table>
				</div>
			</form>
			
		</div>
		<script>
			function active(){
				/* var status = $("#status").val(); */
				/* var select = $(".paginated tbody tr td input").val(); */
				var select = $(".paginated").children().children().children().children(":checked");
				var Array=[];
				$.each(select,function(index,item){
					console.log(index);
					console.log(item);
					Array.push(item.value);
					console.log(typeof(Array));
					
				});
				if(flag=='tab1'){
				$("#activeForm").attr("action","${pageContext.request.contextPath}/admin/memberActive?memberList="+Array);
				$("#activeForm").attr("method","post");
				$("#activeForm").submit();
				}else{
				$("#activeForm").attr("action","${pageContext.request.contextPath}/admin/teamActive?teamList="+Array);
				$("#activeForm").attr("method","post");
				$("#activeForm").submit();
				}
			}
			
			function beactive(){
				var select = $(".paginated").children().children().children().children(":checked");
				var Array=[];
				$.each(select,function(index,item){
					console.log(index);
					console.log(item);
					Array.push(item.value);
					console.log(typeof(Array));
					
				});
				if(flag=='tab1'){
				$("#activeForm").attr("action","${pageContext.request.contextPath}/admin/memberUnActive?memberList="+Array);
				$("#activeForm").attr("method","post");
				$("#activeForm").submit();  
				}else{
					$("#activeForm").attr("action","${pageContext.request.contextPath}/admin/teamUnActive?teamList="+Array);
					$("#activeForm").attr("method","post");
					$("#activeForm").submit(); 
				}
			
			
			}
			function setBg(t){
				td = t.parentNode;
				td.style.backgroundColor=(t.checked) ? "lightgray" : "white";
				tr = t.parentNode.parentNode;
				tr.style.backgroundColor=(t.checked) ? "lightgray" : "white";
			}
			
		function allCheckFunc( obj ) {
				$("[name=checkOne]").prop("checked", $(obj).prop("checked") );
		}

		/* 체크박스 체크시 전체선택 체크 여부 */
		function oneCheckFunc( obj )
		{
			var allObj = $("[name=checkAll]");
			var objName = $(obj).attr("name");

			if( $(obj).prop("checked") )
			{
				checkBoxLength = $("[name="+ objName +"]").length;
				checkedLength = $("[name="+ objName +"]:checked").length;

				if( checkBoxLength == checkedLength ) {
					allObj.prop("checked", true);
				} else {
					allObj.prop("checked", false);
				}
			}
			else
			{
				allObj.prop("checked", false);
			}
		}

		$(function(){
			/* $("[name=checkAll]").click(function(){
				allCheckFunc( this );
				
			}); */
			$(document).on("click","[name=checkAll]",function(){
				allCheckFunc(this);
			})
			$("[name=checkOne]").each(function(){
				 $(this).click(function(){
					oneCheckFunc( $(this) );
				}); 
				/* $(document).on("click",this,function(){
					oneCheckFunc( $(this) );
				}); */
			});
		});
			
			
			</script>
	</article>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
