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
   <jsp:include page="/WEB-INF/views/common/side_book.jsp"></jsp:include>
</div>
<div class="container" style="margin-top:50px; margin-left: 23%;">
<h3>도서 목록</h3>
<hr style="width: 1200px"> 
<div style="position: absolute; left: 75%;">
   <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
   <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/book/booklistForm">  >  도서관</a>
   <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/book/booklistForm">  >  도서목록</a>
</div><br><br>

<c:if test="${sessionScope.id eq 'manager'}">   
   <div align="right">
     <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/add_book" style="color:white;">추가</a>
   <button class="btn btn-primary" id="dbtn">삭제</button>
     <br><br>
   </div>
</c:if>

<form name="checkBook" id="form" method="post">
  <table class="table table-hover" style="font-size: 15px;">
    <thead>
      <tr>
        <c:if test="${sessionScope.id eq 'manager'}">   
        <th style="width: 5%;"><input type="checkbox" id="all" name="checkall"></th>
        </c:if>
        <th>번호</th>
        <th>제목</th>
        <th>저자</th>
        <th>출판사</th>
        <th>수량</th>
        <th>대출여부</th>
      </tr>
    </thead>
   <tbody>
      <c:forEach var="list" items="${list}">
      <tr>
        <c:if test="${sessionScope.id eq 'manager'}">   
        <td><input type="checkbox" name="checked_book" class="check" value="${list.book_num}"></td>
        </c:if>
        <td>${list.book_num}</td>
        <td style="text-align: left;">
        <c:choose>
           <c:when test="${sessionScope.id eq null }">
              <p style=" margin-left: 40px;">${list.book_title}</p>
           </c:when>
           <c:otherwise>
              <a href="${pageContext.request.contextPath}/book/book_rent?book_num=${list.book_num}" style="font-size: 15px;  margin-left: 40px;">${list.book_title}</a>   
           </c:otherwise>
        </c:choose>
        </td>
        <td>${list.book_writer}</td>
        <td>${list.book_publisher}</td>
        <td>${list.rest_amount}</td>
        <c:choose>
           <c:when test="${list.rest_amount eq 0}">
              <td style="color: red">대출불가</td>
           </c:when>
           <c:otherwise>
              <td style="color: green">대출가능</td>
           </c:otherwise>
        </c:choose>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</form>
</div>

<div align="center">
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
        
      <form action="${pageContext.request.contextPath }/book/booklistForm" method="post" id="frmPaging">
            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 개수 -->
            <c:if test="${opt ne null}">
            <input type="hidden" value="${opt}" name="opt">
            <input type="hidden" value="${search_word}" name="search_word">
            </c:if>
            <input type="hidden" name='index' id='index' value='${paging.index}'>
            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
      </form>
</div>


<div  align="center">
<form method="post" id="searchForm" action="${pageContext.request.contextPath }/book/booklist">
<div style="display: inline-flex; padding-bottom: 40px; position: relative;">
  <select id="selectBox" name="selectBox" style="font-size: 15px; margin-right: 10px;">
    <option value="1">제목</option>
    <option value="2">저자</option>
  </select>
  <input type="text" id="search_word" name="search_word" class="form-control" placeholder="search..." style="margin-right: 12px; width: 180px;">
  <input type="submit" class="btn btn-primary" id="search1" value="검색">
</div>
</form>
</div>
<c:if test="${as ne null}">
<a class="btn btn-primary" href="${pageContext.request.contextPath}/book/booklistForm" style="float: right">목록으로 돌아가기</a>
</c:if>

<script>
$(document).ready(function(){
	   //최상단 체크박스 클릭
	    $("#all").click(function(){
	        //클릭되었으면
	        if($("#all").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $(".check").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $(".check").prop("checked",false);
	        }
	    });
	   $("#dbtn").click(function(){
	   var checked = $('.check:checked').length;
	      if(checked==0){
	         alert("한개 이상 선택해야합니다");
	      }
	      else{
	    	  
	    	  $('#form').attr("action", "${pageContext.request.contextPath }/manager/delBook");
	         $("#form").submit();
	    	  
	      }
	      
	   })
	   
})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>