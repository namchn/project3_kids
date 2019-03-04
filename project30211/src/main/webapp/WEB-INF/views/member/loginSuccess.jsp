<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
</head>

<body class="default">
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 본문 -->

	<p>성공적으로 가입 되었습니다.</p>
	
		<a href="../">홈으로 가기</a> <a class="nav-link" href="#loginFormModal"
			data-toggle="modal" data-target="#loginFormModal"
			style="font-size: 13px;"> <span class="fas fa-sign-in-alt">
		</span>로그인하기
		</a>

			<!-- 로그인 -->

			<div class="modal fade" id="loginFormModal">

				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">로그인</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<form id="loginform" action="${pageContext.request.contextPath}/member/login" method="post">
							<div class="form-group">
								<div class="modal-body">
									<h5>
										<label>아이디</label>
									</h5>
									<!-- <input class="form-control" id="loginId" name="loginId"
								type="text" id="id" /> -->
									<input class="form-control" id="id" name="id" type="text" />
									<!-- <div id="checkId"></div> -->
									<br>
									<h5>
										<label>비밀번호</label>
									</h5>
									<input class="form-control" id="pw" name="pw" type="text" /><br>
									<!-- <div id="checkPwd"></div> -->
									<!-- <button class="btn btn-primary" type="button" onclick="javascript:loginCheck();">로그인</button>  -->
									<input type="submit" value="로그인"
										style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4">


								</div>
								<div class="modal-footer"></div>
						</div>
					</form>

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
 		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
		<script src="../resources/js/index.js"></script>
</body>

</html>
