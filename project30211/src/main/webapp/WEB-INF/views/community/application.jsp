<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css?ver=2" />" rel="stylesheet">
</head>

<script>
/* Demo purposes only */
$(".hover").mouseleave(
  function() {
    $(this).removeClass("hover");
  }
);
</script>

<body class="default">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 175px;">
	<jsp:include page="/WEB-INF/views/common/side_com.jsp" />
</div>
<div style="margin-top:50px; margin-left: 22%; margin-bottom: 50px; width: 75%">
<h3>원아모집</h3>
<hr style="float: left; width: 800px;">
<div style="display: inline-block; margin-left: 40%;">
	<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2">  >  커뮤니티</a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/community/application">  >  원아모집</a>
</div><br><br>
<div style="font-size: 15px; font-weight: bold; color: gray; margin-bottom: 50px; position: relative; left: 0%">
<p>
<br>첨부된 파일을 클릭하여 양식 다운을 받으신 후 입학원서를 작성부탁드립니다. <br>
작성하신 입학원서는 팩스나 이메일로 접수 가능합니다. <br><br>

팩스나 이메일로 접수를 원하실 경우 <br>
KITRI유치원 대표번호 (교무실) 02)1234-1234 / (팩스) 02)4567-4567 <br>
연락 부탁드립니다. <br><br>

감사합니다. *^^*</p>
</div>

<div style="margin-left: 33%">
<a class="snip1535" role="button" href="${pageContext.request.contextPath }/download/ComDown?name=form.hwp" style="text-decoration:none; font-size: 15px; text-align:center; width:230px; color:white">입학원서 다운로드</a><br>
<a class="snip1535" role="button" href="${pageContext.request.contextPath }/download/ComDown?name=form2.hwp" style="text-decoration:none; font-size: 15px; text-align:center; width:230px; padding: 12px; color:white">우선입학대상 원서 다운로드</a><br>
</div>
<br><br><br><br>
<div>
<img src="../resources/img/application.png"/>
</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>
         