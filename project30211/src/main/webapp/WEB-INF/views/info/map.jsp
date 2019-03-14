<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">  

<style type="text/css">
a:visited {color: black;}
a:link {color: black;}
a{text-decoration: none;
/*  font-size: 20px; */}

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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 8%;">
	<jsp:include page="/WEB-INF/views/common/side_info.jsp"/>
</div>
<div class="container" style="margin-top:50px; margin-left: 22%; margin-bottom: 50px;">
<h3>오시는 길</h3>
<hr style="width: 79%; float: left;">
<div style="float: right; margin-right: 20%; margin-bottom: 20px">
	<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/introduce/introduce">  >  유치원 소개</a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/info/map">  >  오시는 길</a>
</div><br><br>
<div class="map_wrap" style="height:600px; position: sticky;">
<a href="http://map.daum.net/link/to/한국정보기술연구원,37.485126,126.898812" style="font-size: 15px; font-weight: bold;" target="_blank">
<span class="glyphicon glyphicon-search" style="font-size: 15px"></span>길 찾기</a>
<div id="map" style="width:80%; height:400px; position: sticky;"></div>

<div style="border-bottom: 2px solid lightgray; width: 79%; margin-top: 30px">
<br>
<span class="glyphicon glyphicon-map-marker" style="color: gray; font-size: 20px"></span>
<span style="color: gray; font-weight: bold; font-size: 20px">주소&emsp;</span>
<span style="font-size: 15px">서울특별시 구로구 디지털로34길 43 코오롱싸이언스밸리1차</span>
</div><br>    
<div style="border-bottom: 2px solid lightgray; width: 79%;">
<span class="glyphicon glyphicon-phone" style="color: gray; font-size: 20px"v></span>
<span style="color: gray; font-weight: bold; font-size: 20px">전화&emsp;</span>
<span style="font-size: 15px">02-1234-1234</span>
</div>
</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb0b1955634d613647bc41931ca8ebe9&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450700761312206, 126.57066121198349), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption);
/* // 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
} */

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 구로구 디지털로34길 43 코오롱싸이언스밸리1차', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">떡잎유치원</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); 
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>
         