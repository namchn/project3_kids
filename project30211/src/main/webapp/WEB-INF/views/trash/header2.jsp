<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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

<style type="text/css">
    body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {
		width: 350px;
	}
	.modal-login .modal-content {
		padding: 20px;
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
</style>
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){    //$(document)객체

   $("#teacherDetail").hide();
   $("#parentDetail").hide();
   $("#visitorDetail").hide();
   /* $("#pwResult").html("비밀번호 확인창"); */
   
   
   $('#idBtn').click(function(){//$('#check')아이디 / $('.check')클래스
      var id = $('#id').val(); //val: 태그의 값을 쓰거나 읽는 함수(value속성값에)
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
               $('#id').val('');
            }
            $('#idResult').html(str);
         }
      });
   });
      
   $('#joinBtn').click(function() {

      var pwResult_val = $("#pwResult").html();
      var idResult_val = $("#idResult").html();
      
       var id = $('#id').val(); 
       var name = $('#name').val(); 
       var phone = $('#phone').val(); 
      
         if(id==''||id==null||pw==''||pw==null||pw_check==''||pw_check==null||name==''||name==null||phone==''||phone==null) {
            alert('필수정보를 모두 입력하시오');
            return;
         }else if(idResult_val!='사용가능한 아이디'){
            alert('ID 중복체크를 완료하시오');
            return;
         }else if(pwResult_val=='비밀번호와 비밀번호 확인이 일치하지 않습니다.'){
            alert('비밀번호 확인이 일치하지 않습니다.');
            return;
         }else{
            $("#joinForm").submit();  
            alert('가입되었습니다');
         }
   }); 
     
   
   $('#typeBtn').click(function() {
      //joinForm 에 있는 모든 정보 reset
     //$("#joinForm")[0].reset();  
      //$("#joinForm").find('text').val("");  
      var mem_code = $('input[name="mem_code"]:checked').val();      
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


/* function passCheck() {
   //$("#pwResult").html("");
   var pw = $("#pw").val();
   //alert(pw);
   var pw_check = $("#pw_check").val();
   //alert(pw_check);
   if (pw != pw_check) {
      $("#pwResult").html("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
   } else {
      $("#pwResult").html("일치");
   }
}  */

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
</head>
<body class="default">
	<header class="MOD_HEADER3">
		<div class="MOD_HEADER3_SocialBarContainer">
			<div data-layout="_r" class="MOD_HEADER3_SocialBar">

				<div class="MOD_HEADER3_SocialIcons">
					<a href="">1조유치원</a>
				</div>
				<div class="MOD_HEADER3_Contact">
					<p class="MOD_HEADER3_Tel">
						<c:if test="${empty sessionScope.id}">
							<a href="#joinFormModal" data-toggle="modal"
								data-target="#joinFormModal" style="font-size: 13px;">회원가입<span class="glyphicon glyphicon-pencil"></span></a>
						| <a href="#loginFormModal" data-toggle="modal"
								data-target="#loginFormModal" style="font-size: 13px;">
								 로그인<span class="glyphicon glyphicon-log-in"></span> 
							</a>
							
						</c:if>

						<c:if test="${not empty sessionScope.id}">
							<p style="font-size: 13px;">${sessionScope.id}님환영합니다!</p>
							<br> &nbsp; &nbsp; 
							
							<a href="${pageContext.request.contextPath}/member/logout"
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
                          	 쪽지함<span class="glyphicon glyphicon-envelope"></span>
                        	</p></a>
							  
						</c:if>
						</div>
			</div>
		</div>
	</header> 

   <!-- 로그인 -->

   <div class="modal fade" id="loginFormModal">

      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">로그인</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

		<div class="modal-body">
            <form id="loginform"
               action="${pageContext.request.contextPath}/member/login"
               method="post">
               
               <div class="form-group">
                    <div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input class="form-control" id="loginId" name="id" placeholder="UserId" type="text" />
                    </div>
               </div>

               
               <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<input type="text" class="form-control" name="pw" placeholder="Password" required="required">
					</div>
			  </div>
			  <div class="form-group">
						<button type="submit" class="btn btn-primary btn-block btn-lg">Sign In</button>
			  </div> 
					
					       
                    
                  <!--    <h5>
                        <label>비밀번호</label>
                     </h5>
                        <input class="form-control" id="loginPwd" name="loginPwd"
                        type="password" id="pwd" />
                     <input class="form-control" id="loginPw" name="pw" type="password" /><br>
                     <div id="checkPwd"></div>
                     <button class="btn btn-primary" type="button" onclick="javascript:loginCheck();">로그인</button> 
                     <input type="submit" value="로그인"
                        style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4">
 -->
                 <!--  </div> 
               </div> -->
            </form>
		</div>
            <%-- <!-- 비밀번호 찾기 -->
            <form action="${pageContext.request.contextPath}/memberFindPass"
               method="post">
               <div class="modal fade" id="MissingForm">
                  <div class="modal-dialog  modal-lg">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h4 class="modal-title">비밀번호 찾기</h4>
                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                           현재 아이디를 입력하시면, 가입 정보에 기입된 이메일로 안내 메일을 발송해 드립니다. <input
                              class="form-control" type="text" name="memberID"
                              placeholder="아이디를 입력해주세요.">
                        </div>
                        <div class="modal-footer">
                           <p style="color: red;" id="passCheckMessage"></p>
                           <button class="btn btn-info" type="submit">이메일 전송</button>
                        </div>
                     </div>
                  </div>
               </div>
            </form> --%>
         </div>
      </div>
   </div>

   <!-- 회원가입 -->

	<div class="modal fade" id="joinFormModal">

		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">회원가입</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
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
								* 회원아이디<br>
								<!-- <input class="form-control" id="loginId" name="loginId"
								type="text" id="id" /> -->

								<input class="form-control" type="text" name="id" id="id">
								<input type="button" value="중복체크" id="idBtn"><span
									id="idResult"></span><br> * 비밀번호<br> <input
									class="form-control" type="password" name="pw"
									placeholder="비밀번호를 입력해주세요." id="pw" onkeyup="passCheck()"><br> * 비밀번호 확인
								<br> <input class="form-control" type="password"
									name="pw_check" id="pw_check" placeholder="다시한번 입력해주세요."
									onkeyup="passCheck()"> <span id="pwResult"></span><br>
								* 이름<br> <input class="form-control" type="text"
									name="name" id="name"><br> * 연락처<br> <input
									class="form-control" type="text" name="phone" id="phone"><br>
								주소<br> <input class="form-control" type="text"
									name="postcode" id="postcode" placeholder="우편번호"> <input
									type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
								<input class="form-control" type="text" name="address"
									id="address" placeholder="주소"> <input
									class="form-control" type="text" name="detailAddress"
									id="detailAddress" placeholder="상세주소"> <input
									type="text" name="extraAddress" id="extraAddress"
									placeholder="참고항목"><br>

								<div id="teacherDetail">
									담당 반<br> <input class="form-control" type="text"
										name="mng_group"><br>
								</div>

								<div id="parentDetail">
									아기 이름 <br> <input class="form-control" type="text"
										name="stu_name"><br> 아기 반<br> <input
										class="form-control" type="text" name="stu_group"><br>
								</div>

								<!-- <br> <input type="button" value="가입" id="joinBtn">
								<input type="reset" value="취소"> -->

								<br> <input type="button" value="가입" id="joinBtn"
									style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4">
								<input type="reset" value="취소"
									style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4">
							</div>
						</div>
						<div class="modal-footer"></div>
					</div>
				</form>
			</div>
		</div>
	</div>

   <!-- 상단메뉴바 -->

   <section class="MOD_MENU" data-theme="_bgp">
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
            <ul class="AP_Menu_List">
               <li><a href="#" data-theme="_bgp">유치원소개</a>
                  <ul>
                     <li><a href="introduce/introduce" data-theme="_bgpd">유치원소개</a></li>
                     <li><a href="introduce/applicants" data-theme="_bgpd">모집요강</a></li>
                     <li><a href="${pageContext.request.contextPath }/info/map" data-theme="_bgpd">오시는길</a></li>
                  </ul></li>
               <li><a href="#" data-theme="_bgp">우리반이야기</a>
                  <ul>
                     <li><a href="#" data-theme="_bgpd">1반</a></li>
                     <li><a href="#" data-theme="_bgpd">2반</a></li>
                     <li><a href="#" data-theme="_bgpd">3반</a></li>
                     <li><a href="#" data-theme="_bgpd">4반</a></li>
                  </ul></li>
               <li><a href="#" data-theme="_bgp">커뮤니티</a>
                  <ul>
                     <li><a href="#" data-theme="_bgpd">공지사항</a></li>
                     <li><a href="#" data-theme="_bgpd">행사일정</a></li>
                     <li><a href="#" data-theme="_bgpd">자유게시판</a></li>
                     <li><a href="${pageContext.request.contextPath }/community/bus" data-theme="_bgpd">셔틀버스</a></li>
                     <li><a href="${pageContext.request.contextPath }/community/application" data-theme="_bgpd">원아모집</a></li>
					 <li><a href="boardDiet/dietListForm" data-theme="_bgpd">식단표</a></li>
					 <li><a href="boardDiet/t2Form" data-theme="_bgpd">연습</a></li>
					 <li><a href="poll/pollListForm" data-theme="_bgpd">투표</a></li>
                  </ul></li>
            </ul>
         </nav>
      </div>
   </section>
</body>
</html>