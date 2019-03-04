<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">
<link href="../resources/css/agency.min.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>

</head>
<body>
	<!-- 상단바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 사이드바 -->
	<div style="margin-top: 40px; margin-left: 175px;">
		<jsp:include page="/WEB-INF/views/common/side_galary.jsp"/>
	</div>
	<!-- 바디 -->
	<section id="portfolio">
	<div class="container" style="margin-left: 23%">	         
		<div class="row">
			<div class="col-lg-12">
				<h3 class="section-heading text-uppercase"><b>
	               <c:if test="${mng_group!=null}">
	                    <c:choose>
		               		<c:when test="${mng_group==1}">장미반</c:when>
		               		<c:when test="${mng_group==2}">해바라기반</c:when>
		            		<c:when test="${mng_group==3}">민들레반</c:when>
		               		<c:when test="${mng_group==4}">벚꽃반</c:when>              		
	               		</c:choose>
	               </c:if>이야기
               </b></h3>
				<h4 class="section-subheading text-muted" style="margin-bottom: 5px;"><b>키트리유치원 어린이들의 사진첩입니다.</b></h4>
			</div>
		</div>
		<hr>
		<div align="right" style="margin-bottom: 50px;">
			<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
			<a style="font-size: 13px; color: gray; text-decoration:none" href="#">  >  <c:if test="${mng_group!=null}">
	                    <c:choose>
		               		<c:when test="${mng_group==1}">장미반</c:when>
		               		<c:when test="${mng_group==2}">해바라기반</c:when>
		            		<c:when test="${mng_group==3}">민들레반</c:when>
		               		<c:when test="${mng_group==4}">벚꽃반</c:when>              		
	               		</c:choose>
	               </c:if>이야기</a>
		</div>
		<div class="row" >
			<div style="position: relative; left: 90%;">
			<c:if test="${search_type ne null }">
				<a href="${pageContext.request.contextPath}/boardGallery/galleryList?mng_group=${mng_group}&sort=2" class="btn btn-primary" style="color: white;">전체목록</a>
			</c:if> 
			<c:if test="${sessionScope.id=='manager'}">
				<a href="${pageContext.request.contextPath}/boardGallery/galleryWriteForm?sort=1" class="btn btn-primary" style="color: white;">글작성</a>
			</c:if>
			<c:if test="${sessionScope.mem_code==1 and sessionScope.mng_group==mng_group}">
				<a href="${pageContext.request.contextPath}/boardGallery/galleryWriteForm?sort=2" class="btn btn-primary" style="color: white;">글작성</a>
			</c:if>
			</div>
		</div><br>
		   
		<div class="row">
			<c:forEach var="a" items="${list}">	         
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link" href="${pageContext.request.contextPath}/boardGallery/galleryView?gallery_num=${a.gallery_num}&sort=2">          
			            <img class="img-fluid" src="../resources${a.img1 }" alt="">
					</a>
					<%-- ${a.img1} --%>
					<div class="portfolio-caption">
						<h3>${a.title}</h3>
			            <p class="text-muted">${a.time}</p>
					</div>  
				</div>
			</c:forEach>	         
		</div>		         

		<div class="row">			
			<!-- paging view -->    
			<ul class="pagination" style="position: relative; left: 40%;">   
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
						<input type="hidden" name="sort" value="${sort}">
						<input type="hidden" name="mng_group" value="${mng_group}">
						<input type="hidden" name="search_type" value="${search_type}">
						<input type="hidden" name="search_word" value="${search_word}">
               
            
						<input type="hidden" name='index' id='index' value='${paging.index}'>
						<input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
						<input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
					</form>
				</c:when>
				<c:otherwise>
					<form action="${pageContext.request.contextPath }/boardGallery/galleryList" method="post" id="frmPaging">
						<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
							<input type="hidden" name="sort" value="${sort}">
							<input type="hidden" name="mng_group" value="${mng_group}">
							<input type="hidden" name='index' id='index' value='${paging.index}'>
							<input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
							<input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
					</form>
				</c:otherwise>
			</c:choose>
		</div>

		
		<!-- 검색 -->
		<form action="${pageContext.request.contextPath }/boardGallery/gallerySearchResult">
			<div style="display: inline-flex; padding-bottom: 40px; position: relative; left: 30%;">
				<select name="search_type" style="margin-right: 10px;">
					<option value="1" selected="selected">제목</option>
					<option value="2" selected="selected">작성자</option>
				</select>
	
				<input type="hidden" name="mng_group" value="${mng_group }">
				<input type="text" class="form-control" id="search_word" name="search_word" placeholder="search..." value="" style="margin-right: 12px; width: 250px;">            
				<input type="submit" class="btn btn-primary" value="검색">      
			</div>
		</form>

	</div>
	</section>
	
	<!-- 하단바 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>
</html>