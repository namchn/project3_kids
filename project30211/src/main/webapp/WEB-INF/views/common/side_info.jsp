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
<a id="info">유치원 소개</a>
<div id="mySidenav" class="sidenav">
  <a href="${pageContext.request.contextPath}/introduce/introduce" style="top:265px">유치원 소개</a>
  <a href="${pageContext.request.contextPath}/introduce/applicants" style="top:310px">모집 요강</a>
  <a href="${pageContext.request.contextPath}/info/map" style="top:355px">오시는 길</a>
</div>
</div>
<script src="../resources/js/index.js"></script>
</body>
</html> 
