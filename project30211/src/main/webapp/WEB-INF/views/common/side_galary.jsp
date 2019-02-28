<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
        <p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">우리반이야기</p>
        <ul>
          <li><a href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=1&sort=2">1반</a></li>
          <li><a href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=2&sort=2">2반</a></li>
          <li><a href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=3&sort=2">3반</a></li>
          <li><a href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=4&sort=2">4반</a></li>
        </ul>
      </nav>
    </div>
  </div>
<!-- /측면 메뉴바 -->
<script src="../resources/js/index.js"></script>
</body>
</html>