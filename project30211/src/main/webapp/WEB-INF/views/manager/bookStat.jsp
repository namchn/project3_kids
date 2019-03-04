<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<!-- Start Head -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />"
   rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
   rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<style>
a{
font-size:15px;
}
a:link {
	font-size:15px;
}
table>thead>tr>th{
 text-align:center;
}
</style> 
</head>
<!-- End Head -->

<body class="default">
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
   <!-- 마이페이지 -->
   <form>
	<div class="container">

   <h3>도서 통계 관리</h3>
   <hr>
   <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/manager">  >  관리자 페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="#">  >  도서 통계 관리</a>
  </div><br><br> 
    
   <%--  <div style="padding-bottom:50px;">
     도서 총권수: ${bookCount}<br>
      대출된 총권수:  ${getRentCount}<br>
      대출중인 총권수:   ${bookRentCount}<br>
       대출지연 중인 총 권수 :${bookDelayCount}<br>
	</div> --%>
	 <!-- Page Wrapper -->
  <div id="wrapper" style="border: 1px solid lightgray;padding-left:30px;padding-right:30px;padding-top:20px;padding-bottom:30px">

     <p align="right">(
   
   	<% Date now =new Date(); %>
	<% SimpleDateFormat sf = new SimpleDateFormat("yyyy"); 
	String year =sf.format(now);%><%= year %>
   
   년 
   <% SimpleDateFormat sf2 = new SimpleDateFormat("MM"); 
	String month =sf2.format(now);%><%= month %>
   
   월 기준)</p> 

      <!-- Main Content -->
      <div id="content">

     
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <div class="row">
 
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2"  style="border-left:solid #007bff; width:250px; height:200px">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2" align="center">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"> 도서 총 권 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${bookCount}권</div>
                    </div>
                    <div class="col-auto" style="margin:right">
                      <i class="fas fa-archive fa-2x text-gray-300" style="margin-right: 20px; color:gray;"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
                        <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2"  style="border-left:solid #17a2b8; width:250px; height:200px">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2" align="center">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">  대출 중인 도서:</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${bookCount}권</div>
                    </div>
                    <div class="col-auto" style="margin:right">
                      <i class="fas fa-book-open fa-2x text-gray-300" style="margin-right: 20px; color:gray;"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
                        <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-danger shadow h-100 py-2"  style="border-left:solid #dc3545;width:250px; height:200px">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2" align="center">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1"> 연체 중인 도서</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${bookDelayCount}</div>
                    </div>
                    <div class="col-auto" style="margin:right">
                      <i class="fas fa-book-dead fa-2x text-gray-300" style="margin-right: 20px; color:gray;"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
        <%--                 <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-danger shadow h-100 py-2"  style="border-left:solid #dc3545; width:250px; height:200px">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2" align="center">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1"> 도서 총 권 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${bookCount}권</div>
                    </div>
                    <div class="col-auto" style="margin:right">
                      <i class="fas fa-book fa-2x text-gray-300" style="margin-right: 20px; color:gray;"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div> --%>
         
 

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
	<br>
	
<p style="padding-top:50px;">도서 연체 목록</p><br>

  <table class="table table-hover"  style="text-align:center;padding-bottom:500px;">
    <thead>
      <tr>
        <th style="width: 10%">대출번호</th>
        <th style="width: 10%">대여인</th>
        <th style="width: 20%">제목</th>
        <th style="width: 10%">시작일</th>
        <th style="width: 10%">종료일</th>
        <th style="width: 10%">대출수량</th>
        <th style="width: 10%">반납여부</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${list}">
      <c:if test="${mTime > list.e_date and list.r_date eq null}">
      <tr>
      	<td>${list.rent_num}</td>
      	<td>${list.id}</td>
        <td><a href="${pageContext.request.contextPath}/book/book_rent?book_title=${list.book_title}">${list.book_title}</a></td>
        <td>${list.s_date}</td>
        <td id="endDate">${list.e_date}</td>
        <td>${list.rent_amount}</td>
        <td style="color: red">연체중</td>
      </tr>
      
      </c:if>
      </c:forEach>
    </tbody>
  </table>
   </div>       
</form> 

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   <script src="../resources/js/index.js"></script>
</body>

</html>