<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<!-- 상단바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 사이드바 -->
	<div style="margin-top: 40px; margin-left: 175px;">
		<jsp:include page="/WEB-INF/views/common/side_galary.jsp"/>
	</div>

	<div class="container" style="margin-top:50px; margin-left: 450px; margin-bottom:50px">
		<h3>갤러리 게시판 글 작성</h3>
		<hr> 	
<div align="right" style="margin-bottom: 50px; margin-right: 30%;">
			<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
			<input type="button" style="font-size: 13px; color: gray; width: 100px;background-color: white; text-decoration:none; border: 0; outline: none;" value=">  우리반이야기" onclick="history.back(-1);">
		</div>
 
		<form  id="galleryWrite" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/boardGallery/galleryWrite">
			<input type="hidden" name="id" value="${sessionScope.id}">
			<input type="hidden" name="mng_group" value="${sessionScope.mng_group}">

			<div class="form-group">
				<label for="title">글 제목:</label>
				<input type="text" class="form-control" id="title" name="title" required="required" style="max-width: 100%; width: 70%;">
			</div>

			<div class="form-group">
				<label for="content">글 내용:</label>
				<textarea class="form-control" rows="5" id="content" name="content" required="required" style="resize: none; max-width: 100%; width: 70%;" ></textarea>
			</div>
      
			<div id="fileInsertFormDiv1" name="fileInsertFormDiv">
				사진첨부 1 : <input type="file" id="file1" name="file1" required="required">
				<input type="button" id="fileInsertForm1" class="fileInsert btn btn-primary" style="margin-top: 10px;"value="파일추가">
			</div>
			
      <c:forEach var="i" begin="2" end="10" step="1">
         <div id="fileInsertFormDiv${i }" name="fileInsertFormDiv" style="display: none">
            file${i } : <input type="file" id="file${i }" name="file${i }">
            <input type="button" class="fileInsert" id="fileInsertForm${i }" value="파일추가"><br>
         </div>
      </c:forEach><br>
      <input type="hidden" name="sort" value="${sort}">
      <input type="submit" id="submit" value="작성"  class="btn btn-primary">
   </form>
   
	</div>
	<!-- 하단바 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>
</html>