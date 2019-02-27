<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KITRI유치원</title>
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.modal-header,.close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}
</style>
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

<!-- 쪽지스타일 -->
<style type="text/css">
.circle {
	width: 20px;
	height: 20px;
	border-radius: 50%;
	background-color: yellow;
	margin-bottom: auto;
}
</style>

<!-- 모달 스타일  -->
<style type="text/css">
body {
	font-family: 'Varela Round', sans-serif;
}

.modal-login {
	width: 350px;
}

.modal-login .modal-content {
	padding: 50px;
	border-radius: 5px;
	border: none;
}

.modal-login .modal-header {
	border-bottom: none;
	position: relative;
	justify-content: center;
}

.modal-login .close {
	position: absolute;
	top: -10px;
	right: -10px;
}

.modal-login h4 {
	color: #636363;
	text-align: center;
	font-size: 26px;
	margin-top: 0;
}

.modal-login .modal-content {
	color: #999;
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 25px;
}

.modal-login .form-group {
	margin-bottom: 20px;
}

.modal-login label {
	font-weight: normal;
	font-size: 13px;
}

.modal-login .form-control {
	min-height: 38px;
	padding-left: 5px;
	box-shadow: none !important;
	border-width: 0 0 1px 0;
	border-radius: 0;
}

.modal-login .form-control:focus {
	border-color: #ccc;
}

.modal-login .input-group-addon {
	max-width: 42px;
	text-align: center;
	background: none;
	border-width: 0 0 1px 0;
	padding-left: 5px;
	border-radius: 0;
}

.modal-login .btn {
	font-size: 16px;
	font-weight: bold;
	background: #19aa8d;
	border-radius: 3px;
	border: none;
	min-width: 140px;
	outline: none !important;
}

.modal-login .btn:hover, .modal-login .btn:focus {
	background: #179b81;
}

.modal-login .hint-text {
	text-align: center;
	padding-top: 5px;
	font-size: 13px;
}

.modal-login .modal-footer {
	color: #999;
	border-color: #dee4e7;
	text-align: center;
	margin: 0 -25px -25px;
	font-size: 13px;
	justify-content: center;
}

.modal-login a {
	color: #fff;
	text-decoration: underline;
}

.modal-login a:hover {
	text-decoration: none;
}

.modal-login a {
	color: #19aa8d;
	text-decoration: none;
}

.modal-login a:hover {
	text-decoration: underline;
}

.modal-login .fa {
	font-size: 21px;
}

.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
/* 상단바 스타일 */
.MOD_MENU_Nav {
	z-index: 2;
}
/* 갤러리게시판 스타일 */
.gbtn {
	color: black;
	font-size: 20px;
	border: 0;
	border-bottom: 1px solid rgba(255, 255, 255, 0.3);
	padding: 1em 1.5em;
}
.hasSubmenu>a{
background-color: #f9ca5b;
}
.hasSubmenu>ul>li>*{
background-color: #FFCD12;
}
</style>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){    //$(document)객체
	
   $('#phoneJoinResult').html("");
   $('#idJoinResult').html("");
	
   $("#teacherDetail").hide();
   $("#parentDetail").hide();
   $("#visitorDetail").hide();
   /* $("#pwResult").html("비밀번호 확인창"); */
   
   $('#aclose').click(function(){
	   $('#visitorDetail>div>input[class="form-control"]').val("");
	   $('#parentDetail>div>input[class="form-control"]').val("");
	   $('#teacherDetail>div>input[class="form-control"]').val("");
   })
   //로그인

   
   //회원가입 아이디 중복체크
   $('#joinIdBtn').click(function(){//$('#check')아이디 / $('.check')클래스
      var id = $('#JoinId').val(); //val: 태그의 값을 쓰거나 읽는 함수(value속성값에)
      if(id==''||id==null) {
         alert('id를 입력하시오');
         return;
      }
      var param = "id="+id;
      $.ajax({ //비동기적 요청보내다
         type:"POST",
         url:"${pageContext.request.contextPath}/member/checkId", //보낼곳
         data:param, //전송할 데이터
         success:function(data){ //응답제대로받았을때 호출되는 함수 (서버에서 처리된값을 가져오는 함수)
            var obj = eval('('+data+')'); //obj:멤버변수 flag //eval : json 표현을 바꿔주다
            var str = '';
            if(obj.flag) {
               str='사용가능한 아이디';
            }else {
               str = '중복된 아이디';
               $('#joinId').val('');
            }
            $('#idJoinResult').html(str);
         }
      });
   }); 
   
   /* //회원가입 연락처 중복체크
   $('#joinPhoneBtn').click(function(){//$('#check')아이디 / $('.check')클래스
	  alert("연락처 중복체크");
      var phone = $('#joinPhone').val(); //val: 태그의 값을 쓰거나 읽는 함수(value속성값에)
      alert(phone);
      var phoneLength = phone.length;
      alert(phoneLength)
      if(phone==''||phone==null) {
         alert('연락처를 입력하시오');
      }else if(phoneLength<=10&&phoneLength>11){
    	  alert('연락처는 10자리 혹은 11자리이어야 합니다');
      }
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
               str = '중복된 연락처';
               $('#joinPhone').val('');
            }
            $('#phoneJoinResult').html(str);
         }
      });
   }); */ 
   //회원가입
 
     
   //회원타입구분
   $('#typeBtn').click(function() {
      var mem_code = $('input[name="mem_code"]:checked').val();      
      if(mem_code==1){ 
         $("#visitorDetail").show();
         $("#parentDetail").hide();
         $("#teacherDetail").show();
         $('#Joinmng_group').attr("required","required");
       }else if(mem_code==2){  
          $("#visitorDetail").show();
         $("#teacherDetail").hide();
          $("#parentDetail").show();
          $('#stu_group').attr("required","required");
          $('#stu_name').attr("required","required");
       }else if(mem_code==3){ 
          $("#teacherDetail").hide();
          $("#parentDetail").hide();
          $("#visitorDetail").show();
       }      
   });
   
   //회원가입 조건
   $('#joinBtn').click(function() {
	   var phoneJoinResult = $('#phoneJoinResult').html();
	   var idJoinResult = $('#idJoinResult').html();
	   var phone = $('#joinPhone').val();
	   var pw = $('#pw').val();
	   alert(pw);
	   var phoneLength = phone.length;
	   var pwLength = pw.length;
	   alert(pwLength);
	   
	      if(idJoinResult!='사용가능한 아이디') {
	         alert('아이디 중복체크를 완료하십시오');
	      }else if(pwLength>12||pwLength<8){
	    	  alert('비밀번호는 8자리 이상 12자리 이하여야 합니다');
	      }
	      else if(phoneLength<10||phoneLength>11){
	    	  alert('연락처는 10자리 혹은 11자리이어야 합니다');
	      }
	      else if(phoneJoinResult!='사용가능한 연락처'){
	    	  alert('연락처 중복체크를 완료하십시오');
	      }
	      else{
	    	  $('#joinForm').submit();
	      }
	             
	   });
   
   //쪽지 
   var sid = "<%=(String) session.getAttribute("id")%>"

						if (sid != "null") {

							$(function() { //새 쪽지 갯수를 출력
								$.ajax({
									url : "${pageContext.request.contextPath}/msg/msgcheck",
									cache : false,
									success : function(html) {
									if (html == 0) {
										$('.circle').css('display','none');
												} else {
													$('.circle').css('display',
															'block');
													$('.circle').html(html);
												}

											}
										});
							});
							$(function() { //새 쪽지 갯수를 5초마다 재출력(실시간 알림)
								timer = setInterval(
										function() { //새 쪽지 갯수를 출력
											$
													.ajax({
														url : "${pageContext.request.contextPath}/msg/msgcheck",
														cache : false,
														success : function(html) {
															if (html == 0) {
																$('.circle')
																		.css(
																				'display',
																				'none');
															} else {
																$('.circle')
																		.css(
																				'display',
																				'block');
																$('.circle')
																		.html(
																				html);
															}

														}
													});
										}, 5000); // 5초에 한번씩 받아온다.
							});
						}
   /* 우리반 이야기 갤러리 게시판  */
   var mem_code = $('#mem_code').val();
   var mng_group = $('#mng_group').val();
   var stu_group = $('#stu_group').val();
   var id1 = $('#AccessId').val();
   $('#group1').click(function() {
      /* mem code 0: 관리자 1:선생 2:학부모 */
      /* 관리자가 0이 아니고 stu code가 1일 때 링크 */
      if(id1!=""){
      if(mem_code==0) {
         location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=1&sort=2";
      }else if(mem_code==1){
         if(mng_group!="1") {
            alert("장미반 선생님만 접근할 수 있습니다.");
            return;
         } else if(mng_group=="1"){
               location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=1&sort=2";
            }      
      }else if(mem_code==2){
            if(stu_group!="1") {
               alert("장미반 학부모만 접근할 수 있습니다.");
               return;
            }
            else if(stu_group=="1"){
               location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=1&sort=2";
            }      
      }
      }
   
   })
   $('#group2').click(function() {
      if(id1!=""){
            if(mem_code==0) {
               location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=2&sort=2";
            }else if(mem_code==1){
               if(mng_group!="2") {
                  alert("해바라기반 선생님만 접근할 수 있습니다.");
                  return;
               } else if(mng_group=="2"){
                     location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=2&sort=2";
                  }      
            }else if(mem_code==2){
                  if(stu_group!="2") {
                     alert("해바라기반 학부모만 접근할 수 있습니다.");
                     return;
                  }
                  else if(stu_group=="2"){
                     location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=2&sort=2";
                  }      
            }
            }
   })
   $('#group3').click(function() {
      if(id1!=""){
            if(mem_code==0) {
               location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=3&sort=2";
            }else if(mem_code==1){
               if(mng_group!="3") {
                  alert("민들레반 선생님만 접근할 수 있습니다.");
                  return;
               } else if(mng_group=="3"){
                     location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=3&sort=2";
                  }      
            }else if(mem_code==2){
                  if(stu_group!="3") {
                     alert("민들레반 학부모만 접근할 수 있습니다.");
                     return;
                  }
                  else if(stu_group=="3"){
                     location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=3&sort=2";
                  }      
            }
            }
   })
   $('#group4').click(function() {
      
      if(id1!=""){
            if(mem_code==0) {
               location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=4&sort=2";
            }else if(mem_code==1){
               if(mng_group!="4") {
                  alert("벚꽃반 선생님만 접근할 수 있습니다.");
                  return;
               } else if(mng_group=="4"){
                     location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=4&sort=2";
                  }      
            }else if(mem_code==2){
                  if(stu_group!="4") {
                     alert("벚꽃반 학부모만 접근할 수 있습니다.");
                     return;
                  }
                  else if(stu_group=="4"){
                     location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=4&sort=2";
                  }      
            }
            }
   });
			});/* $(document).ready(function( */

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
	
	function joinPhoneBtn(){
		
		var phone = $('#joinPhone').val();
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
	               $('#joinPhone').val('');
	            }
	            $('#phoneJoinResult').html(str);
	         }
	      });
	     
	}

	function execDaumPostcode() {
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
</head>
<body class="default">
	<header class="MOD_HEADER3">
		<div class="MOD_HEADER3_SocialBarContainer">
			<div data-layout="_r" class="MOD_HEADER3_SocialBar">

				<div class="MOD_HEADER3_SocialIcons">
               <a href="${pageContext.request.contextPath}" style="text-decoration:none"><img src="../resources/img/5.png"/></a>
            </div>
				<div class="MOD_HEADER3_Contact">
					<p class="MOD_HEADER3_Tel">
						<c:if test="${empty sessionScope.id}">
							<a href="#joinFormModal" data-toggle="modal"
								data-target="#joinFormModal" style="font-size: 13px;">회원가입<span
								class="glyphicon glyphicon-pencil"></span></a>
                  | <a href="#loginFormModal" data-toggle="modal"
								data-target="#loginFormModal" style="font-size: 13px;"> 로그인<span
								class="glyphicon glyphicon-log-in"></span>
							</a>

						</c:if>

						<c:if test="${not empty sessionScope.id}">
							<c:choose>
								<c:when test="${sessionScope.id eq 'manager'}">

									<p style="font-size: 13px;">관리자로 로그인했습니다</p>
									<br> &nbsp; &nbsp; 
                     
                     <a
										href="${pageContext.request.contextPath}/member/logout"
										style="font-size: 13px;">
										<p>
											로그아웃<span class="glyphicon glyphicon-log-out">|</span>
										</p>
									</a>
									<a href="${pageContext.request.contextPath}/member/myInfo"
										style="font-size: 13px;"><p>
											마이페이지<span class="glyphicon glyphicon-user">|</span>
										</p></a>

									<a href="${pageContext.request.contextPath}/msg/msg"
										style="font-size: 13px;"><p>
											쪽지함<span class="glyphicon glyphicon-envelope" id="alarmicon"></span>
										</p></a>
									<div class="circle" style="display: none;"></div>

									<a href="${pageContext.request.contextPath}/manager/manager"
										style="font-size: 13px;"><p>
											관리자 페이지<span class="glyphicon glyphicon-police"></span>
										</p></a>
								</c:when>

								<c:otherwise>
									<p style="font-size: 13px;">${sessionScope.id}님환영합니다!</p>
									<br> &nbsp; &nbsp; 
                     
                     <a
										href="${pageContext.request.contextPath}/member/logout"
										style="font-size: 13px;">
										<p>
											로그아웃<span class="glyphicon glyphicon-log-out">|</span>
										</p>
									</a>
									<a href="${pageContext.request.contextPath}/member/myInfo"
										style="font-size: 13px;"><p>
											마이페이지<span class="glyphicon glyphicon-user">|</span>
										</p></a>

									<a href="${pageContext.request.contextPath}/msg/msg"
										style="font-size: 13px;"><p>
											쪽지함<span class="glyphicon glyphicon-envelope" id="alarmicon"></span>
										</p></a>
									<div class="circle" style="display: none;"></div>
								</c:otherwise>
							</c:choose>
						</c:if>
				</div>
			</div>
		</div>
	</header>

	<div class="modal fade" id="loginFormModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">


					<h4>
						<span class="glyphicon glyphicon-lock"></span> Login
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form id="loginform"
						action="${pageContext.request.contextPath}/member/login"
						method="post">
						<div class="form-group">
							<label for="id"><span class="glyphicon glyphicon-user"></span>
								UserID</label> <input type="text" class="form-control" name="id"
								id="loginId" placeholder="Enter userID" required="required">
						</div>
						<div class="form-group">
							<label for="pw"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" class="form-control" name="pw" id="loginpw"
								placeholder="Enter password" required="required">
						</div>
						<!--             <div class="checkbox">
              <span style="padding:80px;">Remember me<input type="checkbox" name="rememberId" checked ></span>
            </div> -->
						<span id="loginCheck"></span>
						<button class="btn btn-success btn-block " id="loginBtn">
							<span class="glyphicon glyphicon-off"></span>Login
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<p style="float: left; margin-right: 40%;">
						회원이 아니십니까? <a href="#joinFormModal" data-toggle="modal"
							data-target="#joinFormModal" data-dismiss="modal"
							style="font-size: 13px;">가입하기</a>
					</p>
					<button type="reset" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal" style="float: right;">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>


					<p>
						<a href="#FindIdModal" data-toggle="modal"
							data-target="#FindIdModal" style="font-size: 13px;">아이디/</a> <a
							href="FindPwModal" data-toggle="modal" data-target="#FindPwModal"
							style="font-size: 13px;">비밀번호찾기</a>
					</p>
				</div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="FindIdModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span>아이디 찾기
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body" style="padding: 40px 50px;">
					<form id="FindId"
						action="${pageContext.request.contextPath}/member/findId"
						method="post">
						<div class="form-group">
							<label><span class="glyphicon glyphicon-user"></span>회원
								이름</label> <input type="text" class="form-control" name="name"
								id="findName" placeholder="Enter user name" required="required">
						</div>
						<div class="form-group">
							<label><span class="glyphicon glyphicon-user"></span>연락처</label>
							<input type="text" class="form-control" name="phone"
								id="findPhone" placeholder="Enter user phone"
								required="required">
						</div>

						<span id="idFind"></span>
						<button class="btn btn-success btn-block " id="findIdBtn">
							<span class="glyphicon glyphicon-off"></span>아이디찾기
						</button>

					</form>
				</div>

			</div>
		</div>
	</div>
	
	<div class="modal fade" id="FindPwModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span>비밀번호 찾기
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body" style="padding: 40px 50px;">
					<form id="FindPw"
						action="${pageContext.request.contextPath}/member/findPw"
						method="post">
						<div class="form-group">
							<label><span class="glyphicon glyphicon-user"></span>회원
								ID</label> <input type="text" class="form-control" name="id"
								id="findID" placeholder="Enter user ID" required="required">
						</div>
						<div class="form-group">
							<label><span class="glyphicon glyphicon-user"></span>연락처</label>
							<input type="text" class="form-control" name="phone"
								id="findPhone" placeholder="Enter user phone"
								required="required">
						</div>

						<span id="pwFind"></span>
						<button class="btn btn-success btn-block " id="findPwBtn">
							<span class="glyphicon glyphicon-off"></span>비밀번호찾기
						</button>

					</form>
				</div>

			</div>
		</div>
	</div>


	<div class="modal fade" id="joinFormModal" role="dialog">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4 class="modal-title">회원가입</h4>
					<button type="button" class="close" id="aclose" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Sign Up
					</h4>
				</div>

				<form id="joinForm"
					action="${pageContext.request.contextPath}/member/join"
					method="post">

					<div class="form-group">
						<div class="modal-body">

							분류 :<input type="radio" name="mem_code" value="1" class="rb"><b>선생님</b>
							<input type="radio" name="mem_code" value="2" class="rb" checked><b>학부모</b>
							<input type="radio" name="mem_code" value="3" class="rb"><b>방문객</b>
							&nbsp; <input type="button" value="확인" id="typeBtn"
								style="width: 100px;"><br>

							<p></p>

							<div id="visitorDetail">
								<p>*표시는 필수입력사항입니다.</p>

								<div class="form-group">
									<label for="id"><span class="glyphicon glyphicon-user"></span>
										UserID</label> <input type="text" class="form-control" name="id"
										id="JoinId" placeholder="사용하실 ID를 입력해주세요" required="required">
									<input type="button" value="아이디 중복체크" id="joinIdBtn"><span
										id="idJoinResult" required="required"></span><br>
								</div>

								<div class="form-group">
									<label for="pw"><span
										class="glyphicon glyphicon-eye-open"></span> Password</label> <input
										type="password" class="form-control" name="pw" id="pw"
										placeholder="비밀번호는 8~12자리 이내여야 합니다" onkeyup="passCheck()"
										required="required">
								</div>
								<div class="form-group">
									<label for="pw"><span class="glyphicon glyphicon-ok"></span>
										Password 확인</label> <input type="password" class="form-control"
										name="pw_check" id="pw_check" placeholder="Enter password"
										onkeyup="passCheck()" required="required"> <span
										id="pwResult"></span><br>
								</div>
								<div class="form-group">
									<label for="name"><span
										class="glyphicon glyphicon-book-address"></span> 이름</label> <input
										type="text" class="form-control" name="name" id="name"
										placeholder="Enter name" required="required">
								</div>
								<div class="form-group">
									<label for="phone"><span
										class="glyphicon glyphicon-phone"></span> 연락처</label> <input
										type="text" class="form-control" name="phone" id="joinPhone"
										placeholder="Enter phone" required="required" onkeyup="joinPhoneBtn()">
										<!-- <input type="button" value="연락처 중복체크" id="joinPhoneBtn"> -->
										<span id="phoneJoinResult"></span><br>
								</div>
								<div class="form-group">
									<label for="postcode"><span
										class="glyphicon glyphicon-envelope"></span> 우편번호</label> <input
										type="text" class="form-control" name="postcode" id="postcode"
										placeholder="우편번호"> <input type="button"
										onclick="execDaumPostcode()" value="우편번호 찾기"><br>
								</div>
								<div class="form-group">
									<label for="address"><span
										class="glyphicon glyphicon-home"></span> 주소</label> <input type="text"
										class="form-control" name="address" id="address"
										placeholder="주소"> <input type="text"
										class="form-control" name="detailAddress" id="detailAddress"
										placeholder="상세주소"> <input type="text"
										class="form-control" name="extraAddress" id="extraAddress"
										placeholder="참고항목">
								</div>

								<div id="teacherDetail">
									<div class="form-group">
										<label for="mng_group" style="width: max-content;"><span
											class="glyphicon glyphicon-users"></span>담당 반&nbsp;&nbsp;</label>											
											<select id="selectBox" name="selectMngGroupBox">
   											 <option value="1">장미반</option>
   											 <option value="2">해바라기반</option>
   											 <option value="3">민들레반</option>
   											 <option value="4">벚꽃반</option>
 										    </select>
											
											
									</div>
								</div>

								<div id="parentDetail">
									<div class="form-group">
										<label for="stu_name"><span
											class="glyphicon glyphicon-girl"></span>원아 이름</label> <input
											type="text" class="form-control" name="stu_name"
											id="stu_name" placeholder="원아 이름">
									</div>
									<div class="form-group">
										<label for="stu_group" style="width: max-content;"><span
											class="glyphicon glyphicon-users"></span>원아 반&nbsp;&nbsp;</label>											
											<select id="selectBox" name="selectStuGroupBox">
   											 <option value="1">장미반</option>
   											 <option value="2">해바라기반</option>
   											 <option value="3">민들레반</option>
   											 <option value="4">벚꽃반</option>
 										    </select>

									</div>
								</div>
								
								<!-- <button type="button" class="btn btn-success btn-block" id="joinBtn" value="가입"><span class="glyphicon glyphicon-off">가입</span></button> -->
								<!--  <button type="reset" class="btn btn-success btn-block" id="resetBtn" value="취소"><span class="glyphicon glyphicon-horizontal">취소</span></button> -->
							</div>
						</div>
					</div>

				</form>
				<button class="btn btn-success btn-block " id="joinBtn">
									<span class="glyphicon glyphicon-off"></span> join
								</button>
			</div>
		</div>
	</div>

	<!-- 상단메뉴바 -->

	<section class="MOD_MENU" data-theme="_bgp" style="background-color: #f9ca5b">
		<div data-layout="_r" class="nopadding">
			<nav class="MOD_MENU_Nav">
				<p class="MOD_MENU_Title">Menu</p>
				<svg class="MOD_MENU_Button"
					xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					width="30px" height="30px" viewBox="0 0 30 30"
					enable-background="new 0 0 30 30" xml:space="preserve">
        <rect width="30" height="6" />
        <rect y="24" width="30" height="6" />
        <rect y="12" width="30" height="6" />
      </svg>
       <input type="hidden" id="mng_group" value="${sessionScope.mng_group }">
                     <input type="hidden" id="stu_group" value="${sessionScope.stu_group }">
                     <input type="hidden" id="mem_code" value="${sessionScope.mem_code }">
                     <input type="hidden" id="AccessId" value="${sessionScope.id }">
				<ul class="AP_Menu_List">
					<li><a
						href="${pageContext.request.contextPath }/introduce/introduce"
						data-theme="_bgp">유치원소개</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath }/introduce/introduce"
								data-theme="_bgpd">유치원소개</a></li>
							<li><a
								href="${pageContext.request.contextPath }/introduce/applicants"
								data-theme="_bgpd">모집요강</a></li>
							<li><a href="${pageContext.request.contextPath }/info/map"
								data-theme="_bgpd">오시는길</a></li>
						</ul></li>
					<li><a href="#" data-theme="_bgp">우리반이야기</a>
						<ul>
							<li>
								<!-- <a href="" data-theme="_bgpd" id="group1">장미반</a> --> <input
								data-theme="_bgpd" type="button" value="장미반" id="group1"
								class="gbtn">
							</li>

							<li><input data-theme="_bgpd" type="button" value="해바라기반"
								id="group2" class="gbtn"> <!-- <a href="" data-theme="_bgpd" id="group2">해바라기반</a> -->
							</li>
							<li><input data-theme="_bgpd" type="button" value="민들레반"
								id="group3" class="gbtn"> <!-- <a href="" data-theme="_bgpd" id="group3">민들레반</a> -->
							</li>
							<li><input data-theme="_bgpd" type="button" value="벚꽃반"
								id="group4" class="gbtn"> <!-- <a href="" data-theme="_bgpd" id="group4">벚꽃반</a> -->
							</li>
						</ul></li>
					<li><a
						href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2"
						data-theme="_bgp">커뮤니티</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2"
								data-theme="_bgpd">공지사항</a></li>
							<li><a
								href="${pageContext.request.contextPath }/boardBulletin/bulletinList?sort=2"
								data-theme="_bgpd">자유게시판</a></li>
							<li><a
								href="${pageContext.request.contextPath }/community/bus"
								data-theme="_bgpd">셔틀버스</a></li>
							<li><a
								href="${pageContext.request.contextPath }/community/application"
								data-theme="_bgpd">원아모집</a></li>
							<li><a
								href="${pageContext.request.contextPath }/boardDiet/dietListForm"
								data-theme="_bgpd">식단표</a></li>
							<li><a href="${pageContext.request.contextPath }/poll/list"
								data-theme="_bgpd">설문조사</a></li>
							<li><a
								href="${pageContext.request.contextPath }/fullcalendar/fullcalendarAll"
								data-theme="_bgpd">행사일정</a></li>
						</ul></li>
					<li><a
						href="${pageContext.request.contextPath }/book/booklistForm"
						data-theme="_bgp">도서관</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath }/book/booklistForm"
								data-theme="_bgpd">도서목록</a></li>
						</ul></li>

				</ul>
			</nav>
		</div>
	</section>
</body>
</html>