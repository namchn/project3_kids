<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">

<style type="text/css">
.rb {
	width: 50px;
}
</style>
</head>

<body class="default">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 본문-->
식단 상세조회 페이지
<h3>식단 정보</h3>
	<%-- <form action="${pageContext.request.contextPath}/boardDiet/editDiet" method="post" enctype="multipart/form-data" id="totalImgForm"> --%>
		<form enctype="multipart/form-data" id="totalImgForm" method="post" > 
		<img src="../resources/img/${db.files}" width="150" height="150"><br>
		제목<br>
		<label>${db.title}</label>
		<%-- <input type="text" name="title" id="title" value="${db.title}"><br>  --%>
		 내용<br>
		 <label>${db.content}</label>
		<%-- <input type="text" name="content" id="content" value="${db.content}"><br> --%>
		날짜<br/>
		<label>${db.time}</label>
		<p></p>
		
		<c:if test="${sessionScope.id=='manager'}">
 		<div>
		<input type="button" value="식단표 수정" onclick="location.href='${pageContext.request.contextPath}/boardDiet/dietNumForm?diet_num=${db.diet_num}'">
		</div> 		
		</c:if>
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>

</html>
