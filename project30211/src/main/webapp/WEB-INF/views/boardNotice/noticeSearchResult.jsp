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
</head>
<body>

 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h3>검색결과 목록</h3>
	<table border="1">
		<tr>
			<th>글번호</th><th>글제목</th><th>작성자</th><th>작성시간</th><th>조회수</th>
		</tr>
		<c:forEach var="a" items="${list}">
		<tr>
			<td>${a.notice_num}</td>
			<td><a href="${pageContext.request.contextPath}/boardNotice/noticeView?notice_num=${a.notice_num}">${a.title}</a></td>
			<td>${a.id}</td>
			<td>${a.time}</td>
			<td>${a.viewcount}</td>
		</tr>
		</c:forEach>	
	</table>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>