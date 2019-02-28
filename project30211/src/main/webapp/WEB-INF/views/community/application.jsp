<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   <link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
   <link href="<c:url value="../resources/css/modules.css?ver=2" />" rel="stylesheet">
   <title>KITRI 유치원 - 원아모집</title>
   <style type="text/css">
   .glyphicon {font-size: 20px; color: gray;}
</style>
</head>
<!-- End Head -->
<script>
/* Demo purposes only */
$(".hover").mouseleave(
  function() {
    $(this).removeClass("hover");
  }
);
</script>
<body class="default">


<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section>
   <div style="margin-left: 10%; padding: 30px;">
<jsp:include page="/WEB-INF/views/common/side_com.jsp" />
</div>
  <div data-layout="_r">
      <div style="margin-left: 30%;">
      <h1>원아모집</h1>
      <div align="right">
      <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/">  >  커뮤니티</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/community/application">  >  원아모집</a>
      </div><br><br>
      </div>
      <div style="width:550px; position: sticky">
    <div style="font-size: 15px; font-weight: bold; color: gray" >
첨부된 파일을 클릭하여 양식 다운을 받으신 후 입학원서를 작성부탁드립니다. <br>
작성하신 입학원서는 팩스나 이메일로 접수 가능합니다. <br><br>

팩스나 이메일로 접수를 원하실 경우 <br>
KITRI유치원 대표번호 (교무실) 02)1234-1234 / (팩스) 02)4567-4567 <br>
연락 부탁드립니다. <br><br>

감사합니다. *^^*
</div>
<br><br><br><br>
<div class="container" style="padding-left: 320px;">
<a class="snip1535" role="button" href="${pageContext.request.contextPath }/download/ComDown?name=2019form.hwp" style="text-decoration:none; font-size: 15px; text-align:center; width:230px; color:white">입학원서 다운로드</a><br>
<a class="snip1535" role="button" href="${pageContext.request.contextPath }/download/ComDown?name=2019form2.hwp" style="text-decoration:none; font-size: 15px; text-align:center; width:230px; padding: 12px; color:white">우선입학대상 원서 다운로드</a><br>
</div>
<br><br><br><br>
<div>
<img src="../resources/img/application.png"/>
</div>
</div>
</div>
 
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
         