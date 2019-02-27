<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
rel="stylesheet">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
	
<meta charset="UTF-8">

<script>
$(document).ready(function(){
	$('#sBtn').click(function(){
		var start_date = $('#start_date').val();
		var end_date = $('#end_date').val();
		if(start_date>=end_date){
			alert("시작일이 종료일보다 큽니다. 다시 선택하여 주십시오");			
		}else{
			$('#uploadForm').submit();
		}
	});
})
</script>
</head>
<!-- End Head -->

<body class="default">
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- 마이페이지 -->

<h3>일정 업로드 페이지</h3>
   	  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
 	<form action="${pageContext.request.contextPath}/manager/calendarUpload" id="uploadForm">
   	
  		<input type="hidden" name="id" value="${sessionScope.id}">
  		<div id="div1">
   	  시작일 <input type="date" id="start_date" name="start_date"><br>
   	  종료일 <input type="date" id="end_date" name="end_date"><br>
   	  </div>
 	 이벤트 <input type="text" name="event"><br>
      <input type="button" value="업로드" id="sBtn">
      </form>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>

</html>
