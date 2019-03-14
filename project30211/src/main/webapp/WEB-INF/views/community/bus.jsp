<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">   

<style type="text/css">
a:visited {color: black;}
a:link {color: black;}
a{text-decoration: none; 
/* font-size: 20px; */}
   
html, body {width:100%;height:100%;margin:0;padding:0;} 
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:9px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;height:40px;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}
</style>
</head>

<body class="default">
<input type="hidden" id="bus1x" value="${bus1.x }">
<input type="hidden" id="bus1y" value="${bus1.y }">
<input type="hidden" id="bus2x" value="${bus2.x }">
<input type="hidden" id="bus2y" value="${bus2.y }">
<input type="hidden" id="bus3x" value="${bus3.x }">
<input type="hidden" id="bus3y" value="${bus3.y }">
<input type="hidden" id="bus4x" value="${bus4.x }">
<input type="hidden" id="bus4y" value="${bus4.y }">
<input type="hidden" id="bus5x" value="${bus5.x }">
<input type="hidden" id="bus5y" value="${bus5.y }">
<input type="hidden" id="bus6x" value="${bus6.x }">
<input type="hidden" id="bus6y" value="${bus6.y }">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 8%;">
   <jsp:include page="/WEB-INF/views/common/side_com.jsp"></jsp:include>
</div>
  <div  class="container" style="margin-top:50px; margin-left: 22%; margin-bottom: 50px;">
  <h3>셔틀버스</h3>
  <hr style="width: 79%; float: left;">
  <div style="float: right; margin-right: 20%; margin-bottom: 20px">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2">  >  커뮤니티</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/community/bus">  >  셔틀버스</a>
  </div><br><br>
<div class="map_wrap" style="height:600px; position: sticky;">
  <a href="http://map.daum.net/link/to/한국정보기술연구원,37.485126,126.898812" style="font-size: 15px; font-weight: bold;" target="_blank">
  <span class="glyphicon glyphicon-search" style="font-size: 15px"></span>길 찾기</a>
  <div id="map" style="width:79%; height:400px; position: sticky;"></div>

  <div style="border-bottom: 2px solid lightgray; width: 79%; margin-top: 30px;">

<span class="glyphicon glyphicon-map-marker" style="color: gray; font-size: 20px"></span>
<span style="color: gray; font-weight: bold; font-size: 20px">주소&emsp;</span>
<span style="font-size: 15px">서울특별시 구로구 디지털로34길 43 코오롱싸이언스밸리1차</span>
</div><br>    
<div style="border-bottom: 2px solid lightgray; width: 79%;" >
<span class="glyphicon glyphicon-phone" style="color: gray; font-size: 20px"></span>
<span style="color: gray; font-weight: bold; font-size: 20px">전화&emsp;</span>
<span style="font-size: 15px">02-1234-1234</span>
</div>
<c:if test="${sessionScope.id eq 'manager'}">
<a href="${pageContext.request.contextPath}/manager/edit_bus" class="btn btn-primary" style="color: white; margin-top: 10px; position: relative; left: 70%;">경로수정</a>
</c:if>
 </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb0b1955634d613647bc41931ca8ebe9&libraries=services"></script>
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

var x1 = document.getElementById('bus1x').value;
var y1 = document.getElementById('bus1y').value;
var x2 = document.getElementById('bus2x').value;
var y2 = document.getElementById('bus2y').value;
var x3 = document.getElementById('bus3x').value;
var y3 = document.getElementById('bus3y').value;
var x4 = document.getElementById('bus4x').value;
var y4 = document.getElementById('bus4y').value;
var x5 = document.getElementById('bus5x').value;
var y5 = document.getElementById('bus5y').value;
var x6 = document.getElementById('bus6x').value;
var y6 = document.getElementById('bus6y').value;
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

for (var i = 0; i < positions.length; i ++) {

// 마커 이미지의 이미지 크기 입니다
var imageSize = new daum.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng, // 마커를 표시할 위치
    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});

marker.setDraggable(true); 
}

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>
         