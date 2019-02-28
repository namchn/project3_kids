<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">
 
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<!-- Custom styles for this template-->

<title>도서 추가</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style type="text/css">
.form-control{
max-width: 100%;
width: 40%;
}
</style>
</head>
<body>

<div style="margin-left: 20%; padding-bottom: 50px; padding-top: 50px;">
<div class="container">
<div style="margin-bottom: 50px;">
<h1 style="display: inline;">도서 추가 </h1><i class="fas fa-book fa-2x text-gray-300" style="margin-right: 20px; color:gray;"></i>
</div>
<div style="position: absolute; left: 60%;">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/book/booklistForm">  >  도서목록</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/book/add_book">  >  도서 추가</a>
</div><br><br>
<form name="addForm" action="${pageContext.request.contextPath}/book/insert_book" method="post" enctype="multipart/form-data">
<div class="form-group">
<label for="usr">제목:</label>
<input type="text" class="form-control" id="book_title" name="book_title"><br>
<label for="usr">저자:</label>
<input type="text" class="form-control" id="book_writer" name="book_writer"><br>
<label for="usr">출판사:</label>
<input type="text" class="form-control" id="book_publisher" name="book_publisher"><br>
<label for="usr">수량:</label>
<input type="number" class="form-control" id="rest_amount" name="rest_amount" min="1"><br>
<label for="usr">이미지:</label>
<input type="file" name ="file" style="max-width: 100%; width: 30%;"><br><br>
<div style="position: absolute; right:46%;">
<input class="btn btn-primary" type="submit" value="추가" style="width: 60px;">
<a class="btn btn-primary" href="${pageContext.request.contextPath}/book/booklistForm" style="color: white;">목록</a>
</div>
</div>
</form>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>