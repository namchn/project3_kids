<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">   

<style type="text/css">
a:visited {color: black;}
a:link {color: black;}
a{text-decoration: none;}   
.table>tbody>tr>td:first-child{
   font-weight: bolder;
}
table>thead>tr>th{
   text-align: center;
}
table>tbody>tr>td{
   text-align: center;
}
</style>
</head>

<body class="default">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 175px;">
   <jsp:include page="/WEB-INF/views/common/side_my.jsp"/>
</div>
<div style="margin-top:50px; margin-left: 22%; margin-bottom: 90px; max-width: 500px">
<c:if test="${sessionScope.mem_code eq 2}">
<div class="container">   
<h3>내 결제정보 확인</h3>
<hr>
<div align="right" style="margin-bottom: 50px; margin-right: 20%;">
   <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
   <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
   <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/pay/complete2">  >  내 결제정보 확인</a>
</div>
                                              
  <table class="table" style="width: 50%;">
    <thead>
      <tr>
        <th>항목</th>
        <th>고객정보</th>
      </tr>
    </thead>
    <tbody>   
      <tr>
        <td>ID</td>
        <td>${m.id}</td>
      </tr>
      <tr>
        <td>학부모 이름</td>
        <td>${m.name}</td>
      </tr>
      <tr>
        <td>아이 이름</td>
        <td>${m.stu_name}</td>
      </tr>
      <tr>
        <td>연락처</td>
        <td>${m.phone}</td>
      </tr>
      <c:choose>
      <c:when test="${p.id eq null}">
         <tr>
            <td>결제날짜</td>
           <td>-</td>
         </tr>
      </c:when>
      <c:otherwise>
         <tr>
            <td>결제날짜</td>
           <td>${p.time}</td>
         </tr>
      </c:otherwise>
      </c:choose>
      <c:choose>
      <c:when test="${p.id eq null}">
         <tr class="danger">
            <td>결제여부</td>
           <td>미납</td>
         </tr>
      </c:when>
      <c:otherwise>
         <tr class="info">
            <td>이번 달&nbsp;결제여부</td>
           <td>완납</td>
         </tr>
      </c:otherwise>
      </c:choose>
    </tbody>
  </table>
</div>
</c:if>

<c:if test="${sessionScope.mem_code eq 1}">
<c:choose>
            <c:when test="${sessionScope.mng_group eq 1}">
               <c:set var="group" value="장미"></c:set>
            </c:when>
            <c:when test="${sessionScope.mng_group eq 2}">
               <c:set var="group" value="해바라기"></c:set>
            </c:when>
            <c:when test="${sessionScope.mng_group eq 3}">
               <c:set var="group" value="민들레"></c:set>
            </c:when>
            <c:otherwise>
               <c:set var="group" value="벚꽃"></c:set>
            </c:otherwise>
         </c:choose>

<div class="container" style="">
<h3>${group }반 결제정보 확인<span style="font-size:15px;">

  (
      <% Date now =new Date(); %>
   <% SimpleDateFormat sf = new SimpleDateFormat("yyyy"); 
   String year =sf.format(now);%><%= year %>
   
   년 
   <% SimpleDateFormat sf2 = new SimpleDateFormat("MM"); 
   String month =sf2.format(now);%><%= month %>
   
   월 기준)  
</span></h3>
<hr>

<div align="right" style="margin-bottom: 50px;">
   <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
   <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
   <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/pay/complete">  >  원생 결제정보 확인</a>
</div>
<table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>id</th>
        <th>이름</th>
        <th>아이 이름</th>
        <th>연락처</th>
        <th>결제여부</th>
      </tr>
    </thead>
    <tbody>   
      <c:forEach var="list" items="${requestScope.map}" varStatus="num">
      <tr>
         <td>${num.index}</td>
         <td>${list.key}</td>
         <td>${mlist[num.index].name}</td>
         <td>${mlist[num.index].stu_name}</td>
         <td>${mlist[num.index].phone}</td>
         <c:choose>
         <c:when test="${list.value ne '미납'}">
         <td style="color: green">${list.value}</td>
         </c:when>
         <c:otherwise>
         <td style="color: red;">${list.value}</td>
         </c:otherwise>
         </c:choose>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  </div>
</c:if>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>
         