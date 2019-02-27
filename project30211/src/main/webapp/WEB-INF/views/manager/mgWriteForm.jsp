<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="../resources/css/style.min.css" />"
   rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
 메인갤러리 업로드폼
   <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/manager/mgWrite">
   
      <div id="fileInsertFormDiv1" name="fileInsertFormDiv">
            file1 : <input type="file" id="file1" name="file1" required="required">
           
         </div>

      <div id="wrapper"></div>
             <input type="button" class="fileInsert1" id="fileInsertForm1" value="파일추가" style="display: block;">
             <input type="button" class="fileInsert" id="fileInsertForm2" value="파일추가" style="display: none;">
             <input type="button" class="fileInsert" id="fileInsertForm3" value="파일추가" style="display: none;">
      <input type="submit" id="submit" value="작성">
      <input type="reset" value="취소">
   </form>
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
         var str1="";
         var str2="";
         var str3="";
      $('#fileInsertForm1').click(function d() {
         var file1 = $('#file1').val();
         if(file1 == null || file1 ==""){
            alert("파일을 먼저 추가해주세요");
            return;
         }else if(file1 != null || file1 != ""){
           $('#fileInsertForm1').css("display","none");
            /* $('#fileInsertFormDiv'+(b)).css("display","block"); */
            str1 +='<div id="fileInsertFormDiv2"';
            str1 +=' name="fileInsertFormDiv">';
            str1 +='file2 : <input type="file" id="file2" name="file2">';
            str1 +='</div>'
            $('#fileInsertForm2').css("display","block");
            $('#wrapper').append(str1);
         }
      })
       $('#fileInsertForm2').click(function d() {
         var file2 = $('#file2').val();
         if(file2 == null || file2 ==""){
            alert("파일을 먼저 추가해주세요");
            return;
         }else if(file2 != null || file2 != ""){
           $('#fileInsertForm2').css("display","none");
            /* $('#fileInsertFormDiv'+(b)).css("display","block"); */
            str2 +='<div id="fileInsertFormDiv3"';
            str2 +=' name="fileInsertFormDiv">';
            str2 +='file3 : <input type="file" id="file3" name="file3">';
            str2 +='</div>'
            $('#fileInsertForm3').css("display","block");
            $('#wrapper').append(str2);
         }
      })
       $('#fileInsertForm3').click(function d() {
         var file3 = $('#file3').val();
         if(file3 == null || file3 ==""){
            alert("파일을 먼저 추가해주세요");
            return;
         }else if(file3 != null || file3 != ""){
           $('#fileInsertForm3').css("display","none");
            /* $('#fileInsertFormDiv'+(b)).css("display","block"); */
            str3 +='<div id="fileInsertFormDiv4"';
            str3 +=' name="fileInsertFormDiv">';
            str3 +='file4 : <input type="file" id="file4" name="file4">';
            str3 +='</div>'
  
            $('#wrapper').append(str3);
         }
      })
      
      
          
   })
   
</script>
</body>
</html>