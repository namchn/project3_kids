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
   font-size: 15px;
    
}
</style>

</head>
<body>
   <!-- 측면 메뉴바 -->
   <div data-layout="al16 al-o2 de-o1 de6 ec4" style="position: absolute; width:10%">
      <div data-layout="ch-half">
         <nav class="MOD_SUBNAVIGATION1_Menu" data-theme="_bo2" style="background-color: #F9F5B3;">
            <p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs" style="background-color: #f9ca5b;">도서관</p>
            <ul>
             <c:if test="${sessionScope.mem_code eq 0}">   <!-- 관리자 -->   
               <li><a href="${pageContext.request.contextPath}/book/booklistForm">도서 목록</a></li>
               <li><a href="${pageContext.request.contextPath}/book/add_book">도서 추가</a></li>
               <li><a href="${pageContext.request.contextPath}/manager/rentpage">도서 관리</a></li>
            </c:if>
            <c:if test="${sessionScope.mem_code eq 1}">   <!-- 선생님 -->   
               <li><a href="${pageContext.request.contextPath}/book/booklistForm">도서 목록</a></li>
               <li><a href="${pageContext.request.contextPath}/book/myCart">찜한 도서 목록</a></li>
               <li><a href="${pageContext.request.contextPath}/book/myrent">내 대출 목록</a></li>
            </c:if>
            <c:if test="${sessionScope.mem_code eq 2}">   <!-- 학부모 -->
               <li><a href="${pageContext.request.contextPath}/book/booklistForm">도서 목록</a></li>
               <li><a href="${pageContext.request.contextPath}/book/myCart">찜한 도서 목록</a></li>
               <li><a href="${pageContext.request.contextPath}/book/myrent">내 대출 목록</a></li>
            </c:if>
            <c:if test="${sessionScope.mem_code eq 3}">   <!-- 방문객 -->   
               <li><a href="${pageContext.request.contextPath}/book/booklistForm">도서 목록</a></li>
            </c:if>

            </ul>
         </nav>
      </div>
   </div>
   <!-- /측면 메뉴바 -->
   <script src="../resources/js/index.js"></script>
</body>
</html>