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
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
.rb {
	width: 50px;
}
</style>
</head>

<head>
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

</head>

<body class="default">

<!-- 본문-->
식단 상세조회 페이지
<h3>식단 정보</h3>
	<%-- <form action="${pageContext.request.contextPath}/boardDiet/editDiet" method="post" enctype="multipart/form-data" id="totalImgForm"> --%>
		<form enctype="multipart/form-data" id="totalImgForm" method="post" > 
		<img src="/img/${db.files}" width="150" height="150"><br>
		제목<br>
		<input type="text" name="title" id="title" value="${db.title}"><br> 
		 내용<br>
		<input type="text" name="content" id="content" value="${db.content}"><br>
		날짜<br/>
		<input type="text" name="time" id="time" value="${db.time}"><br>
		<input type="text" name="diet_num" id="diet_num" value="${db.diet_num}"><br> 
		 <input type="hidden" name="originalImg" id="originalImg" value="${db.files}"> 
		
		<p></p>
		<c:if test="${sessionScope.id=='manager'}">
		<input type="button" value="이미지 수정" onclick="imgBtnOn();" >	
		<div id="editImgBtn">
			수정할 이미지를 선택하세요<br>
			<input type="file" name="mfile" id="editedImg">
		</div>	
		<p></p>	

 		<div id="edit1">
		<input type="button" value="식단표 수정1" onclick="subOn1()">
		</div> 
		
		<div id="edit2">
		 <input type="button" value="식단표 수정2" onclick="subOn2()"> 
		 <div id="editImgBtn">
		 </div>
		
		<input type="button" value="식단표 삭제" onclick="location.href='deleteDiet?diet_num=${db.diet_num}'"> 
		<input type="reset" value="취소">
		</c:if>
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>

</html>
