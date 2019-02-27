<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>${sessionScope.id }님페이지</h4>
	<a href="${pageContext.request.contextPath }/member/myInfo">내정보확인</a><br/>
	<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a><br/>
	<a href="${pageContext.request.contextPath }/member/out">탈퇴</a><br/>
	<a href="${pageContext.request.contextPath }/board/list">게시판</a><br/>
	<a href="${pageContext.request.contextPath }/imgBoard/submissionList">페이스북형 게시판</a><br/>
	<a href="${pageContext.request.contextPath }/download/list">자료실</a><br/>

</body>
</html>s