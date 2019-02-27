<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aperitif - Custom Template</title>

<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
	
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
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
   
	$('#editBtn').click(function() {
	   var id = $('#id').val(); 
	   var pw = $('#pw').val(); 
	   var name = $('#name').val(); 
	   var phone = $('#phone').val(); 
	      if(id==''||id==null||pw==''||pw==null||name==''||name==null||phone==''||phone==null) {
	         alert('필수정보를 모두 입력하시오');
	         return;
	      }else
	    	  alert('수정되었습니다');
	    	  $("#editForm").submit();      
	});	
}); 

function passCheck() {
	var pw = $("#pw").val();
	var pw_check = $("#pw_check").val();
	if (pw != pw_check) {
		$("#pwResult").html("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	} else {
		$("#pwResult").html("");
		$("#pwResult").html("일치");
	}
} 

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
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

<body class="default">
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div style="margin-left: 10%; padding: 40px;"><jsp:include page="/WEB-INF/views/common/side_my.jsp"/></div>
<!--회원정보수정-->
<div style="margin-left: 30%; padding-bottom: 40px; padding-left: 40px;">
<h3>${sessionScope.id }님의 회원정보</h3>
   <form action="${pageContext.request.contextPath}/member/edit" method="post" id="editForm">
   	 
   	  
   	  <input type="hidden" name="mem_code" id="mem_code" value="${m.mem_code}"><br>
   	 
                        <div id="visitorDetail">
                        <p>*표시는 필수입력사항입니다.</p>
                                                   
                        <div class="form-group">
                                <label for="id"><span class="glyphicon glyphicon-user"></span> UserID</label>
                                <input type="text" class="form-control" name="id" id="id" placeholder="Enter userID" value="${m.id}">
                                <input type="button" value="중복체크" id="idBtn"><span id="idResult"></span><br> 
                              </div>
                        
                         <div class="form-group">
                                <label for="pw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                               <input type="password" class="form-control" name="pw" id="pw" placeholder="Enter password" onkeyup="passCheck()" value="${m.pw}">
                              </div> 
                              <div class="form-group">
                                <label for="pw"><span class="glyphicon glyphicon-eye-open"></span> Password 확인</label>
                               <input type="password" class="form-control" name="pw_check" id="pw_check" placeholder="Enter password" onkeyup="passCheck()" value="${m.pw}"> 
                               <span id="pwResult"></span><br>
                              </div> 
                        <div class="form-group">
                                <label for="name"><span class="glyphicon glyphicon-book-address"></span> 이름</label>
                               <input type="text" class="form-control" name="name" id="name" placeholder="Enter name" value="${m.name}">
                             </div> 
                             <div class="form-group">
                                <label for="phone"><span class="glyphicon glyphicon-phone"></span> 연락처</label>
                               <input type="text" class="form-control" name="phone" id="phone" placeholder="Enter phone" value="${m.phone}">
                             </div> 
                             <div class="form-group">
                                <label for="postcode"><span class="glyphicon glyphicon-envelope"></span> 우편번호</label>
                               <input type="text" class="form-control" name="postcode" id="postcode" placeholder="우편번호" value="${m.postcode}">
                               <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                             </div>
                             <div class="form-group">
                                <label for="address"><span class="glyphicon glyphicon-home"></span> 주소</label>
                               <input type="text" class="form-control" name="address" id="address" placeholder="주소" value="${m.address}">
                           <input type="text" class="form-control" name="detailAddress" id="detailAddress" placeholder="상세주소" value="${m.detailAddress}">
                           <input type="text" class="form-control" name="extraAddress" id="extraAddress" placeholder="참고항목" value="${m.extraAddress}">
                             </div>          

                        <div id="teacherDetail">
                        <div class="form-group">
                                <label for="mng_group"><span class="glyphicon glyphicon-family"></span>담당 반</label>
                               <input type="text" class="form-control" name="mng_group" id="mng_group" placeholder="담당 반" value="${m.mng_group}">                         
                             </div>
                        </div>

                        <div id="parentDetail">
                           <div class="form-group">
                                      <label for="stu_name"><span class="glyphicon glyphicon-girl"></span>아기 이름</label>
                                     <input type="text" class="form-control" name="stu_name" id="stu_name" placeholder="아기 이름" value="${m.stu_name}">   
                            </div>
                               <div class="form-group">
                                      <label for="stu_group"><span class="glyphicon glyphicon-users"></span>아기 반</label>
                                     <input type="text" class="form-control" name="stu_group" id="stu_group" placeholder="아기 반" value="${m.stu_group}">   
                            </div>
                        </div>
    
      <br> 
      </div>
      <input type="button" value="수정" id="editBtn">
      <input type="reset" value="뒤로 돌아가기" onclick="javascript:history.go(-1)"><br> 
      
   </form>
   </div>
   <!--/회원정보수정-->   

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>