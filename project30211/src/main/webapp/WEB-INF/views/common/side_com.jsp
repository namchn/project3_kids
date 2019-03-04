<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#mySidenav a {
  position: absolute;
  transition: 0.3s;
  padding: 10px;
  width: 200px;
  height: 40px;
  text-decoration: none;
  font-size: 15px;
  color: black;
  border-radius: 5px 5px 5px 5px;
  background-color: lightgray;
}

#mySidenav a:hover {
  background-color: #555;
  color: white;
}

#info {
  position: absolute;
  transition: 0.3s;
  padding: 15px;
  width: 200px;
  text-decoration: none;
  text-align: center;
  font-size: 20px;
  font-weight: bolder;
  color: white;
  border-radius: 5px 5px 5px 5px;
  top: 200px;
  background-color: #f9ca5b;
}

@media only screen and (max-width: 1300px) {
  #side1{
    display: none;
  }
}
</style>
</head>
<body>
<div id="side1">
<a id="info">커뮤니티</a>
<div id="mySidenav" class="sidenav">
  <a href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2" style="top: 265px">공지사항</a>
  <a href="${pageContext.request.contextPath }/boardBulletin/bulletinList?sort=2" style="top: 310px">자유게시판</a>
  <a href="${pageContext.request.contextPath }/community/bus" style="top: 355px">셔틀버스</a>
  <a href="${pageContext.request.contextPath }/community/application" style="top: 400px">원아모집</a>
  <a href="${pageContext.request.contextPath }/boardDiet/dietListForm" style="top: 445px">식단표</a>
  <a href="${pageContext.request.contextPath }/poll/list" style="top: 490px">설문조사</a>
  <a href="${pageContext.request.contextPath }/fullcalendar/fullcalendarAll" style="top: 535px">행사일정</a>
</div>
</div>
<script src="../resources/js/index.js"></script>
</body>
</html> 
