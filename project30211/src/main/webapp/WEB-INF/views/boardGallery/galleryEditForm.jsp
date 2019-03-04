<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">
<script type="text/javascript">
   function deletefile1() {
      alert("메인사진은 변경만 가능합니다");
      $('#delete1').hide();
      return;
   }
   function deletefile2() {
      $('#image2').hide();
      $('#delete2').hide();
      $('#img2').val("");
   }   
   function deletefile3() {
      $('#image3').hide();
      $('#delete3').hide();
      $('#img3').val("");
   }   
   function deletefile4() {
      $('#image4').hide();
      $('#delete4').hide();
      $('#img4').val("");
   }   
   function deletefile5() {
      $('#image5').hide();
      $('#delete5').hide();
      $('#img5').val("");
   }   
   function deletefile6() {
      $('#image6').hide();
      $('#delete6').hide();
      $('#img6').val("");
   }   
   function deletefile7() {
      $('#image7').hide();
      $('#delete7').hide();
      $('#img7').val("");
   }   
   function deletefile8() {
      $('#image8').hide();
      $('#delete8').hide();
      $('#img8').val("");
   }   
   function deletefile9() {
      $('#image9').hide();
      $('#delete9').hide();
      $('#img9').val("");
   }   
   function deletefile10() {
      $('#image10').hide();
      $('#delete10').hide();
      $('#img10').val("");
   }   
</script>

</head>
<body>


	<!-- 상단바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 사이드바 -->
	<div style="margin-top: 40px; margin-left: 175px;">
		<jsp:include page="/WEB-INF/views/common/side_galary.jsp"/>
	</div>

	<div class="container" style="margin-top:50px; margin-left: 450px; margin-bottom: 50px;">
		<h3>갤러리 게시판 글 수정</h3>
		<p style="width: 70%;">다른 사람의 인격을 침해하거나 명예를 훼손하게 하는 글, 불쾌감을 주는 욕설 또는 비방하는 글, 유언비어나 허위사실을 유포하는 글, 도배성 글의 경우 글이 삭제되거나 이용제재를 받을 수 있습니다.</p> 	



  		<form action="${pageContext.request.contextPath }/boardGallery/galleryEdit" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${gb.id }">
			<input type="hidden" name="mng_group" value="${gb.mng_group }">
			
			
			<div class="form-group">
				<label for="title">글 제목:</label>
				<input type="text" class="form-control" id="title" name="title" value="${gb.title }" required="required" style="max-width: 100%; width: 70%;">
			</div>
			
			<div class="form-group">
				<label for="content">글 내용:</label>
				<textarea class="form-control" rows="5" id="content" name="content" required="required" style="resize: none; max-width: 100%; width: 70%;" >${gb.content}</textarea>
			</div>

      
      <img src="${gb.img1}" width="80" height="80" name="img1">
      <input type="hidden" id="img1" name="img1" value="${gb.img1}">
      <input type="button" value="첨부파일삭제" onclick="deletefile1()" id="delete1"><br>
      
      변경file1 : <input type="file" id="file1" name="file1"><br>
      
      
      
      
      <c:if test="${null ne gb.img2}">
         <img src="${gb.img2}" width="80" height="80" id="image2">
         <input type="hidden" id="img2" name="img2" value="${gb.img2}">
         <input type="button" value="첨부파일삭제" onclick="deletefile2()" id="delete2"><br>
      </c:if>   
      변경file2 : <input type="file" id="file2" name="file2"><br>
      
      
      
      <c:if test="${null ne gb.img3}">
         <img src="${gb.img3}" width="80" height="80" id="image3">
         <input type="hidden" id="img3" name="img3" value="${gb.img3}">
         <input type="button" value="첨부파일삭제" onclick="deletefile3()" id="delete3"><br>
      </c:if>      
      변경file3 : <input type="file" id="file3" name="file3"><br>
      
      
      
      <c:if test="${null ne gb.img4}">
         <img src="${gb.img4}" width="80" height="80" id="image4">
         <input type="hidden" id="img4" name="img4" value="${gb.img4}">
         <input type="button" value="첨부파일삭제" onclick="deletefile4()" id="delete4"><br>
      </c:if>            
      변경file4 : <input type="file" id="file4" name="file4"><br>
      
      <c:if test="${null ne gb.img5}">
         <img src="${gb.img5}" width="80" height="80" id="image5">
         <input type="hidden" id="img5" name="img5" value="${gb.img5}">
         <input type="button" value="첨부파일삭제" onclick="deletefile5()" id="delete5"><br>
      </c:if>   
      변경file5 : <input type="file" id="file5" name="file5"><br>
      
      <c:if test="${null ne gb.img6}">
         <img src="${gb.img6}" width="80" height="80" id="image6">
         <input type="hidden" id="img6" name="img6" value="${gb.img6}">
         <input type="button" value="첨부파일삭제" onclick="deletefile6()" id="delete6"><br>
      </c:if>   
      변경file6 : <input type="file" id="file6" name="file6"><br>
         
      <c:if test="${null ne gb.img7}">
         <img src="${gb.img7}" width="80" height="80" id="image7">
         <input type="hidden" id="img7" name="img7" value="${gb.img7}">
         <input type="button" value="첨부파일삭제" onclick="deletefile7()" id="delete7"><br>
      </c:if>   
      변경file7 : <input type="file" id="file7" name="file7"><br>   
         
      <c:if test="${null ne gb.img8}">
         <img src="${gb.img8}" width="80" height="80" id="image8">
         <input type="hidden" id="img8" name="img8" value="${gb.img8}">
         <input type="button" value="첨부파일삭제" onclick="deletefile8()" id="delete8"><br>
      </c:if>   
      변경file8 : <input type="file" id="file8" name="file8"><br>
      
      <c:if test="${null ne gb.img9}">
         <img src="${gb.img9}" width="80" height="80" id="image9">
         <input type="hidden" id="img9" name="img9" value="${gb.img9}">
         <input type="button" value="첨부파일삭제" onclick="deletefile9()" id="delete9"><br>
      </c:if>   
      변경file9 : <input type="file" id="file9" name="file9"><br>
      
      <c:if test="${null ne gb.img10}">
         <img src="${gb.img10}" width="80" height="80" id="image10">
         <input type="hidden" id="img10" name="img10" value="${gb.img10}">
         <input type="button" value="첨부파일삭제" onclick="deletefile10()" id="delete10"><br>
      </c:if>   
      변경file10 : <input type="file" id="file10" name="file10"><br>
      
      
      <input type="hidden" name="gallery_num" value="${gb.gallery_num }">
      <input type="hidden" name="sort" value="${sort}">
      <input type="submit" class="btn btn-primary" value="작성">
   </form>
   
	</div>
	<!-- 하단바 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
	
</body>
</html>