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
<title>Aperitif - Custom Template</title>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">

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

	<!--
START MODULE AREA 1: Header 3
-->
	<header class="MOD_HEADER3">
		<div class="MOD_HEADER3_SocialBarContainer">
			<div data-layout="_r" class="MOD_HEADER3_SocialBar">

				<div class="MOD_HEADER3_SocialIcons">
					<a href="#">1조유치원</a>
				</div>
				<div class="MOD_HEADER3_Contact">
					<p class="MOD_HEADER3_Tel">
						<a href="${pageContext.request.contextPath}/member/join"
							style="font-size: 13px;">회원가입</a> | <a
							href="${pageContext.request.contextPath }/member/loginForm"
							style="font-size: 13px;">로그인</a>
					</p>
				</div>
			</div>
		</div>
	</header>
	<!--
END MODULE AREA 1: Header 3
-->

	<!--
START MODULE AREA 2: Menu 1
-->
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
							<li><a href="#" data-theme="_bgpd">유치원소개</a></li>
							<li><a href="#" data-theme="_bgpd">오시는길</a></li>
							<li><a href="#" data-theme="_bgpd">모집요강</a></li>
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
						</ul></li>
				</ul>
			</nav>
		</div>
	</section>
	<!--
END MODULE AREA 2: Menu 1
-->

	<!--
  START MODULE AREA 3: Text | Text
-->

	<!-- 측면 메뉴바 -->
	<section>
		<div data-layout="_r">
			<div data-layout="al16 al-o2 de-o1 de6 ec4">
				<nav class="MOD_SUBNAVIGATION1_Menu" data-theme="_bo2">
					<p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">Sub
						Menu Title</p>
					<ul>
						<li><a href="#">Sub menu item 1</a></li>
						<li><a href="#">Sub menu item 2</a></li>
						<li><a href="#">Sub menu item 3</a></li>
						<li><a href="#">Sub menu item 4</a></li>
						<li><a href="#">Sub menu item 5</a></li>
						<li><a href="#">Sub menu item 6</a></li>
						<li><a href="#">Sub menu item 7</a></li>
					</ul>
				</nav>
				<div data-layout="ch-half"></div>
			</div>
	</section>
	<!-- /측면 메뉴바 -->

	<!--
  END MODULE AREA 3: Text | Text
-->


	 <!-- 로그인 -->
	<div class="modal fade" id="loginForm">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form id="loginfrm"
					action="${pageContext.request.contextPath}/member/login" method="post">
					<div class="form-group">
						<div class="modal-body">
							<div class="container">
								<a> <img
									src="${pageContext.request.contextPath}/img/intermission.png"
									style="display: block; height: 150px; width: 450px" />
								</a>
							</div>
							<h5>
								<label>아이디</label>
							</h5>
							<!-- <input class="form-control" id="loingId" name="loingId" type="text" id="id" /> -->
							<input class="form-control" id="id" name="id" type="text" />
							<div id="checkId"></div>
							<br>
							<h5>
								<label>비밀번호</label>
							</h5>
							<!-- <input class="form-control" id="loginPwd" name="loginPwd" type="password" id="pwd" /> -->
							<input class="form-control" name="pw" type="password" id="pw" />
							<div id="checkPwd"></div>
						</div>
						<div class="modal-footer">
							<!-- <a data-toggle="modal" data-target="#MissingForm">혹시 아이디 또는
								비밀번호를 잊어버리셨나요?</a> <input type="hidden" name="member_code"
								value="login" /> -->
							<button class="btn btn-primary" type="button"
								onclick="javascript:loginCheck();">로그인</button>
						</div>
					</div>
				</form>

				<!-- 비밀번호 찾기 -->
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
				</form>
			</div>
		</div>
	</div> 

	<!--
START MODULE AREA 4: Footer 2
-->
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
						<a href="#" class="smIcon"><svg class="fb"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
								<path
									d="M0 0v24h24v-24h-24zm16 7h-1.923c-.616 0-1.077.252-1.077.889v1.111h3l-.239 3h-2.761v8h-3v-8h-2v-3h2v-1.923c0-2.022 1.064-3.077 3.461-3.077h2.539v3z" /></svg></a>
						<!-- Twitter SVG -->
						<a href="#" class="smIcon"><svg class="tw"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
								<path
									d="M0 0v24h24v-24h-24zm18.862 9.237c.208 4.617-3.235 9.765-9.33 9.765-1.854 0-3.579-.543-5.032-1.475 1.742.205 3.48-.278 4.86-1.359-1.437-.027-2.649-.976-3.066-2.28.515.098 1.021.069 1.482-.056-1.579-.317-2.668-1.739-2.633-3.26.442.246.949.394 1.486.411-1.461-.977-1.875-2.907-1.016-4.383 1.619 1.986 4.038 3.293 6.766 3.43-.479-2.053 1.079-4.03 3.198-4.03.944 0 1.797.398 2.396 1.037.748-.147 1.451-.42 2.085-.796-.245.767-.766 1.41-1.443 1.816.664-.08 1.297-.256 1.885-.517-.44.656-.997 1.234-1.638 1.697z" /></svg></a>
						<!-- LinkedIn SVG -->
						<a href="#" class="smIcon"><svg class="li"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
								<path
									d="M0 0v24h24v-24h-24zm8 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.397-2.586 7-2.777 7 2.476v6.759z" /></svg></a>
						<!-- Google Plus SVG-->
						<a href="#" class="smIcon"><svg class="gp"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
								<path
									d="M0 0v24h24v-24h-24zm8.667 16.667c-2.581 0-4.667-2.087-4.667-4.667s2.086-4.667 4.667-4.667c1.26 0 2.313.46 3.127 1.22l-1.267 1.22c-.347-.333-.954-.72-1.86-.72-1.593 0-2.893 1.32-2.893 2.947s1.3 2.947 2.893 2.947c1.847 0 2.54-1.327 2.647-2.013h-2.647v-1.6h4.406c.041.233.074.467.074.773 0 2.666-1.787 4.56-4.48 4.56zm11.333-4h-2v2h-1.333v-2h-2v-1.333h2v-2h1.333v2h2v1.333z" /></svg></a>
						<!-- Pinterest SVG -->
						<a href="#" class="smIcon"><svg class="pi"
								xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24">
								<path
									d="M0 0v24h24v-24h-24zm12 20c-.825 0-1.62-.125-2.369-.357.326-.531.813-1.402.994-2.098l.499-1.901c.261.498 1.023.918 1.833.918 2.413 0 4.151-2.219 4.151-4.976 0-2.643-2.157-4.62-4.932-4.62-3.452 0-5.286 2.317-5.286 4.841 0 1.174.625 2.634 1.624 3.1.151.07.232.039.268-.107l.222-.907c.019-.081.01-.15-.056-.23-.331-.4-.595-1.138-.595-1.825 0-1.765 1.336-3.472 3.612-3.472 1.965 0 3.341 1.339 3.341 3.255 0 2.164-1.093 3.663-2.515 3.663-.786 0-1.374-.649-1.185-1.446.226-.951.663-1.977.663-2.664 0-.614-.33-1.127-1.012-1.127-.803 0-1.448.831-1.448 1.943 0 .709.239 1.188.239 1.188s-.793 3.353-.938 3.977c-.161.691-.098 1.662-.028 2.294-2.974-1.165-5.082-4.06-5.082-7.449 0-4.418 3.582-8 8-8s8 3.582 8 8-3.582 8-8 8z" /></svg></a>
					</div>
					<p>
						Email: <a href="mailto:#">email@email.com</a><br>Phone: <a
							href="tel:#">01234 567 8910</a>
					</p>
					<p>Copyright &copy; 2017 Company</p>
				</div>
				<div data-layout="al16 ch8 ch-o2 ec-third ec-o3">
					<h3>Address</h3>
					<address>
						123 The High Street<br> The Town<br> The City<br>
						County / State<br> Postal / Zip Code
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
