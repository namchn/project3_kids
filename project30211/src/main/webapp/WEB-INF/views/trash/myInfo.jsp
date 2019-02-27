<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
   <meta charset="utf-8">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>KITRI 유치원 - 마이페이지</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   <link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
   <link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">   

   <style type="text/css">
   a:visited {color: black;}
   a:link {color: black;}
   a{text-decoration: none; font-size: 20px;}
   .glyphicon {font-size: 20px; color: gray;}
</style>

<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js">
$(document).ready(function(){
         
    var mem_code = $('#mem_code').val();    
    //var mem_code = $('#mem_code').name(); 
      if(mem_code==1){
         $("#visitorDetail").show();
         $("#parentDetail").hide();
         $("#teacherDetail").show();
       }else if(mem_code==2){ 
          $("#visitorDetail").show();
         $("#teacherDetail").hide();
          $("#parentDetail").show();
       }else if(mem_code==3){ 
          $("#teacherDetail").hide();
          $("#parentDetail").hide();
          $("#visitorDetail").show();
       }           
}); 

 </script>
</head>
<!-- End Head -->

<body class="default">

<!--
START MODULE AREA 1: Header 3
-->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!--
END MODULE AREA 1: Header 3
-->

<!--
  START MODULE AREA 3: Text | Text
-->

<!-- 측면 메뉴바 -->
<section>
  <div data-layout="_r">
  <div style="margin-left: 400px;">
  <h1>${m.id}님의 마이페이지</h1>
  <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
  </div><br><br>
  <div class="container" style="width:500px; height:400px">
  
  <c:choose>
  <c:when test="${mem_code eq '1'}">                                                        
  <table class="table">
    <thead>
      <tr>
        <th>항목</th>
        <th>고객정보</th>
        <th></th>
      </tr>
    </thead>
    <tbody>   
      <tr>
        <td>ID</td>
        <td>${m.id}</td>
      </tr>
      <tr>
        <td>선생님 이름</td>
        <td>${m.name}</td>
      </tr>
      <tr>
        <td>담당반</td>
        <td>${m.mng_group}</td>
      </tr>
      <tr>
        <td>연락처</td>
        <td>${m.phone}</td>
      </tr>
      <%-- <tr>
        <td>주소</td>
        <td>${m.address}</td>
      </tr>
      <tr>
        <td>상세주소</td>
        <td>${m.detailaddress}</td>
      </tr>
      <tr>
        <td>우편번호</td>
        <td>${m.postcode}</td>
      </tr> --%>
    </tbody>
  </table>
  </c:when>
  <c:when test="${mem_code eq '2'}">
  <table class="table">
    <thead>
      <tr>
        <th>항목</th>
        <th>고객정보</th>
        <th></th>
      </tr>
    </thead>
    <tbody>   
      <tr>
        <td>ID</td>
        <td>${m.id}</td>
      </tr>
      <tr>
        <td>학부모 이름</td>
        <td>${m.name}</td>
      </tr>
      <tr>
        <td>아이 이름</td>
        <td>${m.stu_name}</td>
      </tr>
      <%-- <tr>
        <td>주소</td>
        <td>${m.address}</td>
      </tr>
      <tr>
        <td>상세주소</td>
        <td>${m.detailaddress}</td>
      </tr>
      <tr>
        <td>우편번호</td>
        <td>${m.postcode}</td>
      </tr> --%>
    </tbody>
  </table>
  </c:when>
  <c:when test="${mem_code eq '3'}">
  <table class="table">
    <thead>
      <tr>
        <th>항목</th>
        <th>고객정보</th>
        <th></th>
      </tr>
    </thead>
    <tbody>   
      <tr>
        <td>ID</td>
        <td>${m.id}</td>
      </tr>
      <tr>
        <td>방문객 이름</td>
        <td>${m.name}</td>
      </tr>
      <%-- <tr>
        <td>주소</td>
        <td>${m.address}</td>
      </tr>
      <tr>
        <td>상세주소</td>
        <td>${m.detailaddress}</td>
      </tr>
      <tr>
        <td>우편번호</td>
        <td>${m.postcode}</td>
      </tr> --%>
    </tbody>
  </table>
  </c:when>
  </c:choose>
</div>
</div>

    <jsp:include page="/WEB-INF/views/common/side_my.jsp" />
 </div>
</section>
<!-- /측면 메뉴바 -->

<!--
  END MODULE AREA 3: Text | Text
-->

<!--
START MODULE AREA 4: Footer 2
-->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!--
END MODULE AREA 4: Footer 2
-->

<script src="../resources/js/index.js"></script>
</body>

</html>
         