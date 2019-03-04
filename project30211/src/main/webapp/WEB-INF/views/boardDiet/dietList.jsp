<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">

<link href="../resources/css/agency.min.css" rel="stylesheet">
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">
 -->
<script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
   
	<!-- 사이드바 -->
	<div style="margin-top: 40px; margin-left: 175px;">
		<jsp:include page="/WEB-INF/views/common/side_com.jsp" />
	</div>


	<section id="portfolio">
		<div class="container" style="margin-top: 50px; margin-left: 23%;">

			<div class="row">
				<div class="col-lg-12">
					<h3 class="section-heading text-uppercase">식단표</h3>
					<h4 class="section-subheading text-muted">우리 아이들의 건강한 식단을 책임집니다~!</h4>
				</div>
			</div>
<hr>
<div align="right" style="margin-bottom: 50px;">
			<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
			<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2">  >  커뮤니티</a>
			<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardDiet/dietListForm">  >  식단표</a>
		</div>
		<div class="row" style="position: relative; left: 80%; margin-bottom: 50px;">	
			<c:if test="${sessionScope.id=='manager'}">
				<input class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/boardDiet/uploadDietForm'" value="식단표 작성">
			</c:if>
		</div>	

			<div class="row">
				<c:forEach var="db" items="${db}">
					<div class="col-md-4 col-sm-6 portfolio-item">
						<a class="portfolio-link"
							href="${pageContext.request.contextPath}/boardDiet/dietNumForm?diet_num=${db.diet_num}">
							<img class="img-fluid" src="../resources/img/${db.files}" alt="식단표 업로드 불가">
						</a>
						<div class="portfolio-caption">
							<h3>${db.title}</h3>
							<p class="text-muted">${db.time}</p>
						</div>
					</div>
				</c:forEach>
			</div>
<%-- 
			<div class="row">
				<c:forEach var="a" items="${list}">
					<div class="col-md-4 col-sm-6 portfolio-item">
						<a class="portfolio-link"
							href="${pageContext.request.contextPath}/boardGallery/galleryView?gallery_num=${a.gallery_num}&sort=2">
							<img class="img-fluid" src="${a.img1}" alt="">
						</a>
						<div class="portfolio-caption">
							<h3>${a.title}</h3>
							<p class="text-muted">${a.time}</p>
						</div>
					</div>
				</c:forEach>
			</div> --%>




			<div align="center">
    <!-- 5. paging view -->    
        <ul class="pagination">
        
            <c:if test="${paging.pageStartNum ne 1}">
                <!--맨 첫페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>이전</a></li>
              <!--이전 페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'>처음</a></li>
            </c:if>
            
            <!--페이지번호 -->
            <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1"> 
                <li class="page-item pageIndex${i}"><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
            </c:forEach>
            
            <c:if test="${paging.lastChk}">
                <!--다음 페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>다음</a></li>
                <!--마지막 페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>끝</a></li>
            </c:if>
            
        </ul>
        
      <form action="${pageContext.request.contextPath}/boardDiet/dietListForm" method="post" id="frmPaging">
            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
            <input type="hidden" name='index' id='index' value='${paging.index}'>
            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
        </form>

    </div>


		</div>
	</section>

	<!-- 하단바 -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="../resources/js/index.js"></script>
</body>
</html>