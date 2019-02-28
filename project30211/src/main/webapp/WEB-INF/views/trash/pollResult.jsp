<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aperitif - Custom Template</title>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
.rb {
	width: 50px;
}
</style>
</head>
<!-- End Head -->

<body class="default">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- 본문 -->
<!-- 측면 메뉴바 -->
<section>
  <div data-layout="_r">
  <div style="margin-left: 400px;">

<!-- 본문   -->
<section class="MOD_FEATURE">

<h3>투표 결과 페이지</h3>

투표가 잘되었어요!!!!!! ^^*


</section>

<!-- /본문   -->
  
   </div>
    <div data-layout="al16 al-o2 de-o1 de6 ec4" style="position: absolute;">
      <div data-layout="ch-half">
      <nav class="MOD_SUBNAVIGATION1_Menu" data-theme="_bo2">
        <p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">유치원소개</p>
        <ul>
          <li><a href="">유치원 소개</a></li>
          <li><a href="#">오시는길</a></li>
          <li><a href="#">모집요강</a></li>
        </ul>
      </nav>
    </div>
  </div>
  </div>
</section>


<!-- <footer> -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="../resources/js/index.js"></script>
</body>

</html>
