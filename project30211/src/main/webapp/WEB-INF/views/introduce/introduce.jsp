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
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>


<style type="text/css">
.ele2 {
  display: inline-block;
  position: sticky;
  top: 30px;
  width: 80px;
  height: 80px;
  background: blue;
}
</style>
</head>
<!-- End Head -->

<body class="default">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>



<section>
<div style="margin-top: 40px; margin-left: 175px;">
    <jsp:include page="/WEB-INF/views/common/side_info.jsp"/>
    </div>
  <div data-layout="_r">
  <div style="margin-left: 20%;">
  
  <!-- 본문내용 -->
  		<div id="imgdiv1">
  		<img src="../resources/img/intro.png" />
 		</div>
  
  <!-- /본문내용 -->
  
   </div>
    
    
  </div>
</section>
 	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

		<script src="../resources/js/index.js"></script>
</body>

</html>
