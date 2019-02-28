<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aperitif - Custom Template</title>
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />"
   rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
   rel="stylesheet">

<style type="text/css">
a:visited {
   color: black;
}

a:link {
   color: black;
}

a {
   text-decoration: none;
   font-size: 20px;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
$(document).ready(function(){
    
	var elem = document.getElementById("myBar");
	var width = elem.style.width;
	var width_1 = document.getElementById("#");
	  //var id = setInterval(frame, 10);
	  
	   if (width >= 100) {
	     clearInterval(id);
	   } else {
	     elem.style.width = width_1 + '%'; 
	     document.getElementById("demo").innerHTML = width_1 * 1  + '%';
	   }   
})

</script>

<style>
#idea_poll_table {
   width: 610px;
} /*전체 테이블 width 값 고정 // table에 td width는 colgroup으로 고정*/
#idea_poll_table th { /* table의 th - 투표의 답이 들어가는 부분 */
   height: 41px;
   text-align: left;
   margin: 0px;
   color: #333333;
   font-family: dotum, 돋움;
   font-size: 12px;
}

#idea_poll_table td {
   /* td의 텍스트 element 지정 // 그래프가 들어가는 부분에는 텍스트가 없으므로 전체 td로 정해버렸음 */
   color: #757575;
   font-family: dotum, 돋움;
   font-size: 12px;
}

/* 요기부터 그래프 관련 */
#idea_poll_table .graph_yl {
   width: 245px; /* padding으로 전체 1px 밀었으므로 가로사이즈 왼쪽, 오른쪽 각각 1px 씩 뺀 사이즈 */
   height: 7px; /* padding으로 전체 1px 밀었으므로 세로 사이즈 위, 아래 각각 1px 씩 뺀 사이즈 */
   background-image: url(../../nsquare/image/idea_poll_graph_yl_off.gif);
   /* 그래프의 테두리만 남기고 투명 Gif 로 저장 */
   background-repeat: no-repeat; /* 테두리가 반복되면 안되므로 배경 고정 */
   background-position: left; /* 테두리의 위치는 항상 왼쪽에 위치 */
   background-color: #FFAE22; /* 속을 파낸 그래프 테두리안에 off 컬러 지정 */
   margin: 0px;
   /* IE6 과 IE7의 padding 인식 차이를 맞추기 위한 margin 지정 // 이미 body에 지정되어 있으나 다시 지정 */
   padding: 1px; /* 그래프의 테두리 안쪽으로 on 이미지가 늘어나야 하므로 전체 1px padding */
   text-align: left; /* 그래프의 시작은 항상 왼쪽부터 */
}

#idea_poll_table .bold_yl {
   color: #D68A06;
} /* 우측의 투표인원수의 컬러값 지정 */
#idea_poll_table .poll_line { /* 각 그래프 사이의 점선 라인 */
   height: 1px;
   width: 610px;
   background-image:
      url(../../nsquare/image/idea_online_poll_table_line.gif);
   background-repeat: repeat-x;
}
</style>

</head>
<body class="default">
   <table cellpadding="0" cellspacing="0" border="0" id="idea_poll_table">
      <colgroup>
         <col width="148px;">
         <col width="276px" align="left">
         <col width="184px" align="left">
      <tr>
         <!-- 투표1 제목 -->
         <th><img src="image/idea_online_poll_tip.gif" width="8"
            height="9" border="0" alt="" align="absmiddle"> DMB 기능
         </td>
         <!-- 투표1 그래프 -->
         <td>
            <div class="graph_yl">
               <img src="image/idea_poll_graph_yl_on.gif" width="80%" height="7"
                  border="0" align="absmiddle" alt="">
            </div>
         </td>
         <!-- 투표 1 투표인원 -->
         <td><b class="bold_yl">982</b> 명 (50%)</td>
      </tr>
      <tr>
         <td colspan="3" class="poll_line"></td>
      </tr>

   </table>


   <h1>My Web Page</h1>
   <div id="piechart"></div>

   <script type="text/javascript"
      src="https://www.gstatic.com/charts/loader.js"></script>
   <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
* {
   box-sizing: border-box;
}

body {
   font-family: Arial;
   margin: 0 auto; /* Center website */
   max-width: 800px; /* Max width */
   padding: 20px;
}

.heading {
   font-size: 25px;
   margin-right: 25px;
}

.fa {
   font-size: 25px;
}

.checked {
   color: orange;
}

/* Three column layout */
.side {
   float: left;
   width: 15%;
   margin-top: 10px;
}

.middle {
   margin-top: 10px;
   float: left;
   width: 70%;
}

/* Place text to the right */
.right {
   text-align: right;
}

/* Clear floats after the columns */
.row:after {
   content: "";
   display: table;
   clear: both;
}

/* The bar container */
.bar-container {
   width: 100%;
   background-color: #f1f1f1;
   text-align: center;
   color: white;
}

/* Individual bars */

/* .bar-5 {
   width: 30%;
   height: 18px;
   background-color: #4CAF50;
} */

/* .bar-4 {
   width: 30%;
   height: 18px;
   background-color: #2196F3;
}

.bar-3 {
   width: 10%;
   height: 18px;
   background-color: #00bcd4;
}

.bar-2 {
   width: 4%;
   height: 18px;
   background-color: #ff9800;
}

.bar-1 {
   width: 15%;
   height: 18px;
   background-color: #f44336;
} */

/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media ( max-width : 400px) {
   .side, .middle {
      width: 100%;
   }
   .right {
      display: none;
   }
}
</style>
</head>
<body>

   <form>
      <span class="heading">학부모 월례 회의</span> <span
         class="fa fa-star checked"></span> <span class="fa fa-star checked"></span>
      <span class="fa fa-star checked"></span> <span
         class="fa fa-star checked"></span> <span class="fa fa-star"></span>
      <p>4.1 average based on 254 reviews.</p>
      <hr style="border: 3px solid #f1f1f1">
   </form>
   
   2번째 예제 
<c:set var="cc" value="progress-bar progress-bar-success progress-bar-striped, progress-bar progress-bar-info progress-bar-striped,progress-bar progress-bar-warning progress-bar-striped,progress-bar progress-bar-danger progress-bar-striped,progress-bar progress-bar-visible progress-bar-striped"/>    
<%-- <c:set var="list" value="1,2,3,4,5"/>  --%>


    <div class="container">
  <h2>Striped Progress Bars</h2>
  <p>The .progress-bar-striped class adds stripes to the progress bars:</p> 

	
	<c:forEach var="list" items="${list}">
  		<div class="progress">
   		 <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:80%">
    		 ${list.poll_candidate}
    		 <input type="button" onclick="location.href='poll/pollResult">
    	</div>
 	   </div>
 	 </c:forEach>
 	 
 	 <c:forEach var="pc" items="${pc}">
  		<div class="progress">
   		 <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:80%">
    		 ${pc.poll_candidate}
    		 <input type="button" onclick="location.href='poll/pollResult">
    	</div>
 	   </div>
 	 </c:forEach>



</div>


   <div class="row">
   
      <div class="side">
         <div> 1</div>
      </div>
      <div class="middle">
         <div class="bar-container">
            <div class="bar-5">123</div>
            <div class="bar-5" id="myBar" style="height:18px;width:30%;background-color: #4CAF50;">나중에 추가</div>
         </div>
      </div>
      <div class="side right">
         <div id="demo">60</div>
      </div>
      
      <div class="side">
         <div>2월 20일</div>
      </div>
      <div class="middle">
         <div class="bar-container">
            <div class="bar-4" id="myBar" style="height:18px;width:30%;background-color: #4CAF50;"></div>
         </div>
      </div>
      <div class="side right">
         <div>63</div>
      </div>
      
      <div class="side">
         <div>2월 19일</div>
      </div>
      <div class="middle">
         <div class="bar-container">
            <div class="bar-3"></div>
         </div>
      </div>
      <div class="side right">
         <div>15</div>
      </div>
      
      <div class="side">
         <div>2월 18일</div>
      </div>
      <div class="middle">
         <div class="bar-container">
            <div class="bar-2"></div>
         </div>
      </div>
      <div class="side right">
         <div>6</div>
      </div>
      
      <div class="side">
         <div>2월 17일</div>
      </div>
      <div class="middle">
         <div class="bar-container">
            <div class="bar-1"></div>
         </div>
      </div>
      <div class="side right">
         <div>20</div>
      </div>
   </div> 

</body>
</html>