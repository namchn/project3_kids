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

<style type="text/css">
.form-control{
max-width: 50%;
width: 40%;
}
</style>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var t = $("#book_title").val();
	var p = $("#book_publisher").val();
	var n = $("#rest_amount").val();
	var w = $("#book_writer").val();
	$('#editImgBtn').hide();
	$('#edit1').hide();//이미지변경한 후 생기는 수정버튼 hide
	$('#edit2').show();
	
	$("#btn11").click(function(){
		if(t,p,n,w!=""){
			$("#totalImgForm").attr("action","${pageContext.request.contextPath}/manager/edit_book");
			$("#totalImgForm").submit();
		}
		else{ 
		
		alert("모든 값을 입력하세요");
		 } 
	})
	
	$("#btn12").click(function(){
		if(t,p,n,w!=""){
			$("#totalImgForm").attr("action","${pageContext.request.contextPath}/manager/edit_book2");
			$("#totalImgForm").submit();
			
		}
		else{ 
			alert("모든 값을 입력하세요");
		 } 
	})
	
	$("#tt").click(function(){
		$('#edit2').hide();//이미지변경한 후 생기는 수정버튼 hide
		$('#edit1').show();
		$('#editImgBtn').show();  
	})
	
});


</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div style="margin-top: 40px; margin-left: 175px;">
   <jsp:include page="/WEB-INF/views/common/side_book.jsp"></jsp:include>
</div>
<div class="container" style="margin-top:50px; margin-left: 22%; margin-bottom: 80px">
<h3>도서 수정<span>&nbsp;<i class="fas fa-book fa-2x text-gray-300" style="color:gray; font-size: 28px"></i></span></h3>
<hr style="width: 800px; float:left">
<div style="display:inline-block; margin-left: 55%;">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath}"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath}/book/booklistForm">  >  도서목록</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath}/manager/editBook">  >  도서 수정</a>
</div><br><br>
<form name="editForm" id="totalImgForm" method="post" enctype="multipart/form-data">
<div class="form-group">
<label for="usr">제목:</label>
<input type="text" class="form-control" id="book_title" name="book_title" value="${b.book_title}"><br>
<label for="usr">저자:</label>
<input type="text" class="form-control" id="book_writer" name="book_writer" value="${b.book_writer}"><br>
<label for="usr">출판사:</label>
<input type="text" class="form-control" id="book_publisher" name="book_publisher" value="${b.book_publisher}"><br>
<label for="usr">수량:</label>
<input type="number" class="form-control" id="rest_amount" name="rest_amount" min="1" value="${b.rest_amount}"><br>
<input type="hidden" name="book_num" value="${b.book_num }">
<input type="button"  class="btn btn-primary" value="이미지 수정" style="width:110px;" id="tt">	
		
		<div id="editImgBtn">
			수정할 이미지를 선택하세요<br>
			<input type="file" name="file" id="editedImg">
		</div>	
		<p></p>	

 		<div id="edit1">
		<input type="button" class="btn btn-primary" style="width:110px;" value="수정완료" id="btn11">
		</div> 
		
		<div id="edit2">
		 <input type="button" class="btn btn-primary" style="width:110px;" value="수정완료" id="btn12"> 
		 </div>
		
<div style="position: absolute; right:48%;">


<a class="btn btn-primary" href="${pageContext.request.contextPath}/book/booklistForm" style="color: white;">목록</a>
</div>
</div>
</form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>