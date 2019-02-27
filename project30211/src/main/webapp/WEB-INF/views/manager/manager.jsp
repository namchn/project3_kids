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
	 <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<!-- End Head -->

<body class="default">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<h3>${sessionScope.id }(관리자)님의 관리페이지</h3>

	<form>
	<div style="border:1px">
		<a href="${pageContext.request.contextPath}/manager/memberManage"
			style="font-size: 13px;">
			<p>
				회원 관리<span class="glyphicon glyphicon-user"></span>
			</p>
		</a>
	</div>	
	
		<a href="${pageContext.request.contextPath}/manager/boardGalleryManage?sort=1"
			style="font-size: 13px;">
			<p>
				갤러리게시판 관리<span class="glyphicon glyphicon-picture"></span>
			</p>
		</a> <a
			href="${pageContext.request.contextPath}/manager/boardBulletinManage?sort=1"
			style="font-size: 13px;">
			<p>
				자유게시판 관리<span class="glyphicon glyphicon-pencil"></span>
			</p>
		</a> 
		<a href="${pageContext.request.contextPath}/manager/boardNoticeManage?sort=1" style="font-size: 13px;">
			<p>
				공지사항게시판 관리<span class="glyphicon glyphicon-pencil"></span>
			</p>		
		</a> 

		<a href="${pageContext.request.contextPath}/manager/calendarManage"
			style="font-size: 13px;"><p>
				일정 관리<span class="glyphicon glyphicon-log-out"></span>
			</p></a>
			
		<a href="${pageContext.request.contextPath}/manager/rent"
			style="font-size: 13px;"><p>
				도서 반납<span class="glyphicon glyphicon-book"></span>
		</p></a>
		
		<a href="${pageContext.request.contextPath}/book/add_book"
			style="font-size: 13px;"><p>
				도서 업로드<span class="glyphicon glyphicon-book"></span>
		</p></a>
		
		<a href="${pageContext.request.contextPath}/manager/mgWriteForm"
			style="font-size: 13px;"><p>
				메인 페이지 사진 변경<span class="glyphicon glyphicon-home"></span>
		</p></a>
		
		<a href="${pageContext.request.contextPath}/manager/memberStat"
			style="font-size: 13px;"><p>
				통계(회원수)보기<span class="glyphicon glyphicon-home"></span>
		</p></a>
		<a href="${pageContext.request.contextPath}/manager/bookStat"
			style="font-size: 13px;"><p>
				통계(도서총권수/대출/지연권수)보기<span class="glyphicon glyphicon-home"></span>
		</p></a>
		<a href="${pageContext.request.contextPath}/manager/payStat"
			style="font-size: 13px;"><p>
				통계(결제총액/미납/월별금액)보기<span class="glyphicon glyphicon-home"></span>
		</p></a>
		
	</form>



	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="../resources/js/index.js"></script>
</body>

</html>
