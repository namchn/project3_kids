<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="padding: 40px; margin-left: 10%;">
<jsp:include page="/WEB-INF/views/common/side_galary.jsp"/>
</div>
<div style="margin-left: 30%;">
	<h3>갤러리 목록</h3>
	   <p>갤러리 게시판 입니다.</p>
	   
	<c:if test="${sessionScope.id=='manager'}">
		<a href="${pageContext.request.contextPath}/boardGallery/galleryWriteForm?sort=1">글작성</a>
	</c:if>
	<c:if test="${sessionScope.mem_code==1 and sessionScope.mng_group==mng_group}">
		<a href="${pageContext.request.contextPath}/boardGallery/galleryWriteForm?sort=2">글작성</a>
	</c:if>
   
   <table border="1">
    <c:if test="${search_type ne null }">
      <a href="${pageContext.request.contextPath}/boardGallery/galleryList?mng_group=${mng_group}&sort=2" class="btn btn-warning">전체목록</a>
   </c:if>   
      <tr>
         <c:forEach var="a" items="${list}">
            <td><a href="${pageContext.request.contextPath}/boardGallery/galleryView?gallery_num=${a.gallery_num}&sort=2"><img src="${a.img1}" width="200" height="200"></a></td>
         </c:forEach>   
      </tr>
      <tr>
         <c:forEach var="a" items="${list}">
            <td><a href="${pageContext.request.contextPath}/boardGallery/galleryView?gallery_num=${a.gallery_num}&sort=2">${a.title}</a></td>
         </c:forEach>   
      </tr>      
      <tr>
         <c:forEach var="a" items="${list}">
            <td>${a.time}</td>
         </c:forEach>
      </tr>
   </table>

	
	
	<div style="clear: both; margin-bottom: 50px; padding: 40px;">
		<!-- 5. paging view -->    
        <ul class="pagination" style="">
        
            <c:if test="${paging.pageStartNum ne 1}">
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>«</a></li>
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'>‹</a></li>
            </c:if>
            
            <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1"> 
                <li class="page-item pageIndex${i}"><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
            </c:forEach>
            
            <c:if test="${paging.lastChk}">
                <li class="page-item"><a class="page-link" onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>›</a></li>
 
                <li class="page-item"><a class="page-link" onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>»</a></li>
            </c:if>
            
        </ul>
	
		<form action="${pageContext.request.contextPath }/boardGallery/galleryList" method="post" id="frmPaging">
			<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
			<input type="hidden" name='index' id='index' value='${paging.index}'>
			<input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
			<input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
		</form>
		
<form action="${pageContext.request.contextPath }/boardGallery/gallerySearchResult">
               <input type="hidden" name="mng_group" value="${mng_group }">
               <input type="radio" name="search_type" value="1" checked>제목
               <input type="radio" name="search_type" value="2">작성자      
               <input type="text" name="search_word" value="">         
               <input type="submit" value="검색">
            </form>

	</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>

</body>
</html>