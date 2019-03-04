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
<a id="info">도서관</a>
<div id="mySidenav" class="sidenav">
  <c:if test="${sessionScope.mem_code eq 0}">   <!-- 관리자 -->   
    <a href="${pageContext.request.contextPath}/book/booklistForm" style="top:265px">도서 목록</a>
    <a href="${pageContext.request.contextPath}/book/add_book" style="top:310px">도서 추가</a>
    <a href="${pageContext.request.contextPath}/manager/rentpage" style="top:355px">도서 관리</a>
  </c:if>
  <c:if test="${sessionScope.mem_code eq 1 or sessionScope.mem_code eq 2}">   <!-- 선생님 -->   
    <a href="${pageContext.request.contextPath}/book/booklistForm" style="top:265px">도서 목록</a>
    <a href="${pageContext.request.contextPath}/book/myCart" style="top:310px">찜한 도서 목록</a>
    <a href="${pageContext.request.contextPath}/book/myrent" style="top:355px">내 대출 목록</a>
  </c:if>
  <c:if test="${sessionScope.mem_code eq 3}">   <!-- 방문객 -->   
    <a href="${pageContext.request.contextPath}/book/booklistForm" style="top:265px">도서 목록</a>
  </c:if>
</div>
</div>
<script src="../resources/js/index.js"></script>
</body>
</html> 