<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
rel="stylesheet">	
<meta charset="UTF-8">
</head>

<body class="default">

<!-- 마이페이지 -->

<h3>일정 수정 페이지</h3>
   	  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
   	 <form action="${pageContext.request.contextPath}/manager/calendarEdit">

  	  일정 번호 <input type="text" name="num" value="${calendar.num }" readonly>
   	  시작일 <input type="date" id="start_date" name="start_date" value="${start}">
   	  종료일 <input type="date" id="end_date" name="end_date" value="${end}">
 	 이벤트 <input type="text" name="event" value="${calendar.event }">
      <input type="submit" value="수정">
      </form>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>

</html>
