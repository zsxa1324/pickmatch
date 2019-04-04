<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE htm>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/playgroundSearch.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modal.css" />
<style>

</style>

<script>

	Date.prototype.toDateInputValue = (function() {
	    var local = new Date(this);
	    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
	    return local.toJSON().slice(0,10);
	});
	$(function(){
		
		$("input[name=matchDate]").val(new Date().toDateInputValue());
		 $("#playgroundSearchBtn").click(function(){
		        $('div.modal').modal(); 
		         
		        
		    })
		$(".modal").on("shown.bs.modal", function(){
			map.relayout();
		});
		 
		$(document).on("click", ".item", function(){
			/* console.log(this);
			console.log($(this).children("div").children("input").val()); */
			/* console.log($(this).children("div").children("h5").html()); */
			var playgroundName = $(this).children("div").children("h5").html();
			var latLng = $(this).children("div").children("input").val().split(" ");
			var lat = latLng[0];
			var lng = latLng[1];
			console.log(lat + " " + lng);
			// 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new daum.maps.LatLng(lat, lng);

		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        position: moveLatLon
		    });
		    
		 	// 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map2);

		    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		    // marker.setMap(null); 
		    $("input[name=playground]").val(playgroundName);
		    $("input[name=lat]").val(lat);
		    $("input[name=lng]").val(lng);
		    var iwContent = '<div style="padding:5px;">' + playgroundName + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new daum.maps.LatLng(lat, lng), //인포윈도우 표시 위치입니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성하고 지도에 표시합니다
			/* var infowindow = new daum.maps.InfoWindow({zIndex:1}); */
			var infowindow = new daum.maps.InfoWindow({
			    map: map2, // 인포윈도우가 표시될 지도
			    position : iwPosition, 
			    content : iwContent,
			    removable : iwRemoveable
			});
		    
			daum.maps.event.addListener(marker, 'mouseover', function() {
				infowindow.setContent(iwContent);
			    infowindow.open(map2, marker);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            
            daum.maps.event.addListener(marker, 'click', function() {
            	
                console.log(marker);
            });
			
		 	// 지도 중심을 이동 시킵니다
		    map2.panTo(moveLatLon); 
		 	$(".close").trigger("click");
		});
	});

</script>
</head>
<body>
<style>
      div#enroll-container{width:400px; margin:0 auto;}
      div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
</style>
<section>
	
	<div class="modal fade" id="layerpop" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- header -->
	      <div class="modal-header">
	        <!-- 닫기(x) 버튼 -->
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <!-- header title -->
	        <h4 class="modal-title">구장 검색</h4>
	      </div>
	      <!-- body -->
	      <div class="modal-body">
	      	<div class="map_wrap">
	      		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			    <div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="풋살" id="keyword" size="15"> 
			                    <button type="submit">검색하기</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
	      </div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div id="enroll-container">
	   <form name="matchEnrollForm" action="${pageContext.request.contextPath}/match/enroll" method="post" onsubmit="return validate();" >
	      날짜 <input type="date" placeholder="날짜" name="matchDate"  required><br> 
	     시간 <input type="time" name="matchTime" required><br>
	  	 매치유형   <!-- <input type="text" class="form-control" placeholder="축구/풋살" name="matchType" list="playType">  -->
	    <select name="matchType">
	    	<option>축구</option>
	    	<option>풋살</option>
	    </select>
	    <br>  
	      <label>구장</label> <input type="text" placeholder="구장" name="playground">
	      <button type="button" id="playgroundSearchBtn">검색</button>
	      <input type="hidden" name="lat"/>
	      <input type="hidden" name="lng"/>
	      <br/>
    	
    	<!-- <div id="map" style="width:100%;height:30%;position:relative;overflow:hidden;"></div> -->
    	<div id="map2" style="width:100%;height:300px;position:relative;overflow:hidden;"></div>    
	      <br>
	    
	     비용 <input type="number" class="form-control" placeholder="비용" name="cost" id="cost" > <br>
	     유니폼색 <input type="text" class="form-control" placeholder="유니폼색" name="email" id="email"> <br>
	     경기가능지역 <input type="text" class="form-control" placeholder="경기가능지역" name="email" id="email" > <br>
	     내용 <textarea name="matchContent" cols="50" rows=6" style="resize:none"></textarea>
	      
	      <br />
	      <input type="submit" class="btn btn-outline-success" value="등록" >&nbsp;
	      <input type="reset" class="btn btn-outline-success" value="취소">
	   </form>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c472012c135166c57bf567ee22b393ed&libraries=services"></script>	
<script src="${pageContext.request.contextPath }/resources/js/playgroundSearch.js"></script>
	
	
	<!-- 패스워드 일치 여부, 아이디 4자리이상 -->
	<script>
		$(function(){
		
		});
		
		function validate() {
			var matchContent = $("[name=matchContent]").val().trim();
			if (matchContent.length == 0) {
				alert("내용 입력");
				return false;
			}
		}
	</script>

</body>
</html>