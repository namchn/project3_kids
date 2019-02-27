<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="resources/css/modules.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
	
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<style type="text/css">
a:visited {
	color: black;
}

a:link {
	color: black;
}

a {
	text-decoration: none;
	font-size: 20px;
}
</style>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js">
$(document).ready(function(){
		   
	 var mem_code = $('#mem_code').val(); 	
	 //var mem_code = $('#mem_code').name(); 
	   if(mem_code==1){
		   $("#visitorDetail").show();
		   $("#parentDetail").hide();
		   $("#teacherDetail").show();
       }else if(mem_code==2){ 
    	   $("#visitorDetail").show();
		   $("#teacherDetail").hide();
    	   $("#parentDetail").show();
       }else if(mem_code==3){ 
    	   $("#teacherDetail").hide();
    	   $("#parentDetail").hide();
    	   $("#visitorDetail").show();
       }		     
}); 

 </script>
<style type="text/css">
a:visited {
	color: black;
}

a:link {
	color: black;
}

a {
	text-decoration: none;
	font-size: 20px;
}
</style>
</head>
<!-- End Head -->

<body class="default">
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- 마이페이지 -->
<div style="padding: 40px; margin-left: 10%;">
<jsp:include page="/WEB-INF/views/common/side_my.jsp"/>
</div>
<div style="margin-left: 30%; margin-bottom: 50px; padding: 50px;">
<h3>${sessionScope.id }님의 마이페이지</h3>
<%--    <form action="${pageContext.request.contextPath}/member/edit" method="post" id="editForm"> --%>
   	 
   	 <form>
   	  <%-- <input type="button" value="내 정보 수정" action="${pageContext.request.contextPath}/member/myInfoEdit"> --%>
   	  
   	  <a href="${pageContext.request.contextPath}/member/myInfoEdit"
								style="font-size: 17px;"> <span>내정보수정<span class="glyphicon glyphicon-log-out"></span></span></a><br>
		<a href="${pageContext.request.contextPath}/member/outForm"
								style="font-size: 17px;"> <span>탈퇴<span class="glyphicon glyphicon-log-out"></span></span></a><br>			
	
		
	<a href="${pageContext.request.contextPath}/#"
								style="font-size: 17px;"> <span>내쪽지함<span class="glyphicon glyphicon-log-out"></span></span></a><br>					
   	 <!--  <input type="button" value="내 쪽지함"> -->
      <!-- <input type="reset" value="홈으로 돌아가기" onclick="javascript:history.go(-1)"><br> -->
	 <a href="${pageContext.request.contextPath}/"
								style="font-size: 17px;"> <span>홈으로 돌아가기<span class="glyphicon glyphicon-log-out"></span></span></a><br>	
      </form>
<!-- /마이페이지 -->   
</div>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>

</html>
