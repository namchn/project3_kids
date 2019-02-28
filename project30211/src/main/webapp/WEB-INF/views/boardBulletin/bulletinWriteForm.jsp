<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<form action="${pageContext.request.contextPath }/boardBulletin/bulletinWrite">	  
		writer: <input type="text" name="id" value="${sessionScope.id}" readonly><br>

		<c:if test="${sessionScope.mem_code == 0}">
			<input type="hidden" name="mng_group" value="" >
			<input type="hidden" name="stu_group" value="" >
		</c:if>   
         
		<c:if test="${sessionScope.mem_code == 1}">
			mng_group : <input type="text" name="mng_group" value="${sessionScope.mng_group}" readonly><br>
			<input type="hidden" name="stu_group" value="" readonly>
		</c:if>      
		<c:if test="${sessionScope.mem_code == 2}">
			stu_group : <input type="text" name="stu_group" value="${sessionScope.stu_group}" readonly><br>
			<input type="hidden" name="mng_group" value="" readonly>
		</c:if>
         
      title: <input type="text" name="title" required="required"><br>
      content: <textarea name="content" required="required"></textarea><br>
      비밀글여부 : <input type="radio" name="secret" value="1">예
             <input type="radio" name="secret" value="0" checked>아니오<br>
		<input type="hidden" name="sort" value="${sort}">
		<input type="submit" value="작성">
	</form>   

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>