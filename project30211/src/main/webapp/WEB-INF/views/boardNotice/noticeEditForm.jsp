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
   function deletefile() {
      alert("온클릭실행");
       //$( 'input' ).remove('#notice_files'); 
      $( '#files' ).val(""); 
   }
</script>

</head>
<body>
	<!-- 상단바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 사이드바 -->
	<div style="margin-top: 40px; margin-left: 175px;">
		<jsp:include page="/WEB-INF/views/common/side_com.jsp"></jsp:include>
	</div>
	
	
	
	
	<div class="container" style="margin-top:50px; margin-left: 450px; margin-bottom: 50px;">
	
	
		<h3>공지사항 게시판  글 수정</h3>
		<p style="width: 70%;">다른 사람의 인격을 침해하거나 명예를 훼손하게 하는 글, 불쾌감을 주는 욕설 또는 비방하는 글, 유언비어나 허위사실을 유포하는 글, 도배성 글의 경우 글이 삭제되거나 이용제재를 받을 수 있습니다.</p>

		<form action="${pageContext.request.contextPath }/boardNotice/noticeEdit" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${nb.id}"><br>
			<div class="form-group">
				<label for="title">글 제목:</label>
				<input type="text" class="form-control" id="title" name="title" value="${nb.title}" required="required" style="max-width: 100%; width: 70%;">
			</div>			
			<div class="form-group">
				<label for="content">글 내용:</label>
				<textarea class="form-control" rows="10" id="content" name="content" required="required" style="resize: none; max-width: 100%; width: 70%;" >${nb.content}</textarea>
			</div>			

      현재 files : ${nb.files}<br>
      
         
      변경 files : <input type="file" id="notice_files" name="notice_files"><br>


      <input type="hidden" id="files" name="files" value="${nb.files}">
      <input type="button" value="첨부파일삭제" onclick="deletefile();" style="width:100px;"><br><br>

      <input type="hidden" name="notice_num" value="${nb.notice_num}">
      <input type="hidden" name="sort" value="${sort}">
      <input type="submit" value="수정" class="btn btn-primary">
	
   </form>

	
	
	
	
	
	</div>
	
	<!-- 하단바 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>
</html>