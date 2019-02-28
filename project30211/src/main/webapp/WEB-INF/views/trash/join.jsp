<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Aperitif - Custom Template</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
	<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">	

	<style type="text/css">
	a:visited {color: black;}
	a:link {color: black;}
	a{text-decoration: none; font-size: 20px;}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){    //$(document)객체

   $("#teacherDetail").hide();
   $("#parentDetail").hide();
   $("#visitorDetail").hide();
   $("#pwResult").html("비밀번호 확인창");
	
   
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
	   
		var pw = $("#pw").val();
		var pw_check = $("#pw_check").val();
		var pwResult_val = $("#pw_check").html();
	   var id = $('#id').val(); 
	   var name = $('#name').val(); 
	   var phone = $('#phone').val(); 
	   
	      if(id==''||id==null||pw==''||pw==null||pw_check==''||pw_check==null||name==''||name==null||phone==''||phone==null||pwResult_val=='비밀번호와 비밀번호 확인이 일치하지 않습니다') {
	         alert('필수정보를 모두 입력하시오');
	         return;
	      }else
	    	  alert('가입되었습니다');
	    	  $("#joinForm").submit();  
   }); 
  	
   
   $('#typeBtn').click(function() {
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
.rb{width: 50px;}
</style>
</head>

<body class="default">


 <header class="MOD_HEADER3">
  <div class="MOD_HEADER3_SocialBarContainer">
  <div data-layout="_r" class="MOD_HEADER3_SocialBar">
    
    <div class="MOD_HEADER3_SocialIcons">
      <a href="#">1조유치원</a>
    </div>
    <div class="MOD_HEADER3_Contact">
    <p class="MOD_HEADER3_Tel"><a href="${pageContext.request.contextPath}/member/join" style="font-size: 13px;">회원가입</a> | <a href="${pageContext.request.contextPath }/member/loginForm" style="font-size: 13px;">로그인</a></p>
    </div>
    </div>
  </div>
</header>

 <section class="MOD_MENU" data-theme="_bgp">
  <div data-layout="_r" class="nopadding">
    <nav class="MOD_MENU_Nav">
      <p class="MOD_MENU_Title">Menu</p>
      <svg class="MOD_MENU_Button" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px" height="30px" viewBox="0 0 30 30" enable-background="new 0 0 30 30" xml:space="preserve">
        <rect width="30" height="6"/>
        <rect y="24" width="30" height="6"/>
        <rect y="12" width="30" height="6"/>
      </svg>
      <ul class="AP_Menu_List">
        <li>
          <a href="#" data-theme="_bgp">유치원소개</a>
          <ul>
            <li>
              <a href="#" data-theme="_bgpd">유치원소개</a>
            </li>
            <li>
              <a href="#" data-theme="_bgpd">오시는길</a>
            </li>
            <li>
              <a href="#" data-theme="_bgpd">모집요강</a>
            </li>
          </ul>
        </li>
         <li>
          <a href="#" data-theme="_bgp">우리반이야기</a>
          <ul>
            <li>
              <a href="#" data-theme="_bgpd">1반</a>
            </li>
            <li>
              <a href="#" data-theme="_bgpd">2반</a>
            </li>
            <li>
              <a href="#" data-theme="_bgpd">3반</a>
            </li>
            <li>
              <a href="#" data-theme="_bgpd">4반</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#" data-theme="_bgp">커뮤니티</a>
          <ul>
            <li>
              <a href="#" data-theme="_bgpd">공지사항</a>
            </li>
            <li>
              <a href="#" data-theme="_bgpd">행사일정</a>
            </li>
            <li>
              <a href="#" data-theme="_bgpd">자유게시판</a>
            </li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</section>

<div>
<h3>회원가입</h3>
	 <form action="${pageContext.request.contextPath}/member/join" method="post" id="joinForm"> 
		분류 :<input type="radio" name="mem_code" value="1" class="rb"><b>선생님</b>
			<input type="radio" name="mem_code" value="2" class="rb" checked><b>학부모</b>
			 <input type="radio" name="mem_code" value="3" class="rb"><b>방문객</b> &nbsp;
			 <input type="button" value="확인" id="typeBtn" style="width: 100px;"><br> 
		<p></p>
		
		<div id="visitorDetail">
		<p> *표시는 필수입력사항입니다.</p>
		* 회원아이디<br> 
		<input type="text" name="id" id="id"> 
		<input type="button" value="중복체크" id="idBtn"><span id="idResult"></span><br> 
        * 비밀번호<br> 
        <input type="password" name="pw" placeholder="비밀번호를 입력해주세요." id="pw"><br> 
        * 비밀번호 확인 <br> 
        <input type="password" name="pw_check" onkeyup="passCheck()" placeholder="다시한번 입력해주세요." id="pw_check"><span id="pwResult"></span><br>  
		* 이름<br> 
		<input type="text" name="name" id="name"><br> 
		* 연락처<br> 
		<input type="text" name="phone" id="phone"><br> 
		주소<br> 
		<input type="text" name="postcode" id="postcode" placeholder="우편번호">
                           <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br> 
                           <input type="text" name="address" id="address" placeholder="주소">
                           <input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
                           <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목"><br> 
		
		<div id="teacherDetail">
		담당 반<br> 
		<input type="text" name="mng_group"><br> 
		</div>
		
		<div id="parentDetail">
		아기 이름 <br> 
		<input type="text" name="stu_name"><br> 
		아기 반<br> 
		<input type="text" name="stu_group"><br> 
		</div>
		
		<br>
		<input type="button" value="가입" id="joinBtn">
		<input type="reset" value="취소">
		</div>

 </form> 
 </div>
 
<footer>
  <div class="MOD_FOOTER2" data-theme="_bgd">
    <div data-layout="_r">
      <div data-layout="al16 ch8 ch-o1 ec-third ec-o1">
        <h3>Links</h3>
        <nav>
          <ul>
            <li><a href="#">Footer Link 1</a></li>
            <li><a href="#">Footer Link 2</a></li>
            <li><a href="#">Footer Link 3</a></li>
            <li><a href="#">Footer Link 4</a></li>
            <li><a href="#">Footer Link 5</a></li>
          </ul>
        </nav>
      </div>
      <div data-layout="al16 ch-o3 ec-third ec-o2">
        <h3>Contact</h3>
        <!-- Facebook SVG -->
        <div class="MOD_FOOTER2_Icons">
          <a href="#" class="smIcon"><svg class="fb" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0v24h24v-24h-24zm16 7h-1.923c-.616 0-1.077.252-1.077.889v1.111h3l-.239 3h-2.761v8h-3v-8h-2v-3h2v-1.923c0-2.022 1.064-3.077 3.461-3.077h2.539v3z"/></svg></a>
          <!-- Twitter SVG -->
          <a href="#" class="smIcon"><svg class="tw" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0v24h24v-24h-24zm18.862 9.237c.208 4.617-3.235 9.765-9.33 9.765-1.854 0-3.579-.543-5.032-1.475 1.742.205 3.48-.278 4.86-1.359-1.437-.027-2.649-.976-3.066-2.28.515.098 1.021.069 1.482-.056-1.579-.317-2.668-1.739-2.633-3.26.442.246.949.394 1.486.411-1.461-.977-1.875-2.907-1.016-4.383 1.619 1.986 4.038 3.293 6.766 3.43-.479-2.053 1.079-4.03 3.198-4.03.944 0 1.797.398 2.396 1.037.748-.147 1.451-.42 2.085-.796-.245.767-.766 1.41-1.443 1.816.664-.08 1.297-.256 1.885-.517-.44.656-.997 1.234-1.638 1.697z"/></svg></a>
          <!-- LinkedIn SVG -->
          <a href="#" class="smIcon"><svg class="li" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0v24h24v-24h-24zm8 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.397-2.586 7-2.777 7 2.476v6.759z"/></svg></a>
          <!-- Google Plus SVG-->
          <a href="#" class="smIcon"><svg class="gp" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0v24h24v-24h-24zm8.667 16.667c-2.581 0-4.667-2.087-4.667-4.667s2.086-4.667 4.667-4.667c1.26 0 2.313.46 3.127 1.22l-1.267 1.22c-.347-.333-.954-.72-1.86-.72-1.593 0-2.893 1.32-2.893 2.947s1.3 2.947 2.893 2.947c1.847 0 2.54-1.327 2.647-2.013h-2.647v-1.6h4.406c.041.233.074.467.074.773 0 2.666-1.787 4.56-4.48 4.56zm11.333-4h-2v2h-1.333v-2h-2v-1.333h2v-2h1.333v2h2v1.333z"/></svg></a>
          <!-- Pinterest SVG -->
          <a href="#" class="smIcon"><svg class="pi" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0v24h24v-24h-24zm12 20c-.825 0-1.62-.125-2.369-.357.326-.531.813-1.402.994-2.098l.499-1.901c.261.498 1.023.918 1.833.918 2.413 0 4.151-2.219 4.151-4.976 0-2.643-2.157-4.62-4.932-4.62-3.452 0-5.286 2.317-5.286 4.841 0 1.174.625 2.634 1.624 3.1.151.07.232.039.268-.107l.222-.907c.019-.081.01-.15-.056-.23-.331-.4-.595-1.138-.595-1.825 0-1.765 1.336-3.472 3.612-3.472 1.965 0 3.341 1.339 3.341 3.255 0 2.164-1.093 3.663-2.515 3.663-.786 0-1.374-.649-1.185-1.446.226-.951.663-1.977.663-2.664 0-.614-.33-1.127-1.012-1.127-.803 0-1.448.831-1.448 1.943 0 .709.239 1.188.239 1.188s-.793 3.353-.938 3.977c-.161.691-.098 1.662-.028 2.294-2.974-1.165-5.082-4.06-5.082-7.449 0-4.418 3.582-8 8-8s8 3.582 8 8-3.582 8-8 8z"/></svg></a>
        </div>
        <p>Email: <a href="mailto:#">email@email.com</a><br>Phone: <a href="tel:#">01234 567 8910</a>
        </p>
        <p>Copyright &copy; 2017 Company</p>
      </div>
      <div data-layout="al16 ch8 ch-o2 ec-third ec-o3">
        <h3>Address</h3>
          <address>
            123 The High Street<br>
            The Town<br>
            The City<br>
            County / State<br>
            Postal / Zip Code
          </address>
      </div>
    </div>
  </div>
</footer>
<!--
END MODULE AREA 4: Footer 2
-->

<script src="../resources/js/index.js"></script>

</body>
</html>