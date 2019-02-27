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
<script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <section>
 <div style="margin-left: 10%; padding: 20px;">
 <jsp:include page="/WEB-INF/views/common/side_com.jsp"></jsp:include>

 </div>
 <div style="margin-left: 40%; padding: 20px;">
	<h3>공지사항 목록</h3>
	<p>공지사항 게시판 입니다.</p>
 <c:if test="${sessionScope.mem_code==0 or sessionScope.mem_code==1}">
      <a href="${pageContext.request.contextPath}/boardNotice/noticeWriteForm?sort=2">글작성</a>
   </c:if>
    <c:if test="${search_type ne null }">
      <a href="${pageContext.request.contextPath}/boardNotice/noticeList?sort=2" class="btn btn-warning">전체목록</a>
   </c:if>
   
   <table border="1">
      <tr>
         <th>글번호</th><th>글제목</th><th>작성자</th><th>작성시간</th><th>조회수</th><th>첨부파일</th>
      </tr>
      <c:forEach var="a" items="${list}">
      <tr>
         <td>${a.notice_num}</td>
         <td><a href="${pageContext.request.contextPath}/boardNotice/noticeView?notice_num=${a.notice_num}&sort=2">${a.title}</a></td>
         <td>${a.id}</td>
         <td>${a.time}</td>
         <td>${a.viewcount}</td>
         <td>
            <c:if test="${a.files ne null }">
               첨부파일有
            </c:if>
         </td>
      </tr>
      </c:forEach>   
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
            <%-- <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1">  --%>
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
              <form action="${pageContext.request.contextPath }/boardNotice/noticeSearchResult"" method="post" id="frmPaging">
                  <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
               <input type="hidden" name="search_type" value="${search_type}">
               <input type="hidden" name="search_word" value="${search_word}">
                  <input type="hidden" name='index' id='index' value='${paging.index}'>
                  <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
                  <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
              </form>
         </c:when>
         <c:otherwise>
              <form action="${pageContext.request.contextPath }/boardNotice/noticeList" method="post" id="frmPaging">
                  <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
                  <input type="hidden" name='index' id='index' value='${paging.index}'>
                  <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
                  <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
              </form>
         </c:otherwise>
      </c:choose>
   
   
   <table border="1">
      <tr>
         <td>
            <form action="${pageContext.request.contextPath }/boardNotice/noticeSearchResult">
               <input type="radio" name="search_type" value="1" checked>제목
               <input type="radio" name="search_type" value="2">작성자      
               <input type="text" name="search_word"value="">         
               <input type="submit" value="검색">
            </form>
         </td>
      </tr>
   </table>

	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>	
</body>
</html>