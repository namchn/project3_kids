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
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- 이 페이지에서 단독 사용하는 link -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<style>
div.card {
  width: 200px;
  height: 170px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  text-align: center;
  padding-top: 30px; 
  padding-left: 10px;
  padding-right: 60px; 
}
div.card2 {
  width: 200px;
  height: 210px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  text-align: center;
  padding-top: 20px; 
  padding-left: 10px;
  padding-right: 60px; 
}
div.card2>ul>li{
	background-color: #f1f1f1;
}
div.card>ul>li{
	background-color: #f1f1f1;
}
#rcorners2 {
  border-radius: 15px;
  border: 3px solid #002266;
  padding: 4px; 
  width: 180px;
  height: 40px; 
  font-weight: bold;
}


ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 180px;
  
}

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

li .a1:hover:not(.active) {
  background-color: #002266;
  color: white;
}
</style>
</head>
<!-- End Head -->

<body class="default">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<form style="height:550px;">
	<div class="container">
	
	<h3>관리자 페이지</h3>
	<hr>
	     <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/manager">  >  관리자 페이지</a>
  </div><br><br> 

<%-- 
	<form>
		<a href="${pageContext.request.contextPath}/manager/memberManage"
			style="font-size: 13px;">
			<p>
				회원 관리<span class="glyphicon glyphicon-user"></span>
			</p>
		</a>


		<a
			href="${pageContext.request.contextPath}/manager/boardGalleryManage?sort=1"
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
		</a> <a
			href="${pageContext.request.contextPath}/manager/boardNoticeManage?sort=1"
			style="font-size: 13px;">
			<p>
				공지사항게시판 관리<span class="glyphicon glyphicon-pencil"></span>
			</p>
		</a> <a href="${pageContext.request.contextPath}/manager/calendarManage"
			style="font-size: 13px;"><p>
				일정 관리<span class="glyphicon glyphicon-log-out"></span>
			</p></a> <a href="${pageContext.request.contextPath}/manager/rent"
			style="font-size: 13px;"><p>
				도서 반납<span class="glyphicon glyphicon-book"></span>
			</p></a> <a href="${pageContext.request.contextPath}/book/add_book"
			style="font-size: 13px;"><p>
				도서 업로드<span class="glyphicon glyphicon-book"></span>
			</p></a> <a href="${pageContext.request.contextPath}/manager/mgWriteForm"
			style="font-size: 13px;"><p>
				메인 페이지 사진 변경<span class="glyphicon glyphicon-home"></span>
			</p></a> <a href="${pageContext.request.contextPath}/manager/memberStat"
			style="font-size: 13px;"><p>
				통계(회원수)보기<span class="glyphicon glyphicon-home"></span>
			</p></a> <a href="${pageContext.request.contextPath}/manager/bookStat"
			style="font-size: 13px;"><p>
				통계(도서총권수/대출/지연권수)보기<span class="glyphicon glyphicon-home"></span>
			</p></a> <a href="${pageContext.request.contextPath}/manager/payStat"
			style="font-size: 13px;"><p>
				통계(결제총액/미납/월별금액)보기<span class="glyphicon glyphicon-home"></span>
			</p></a>

			<div style="border-top:solid #17a2b8; width:250px;">
                
			<div style="border:solid linear-gradient(to right, red , yellow);" >
				aaaa
			</div>
			</div>

	</form>
	
<br> --%>	



<table style="width: 100%;">
<form style="padding:30px;">
<tbody>

<td>
<div class="card">
<div id="rcorners2">회원 관리&nbsp;<span class="glyphicon glyphicon-user"></span></div>
<ul>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/memberManage">회원 목록/탈퇴</a></li>
</ul>
</div>
</td>

<td>
<div class="card">
<div id="rcorners2">일정 관리&nbsp;<span class="glyphicon glyphicon-calendar"></span></div>
<ul>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/calendarManage">일정 목록/삭제</a></li>
</ul>
</div>
</td>

<td>
<div class="card">
<div id="rcorners2">홈페이지 관리&nbsp;<span class="glyphicon glyphicon-home"></span></div>
<ul>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/mgWriteForm">메인 페이지 사진 변경</a></li>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/appWriteForm">원서 파일 업로드</a></li>
</ul>
</div>
</td>


</tbody>
</form>
</table>
<br>

<table style="width: 100%;">
<form style="padding:30px;">
<tbody>

<td>
<div class="card2">
<div id="rcorners2">게시판 관리&nbsp;<span class="glyphicon glyphicon-pencil"></span></div>
<ul>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/boardNoticeManage?sort=1">공지사항 게시판 관리</a></li>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/boardBulletinManage?sort=1">자유 게시판 관리</a></li>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/boardGalleryManage?sort=1">갤러리 게시판 관리</a></li>
</ul>
</div>
</td>

<td>
<div class="card2">
<div id="rcorners2">도서 관리&nbsp;<span class="glyphicon glyphicon-book"></span></div>
<ul>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/rent">도서 목록/반납</a></li>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/book/add_book">도서 업로드</a></li>
</ul>
</div>
</td>

<td>
<div class="card2">
<div id="rcorners2">유치원 통계 관리&nbsp;<span class="glyphicon glyphicon-signal"></span></div>
<ul>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/memberStat">회원 통계</a></li>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/payStat">원비 통계</a></li>
  <li><a class="a1" style="font-size:15px;" href="${pageContext.request.contextPath}/manager/bookStat">도서 통계</a></li>
</ul>
</div>
</td>


</tbody>
</form>
</table>
<br>		


</div>
</form>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="../resources/js/index.js"></script>
</body>

</html>
