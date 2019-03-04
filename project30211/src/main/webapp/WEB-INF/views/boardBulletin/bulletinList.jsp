<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
<script type="text/javascript">
function bulletinWriteForm() {
	if("${sessionScope.id}"==null) {
		alert("회원가입 후 가능한 메뉴입니다.");
	} else {
		alert("글작성 페이지로 이동합니다.")
		document.getElementById("bulletinWriteForm").submit();
	}
}
</script>

<style type="text/css">
   .page-link{
      font-size: 15px;
   }
   thead>tr>th{
   	text-align: center;
   }
   tbody>tr>td{
   	text-align: center;
   }
   .aa{
   	text-align: left;
   }
</style>

</head>
<body>
	<!-- 상단바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- 사이드바 -->
	<div style="margin-top: 40px; margin-left: 175px;">
		<jsp:include page="/WEB-INF/views/common/side_com.jsp"></jsp:include>
	</div>
	
	<!-- 바디 -->
	<div class="container" style="margin-left: 23%">
		<h3>자유 게시판</h3>
		<hr>   
		<div align="right">
			<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
			<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2">  >  커뮤니티</a>
			<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardBulletin/bulletinList?sort=2">  >  자유게시판</a>
		</div><br>


	   	<div style="margin-bottom: 30px; position: relative; left: 90%;">
		 	<c:if test="${sessionScope.mem_code==0 or sessionScope.mem_code==1 or sessionScope.mem_code==2}">
		      	<a href="${pageContext.request.contextPath}/boardBulletin/bulletinWriteForm?sort=2" class="btn btn-primary" style="color: white;">글작성</a>
		   	</c:if>
		    <c:if test="${search_type ne null }">
		      	<a href="${pageContext.request.contextPath}/boardBulletin/bulletinList?sort=2" class="btn btn-primary" style="color: white;">전체목록</a>
		   	</c:if>
	   	</div>




		
		
		
		
		
		<table class="table table-hover">
			<thead>
	         	<tr>
	            	<th>글번호</th><th width="50%;">글제목</th><th>그룹</th><th>작성자</th><th>작성시간</th><th>조회수</th>
	         	</tr>
	      	</thead>
	      	
	      	<tbody>
				<c:forEach var="a" items="${list}">
				<tr>
		            <td>${a.bulletin_num}</td>
		            
		            <td class="aa">
						<!-- 공개글 -->
		               	<c:if test="${a.secret == 0}">
							<a href="${pageContext.request.contextPath}/boardBulletin/bulletinView?bulletin_num=${a.bulletin_num}&sort=2" style="font-size: 15px">${a.title}</a>
		               	</c:if>               
		               	<!-- 비밀글 -->            
		               	<c:if test="${a.secret == 1}"><span class="glyphicon glyphicon-lock"></span> 
		                  	<c:choose>
		                     	<%-- 비밀글 : 작성자거나 작성자 담당반 선생님(공개) --%>
		                     	<c:when test="${sessionScope.id==a.id or sessionScope.mng_group==a.stu_group}">
		                        	<a href="${pageContext.request.contextPath}/boardBulletin/bulletinView?bulletin_num=${a.bulletin_num}&sort=2" style="font-size: 15px">${a.title}</a>
		                     	</c:when>
		                     	<%-- 비밀글 : 작성자거나 작성자 담당반 선생님을 제외한 나머지(비공개) --%>
	                     		<c:otherwise>
		                        	${a.title}
		                     	</c:otherwise>                  
		                  	</c:choose>
		               	</c:if>
	            	</td> 
		          	<td class="aa">
						<c:if test="${a.stu_group!=null}">[학부모]
			               	<c:choose>
		               			<c:when test="${a.stu_group==1}">장미반</c:when>
			               		<c:when test="${a.stu_group==2}">해바라기반</c:when>
			            		<c:when test="${a.stu_group==3}">민들레반</c:when>
			               		<c:when test="${a.stu_group==4}">벚꽃반</c:when>              		
			               	</c:choose>
		               	</c:if>
		               	<c:if test="${a.mng_group!=null}">[선생님]
		                    <c:choose>
		               			<c:when test="${a.mng_group==1}">장미반</c:when>
			               		<c:when test="${a.mng_group==2}">해바라기반</c:when>
			            		<c:when test="${a.mng_group==3}">민들레반</c:when>
			               		<c:when test="${a.mng_group==4}">벚꽃반</c:when>              		
		               		</c:choose>
		               	</c:if>
	            	</td>
		            <td>${a.id}</td>
		            <td>${a.time}</td>
		            <td>${a.viewcount}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	
	
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
	         
	   
	<%--    <form action="${pageContext.request.contextPath }/boardBulletin/bulletinList" method="post" id="frmPaging">
	       <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
	       <input type="hidden" name='index' id='index' value='${paging.index}'>
	       <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
	       <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
	   </form> --%>
	   
	   <c:choose>
	      <c:when test="${search_type ne null }">
	         <form action="${pageContext.request.contextPath }/boardBulletin/bulletinSearchResult" method="post" id="frmPaging">
	             <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
				<input type="hidden" name="sort" value="${sort}">
	            <input type="hidden" name="search_type" value="${search_type}">
	            <input type="hidden" name="search_word" value="${search_word}">
	
	            <input type="hidden" name='index' id='index' value='${paging.index}'>
	            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
	           	<input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
	         </form>
	      </c:when>
	      <c:otherwise>
	         <form action="${pageContext.request.contextPath }/boardBulletin/bulletinList" method="post" id="frmPaging">
	            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
	           	<input type="hidden" name="sort" value="${sort}">
	            <input type="hidden" name='index' id='index' value='${paging.index}'>
	            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
	            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
	         </form>
	      </c:otherwise>
	   </c:choose>
	   
	   
	   
	   
	
	   <form action="${pageContext.request.contextPath }/boardBulletin/bulletinSearchResult">
	<div style="display: inline-flex; padding-bottom: 40px; position: relative; left: 26%;">
	   <select name="search_type" style="margin-right: 10px;">
	         <option value="1" selected="selected">제목</option>
	         <option value="2" selected="selected">작성자</option>
	   </select>
	      <!-- <input type="radio" name="search_type" value="1" checked>제목
	      <input type="radio" name="search_type" value="2">작성자 -->
	      <input type="text" class="form-control" id="search_word" name="search_word" placeholder="search..." value="" style="margin-right: 12px; width: 180px;">            
	      <input type="submit" class="btn btn-primary" value="검색">      
	</div>
	   </form>
	</div>  

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>

