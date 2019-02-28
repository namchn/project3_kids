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
<title>떡잎유치원 - 도서 추가</title>





<script>
$(document).ready(function(){
   $('#sBtn').click(function(){
      var start_date = $('#start_date').val();
      var end_date = $('#end_date').val();
      if(start_date>=end_date){
         alert("시작일이 종료일보다 작아야 합니다. 다시 선택하여 주십시오");         
      }else{
         $('#uploadForm').submit();
      }
   });
})
</script>

<style type="text/css">
.form-control{
max-width: 51%;
width: 40%;
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>




<div style="margin-top: 40px; margin-left: 175px;">
   <%-- <jsp:include page="/WEB-INF/views/common/side_book.jsp"></jsp:include> --%>
</div>

<br>
<br>
<br>
<br>
<div class="container" style="margin-top:50px; margin-left: 450px; margin-bottom: 80px ">
<div style="margin-bottom: 30px;">
<h3 style="display: inline;">일정 업로드 페이지 </h3><i class="fas fa-book fa-2x text-gray-300" style="margin-right: 20px; color:gray;"></i>
</div>
<div style="position: absolute; left: 60%;">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath}"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath}/manager/manager">  >  관리페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath}/manager/calendarManage">  >  일정 목록</a>
</div><br><br>



<form name="addForm" action="${pageContext.request.contextPath}/manager/calendarUpload" method="post" id="uploadForm">
<input type="hidden" name="id" value="${sessionScope.id}">

<div class="form-group">
<div id="div1">
<label for="usr">시작일:</label>
<input type="date" id="start_date" name="start_date"><br>
<label for="usr">종료일:</label>
<input type="date" id="end_date" name="end_date"><br>
 </div>
 
<label for="usr">이벤트:</label>
<input type="text" name="event"><br>
<!-- <input type="button" value="업로드" id="sBtn">
 -->
 
 <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div style="position: absolute; text-align:center; ">
<input class="btn btn-primary" type="button" value="업로드"  id="sBtn" style="width: 60px;">
<a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/calendarManage" style="color: white;">목록</a>
</div>

</div>
</form>




</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script src="../resources/js/index.js"></script>
</body>
</html>