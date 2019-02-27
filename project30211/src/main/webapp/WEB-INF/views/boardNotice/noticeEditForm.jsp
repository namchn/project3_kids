<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
rel="stylesheet">
<title>Insert title here</title>
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
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h3>공지사항  수정</h3>
	<form action="${pageContext.request.contextPath }/boardNotice/noticeEdit" method="post" enctype="multipart/form-data">
      writer: <input type="text" name="id" value="${nb.id}" readonly><br>
      title: <input type="text" name="title" value="${nb.title}" required="required"><br>
      content: <textarea name="content" required="required">${nb.content}</textarea><br>
      현재 files : ${nb.files}<br>
      
         
      변경 files : <input type="file" id="notice_files" name="notice_files"><br>


      <input type="hidden" id="files" name="files" value="${nb.files}">
      <input type="button" value="첨부파일삭제" onclick="deletefile();">
      

      
      <input type="hidden" name="notice_num" value="${nb.notice_num}">
      <input type="hidden" name="sort" value="${sort}">
      <input type="submit" value="수정">
   </form>

	<a href="${pageContext.request.contextPath}/boardNotice/noticeList">목록</a>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>