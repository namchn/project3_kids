<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />"
   rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
   rel="stylesheet">

<meta charset="UTF-8">

<script type="text/javascript">
$(document).ready(function(){
   
     //회원가입 조건
      $('#editBtn1').click(function() {
         alert("회원 수정 버튼");
         var phoneJoinResult = $('#phoneJoinResult').html();
         var phone = $('#editPhone').val();
         var pw = $('#editPw').val();
         //alert(pw);
         var phoneLength = phone.length;
         var pwLength = pw.length;
        // alert(pwLength);
         
           if(pwLength>12||pwLength<8){
               alert('비밀번호는 8자리 이상 12자리 이하여야 합니다');
            }
            else if(phoneLength<10||phoneLength>11){
               alert('연락처는 10자리 혹은 11자리이어야 합니다');
            }
            else if(phoneEditResult!='사용가능한 연락처'){
               alert('연락처 중복체크를 완료하십시오');
            }
            else{
               $('#editForm').submit();
            }
                   
         });
}); 

//회원가입 조건

   function editBtn() {
      alert("회원 수정 버튼");
      var phoneEditResult = $('#phoneEditResult').html();
      var phone = $('#editPhone').val();
      var pw = $('#editPw').val();
      //alert(pw);
      var phoneLength = phone.length;
      var pwLength = pw.length;
     // alert(pwLength);
      
        if(pwLength>12||pwLength<8){
            alert('비밀번호는 8자리 이상 12자리 이하여야 합니다');
         }
         else if(phoneLength<10||phoneLength>11){
            alert('연락처는 10자리 혹은 11자리이어야 합니다');
         }
         else if(phoneEditResult!='사용가능한 연락처'){
            alert('연락처 중복체크를 완료하십시오');
         }
         else{
            $('#editForm').submit();
         }
                
   }
      
function passCheck1() {
   var pw = $("#editPw").val();
   var pw_check = $("#editPw_check").val();
   if (pw != pw_check) {
      $("#editPwResult").html("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
   } else {
      $("#editPwResult").html("");
      $("#editPwResult").html("일치");
   }
} 

function editPhoneBtn(){
   
   var phone = $('#editPhone').val();
    var phoneLength = phone.length;
    var param = "phone="+phone;
      
      $.ajax({ //비동기적 요청보내다
         type:"POST",
         url:"${pageContext.request.contextPath}/member/checkPhone", //보낼곳
         data:param, //전송할 데이터
         success:function(data){ //응답제대로받았을때 호출되는 함수 (서버에서 처리된값을 가져오는 함수)
            var obj = eval('('+data+')'); //obj:멤버변수 flag //eval : json 표현을 바꿔주다
            var str = '';
            if(obj.flag) {
               str='사용가능한 연락처';
            }else {
               str ='중복된 연락처';
               $('#editPhone').val('');
            }
            $('#phoneEditResult').html(str);
         }
      });
     
}

function execDaumPostcode1() {
   
   
   new daum.Postcode({
      oncomplete : function(data) {
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
         if (data.userSelectedType === 'R') {
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
               extraAddr += data.bname;
            
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
               extraAddr += (extraAddr !== '' ? ', '
                     + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraAddr !== '') {
               extraAddr = ' (' + extraAddr + ')';
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            document.getElementById("editExtraAddress").value = extraAddr;

         } else {
            document.getElementById("editExtraAddress").value = '';
         }
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         document.getElementById("editPostcode").value = data.zonecode;
         document.getElementById("editAddress").value = addr;
         // 커서를 상세주소 필드로 이동한다.
         document.getElementById("editDetailAddress").focus();
         document.getElementById("editDetailAddress").value = '';
      }
   }).open();
}

 </script>
</head>

<body class="default">
   <!-- 상단바 -->
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
   <!-- 사이드바 -->

   <div style="margin-top: 40px; margin-left: 175px;">
      <jsp:include page="/WEB-INF/views/common/side_my.jsp"></jsp:include>
   </div>


   <div class="container" style="width: 1000px; margin-bottom: 100px;">
      <h3>나의 회원정보 수정</h3>
      <hr>
      <div align="right">
         <a class="glyphicon glyphicon-home"
            style="font-size: 12px; color: darkred; text-decoration: none"
            href="${pageContext.request.contextPath }"></a> <a
            style="font-size: 13px; color: gray; text-decoration: none"
            href="${pageContext.request.contextPath }/member/myInfo"> >
            마이페이지</a>
      </div>
      <br> <br>
      <form action="${pageContext.request.contextPath}/member/edit"
         method="post" id="editForm">

         <div class="form-group" style="margin-left: 25%;">
            <input type="hidden" name="mem_code" id="mem_code"
               value="${sessionScope.mem_code}"><br>

            <div id="visitorDetail">
               <p>*표시는 필수입력사항입니다.</p>


               <label for="id">UserID</label>
               <div style="display: flex;">
                  <input type="text" class="form-control" name="id" id="editId"
                     value="${m.id}" style="margin-right: 10px;" readonly>
               </div>

               <label for="pw">Password</label> <input type="password"
                  class="form-control" name="pw" id="editPw"
                  placeholder="Enter password" onkeyup="passCheck1()"
                  value="${m.pw}" required="required"> <label for="pw">Password
                  확인</label> <input type="password" class="form-control" name="pw_check"
                  id="editPw_check" placeholder="Enter password"
                  onkeyup="passCheck1()" value="${m.pw}" required="required">
               <span id="editPwResult"></span><br> <label for="name">이름</label>
               <input type="text" class="form-control" name="name" id="editName"
                  placeholder="Enter name" value="${m.name}" required="required">
               <label for="phone"> 연락처</label> <input type="text"
                  class="form-control" name="phone" id="editPhone"
                  value="${m.phone}" required="required" onkeyup="editPhoneBtn()">
               <span id="phoneEditResult"></span><br> 
               
         
               <label for="editPostcode">우편번호</label> <input
                  type="text" class="form-control" name="postcode" id="editPostcode"
                   placeholder="우편번호" value="${m.postcode}"> <input type="button"
                  onclick="execDaumPostcode1()" value="우편번호 찾기"><br>
            
            
               <label for="editAddress">주소</label> 
                  <input type="text" class="form-control" name="address" id="editAddress" placeholder="주소" value="${m.address}"> 
                  <input type="text" class="form-control" name="detailAddress" id="editDetailAddress" placeholder="상세주소" value="${m.detailAddress}"> 
                  <input type="text" class="form-control" name="extraAddress" id="editExtraAddress" placeholder="참고항목" value="${m.extraAddress}">
               </div>
            
            
         

            <c:if test="${sessionScope.mem_code eq 1 }">
               <div id="teacherDetail">

                  <label for="mng_group" style="width: max-content;">담당
                     반&nbsp;&nbsp;</label> <select id="selectBox" name="selectMngGroupBox">
                     <c:choose>
                        <c:when test="${sessionScope.mng_group eq 1}">
                           <option value="1" selected>장미반</option>
                           <option value="2">해바라기반</option>
                           <option value="3">민들레반</option>
                           <option value="4">벚꽃반</option>
                        </c:when>
                        <c:when test="${sessionScope.mng_group eq 2}">
                           <option value="1">장미반</option>
                           <option value="2" selected>해바라기반</option>
                           <option value="3">민들레반</option>
                           <option value="4">벚꽃반</option>
                        </c:when>
                        <c:when test="${sessionScope.mng_group eq 3}">
                           <option value="1">장미반</option>
                           <option value="2">해바라기반</option>
                           <option value="3" selected>민들레반</option>
                           <option value="4">벚꽃반</option>
                        </c:when>
                        <c:otherwise>
                           <option value="1">장미반</option>
                           <option value="2">해바라기반</option>
                           <option value="3">민들레반</option>
                           <option value="4" selected>벚꽃반</option>
                        </c:otherwise>
                     </c:choose>
                  </select>
               </div>
            </c:if>
            <c:if test="${sessionScope.mem_code eq 2 }">
               <div id="parentDetail">

                  <label for="stu_name">원아 이름</label> <input type="text"
                     class="form-control" name="stu_name" id="stu_name" value="${m.stu_name}"   placeholder="원아 이름" > 
                     
                     <label for="stu_group" style="width: max-content;">원아 반&nbsp;&nbsp;</label> 
                     
                     <select id="selectBox" name="selectStuGroupBox" style="display: block; margin-bottom: 20px;">
                     <c:choose>
                        <c:when test="${sessionScope.stu_group eq 1}">
                           <option value="1" selected>장미반</option>
                           <option value="2">해바라기반</option>
                           <option value="3">민들레반</option>
                           <option value="4">벚꽃반</option>
                        </c:when>
                        <c:when test="${sessionScope.mng_group eq 2}">
                           <option value="1">장미반</option>
                           <option value="2" selected>해바라기반</option>
                           <option value="3">민들레반</option>
                           <option value="4">벚꽃반</option>
                        </c:when>
                        <c:when test="${sessionScope.mng_group eq 3}">
                           <option value="1">장미반</option>
                           <option value="2">해바라기반</option>
                           <option value="3" selected>민들레반</option>
                           <option value="4">벚꽃반</option>
                        </c:when>
                        <c:otherwise>
                           <option value="1">장미반</option>
                           <option value="2">해바라기반</option>
                           <option value="3">민들레반</option>
                           <option value="4" selected>벚꽃반</option>
                        </c:otherwise>
                     </c:choose>
                     
               </div>
            </c:if>
            <!-- <input class="btn btn-primary" type="button" value="수정2" onclick="editBtn2()" style="width: 70px;">  -->
         <div style="position: relative; left: 70%;">
            <input class="btn btn-primary" type="button" value="수정" onclick="editBtn()" style="width: 70px;"> 
            <input class="btn btn-primary" type="reset" value="리셋" style="width: 70px;"><br>   
         </div>
         </div>
            
         
      </form>
   </div>
   <div style="position: absolute; width: 100%; left: 0%;">

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   </div>

   
   <script src="../resources/js/index.js"></script>
</body>
</html>