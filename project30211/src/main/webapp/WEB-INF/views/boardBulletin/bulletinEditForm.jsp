<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
rel="stylesheet">
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 사이드바 -->
	<div style="margin-top: 40px; margin-left: 175px;">
		<jsp:include page="/WEB-INF/views/common/side_com.jsp"></jsp:include>
	</div>
	
	<div class="container" style="margin-top:50px; margin-left: 450px;">
		<h3>자유 게시판 글 작성</h3>
		<p style="width: 70%;">다른 사람의 인격을 침해하거나 명예를 훼손하게 하는 글, 불쾌감을 주는 욕설 또는 비방하는 글, 유언비어나 허위사실을 유포하는 글, 도배성 글의 경우 글이 삭제되거나 이용제재를 받을 수 있습니다.</p> 	

    
		<form action="${pageContext.request.contextPath }/boardBulletin/bulletinEdit">
			<input type="hidden" name="id" value="${bb.id }">
			<c:if test="${sessionScope.mem_code == 1}">
				<input type="hidden" name="mng_group" value="${bb.mng_group }">
				<input type="hidden" name="stu_group" value="">
			</c:if>      
      		<c:if test="${sessionScope.mem_code == 2}">
         		<input type="hidden" name="stu_group" value="${bb.stu_group }">
         		<input type="hidden" name="mng_group" value="">
      		</c:if>

			<div class="form-group">
				<label for="title">글 제목:</label>
				<input type="text" class="form-control" id="title" name="title" value="${bb.title }" required="required" style="max-width: 100%; width: 70%;">
			</div>
			<div class="form-group">
				<label for="content">글 내용:</label>
				<textarea class="form-control" rows="10" id="content" name="content" required="required" style="resize: none; max-width: 100%; width: 70%;" >${bb.content }</textarea>
			</div>


      <c:if test="${bb.secret==1}">
         비밀글여부 : <input type="radio" name="secret" value="1" checked>예
             <input type="radio" name="secret" value="0">아니오<br>
      </c:if>
      <c:if test="${bb.secret==0}">
         비밀글여부 : <input type="radio" name="secret" value="1">예
             <input type="radio" name="secret" value="0" checked>아니오<br>
      </c:if>
          
      <input type="hidden" name="bulletin_num" value="${bb.bulletin_num }">
      <input type="hidden" name="sort" value="${sort}">
      <input type="submit" value="작성">
	</form>   
   
   
	</div>
	
	<!-- 하단바 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>
</html>