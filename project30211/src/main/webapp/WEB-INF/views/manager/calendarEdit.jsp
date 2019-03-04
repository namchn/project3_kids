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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style type="text/css">
.form-control{
max-width: 100%;
width: 30%;
}
</style>
</head>

<body class="default">

<div class="container" style="margin-top:50px; margin-left: 22%; margin-bottom: 50px;">
<h3 style="margin-left: 22%;">일정 수정 페이지</h3>
  <hr>
<div style="margin-left: 65%;">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/manager">  >  관리자 페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/calendarManage">  >  일정 관리</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="#">  >  일정 수정 페이지</a>
  </div>
  <div style="margin-left: 22%;">
       <form action="${pageContext.request.contextPath}/manager/calendarEdit">
       <label>일정 번호</label>
      <input type="text" class="form-control" name="num" value="${calendar.num }" readonly>
      <label>시작일 </label>
        <input type="date" class="form-control" id="start_date" name="start_date" value="${start}">
        <label>종료일</label>
       <input type="date" class="form-control" id="end_date" name="end_date" value="${end}">
        <label>이벤트</label>
     <input type="text" name="event" class="form-control" value="${calendar.event }">
     <input type="hidden" name="id" value="${sessionScope.id }">
      <input type="submit" value="수정" class="btn btn-primary" style="width: 60px; margin-top: 10px; position: relative; left: 25%;">
      </form>
      </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>

</html>