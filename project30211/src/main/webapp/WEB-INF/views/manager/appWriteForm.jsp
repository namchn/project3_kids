<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/> 
<div class="container" style="margin-top:50px; margin-left: 22%; margin-bottom: 80px">
<div style="margin-bottom: 30px;">
<h3>원서 파일 업로드<span>&nbsp;<i class="fas fa-file-upload fa-2x text-gray-300" style="font-size: 28px; margin-right: 20px; color:gray;"></i></span></h3>
<hr style="width: 700px; float: left">
</div>
<div style="display:inline-block; margin-left: 40%;">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath}"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath}/manager/manager">  >  관리자 페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath}/manager/appWriteForm">  >  원서 파일 업로드</a>
</div><br><br>

 <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/manager/appWrite">
   
      <div id="fileInsertFormDiv1" name="fileInsertFormDiv">
      <label>입학원서: </label>
           <input type="file" id="file1" name="file1" required="required">
           
         </div>

      <div id="wrapper" style="margin-bottom: 30px; margin-top: 20px;">
      </div>
      <div style="display: flex;">
             <input type="button" class="fileInsert1 btn btn-primary" id="fileInsertForm1" value="파일추가" style="display: block; width: 80px; margin-right: 10px;">
            
      <input class="btn btn-primary" type="submit" id="submit" value="작성" style="width: 60px; margin-right: 10px;">
      <input class="btn btn-primary" type="reset" value="취소" style="width: 60px;">
      </div>
   </form>
</div>

   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
         var str1="";
      $('#fileInsertForm1').click(function d() {
         var file1 = $('#file1').val();
         if(file1 == null || file1 ==""){
            alert("파일을 먼저 추가해주세요");
            return;
         }else if(file1 != null || file1 != ""){
           $('#fileInsertForm1').css("display","none");
            str1 +='<div id="fileInsertFormDiv2"';
            str1 +=' name="fileInsertFormDiv">';
            str1 +='<label>우선입학대상 원서:</label>';
            str1 +='<input type="file" id="file2" name="file2">';
            str1 +='</div>'
            $('#fileInsertForm2').css("display","block");
            $('#wrapper').append(str1);
         }
      })      
   })  
</script>
</body>
</html>