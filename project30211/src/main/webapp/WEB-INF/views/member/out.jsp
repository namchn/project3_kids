<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
	
<meta charset="UTF-8">
	
<script type="text/javascript">
$(document).ready(function(){ 
});	
	function pwOutBtn(){
		alert("비밀번호 확인 버튼입니다.");
	      var pw = $('#outPw').val(); //val: 태그의 값을 쓰거나 읽는 함수(value속성값에)
	      var id = $('#outId').val();
	      //alert(pw);
	      //alert(id);
	      if(pw==''||pw==null) {
	         alert('비밀번호를 입력하시오');
	         return;
	      }
	      var param = "pw="+pw+"&id="+id;
	      //alert(param);
	      $.ajax({ //비동기적 요청보내다
	         type:"POST",
	         url:"${pageContext.request.contextPath}/member/checkPw", //보낼곳
	         data:param, //전송할 데이터
	         success:function(data){ //응답제대로받았을때 호출되는 함수 (서버에서 처리된값을 가져오는 함수)
	         	var obj = eval('('+data+')'); //obj:멤버변수 flag //eval : json 표현을 바꿔주다
	            var str = '';
	            if(obj.flag) {
	               str='비밀번호가 확인되었습니다.';
	               $('#outDiv').show();
	            }else {
	               str = '비밀번호가 올바르지 않습니다';
	               $('#outPw').val('');
	            }
	            $('#outPwResult').html(str);
	         }
	      });
	}



function outBtn(){
	  alert("탈퇴되었습니다.")
	  $("#outForm").submit();
}


</script>

</head>
<body class="default">
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 175px;">
   <jsp:include page="/WEB-INF/views/common/side_my.jsp"></jsp:include>
</div>
<form action="${pageContext.request.contextPath }/member/out" method="post" id="outForm">

<div style="margin-top:50px; margin-left: 450px; margin-bottom: 250px; max-width: 500px">
<h3>회원 탈퇴</h3>
<hr>
<div style="position: absolute; left: 55%;">
	<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="">  >  회원 탈퇴</a>
</div><br><br>

<p>${sessionScope.id } 님의 비밀번호 확인</p> <br>
<input type="password" name="pw" id="outPw" placeholder="비밀번호를 입력하여 주십시오" style="max-width: 80%;"><br>
<input type="hidden" name="id" value="${sessionScope.id }" id="outId"><br>
<input class="btn btn-primary" type="button" value="비밀번호 확인" onclick="pwOutBtn()" style="width: 120px;" >&nbsp;<span id="pwOutResult"></span><br>

<div id="outDiv" style="display : none">
<input class="btn btn-primary" type="button" value="탈퇴" style="width: 60px;" onclick="outBtn()">
</div>

</div>
</form>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
	
</body>
</html>