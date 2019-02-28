<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그인</h3>
<form action="${pageContext.request.contextPath }/member/login" method="post">
id<br>
<input type="text" name="id"><br/>
pw<br>
<input type="text" name="pw"><br/>
<input type="submit" value="로그인">
</form>
<a href="${pageContext.request.contextPath }/member/join">회원가입</a>
</body>
</html>