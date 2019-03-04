<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-login-btn"><img src="resources/img/kakao.png" style="cursor: pointer;"></a>
<input type="button" onclick="logout()">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('b252e724ff8dc026ff00d1148871176b');
    // 카카오 로그인 버튼을 생성합니다.
    $('#kakao-login-btn').click(function login(){
    	 Kakao.Auth.loginForm();
    })
    
  //]]>
  function logout(){
	  Kakao.Auth.logout(function(){
		  setTimeout(function(){
			  location.href="${pageContext.request.contextPath}/cacao"},1000);
		  });
	  
  }
</script>
</body>
</html>
