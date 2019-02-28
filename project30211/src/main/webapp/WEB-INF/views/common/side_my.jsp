<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<style type="text/css">
a:visited {
   color: black;
}

a:link {
   color: black;
}

a {
   text-decoration: none;
   font-size: 20px;
}
@media only screen and (max-width: 1300px) {
  #side1{
    display: none;
  }
}
</style>
</head>
<body>
<!-- 측면 메뉴바 -->
    <div data-layout="al16 al-o2 de-o1 de6 ec4" style="position: absolute; width: 10%;" id="side1">
      <div data-layout="ch-half">
      <nav class="MOD_SUBNAVIGATION1_Menu" data-theme="_bo2">
        <p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">마이 페이지</p>
        <ul>
          <li><a href="${pageContext.request.contextPath}/member/myInfoEdit">내 정보 수정</a></li>
          <li><a href="${pageContext.request.contextPath}/msg/msg">내 쪽지함</a></li>
          <c:if test="${sessionScope..mem_code eq 2}">   <!-- 학부모 -->
            <li><a href="${pageContext.request.contextPath}/pay/payForm">원비 결제</a></li>
            <li><a href="${pageContext.request.contextPath}/pay/complete2">내 결제정보 확인</a></li>
            <li><a href="${pageContext.request.contextPath}/book/myrent">내 대출 목록</a></li>
            <li><a href="${pageContext.request.contextPath}/book/myCart">찜한 도서목록</a></li>
        </c:if>
          <c:if test="${sessionScope.mem_code eq 1}">   <!-- 선생님 -->
            <li><a href="${pageContext.request.contextPath}/member/mystu">담임 반 원생 목록</a></li>
            <li><a href="${pageContext.request.contextPath}/pay/complete">원생 결제정보 확인</a></li>
          </c:if>   
          <c:if test="${sessionScope.mem_code eq 0}">   <!-- 관리자-->
            <li><a href="${pageContext.request.contextPath}/manager/memberManage">회원 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/manager/boardManage">게시판 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/manager/calendarManage">일정 관리</a></li>
          </c:if>
          <li><a href="${pageContext.request.contextPath}/member/outForm">회원 탈퇴</a></li>
          
        </ul>
      </nav>
    </div>
  </div>
<!-- /측면 메뉴바 -->
<script src="../resources/js/index.js"></script>
</body>
</html>