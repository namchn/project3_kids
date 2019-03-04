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
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">


	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Aperitif - Custom Template</title>

	<link rel="stylesheet" href="../resources/css/style.min.css">
	<link rel="stylesheet" href="../resources/css/modules.css">

	<!-- Canonical URL usage -->
	<link rel="canonical" href="https://aperitif.io/">

	<!-- Facebook Open Graph -->
	<meta property="og:url"                content="https://aperitif.io/" />
	<meta property="og:title"              content="Aperitif | The web template generator" />
	<meta property="og:description"        content="Aperitif is a rapid web template generation tool." />
	<meta property="og:image"              content="https://aperitif.io/img/aperitif-facebook.png" />
	<meta property="og:image:width"        content="1200" />
	<meta property="og:image:height"       content="630" />

	<!-- Twitter Cards -->
	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:site" content="@Aperitif">
	<meta name="twitter:creator" content="@Aperitif">
	<meta name="twitter:title" content="Aperitif - The web template generator">
	<meta name="twitter:description" content="Aperitif is a rapid web template generation tool.">
	<meta name="twitter:image" content="https://aperitif.io/img/aperitif-card.png">

	<!-- Google Structured Data -->
	<script type="application/ld+json">
	{
	"@context" : "http://schema.org",
	"@type" : "SoftwareApplication",
	"name" : "Aperitif",
	"image" : "https://aperitif.io/img/aperitif-logo.svg",
	"url" : "https://aperitif.io/",
	"author" : {
	  "@type" : "Person",
	  "name" : "Octavector"
	},
	"datePublished" : "2017-MM-DD",
	"applicationCategory" : "HTML"
	}
	</script>
	<style type="text/css">
 .con{
 margin-bottom: 10px;
 margin-top: 10px;
 }
 .con>input[type=text]{
 max-width: 40%;
 }
 .con>p{
 	font-weight: bolder;
 }
</style>
</head>

<!-- End Head -->

<body class="default">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#editImgBtn').hide();
	$('#edit2').hide();//이미지변경한 후 생기는 수정버튼 hide
	var title = $('#title').val();
	var content = $('#content').val();
});
  function imgBtnOn(){
	  $('#editImgBtn').show();  
	  $('#edit1').hide()//기존식단표수정 버튼 hide
	  $('#edit2').show()//기존식단표에서 새로운 이미지로 버튼한 후 식단표 수정 버튼 show
  }
  
  function deleteDiet(){
	  alert("해당 식단표를 삭제합니다"); 
	  }
  
  function subOn1(){
	  //alert("subOn1-이미지변경없이게시글수정")
	  document.getElementById("totalImgForm").action = "${pageContext.request.contextPath}/boardDiet/editDiet";  	  
	 /*  var dietImg = $('#editedImg').val();
	  alert(dietImg);
	  if(dietImg==''||dietImg==null){
		  alert("이미지는 변경하지 않으셨습니다.")
		  $('#totalImgForm').submit();		  
	  }else{	
		  alert("첨부된이미지: "+dietImg);
		  $('#totalImgForm').submit();
	  } */
	  if(title==''||title==null||content==''||content==null){
		  alert("게시글 제목과 내용을 모두 입력하여 주십시오");
	  }else{
		  $('#totalImgForm').submit();
	  }		  
  }  
  function subOn2(){
	  //alert("subOn2-이미지변경하여 게시글수정")
	  document.getElementById("totalImgForm").action = "${pageContext.request.contextPath}/boardDiet/editDiet2";   
	  if(title==''||title==null||content==''||content==null){
		  alert("게시글 제목과 내용을 모두 입력하여 주십시오");
	  }else{
		  $('#totalImgForm').submit();
	  }	
  }   
 </script>
<div style="margin-left: 175px; margin-top: 40px;">
<jsp:include page="/WEB-INF/views/common/side_com.jsp"></jsp:include>
</div>
<!-- 본문-->
<div class="container" style="margin-left: 23%; margin-bottom: 50px;">
<h3>식단 정보</h3>
<hr>
<div align="right" style="margin-bottom: 50px; margin-right: 30%;">
			<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
			<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2">  >  커뮤니티</a>
			<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardDiet/dietListForm">  >  식단표</a>
		</div>
	<%-- <form action="${pageContext.request.contextPath}/boardDiet/editDiet" method="post" enctype="multipart/form-data" id="totalImgForm"> --%>
		<form enctype="multipart/form-data" id="totalImgForm" method="post" > 
		<img src="../resources/img/${db.files}" width="450px" height="300">
		<div class="con">
		<p>제목</p>
		<input type="text" name="title" id="title" value="${db.title}"><br> 
		</div>
		 <div class="con">
		 <p>내용</p>
		<input type="text" name="content" id="content" value="${db.content}"><br>
		</div>
		<div class="con">
		<p>날짜</p>
		<input type="datetime" name="time" style="max-width: 40%; height: 35px; margin-bottom: 10px;"id="time" value="${db.time}"><br>
		<input type="text" name="diet_num" id="diet_num" value="${db.diet_num}"><br> 
		 <input type="hidden" name="originalImg" id="originalImg" value="${db.files}"> 
		</div>
		<c:if test="${sessionScope.id=='manager'}">
		<input type="button"  class="btn btn-primary" value="이미지 수정" style="width:110px;" onclick="imgBtnOn();" >	
		<div id="editImgBtn">
			수정할 이미지를 선택하세요<br>
			<input type="file" name="mfile" id="editedImg">
		</div>	
		<p></p>	

 		<div id="edit1">
		<input type="button" class="btn btn-primary" style="width:110px;" value="식단표 수정" onclick="subOn1()">
		</div> 
		
		<div id="edit2">
		 <input type="button" class="btn btn-primary" style="width:110px;" value="식단표 수정" onclick="subOn2()"> 
		 </div>
		<div style="margin-top: 10px; margin-left: 35%;" >
		<input type="button" class="btn btn-primary" value="식단표 삭제" style="width: 100px;" onclick="location.href='deleteDiet?diet_num=${db.diet_num}'"> 
		<input type="reset" class="btn btn-primary" value="취소" style="width: 100px;">
		</div>
		</c:if>
	</form>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>

</html>
