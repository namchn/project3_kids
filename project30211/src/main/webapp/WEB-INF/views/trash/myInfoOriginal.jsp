<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	
<script type="text/javascript">
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
</head>
<body>

<h3>${sessionScope.id }님의 정보</h3>
   <form action="${pageContext.request.contextPath}/member/edit" method="post" id="editForm">
   	 
   	  
   	  <input type="hidden" name="mem_code" id="mem_code" value="${m.mem_code}"><br>
   	    	 
          회원아이디<br> 
        <input type="text" name="id" id="id" value="${m.id}" readonly><br>
        비밀번호<br> 
        <input type="password" name="pw" value="${m.pw}" id="pw" readonly><br> 		
   	 	이름<br>  <input type="text" name="name" id="name" value="${m.name}" readonly><br>
    	 연락처<br>  <input type="text" name="phone" id="phone" value="${m.phone}" readonly><br>
    	 주소<br> 
		<input type="text" name="postcode" id="postcode" value="${m.postcode}" readonly>
        <br> 
        <input type="text" name="address" id="address" value="${m.address}" readonly>
        <input type="text" name="detailAddress" id="detailAddress" value="${m.detailAddress}" readonly>
        <input type="text" name="extraAddress" id="extraAddress" value="${m.extraAddress}" readonly><br> 
		
      <div id="teacherDetail">
	   담당 반<br> 
	   <input type="text" name="mng_group" id="mng_group" value="${m.mng_group}" readonly><br>
	  </div>
		
 	  <div id="parentDetail">
	  아기 이름 <br> 
	  <input type="text" name="stu_name" id="stu_name" value="${m.stu_name}" readonly><br>
	  아기 반<br> 
	  <input type="text" name="stu_group" id="stu_group" value="${m.stu_group}" readonly><br>
	  </div>
    
      <br> 
      <!-- <input type="submit" value="수정 submit"> -->
      <input type="button" value="수정" id="editBtn">
      <input type="reset" value="취소" onclick="javascript:history.go(-1)"><br> 
      
   </form>
</body>
</html>