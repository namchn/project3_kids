<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">

<style type="text/css">
table>thead>tr>th{
	text-align: center;
}
table>tbody>tr>td{
	text-align: center;
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div style="margin-top: 40px; margin-left: 175px;">
	<jsp:include page="/WEB-INF/views/common/side_my.jsp"></jsp:include>
</div>
<div class="container" style="margin-top:50px; margin-left: 22%; margin-bottom: 80px">
  <h3>내 대출 목록</h3>
  <hr>
  <div align="right" style="margin-bottom: 50px; margin-right: 20%;">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/book/myrent">  >  내 대출 목록</a>
  </div><br><br>   
  <div id="todayDiv"></div>
  <table class="table table-hover" style="width: 75%;">
    <thead>
      <tr style="text-align:center">
        <th style="width: 8%">대출번호</th>
        <th style="width: 20%" id="title">제목</th>
        <th style="width: 8%">시작일</th>
        <th style="width: 8%">종료일</th>
        <!-- <th style="width: 8%">대출수량</th> -->
        <th style="width: 10%">반납여부</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="mylist" items="${mylist}" varStatus="status">
      <tr>
      	<td>${mylist.rent_num}</td>
        <td style="text-align: left"><a href="${pageContext.request.contextPath}/book/book_rent?book_num=${mylist.book_num}" style="font-size: 15px; margin-left: 40px">${mylist.book_title}</a></td>
        <td>${mylist.s_date}</td>
        <td id="endDate">${mylist.e_date}</td>
        <%-- <td>${mylist.rent_amount}</td> --%>
        <c:choose>
        <c:when test="${mTime > list.e_date and list.r_date eq null}">
        <td style="color: red">연체중</td>
        </c:when>
        <c:when test="${mylist.r_date ne null}">
        <td style="color: blue">반납완료</td>
        </c:when>
        <c:otherwise>
        <td style="color: green">대출중</td>
        </c:otherwise>
        </c:choose>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<div align="center" style="margin-bottom: 80px;">
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
        
      <form action="${pageContext.request.contextPath}/book/myrent" method="post" id="frmPaging">
            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 개수 -->
            <input type="hidden" name='index' id='index' value='${paging.index}'>
            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
      </form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>