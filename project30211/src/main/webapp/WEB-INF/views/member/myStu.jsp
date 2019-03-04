<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">	

<style type="text/css">
a:visited {color: black;}
a:link {color: black;}
a{text-decoration: none;}
table>thead>tr>th {
	text-align: center;
}
table>tbody>tr>td {
	text-align: center;
}
</style>
</head>

<body class="default">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 175px;">
<jsp:include page="/WEB-INF/views/common/side_my.jsp"/>
</div>
<div class="container" style="margin-top:50px; margin-left: 22.5%; margin-bottom: 50px; max-width: 75%">
<c:choose>
<c:when test="${sessionScope.mng_group eq 1}">
	<c:set var="group" value="장미"></c:set>
</c:when>
<c:when test="${sessionScope.mng_group eq 2}">
	<c:set var="group" value="해바라기"></c:set>
</c:when>
<c:when test="${sessionScope.mng_group eq 3}">
	<c:set var="group" value="민들레"></c:set>
</c:when>
<c:otherwise>
	<c:set var="group" value="벚꽃"></c:set>
</c:otherwise>
</c:choose>
<h3>${group}반 원생 목록</h3>
<hr style="width: 1000px; float:left">
<div style="display: inline-block; margin-left: 68%;">
	<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myStu">  >  담임 반 원생 목록</a>
</div><br><br>
  <table class="table table-hover" style="max-width: 75%; margin-top: 30px">
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>