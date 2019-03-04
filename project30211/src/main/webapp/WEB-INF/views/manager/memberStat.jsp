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
<!-- memberStat에서만 쓰이는 link-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
   
<meta charset="UTF-8">
</head>
<!-- End Head -->

<body class="default">
   <jsp:include page="/WEB-INF/views/common/header.jsp" />

<form style="height:550px;">
<div class="container">

  <h3>회원 통계 관리</h3>  
  <hr>   
    <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/manager">  >  관리자 페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="#">  >  회원 통계 관리</a>
  </div><br><br>   
    
   <%--<p>(2019년 현재 기준)</p> 
    <div style="padding-bottom:50px;">
   총 회원 수 : ${totalMemCount}<br>
   부모님 수 : ${parentCount}<br>
   선생님 수 : ${teacherCount}<br>
   방문객 수 : ${visitorCount}<br>
   </div> --%>
   <p></p>
 <!-- Page Wrapper -->
 <div id="wrapper" style="border: 1px solid lightgray;padding-left:30px;padding-right:30px;padding-top:20px;padding-bottom:50px">

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
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">총 회원 수</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">${totalMemCount}명</div>
                    </div>
                    <div class="col-auto" style="margin:right">
                      <i class="fas fa-users fa-2x text-gray-300" style="margin-right: 20px; color:gray;"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2" style="border-left:solid #17a2b8; width:250px;">
                <div class="card-body">
                
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2"  align="center">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">선생님 수</div>
                      <div class="row no-gutters align-items-center" style="padding-bottom: 20px;">
                        <div class="col-auto" style="position: absolute; top:16px; left: 8px;">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${teacherCount}명</div>
                        </div>
                        
                       <div class="col" style="margin-left: 26px; position: absolute; top: 26px; left:-7px;">
                          <div class="progress progress-sm mr-2" style="width: 150px; height: 15px;">
                            <div class="progress-bar bg-info" role="progressbar" style="width: ${teacherPortion}%; height:20px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="60"></div>
                          </div>
                        </div> 
                        
                      </div>
                    </div>
                    
                    <div class="col-auto">
                      <i class="fas fa-id-badge fa-2x text-gray-300" style="margin-right: 20px; color:gray; "></i>
                    </div> 
                  </div>
                </div>
              </div>
            </div> 
            
                        <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2" style="border-left:solid #ffc107; width:250px;">
                <div class="card-body">
                
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2"  align="center">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">학부모 수</div>
                      <div class="row no-gutters align-items-center" style="padding-bottom: 20px;">
                        <div class="col-auto" style="position: absolute; top:16px; left: 8px;">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${parentCount}명</div>
                        </div>
                        
                       <div class="col" style="margin-left: 26px; position: absolute; top: 26px; left:-7px;">
                          <div class="progress progress-sm mr-2" style="width: 150px; height: 15px;">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: ${parentPortion}%; height:20px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="60"></div>
                          </div>
                        </div> 
                        
                      </div>
                    </div>
                    
                    <div class="col-auto">
                      <i class="fas fa-baby fa-2x text-gray-300" style="margin-right: 20px; color:gray; "></i>
                    </div> 
                  </div>
                </div>
              </div>
            </div> 
            
                        <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2" style="border-left:solid #dc3545; width:250px;">
                <div class="card-body">
                
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2"  align="center">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">방문객 수</div>
                      <div class="row no-gutters align-items-center" style="padding-bottom: 20px;">
                        <div class="col-auto" style="position: absolute; top:16px; left: 8px;">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${visitorCount}명</div>
                        </div>
                        
                       <div class="col" style="margin-left: 26px; position: absolute; top: 26px; left:-7px;">
                          <div class="progress progress-sm mr-2" style="width: 150px; height: 15px;">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: ${visitorPortion}%; height:20px" aria-valuenow="50" aria-valuemin="0" aria-valuemax="60"></div>
                          </div>
                        </div> 
                        
                      </div>
                    </div>
                    
                    <div class="col-auto">
                      <i class="fas fa-user fa-2x text-gray-300" style="margin-right: 20px; color:gray; "></i>
                    </div> 
                  </div>
                </div>
              </div>
            </div> 

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->



  </div>
</form>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   <script src="../resources/js/index.js"></script>
</body>

</html>