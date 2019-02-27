<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
rel="stylesheet">

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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
<div style="padding: 20px; margin-left: 10%;">
<jsp:include page="/WEB-INF/views/common/side_com.jsp"/></div>

<div class="container" style="margin-left: 30%">
	
	<h2>자유 게시판</h2>
	<p>자유 게시판 입니다.</p>  
		
	<form action="${pageContext.request.contextPath}/boardBulletin/bulletinWriteForm?sort=2" id="bulletinWriteForm">
		<input type="button" value="글작성" onclick="location.href='${pageContext.request.contextPath}/boardBulletin/bulletinWriteForm?sort=2'" class="btn btn-warning">
	</form>
	
	<c:if test="${search_type ne null }">
      <a href="${pageContext.request.contextPath}/boardBulletin/bulletinList?sort=2" class="btn btn-warning">전체목록</a>
   </c:if>
	<table class="table table-hover">
      <thead class="thead-dark">
         <tr>
            <th>글번호</th><th>글제목</th><th>그룹</th><th>작성자</th><th>작성시간</th><th>조회수</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="a" items="${list}">
         <tr>
            <td>${a.bulletin_num}</td>
            
            <td>
               <!-- 공개글 -->
               <c:if test="${a.secret == 0}">
                  <a href="${pageContext.request.contextPath}/boardBulletin/bulletinView?bulletin_num=${a.bulletin_num}&sort=2">${a.title}</a>
               </c:if>               
               <!-- 비밀글 -->            
               <c:if test="${a.secret == 1}">[비밀글] 
                  <c:choose>
                     <%-- 비밀글 : 작성자거나 작성자 담당반 선생님(공개) --%>
                     <c:when test="${sessionScope.id==a.id or sessionScope.mng_group==a.stu_group}">
                        <a href="${pageContext.request.contextPath}/boardBulletin/bulletinView?bulletin_num=${a.bulletin_num}&sort=2">${a.title}</a>
                     </c:when>
                     <%-- 비밀글 : 작성자거나 작성자 담당반 선생님을 제외한 나머지(비공개) --%>
                     <c:otherwise>
                        ${a.title}
                     </c:otherwise>                  
                  </c:choose>
               </c:if>
            </td>
            
            <td>
               <c:if test="${a.stu_group!=null}">[학부모]
                  ${a.stu_group}
               </c:if>
               <c:if test="${a.mng_group!=null}">[선생님]
                  ${a.mng_group}
               </c:if>
            </td>
            <td>${a.id}</td>
            <td>${a.time}</td>
            <td>${a.viewcount}</td>
         </tr>
         </c:forEach>
      </tbody>
   </table>


   <!-- 5. paging view -->    
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
             <c:if test="${search_type ne null }">
               <input type="hidden" name="search_type" value="${search_type}">
               <input type="hidden" name="search_word" value="${search_word}">
               
            </c:if>
            
             <input type="hidden" name='index' id='index' value='${paging.index}'>
             <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
             <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
         </form>
      </c:when>
      <c:otherwise>
         <form action="${pageContext.request.contextPath }/boardBulletin/bulletinList" method="post" id="frmPaging">
             <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
            
             <input type="hidden" name='index' id='index' value='${paging.index}'>
             <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
             <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
         </form>
      </c:otherwise>
   </c:choose>


   <form action="${pageContext.request.contextPath }/boardBulletin/bulletinSearchResult">
      <input type="radio" name="search_type" value="1" checked>제목
      <input type="radio" name="search_type" value="2">작성자
      <input type="text" class="form-control" id="search_word" name="search_word" placeholder="search..." value="">            
      <input type="submit" class="btn btn-primary" value="검색">      
   </form>

</div>  
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>