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
<link href="<c:url value="../resources/css/style.min.css" />"
   rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
   rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">   
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
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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

   <div style="margin-top: 40px; margin-left: 175px;">
    <jsp:include page="/WEB-INF/views/common/side_com.jsp"/>
    </div>
    
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
<h3>설문조사</h3>
<hr>

<div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2">  >  커뮤니티</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="#">  >  설문조사</a>
      </div> 
<br>
 <c:if test="${sessionScope.id eq 'manager' }">
<a href="${pageContext.request.contextPath }/poll/writeform" class="btn btn-primary" style="color: white; position: absolute; right: 18.5%;">설문조사 업로드</a>
</c:if>

<div class="container" style="margin-top: 50px; margin-bottom: 100px;">
 
  <table class="table table-hover" style="font-size: 15px;">
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
              <c:if test="${sessionScope.id != null && sessionScope.mem_code != '3'}">
              <a href="${pageContext.request.contextPath }/poll/view?pollnum=${a.poll_num}" style="color: black;" class="subject" id="${a.poll_num }">${a.poll_subject }</a>
               </c:if>
               <c:if test="${sessionScope.id == null || sessionScope.mem_code =='3'}">
               	${a.poll_subject }
               </c:if>
              </c:otherwise>
              </c:choose>
             
            </td>
         </tr>
       </c:forEach>
    </tbody>
  </table>
  


</div>
<div style="position:relative; left: 45%; bottom: 50px;">
        <ul class="pagination" >
   
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
         </div>
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