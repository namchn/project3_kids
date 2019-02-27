<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<title>KITRI 유치원 - 담임 반 원생 목록</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
	<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">	

	<style type="text/css">
	a:visited {color: black;}
	a:link {color: black;}
	a{text-decoration: none; font-size: 20px;}
	.glyphicon {font-size: 20px; color: gray;}
</style>
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
<section style="margin-bottom: 300px;">
  <div data-layout="_r">
  <div style="margin-left: 400px;">
  <h1>담임 반 원생 목록</h1>
  <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myStu">  >  담임 반 원생 목록</a>
  </div><br><br>
  <div class="container" style="width:500px;">
                                                          
  <table class="table">
    <thead>
      <tr>
      	<th>ID</th>
        <th>아이</th>
        <th>학부모</th>
        <th>연락처</th>
      </tr>
    </thead>
    <tbody>   
    
      <c:forEach var="s" items="${list}">
      <tr>
        <td>${s.id}</td>
        <td>${s.stu_name}</td>
        <td>${s.name}</td>
        <td>${s.phone}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  </div>
</div>

    
    <jsp:include page="/WEB-INF/views/common/side_my.jsp"></jsp:include>
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