<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">   
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 8%;">
   <jsp:include page="/WEB-INF/views/common/side_com.jsp"></jsp:include>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb0b1955634d613647bc41931ca8ebe9&libraries=services"></script>
<div class="container" style="margin-top:50px; margin-left: 22%; margin-bottom: 80px; width: 60%;">
<h3>셔틀버스 경로 수정</h3>
<hr>
<div style="float: right;">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2">  >  커뮤니티</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/community/bus">  >  셔틀버스</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/edit_bus">  >  셔틀버스 경로 수정</a>
  </div><br><br>
<div id="map" style="width:100%;height:400px;"></div>
<p><em>마크를 움직이세요</em></p> 
<div id="clickLatlng"></div>

<form action="${pageContext.request.contextPath }/community/bus">
<c:forEach items="${list}" var="a" varStatus="status">
<div style="display: flow-root">

<input type="hidden" class="form-control" value="${a.x}" name="x${a.bus_num}" readonly="readonly">
<input type="hidden" class="form-control" value="${a.y}" name="y${a.bus_num}" readonly="readonly">
<!-- <input type="button" class="btn btn-primary" value="변경"> -->
</div>
</c:forEach>
<input type="submit" value="수정완료" class="btn btn-primary" style="float: right; width: 110px;">
</form>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new daum.maps.LatLng(37.485126, 126.898812), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

var x1 = document.getElementsByName('x1')[0].value;
var y1 = document.getElementsByName('y1')[0].value;
var x2 = document.getElementsByName('x2')[0].value;
var y2 = document.getElementsByName('y2')[0].value;
var x3 = document.getElementsByName('x3')[0].value;
var y3 = document.getElementsByName('y3')[0].value;
var x4 = document.getElementsByName('x4')[0].value;
var y4 = document.getElementsByName('y4')[0].value;
var x5 = document.getElementsByName('x5')[0].value;
var y5 = document.getElementsByName('y5')[0].value;
var x6 = document.getElementsByName('x6')[0].value;
var y6 = document.getElementsByName('y6')[0].value;
//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
{
    title: '1', 
    latlng: new daum.maps.LatLng(x1, y1)
},
{
    title: '2', 
    latlng: new daum.maps.LatLng(x2, y2)
},
{
    title: '3',
    latlng: new daum.maps.LatLng(x3, y3)
},
{
    title: '4', 
    latlng: new daum.maps.LatLng(x4, y4)
},
{
    title: '5',
    latlng: new daum.maps.LatLng(x5, y5)
},
{
    title: '6',
    latlng: new daum.maps.LatLng(x6, y6)
},
];

//마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 



// 마커 이미지의 이미지 크기 입니다
var imageSize = new daum.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 

// 마커를 생성합니다
var marker1 = new daum.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[0].latlng, // 마커를 표시할 위치
    title : positions[0].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
var marker2 = new daum.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[1].latlng, // 마커를 표시할 위치
    title : positions[1].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
var marker3 = new daum.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[2].latlng, // 마커를 표시할 위치
    title : positions[2].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
var marker4 = new daum.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[3].latlng, // 마커를 표시할 위치
    title : positions[3].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
var marker5 = new daum.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[4].latlng, // 마커를 표시할 위치
    title : positions[4].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
var marker6 = new daum.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[5].latlng, // 마커를 표시할 위치
    title : positions[5].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});

marker1.setDraggable(true);
marker2.setDraggable(true);
marker3.setDraggable(true);
marker4.setDraggable(true);
marker5.setDraggable(true);
marker6.setDraggable(true);

var x;
var y;

daum.maps.event.addListener(marker1, 'dragend', function() {
    // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
var latlng = marker1.getPosition();
    
    
    x = latlng.getLat();
    y = latlng.getLng();
    
	var param = "bus_num=1&x="+x+"&y="+y;
    $.ajax({
    	url:"${pageContext.request.contextPath }/manager/abcd",
    	data: param,
    	success:function(data){
    		 var obj = eval('('+data+')');
        	 var x11 = obj.x;
        	 var y11 = obj.y;
        	
        	 $('input[name="x1"]').val(x11);
        	 $('input[name="y1"]').val(y11);
    	}
    })
});
daum.maps.event.addListener(marker2, 'dragend', function() {
    // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
var latlng = marker2.getPosition();
 
    
    x = latlng.getLat();
    y = latlng.getLng();
    var param = "bus_num=2&x="+x+"&y="+y;
    $.ajax({
    	url:"${pageContext.request.contextPath }/manager/abcd",
    	data: param,
    	success:function(data){
    		 var obj = eval('('+data+')');
        	 var x11 = obj.x;
        	 var y11 = obj.y;
        	
        	 $('input[name="x2"]').val(x11);
        	 $('input[name="y2"]').val(y11);
    	}
    })
});
daum.maps.event.addListener(marker3, 'dragend', function() {
    // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
var latlng = marker3.getPosition();
 
    
    x = latlng.getLat();
    y = latlng.getLng();
    var param = "bus_num=3&x="+x+"&y="+y;
    $.ajax({
    	url:"${pageContext.request.contextPath }/manager/abcd",
    	data: param,
    	success:function(data){
    		 var obj = eval('('+data+')');
        	 var x11 = obj.x;
        	 var y11 = obj.y;
        	
        	 $('input[name="x3"]').val(x11);
        	 $('input[name="y3"]').val(y11);
    	}
    })
});
daum.maps.event.addListener(marker4, 'dragend', function() {
    // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
var latlng = marker4.getPosition();

    
    x = latlng.getLat();
    y = latlng.getLng();
    var param = "bus_num=4&x="+x+"&y="+y;
    $.ajax({
    	url:"${pageContext.request.contextPath }/manager/abcd",
    	data: param,
    	success:function(data){
    		 var obj = eval('('+data+')');
        	 var x11 = obj.x;
        	 var y11 = obj.y;
        	
        	 $('input[name="x4"]').val(x11);
        	 $('input[name="y4"]').val(y11);
    	}
    })
});
daum.maps.event.addListener(marker5, 'dragend', function() {
    // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
var latlng = marker5.getPosition();

    
    x = latlng.getLat();
    y = latlng.getLng();
    var param = "bus_num=5&x="+x+"&y="+y;
    $.ajax({
    	url:"${pageContext.request.contextPath }/manager/abcd",
    	data: param,
    	success:function(data){
    		 var obj = eval('('+data+')');
        	 var x11 = obj.x;
        	 var y11 = obj.y;
        	
        	 $('input[name="x5"]').val(x11);
        	 $('input[name="y5"]').val(y11);
    	}
    })
});
daum.maps.event.addListener(marker6, 'dragend', function() {
    // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
var latlng = marker6.getPosition();

    
    x = latlng.getLat();
    y = latlng.getLng();
    var param = "bus_num=6&x="+x+"&y="+y;
    $.ajax({
    	url:"${pageContext.request.contextPath }/manager/abcd",
    	data: param,
    	success:function(data){
    		 var obj = eval('('+data+')');
        	 var x11 = obj.x;
        	 var y11 = obj.y;
        	
        	 $('input[name="x6"]').val(x11);
        	 $('input[name="y6"]').val(y11);
    	}
    })
});
</script>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>