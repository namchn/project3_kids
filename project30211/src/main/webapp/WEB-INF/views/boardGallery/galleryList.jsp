<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">

<link href="../resources/css/agency.min.css" rel="stylesheet">
<!-- <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">
 -->
<script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 사이드바 -->
	<div style="margin-top: 40px; margin-left: 175px;">
		<jsp:include page="/WEB-INF/views/common/side_galary.jsp"/>
	</div>


<section id="portfolio">
	<div class="container" style="margin-top:50px; margin-left: 450px;">
	         
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase">Portfolio</h2>
				<h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
			</div>
		</div>
		
		<div class="row">	
			<c:if test="${sessionScope.id=='manager'}">
				<a href="${pageContext.request.contextPath}/boardGallery/galleryWriteForm?sort=1">글작성</a>
			</c:if>
			<c:if test="${sessionScope.mem_code==1 and sessionScope.mng_group==mng_group}">
				<a href="${pageContext.request.contextPath}/boardGallery/galleryWriteForm?sort=2">글작성</a>
			</c:if>
			<c:if test="${search_type ne null }">
				<a href="${pageContext.request.contextPath}/boardGallery/galleryList?mng_group=${mng_group}&sort=2" class="btn btn-warning">전체목록</a>
			</c:if> 
		</div>	
		
		         
		<div class="row">
			<c:forEach var="a" items="${list}">	         
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link" href="${pageContext.request.contextPath}/boardGallery/galleryView?gallery_num=${a.gallery_num}&sort=2">          
			            <img class="img-fluid" src="${a.img1}" alt="">
					</a>
					<div class="portfolio-caption">
						<h3>${a.title}</h3>
			            <p class="text-muted">${a.time}</p>
					</div>
			          
			          
				</div>
			</c:forEach>	         
		</div>		         
		         


	
		<div class="row">			
	
			<!-- paging view -->    
			<ul class="pagination">   
				<c:if test="${paging.pageStartNum ne 1}">
					<!--맨 첫페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>«</a></li>
					<!--이전 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'>‹</a></li>
				</c:if>
				<!--페이지번호 -->
				<c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1"> 
					<li class="page-item pageIndex${i}"><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
				</c:forEach>
				<c:if test="${paging.lastChk}">
					<!--다음 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>›</a></li>
					<!--마지막 페이지 이동 -->
					<li class="page-item"><a class="page-link" onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>»</a></li>
				</c:if>          
			</ul>
	
			<c:choose>
				<c:when test="${search_type ne null }">
					<form action="${pageContext.request.contextPath }/boardGallery/gallerySearchResult" method="post" id="frmPaging">
						<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
						<input type="hidden" name="search_type" value="${search_type}">
						<input type="hidden" name="search_word" value="${search_word}">
						<input type="hidden" name='index' id='index' value='${paging.index}'>
						<input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
						<input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
					</form>
				</c:when>
				<c:otherwise>
					<form action="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=${mng_group}&sort=2" method="post" id="frmPaging">
						<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
						<input type="hidden" name='index' id='index' value='${paging.index}'>
						<input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
						<input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
					</form>
				</c:otherwise>
			</c:choose>
		
		</div>
		
		
		
		
		
		<!-- 검색 -->
		<form action="${pageContext.request.contextPath }/boardGallery/gallerySearchResult">
               <input type="hidden" name="mng_group" value="${mng_group }">
               <input type="radio" name="search_type" value="1" checked>제목
               <input type="radio" name="search_type" value="2">작성자      
               <input type="text" name="search_word" value="">         
               <input type="submit" value="검색">
		</form>

	</div>
</section>
	
	
	
	

	
	
	
	
	
	
	
	
	<!-- 하단바 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>
</html>