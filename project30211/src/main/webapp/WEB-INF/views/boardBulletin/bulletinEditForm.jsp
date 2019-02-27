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
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
	<form action="${pageContext.request.contextPath }/boardBulletin/bulletinEdit">   
		writer: <input type="text" name="id" value="${bb.id }" readonly><br>
		<c:if test="${sessionScope.mem_code == 1}">
			mng_group : <input type="text" name="mng_group" value="${bb.mng_group }" readonly><br>
			<input type="hidden" name="stu_group" value="" readonly>
		</c:if>      
      <c:if test="${sessionScope.mem_code == 2}">
         stu_group : <input type="text" name="stu_group" value="${bb.stu_group }" readonly><br>
         <input type="hidden" name="mng_group" value="" readonly>
      </c:if>

      title: <input type="text" name="title" value="${bb.title }" required="required"><br>
      content: <textarea name="content" required="required">${bb.content } </textarea><br>

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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>
</html>