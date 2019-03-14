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
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>

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
   $("#btn1").click(function(){
   var checked = $('.check:checked').length;
      if(checked==0){
         alert("선택을 해야합니다");
      }
      else{
    	  
    	  $('#form').attr("action", "${pageContext.request.contextPath }/manager/rent");
         $("#form").submit();
    	  
      }
      
   })
   $("#btn2").click(function(){
   var checked = $('.check:checked').length;
      if(checked==0){
         alert("선택을 해야합니다");
      }
      else{
    	 
    	  $('#form').attr("action", "${pageContext.request.contextPath }/manager/delRent");
         $("#form").submit();
    	  
      }
   })
   $("#btn3").click(function(){
   var checked = $('.check:checked').length;
      if(checked!=1){
    	 
         alert("하나만 선택해야합니다");
      }
      else{
    	  $('#form').attr("action", "${pageContext.request.contextPath}/manager/editBook");
         $("#form").submit();
      }
   })
})
</script> 

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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 175px;">
   <jsp:include page="/WEB-INF/views/common/side_book.jsp"></jsp:include>
</div>
<div class="container" style="margin-top:50px; margin-left: 22%;">
  <h3>도서관리</h3>
  <hr> 
  <div style="position: absolute; left: 73%;">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/manager">  >  관리자페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/rentpage">  >  도서관리</a>
  </div><br><br>  
  
  <div>
  <a class="glyphicon glyphicon-check" style="font-size: 12px; color: gray; text-decoration:none"></a><a style="font-size: 13px;" href="${pageContext.request.contextPath}/manager/rentalList">대출중&nbsp;</a>
  <a class="glyphicon glyphicon-check" style="font-size: 12px; color: gray; text-decoration:none"></a><a style="font-size: 13px;" href="${pageContext.request.contextPath}/manager/delayList">연체중&nbsp;</a>
  <a class="glyphicon glyphicon-check" style="font-size: 12px; color: green; text-decoration:none"></a><a style="font-size: 13px; font-weight: bolder;">반납완료&nbsp;</a>
  </div><br><br>
  
  <div id="todayDiv"></div>
  <form name="checkTest" id="form" method="post">
  <table class="table table-hover" style="font-size: 15px">
    <thead>
      <tr>
        <th style="width: 3%"><input type="checkbox" id="all" name="checkall" onclick="javascript:CheckAll()"></th>
        <th style="width: 8%">대출번호</th>
        <th style="width: 8%">대여인</th>
        <th style="width: 25%">제목</th>
        <th style="width: 10%">시작일</th>
        <th style="width: 10%">종료일</th>
        <!-- <th style="width: 8%">대출수량</th> -->
        <th style="width: 10%">반납여부</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="list" items="${list}">
      <tr>
         <td> 
  <input type="hidden" value="${list.book_num}" name="book_num">
         <input type="checkbox" name="checked_book" class="check" value="${list.rent_num}"></td>
         <td>${list.rent_num}</td>
         <td>${list.id}</td>
        <td style="text-align: left"><a href="${pageContext.request.contextPath}/book/book_rent?book_num=${list.book_num}" style="font-size: 15px;  margin-left: 40px;">${list.book_title}</a></td>
        <td>${list.s_date}</td>
        <td id="endDate">${list.e_date}</td>
        <%-- <td>${list.rent_amount}</td> --%>
        <c:choose>
        <c:when test="${mTime > list.e_date and list.r_date eq null}">
        <td style="color: red" class="rr">연체중</td>
        </c:when>
        <c:when test="${list.r_date ne null}">
        <td style="color: blue" class="rr">반납완료</td>
        </c:when>
        <c:otherwise>
        <td style="color: green" class="rr">대출중</td>
        </c:otherwise>
        </c:choose>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <div align="right">
  <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/add_book" style="color:white;">추가하기</a>
  <button class="btn btn-primary" id="btn3">수정하기</button>
  <button class="btn btn-primary button1" id="btn1">반납하기</button>
  <button id="btn2" class="btn btn-primary button1">삭제하기</button>
  </div>
  </form>
</div>

<div align="center"  style="margin-bottom: 50px">
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
        
      <form action="${pageContext.request.contextPath}/manager/completeList" method="post" id="frmPaging">
            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 개수 -->
            <input type="hidden" name='index' id='index' value='${paging.index}'>
            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
      </form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>