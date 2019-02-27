<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <form action="${pageContext.request.contextPath }/boardNotice/noticeWrite" method="post" enctype="multipart/form-data">   
      writer: <input type="text" name="id" value="${sessionScope.id}" readonly><br>
      title: <input type="text" name="title" required="required"><br>
      content: <textarea name="content" required="required"></textarea><br>
      files : <input type="file" name="notice_files">
      <input type="hidden" value="${sort}" name="sort">
      <input type="submit" value="작성">
   </form>   

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>