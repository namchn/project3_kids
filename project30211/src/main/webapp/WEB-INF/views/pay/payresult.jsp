<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<title>KITRI 유치원 - 내 결제정보 확인</title>
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
  <c:if test="${m.mem_code eq 2}">
  <h1>내 결제정보 확인</h1>
<div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/pay/complete2">  >  내 결제정보 확인</a>
  </div><br><br>
  <div class="container" style="width:500px;">                                                         
  <table class="table">
    <thead>
      <tr>
        <th>항목</th>
        <th>고객정보</th>
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
      <tr>
        <td>연락처</td>
        <td>${m.phone}</td>
      </tr>
      <c:choose>
      <c:when test="${p.id eq null}">
   		<tr>
      		<td>결제날짜</td>
        	<td>-</td>
      	</tr>
      </c:when>
      <c:otherwise>
   		<tr>
      		<td>결제날짜</td>
        	<td>${p.time}</td>
      	</tr>
      </c:otherwise>
      </c:choose>
      <c:choose>
      <c:when test="${p.id eq null}">
   		<tr class="danger">
      		<td>결제여부</td>
        	<td>미납</td>
      	</tr>
      </c:when>
      <c:otherwise>
   		<tr class="info">
      		<td>이번 달&nbsp;결제여부</td>
        	<td>완납</td>
      	</tr>
      </c:otherwise>
      </c:choose>
    </tbody>
  </table>
</div>
</c:if>

<c:if test="${m.mem_code eq 1}">
  <h1>원생 결제정보 확인</h1>
  <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/pay/complete">  >  원생 결제정보 확인</a>
  </div><br><br>
  <div class="container" style="width:500px;">
                                                          
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>id</th>
        <th>이름</th>
        <th>아이 이름</th>
        <th>연락처</th>
        <th>결제여부</th>
      </tr>
    </thead>
    <tbody>   
      <c:forEach var="list" items="${requestScope.map}" varStatus="num">
      <tr>
      	<td>${num.index}</td>
      	<td>${list.key}</td>
      	<td>${mlist[num.index].name}</td>
      	<td>${mlist[num.index].stu_name}</td>
      	<td>${mlist[num.index].phone}</td>
      	<c:choose>
      	<c:when test="${list.value eq '완납'}">
      	<td style="color: green">${list.value}</td>
      	</c:when>
      	<c:otherwise>
      	<td style="color: red;">${list.value}</td>
      	</c:otherwise>
      	</c:choose>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  </div>
</c:if>
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
			