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
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">

<style>
.modal-header, h4, .close {
   background-color: #9ac5e8;
   color:white !important;
   text-align: center;
   font-size: 30px;
}
.modal-footer {
   background-color: #f9f9f9;
}
table>tbody>tr>td:first-child{
   font-weight: bolder;
}
.form-control{
   max-width: 96%;
}
.modal-header{
   padding-bottom: 30px;
    padding-top: 30px;
    padding-left: 50px;
}
.btn-success{
   background-color: #9ac5e8;
   width: 96%;
   border: 0;
}
.btn-success:hover{
   background-color: #68abe2;
}
.btn-success:focus{
   background-color: #68abe2;
}

.btn-success:not(:disabled):not(.disabled).active, .btn-success:not(:disabled):not(.disabled):active, .show>.btn-success.dropdown-toggle{
   background-color: #68abe2;
   border-color:#68abe2;
}

</style>

<script>
$(document).ready(function(){

   if ($('#myCart').hasClass("active")) {
      $('#myCartList').css("display","");
   }
   else {
      $('#myCartList').css("display","none");
   }

   $('#btn1').click(function() {   // 수량, 날짜 체크 후 대출
      var rest_amount = $('#rest_amount').html();
      var rent_amount = $('#rent_amount').val();
      var mTime = $('#mTime').val();
      var s_date = $('#s_date').val();
      var e_date = $('#e_date').val();
      if((rent_amount > rest_amount) || (rest_amount <= 0) || (rent_amount <= 0)) {
         alert("수량을 확인해 주세요.");
      }
      else if((s_date >= e_date) || (s_date < mTime) || (e_date < mTime) || (e_date - s_date > 7)) {
         alert("날짜를 확인해 주세요.");
      }
      else {
         alert("대출 완료했습니다.");   
         $("#rentForm").attr("action", "${pageContext.request.contextPath}/book/rent_book");
         $('#rentForm').submit();
      }
   });

   $('#myCart').click(function() {
      if ($(this).hasClass("active")) {   // 찜을 한 경우 삭제
         var book_num = $('#book_num').val();
         var param = "book_num=" + book_num;
         $.ajax({
            type:"POST",
            url: "${pageContext.request.contextPath}/book/mybookdel",
            data: param,
            success:function(data) {
               $('#myCartList').css("display","none");
            }
         });
         
      } else {   // 찜을 안한 경우 추가
         var book_num = $('#book_num').val();
         var param = "book_num=" + book_num;
         $.ajax({
            type:"POST",
            url: "${pageContext.request.contextPath}/book/mybook",
            data: param,
            success:function(data) {
               $('#myCartList').css("display","");
            }
         });
      }
   });
});

function endDate() {
   var startDate = $('#s_date').val();
   var book_num = $('#book_num').val();
   var param = "startDate="+startDate+"&book_num="+book_num;
   $.ajax({
      type:"POST",
      url:"${pageContext.request.contextPath}/book/rentdate",
      data:param,
      success:function(data) {
         var obj = eval('('+data+')');
         var str = "";
         str += "<input type=\"date\" id=\"e_date\" name=\"e_date\" class=\"form-control\" value=" + obj.endDate + " readonly style=\"width: 45%; float: left;\">";
         $('#endDate').html(str);
         $('#endDate').css("display", "inline");
      }
   });
}
</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div style="margin-top: 40px; margin-left: 175px;">
   <jsp:include page="/WEB-INF/views/common/side_book.jsp"></jsp:include>
</div>
<div class="container" style="margin-top:50px; font-size: 15px; margin-left: 22%; margin-bottom: 90px;">     
<h3>도서 대출</h3>
<hr style="width: 800px; float: left;"> 
<div style="display: inline-block; margin-left: 55%;">
   <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
   <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/book/booklistForm">  >  도서관</a>
   <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/book/book_rent">  >  도서 대출</a>
</div><br><br>
                                                    
<table class="table" style="max-width: 45%">
  <thead>
    <tr>
     <th>항목</th>
    <th>정보</th>
   </tr>
  </thead>
  <tbody>
   <tr>
    <td>이미지</td>
    <td><img src="../resources/img/${b.book_img}" width="100" height="100"></td>
   </tr>
   <tr>
    <td>제목</td>
    <td>${b.book_title}</td>
   </tr>
   <tr>
    <td>저자</td>
    <td>${b.book_writer}</td>
   </tr>
   <tr>
    <td>출판사</td>
    <td>${b.book_publisher}</td>
   </tr>
   <tr>
     <td>수량</td>
    <td id="rest_amount">${b.rest_amount}</td>
   </tr>
   <c:choose>
      <c:when test="${b.rest_amount eq 0}">
         <tr class="danger">
            <td>대출여부</td>
            <td style="color:red">대출불가</td>
         </tr>
      </c:when>
      <c:otherwise>
         <tr class="success">
            <td>대출여부</td>
            <td style="color:green">대출가능</td>
      </c:otherwise>
   </c:choose>
  </tbody>
</table>
<div>

  <!-- Trigger the modal with a button -->
  <!-- <button type="button" class="btn btn-default btn-lg" id="myBtn">Login</button> -->
  <div style="position: absolute; right: 51.5%; margin-top: 20px">
     <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/booklistForm" style="color:white">목록</a>
     <c:if test="${b.rest_amount > 0}">
        <a class="btn btn-primary" id="myBtn"  data-toggle="modal" data-target="#myModal" style="color:white;">대출</a>
     </c:if>
     <a class="btn btn-primary 1 ${chk == true ? 'active' : ''}" id="myCart" data-toggle="button" style="color:white;">찜하기</a>
     <span id="myCartList" style="display: none;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/myCart" style="color:white">찜목록</a>
     </span>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <h3>도서 대출 내용 입력</h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
        
          <form id="rentForm" name="rentForm" method="post" action="${pageContext.request.contextPath}/book/rent_book">
          <input type="hidden" name="book_num" id="book_num" value="${b.book_num}">
          <div class="form-group">
              <label>제목</label>
              <input type="text" class="form-control" name="book_title" value="${b.book_title}" readonly  style="max-width: 100%;">
            </div>
            <div class="form-group">
              <label>수량</label>
              <input type="number" class="form-control" id="rent_amount" name="rent_amount" placeholder="수량을 입력하세요" style="max-width: 100%;">
            </div>
            <div class="form-group">
              <label>대출기간</label>
              <div>
              <span><input type="date" class="form-control" id="s_date" name="s_date"  style="width: 45%; float: left; margin-bottom: 30px;"
                value="" onchange="endDate()"></span><p style="font-size: 20px; float: left;">&nbsp;~&nbsp;</p> 
               <span id="endDate"></span>
              </div>
            </div>
            <input type="hidden" id="mTime" value="${mTime}">
         <button class="btn btn-success btn-block" id="btn1" data-dismiss= "modal">대출하기</button>
          </form>
        </div>
      </div>      
    </div>
  </div> 
</div>
  </div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>