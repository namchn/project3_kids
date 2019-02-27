<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link href="<c:url value="../resources/css/style.min.css" />"
   rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
   rel="stylesheet">
   
   
   <!-- 여기요 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>   
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">   

   <script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
<style type="text/css">

/* body{font-size: 10px;
margin: 0 0 40px 0;
padding: 6px 12px;
} */

table{margin: 0 0 1em 0;
   border-left:0;
  width: 100%;
   
  }
 .wrapper {
  margin: 0 auto;
  max-width: 70em;
  overflow: auto;
  margin-left: 30%;
}
.row {
  display: table-row;
  background: #f6f6f6;
}
.row:nth-of-type(odd) {
  background: #e9e9e9;
}
.row.header {
  font-weight: 900;
  color: #ffffff;
  background: #ea6153;
  text-align: center;
}
.row.green {
  background: #27ae60;
}
.row.blue {
  background: #2980b9;
}
.cell {
  padding: 1em 1em;
}
#delbtn{
font-size: 1em; float: right; width: 1em; color: #a51c1c;
margin-bottom: 1em; border: solid 1em #c1889c; border-radius: 1em; background-color: #ffc0c0;
}
</style>

<script type="text/javascript">

/* window.onload = function react(){
   var a=window.innerWidth;
   console.log(a);
   return a;
} */

setInterval(function(){
   var a=window.innerWidth;
   console.log(a)
   }, 500);


</script>


</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <c:set var="a" value="1" scope="page"/> 
   <c:if test="${a< 540}" >
   <div style="padding: 1.6em; margin-left: 10%;">
    <jsp:include page="/WEB-INF/views/common/side_com.jsp"/>
    </div>
    </c:if> 
    
<%
DecimalFormat df = new DecimalFormat("00");
Calendar currentCalendar = Calendar.getInstance();

//현재 날짜 구하기
String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
String strMonth = df.format(currentCalendar.get(Calendar.MONTH) + 1);
String strDay = df.format(currentCalendar.get(Calendar.DATE));
String strDate = strYear + "-"+strMonth +"-"+ strDay;
%>


<div class="wrapper">
<c:if test="${sessionScope.id eq 'manager' }">
<a href="${pageContext.request.contextPath }/poll/writeform" style="font-size: 1.5vw;">설문조사 만들기<span class="glyphicon glyphicon-log-out"></span></a>
</c:if>




<div class="container">
  <table class="table table-hover" style="font-size: 1vw;">
    <thead>
      <tr>
        <th>시작일</th>
        <th>종료일</th>
        <th>제목</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="a" items="${list }">
        <tr>
            <td class="cell" style="display: none">${a.poll_num }</td>
            <td>${a.start_date}</td>
            <td>${a.end_date }</td>   <%-- <td>${a.mng_group}</td> --%>
            <td>
            <c:set var="today" value="<%=strDate %>"/>
            <c:choose>
            <c:when test="${a.end_date < today && sessionScope.id ne 'manager'}">
            <b>${a.poll_subject}</b>
            </c:when>
              <c:otherwise>
              <a href="${pageContext.request.contextPath }/poll/view?pollnum=${a.poll_num}" style="color: black;" class="subject" id="${a.poll_num }">${a.poll_subject }</a>
              </c:otherwise>
              </c:choose>
            </td>
         </tr>
       </c:forEach>
    </tbody>
  </table>
</div>

<%-- 

<table style="font-size: 13px;">
        <tr class="row header">
           <th class="cell" style="width: 5%"><!-- <input type="checkbox" id="all"> --></th><th class="cell" style="display: none">투표번호</th><th class="cell" style="width: 25%">시작일</th><th class="cell" style="width: 25%">종료일</th><th class="cell" style="width: 45%">제목</th>
        </tr>
        <c:forEach var="a" items="${list }">
        <tr class="row" id="tr${a.poll_num }" name="row">
        <td class="cell" style="width: 5%"><input type="checkbox" value="${a.poll_num }" class="check" name="check"></td>
        <td class="cell" style="display: none">${a.poll_num }</td>
        <td class="cell" style="width: 25%" class="time">${a.start_date }</td>
        <td class="cell"  style="width: 25%;">${a.end_date }</td>
        <td class="cell" style="width: 45%;">
           <c:set var="today" value="<%=strDate %>"/>
           <c:choose>
           <c:when test="${a.end_date < today && sessionScope.id ne 'manager'}">
        <b style="color: gray; font-size: 20px;">${a.poll_subject }(투표 종료)</b>         
           </c:when>
           <c:otherwise>
           <a href="${pageContext.request.contextPath }/poll/view?pollnum=${a.poll_num}" style="color: black;" class="subject" id="${a.poll_num }">${a.poll_subject }</a>
           </c:otherwise>
           </c:choose>
        </td>
        </tr>
        </c:forEach>
</table>

 --%>

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
<form action="${pageContext.request.contextPath }/poll/list" method="post" id="frmPaging">
            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 개수 -->
            <input type="hidden" name='index' id='index' value='${paging.index}'>
            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
      </form>
</div>
        
         <div id="chart_div"></div>
         
         
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

   <script src="../resources/js/index.js"></script>
</body>
</html>