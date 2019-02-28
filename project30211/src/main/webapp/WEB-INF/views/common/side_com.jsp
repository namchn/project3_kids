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
   <div data-layout="al16 al-o2 de-o1 de6 ec4" style="position: absolute; width: 10%" id="side1">
      <div data-layout="ch-half">
         <nav class="MOD_SUBNAVIGATION1_Menu" data-theme="_bo2">
            <p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">커뮤니티</p>
            <ul>
               <li><a
                  href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2"
                  >공지사항</a></li>
               <li><a
                  href="${pageContext.request.contextPath }/boardBulletin/bulletinList?sort=2"
                  >자유게시판</a></li>
               <li><a
                  href="${pageContext.request.contextPath }/community/bus"
                  >셔틀버스</a></li>
               <li><a
                  href="${pageContext.request.contextPath }/community/application"
                  >원아모집</a></li>
               <li><a
                  href="${pageContext.request.contextPath }/boardDiet/dietListForm"
                  >식단표</a></li>
               <li><a href="${pageContext.request.contextPath }/poll/list"
                  >설문조사</a></li>
               <li><a
                  href="${pageContext.request.contextPath }/fullcalendar/fullcalendarAll"
                  >행사일정</a></li>
            </ul>
         </nav>
      </div>
   </div>
   <!-- /측면 메뉴바 -->
   <script src="../resources/js/index.js"></script>
</body>
</html>