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

<script>
var check = false;
function CheckAll() {
	var chk = document.getElementsByName("checked_cart");
	if(check == false) {
		check = true;
		for(var i = 0; i < chk.length; i++) {
			chk[i].checked = true;	// 모두 체크
		}
	} else {
		check = false;
		for(var i = 0; i < chk.length; i++) {
			chk[i].checked = false;	// 모두 해제
		}
	}
}
</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div style="margin-top: 40px; margin-left: 175px;">
	<jsp:include page="/WEB-INF/views/common/side_my.jsp"></jsp:include>
</div>
<!-- 현재날짜 -->
<div class="container" style="margin-top:50px; margin-left: 22%; margin-bottom: 80px">
  <h3>찜한 도서 목록</h3>
  <hr style="width: 1200px">
  <div style="position: absolute; left: 72%;">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath}"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/book/myCart">  >  찜한 도서 목록</a>
  </div><br><br>   
  <div id="todayDiv"></div>
  <form name="checkTest" action="${pageContext.request.contextPath}/book/my_cart" method="post">
  <table class="table table-hover" style="font-size: 15px;">
    <thead>
      <tr>
        <th style="width: 2%"><input type="checkbox" id="checkall" name="checkall" onclick="javascript:CheckAll()"></th>
        <th style="width: 10%">번호</th>
        <th style="width: 25%">제목</th>
        <th style="width: 10%">저자</th>
        <th style="width: 10%">출판사</th>
        <th style="width: 10%">수량</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="myCart" items="${myCart}">
      <tr>
        <td><input type="checkbox" name="checked_cart" value="${myCart.book_num}"></td>
      	<td>${myCart.cart_num}</td>
        <td style="text-align: left"><a href="${pageContext.request.contextPath}/book/book_rent?book_num=${myCart.book_num}" style="font-size: 15px">${myCart.book_title}</a></td>
        <td>${myCart.book_writer}</td>
        <td>${myCart.book_publisher}</td>
        <td>${myCart.rest_amount}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <div align="right" style="margin-top: 30px">
  <button type="submit" class="btn btn-primary">삭제하기</button>
  </div>
  </form>
</div>

<div align="center" style="margin-bottom: 80px">
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
        
      <form action="${pageContext.request.contextPath}/book/myCart" method="post" id="frmPaging">
            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 개수 -->
            <input type="hidden" name='index' id='index' value='${paging.index}'>
            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
      </form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>