<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">
	
<meta charset="UTF-8">
<script>
$(document).ready(function(){
	   
 	   $('#dietSubmit2').click(function(){
			var title = $('#title').val();
			var content = $('#content').val();
		   var mfile = $('#mfile').val(); 
		   
		if(mfile==''||mfile==null){
			 alert("이미지를 등록하여 주십시오");
		}else if(title==''||title==null||content==''||content==null){
			 alert("게시글 제목과 내용을 모두 입력하여 주십시오");
		}else{
			 $('#dietUploadForm').submit();
		}
	 }); 
}) 

function dietSubmit3(){
	
	
		    alert("버튼");
			var title = $('#title').val();
			var content = $('#content').val();
		   var mfile = $('#mfile').val(); 
		   
		if(mfile==''||mfile==null){
			 alert("이미지를 등록하여 주십시오");
		}else if(title==''||title==null||content==''||content==null){
			 alert("게시글 제목과 내용을 모두 입력하여 주십시오");
		}else{
			 $('#dietUploadForm').submit();
		}
	
}

</script>
</head>

<body class="default">

   <!-- 상단바 -->
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <!-- 사이드바 -->
   <div style="margin-top: 40px; margin-left: 175px;">
      <jsp:include page="/WEB-INF/views/common/side_com.jsp"></jsp:include>
   </div>

<div style="margin-top:50px; margin-left: 23%; margin-bottom: 50px; width: 50%"> 
      <h3>식단표 게시판 글 작성</h3>
      <hr style="float: left; width: 680px;">
      
      <div style="display: inline-block; margin-left: 70%;">
	<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardBulletin/bulletinList?sort=2">  >  커뮤니티</a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/community/dietListForm">  >  식단표</a>
</div><br><br>
      <p style="width: 70%;">다른 사람의 인격을 침해하거나 명예를 훼손하게 하는 글, 불쾌감을 주는 욕설 또는 비방하는 글, 유언비어나 허위사실을 유포하는 글, 도배성 글의 경우 글이 삭제되거나 이용제재를 받을 수 있습니다.</p>    


	<form action="${pageContext.request.contextPath}/boardDiet/uploadDiet" method="post" enctype="multipart/form-data" id="dietUploadForm">
		 <input type="hidden" name="id" value="${sessionScope.id}" readonly>
		
		<div class="form-group" style="padding-top:40px;"> 
		<label for="title">글 제목:</label>
		<input type="text" class="form-control" name="title" id="title"  required="required" style="max-width: 100%; width: 70%;"><br> 
		</div>
		
		<div class="form-group"> 
		<label for="title">글 내용:</label>
		<input type="text" class="form-control" name="content" id="content"  required="required" style="max-width: 100%; width: 70%; height: 200px;"><br> 
		</div>
		
		<div class="form-group">
		<label for="title">식단이미지 :</label>
		 <input type="file" name="mfile" id="mfile"><br/><br/>
		</div>
		
		<div class="form-group"  style="margin-left:60%;">
		<input type="button" style="width:120px;" class="btn btn-primary" value="식단표 등록" onclick="dietSubmit3()">
		<input type="reset" style="width:120px;" class="btn btn-primary" value="취소">
		</div>
		
	</form>
	
</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>

</html>
