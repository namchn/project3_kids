<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var b = 1;
		$('.fileInsert').click(function() {
			var file1 = $('#file'+ (b)).val();
			if(file1 == null || file1 ==""){
				alert("파일을 먼저 추가해주세요");
				return;
			}else if(file1 != null || file1 != ""){
				$('#fileInsertForm'+(b)).css("display","none");
				b++;
				$('#fileInsertFormDiv'+(b)).css("display","block");
			}
		})    
	})
   
</script>

</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
 
   <form  id="galleryWrite" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/boardGallery/galleryWrite">
      write : <input type="text" name="id" value="${sessionScope.id}" readonly><br>
      mng_group: <input type="text" name="mng_group" value="${sessionScope.mng_group}" readonly><br>
      title : <input type="text" name="title" required="required"><br>
      content: <textarea name="content"></textarea><br>
      <div id="fileInsertFormDiv1" name="fileInsertFormDiv">
         file1 : <input type="file" id="file1" name="file1" required="required">
         <input type="button" id="fileInsertForm1" class="fileInsert" value="파일추가"><br>
      </div>
      <c:forEach var="i" begin="2" end="10" step="1">
         <div id="fileInsertFormDiv${i }" name="fileInsertFormDiv" style="display: none">
            file${i } : <input type="file" id="file${i }" name="file${i }">
            <input type="button" class="fileInsert" id="fileInsertForm${i }" value="파일추가"><br>
         </div>
      </c:forEach>
      <input type="hidden" name="sort" value="${sort}">
      <input type="submit" id="submit" value="작성">
   </form>
   
   
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>