<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aperitif - Custom Template</title>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">
	
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<style type="text/css">
a:visited {
	color: black;
}

a:link {
	color: black;
}

a {
	text-decoration: none;
	font-size: 20px;
}
</style>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){

		   
 	   $('#dietSubmit2').click(function(){
		   alert("dietsubmit");
			
			var title = $('#title').val();
			var content = $('#content').val();
			alert(title);
			alert(content);
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

/* function dietSubmit1(){
	 var mfile = $('#mfile').val(); 
	 if(mfile==''||mfile==null){
		 alert("이미지를 등록하여 주십시오");
	 }else if(title==''||title==null||content==''||content==null){
		 alert("게시글 제목과 내용을 모두 입력하여 주십시오");
	 }
	 else{
		 $('#dietUploadForm').submit();
	 }
} */

</script>
<style type="text/css">
a:visited {
	color: black;
}

a:link {
	color: black;
}

a {
	text-decoration: none;
	font-size: 20px;
}
</style>
</head>

<body class="default">

<!-- 본문-->
식단 업로드 페이지

<h3>식단 업로드</h3>
	<form action="${pageContext.request.contextPath}/boardDiet/uploadDiet" method="post" enctype="multipart/form-data" id="dietUploadForm">
		
		제목: <input type="text" name="title" id="title"><br> 
		내용 : <input type="text" name="content" id="content"><br> 	
		식단이미지 : <input type="file" name="mfile" id="mfile"><br/><br/>
		
		<input type="button" value="식단표 등록" id="dietSubmit2">
		<input type="reset" value="취소">
	</form>
	<script src="../resources/js/index.js"></script>
</body>

</html>
