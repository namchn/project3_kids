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
<a id="info">마이페이지</a>
<div id="mySidenav" class="sidenav">
  <a href="${pageContext.request.contextPath}/member/myInfoEdit" style="top: 265px">내 정보 수정</a>
  <a href="${pageContext.request.contextPath}/msg/msg" style="top: 310px">내 쪽지함</a>
  <c:if test="${sessionScope.mem_code eq 0}">	<!-- 관리자 -->
  <a href="${pageContext.request.contextPath}/member/outForm" style="top: 355px">회원 탈퇴</a>
  </c:if>
  <c:if test="${sessionScope.mem_code eq 1}">	<!-- 선생님 -->
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
  <a href="${pageContext.request.contextPath}/member/mystu" style="top: 355px">${group}반 원생 목록</a>
  <a href="${pageContext.request.contextPath}/pay/complete" style="top: 400px">${group}반 결제정보 확인</a>
  <a href="${pageContext.request.contextPath}/member/outForm" style="top: 445px">회원 탈퇴</a>
  </c:if>
  <c:if test="${sessionScope.mem_code eq 2}">	<!-- 학부모 -->
  <a href="${pageContext.request.contextPath}/pay/payForm" style="top: 355px">원비 결제</a>
  <a href="${pageContext.request.contextPath}/pay/complete2" style="top: 400px">내 결제정보 확인</a>
  <a href="${pageContext.request.contextPath}/book/myrent" style="top: 445px">내 대출 목록</a>
  <a href="${pageContext.request.contextPath}/book/myCart" style="top: 490px">찜한 도서목록</a>
  <a href="${pageContext.request.contextPath}/member/outForm" style="top: 535px">회원 탈퇴</a>
  </c:if>
</div>
</div>
<script src="../resources/js/index.js"></script>
</body>
</html> 
