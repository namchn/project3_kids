<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<meta charset="UTF-8">
<script>
function deleteCal(){;

  document.getElementById("calForm").action = "${pageContext.request.contextPath}/manager/calendarDelete";
 $('#calForm').action = "${pageContext.request.contextPath}/manager/calendarDelete";
  //document.getElementsById("calForm")[0].submit();
  // $('#calForm').submit()
  
}

function editCal(){
	 alert("edit");

      document.getElementById("calForm").action = "${pageContext.request.contextPath}/manager/calendarEditForm";
      document.getElementById("calForm").submit();
      //$('#calForm').action = "${pageContext.request.contextPath}/manager/calendarEdit";
      //$('#calForm').submit()
}
function uploadCal(){
	alert("upload");
	  $('#calForm').submit();
}
</script>
</head>


<body class="default">

 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- 본문 - 관리자페이지 -->
<form style="height:700px;">
<div class="container">

  <h3>일정 관리</h3>  
  <hr>
      <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/manager">  >  관리 페이지</a>
  </div><br><br>          
  <table class="table table-hover">
    <thead>
      <tr> 
      	<th>선택</th>
        <th>번호</th>
        <th>시작일</th>
        <th>종료일</th>
        <th>이벤트</th>
      </tr>
    </thead>
    <c:forEach var="allc" items="${allc}">
    <tbody>
      <tr>
        <td><input type="checkbox" name="check_num" value="${allc.num }"></td>
        <td>${allc.num }</td>
        <td>${allc.start_date }</td>
        <td>${allc.end_date }</td>
        <td>${allc.event }</td>
      </tr>
    </tbody>
    </c:forEach>
  </table>
  
  <div align="right">
  <input class="btn btn-primary" type="submit" value="삭제" onclick="deleteCal()">
  <%-- <input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/manager/calendarEditForm?num=${allc.num }'">  --%>
  <input class="btn btn-primary" type="submit" value="수정" onclick="editCal()"> 
  <input class="btn btn-primary" type="button" value="업로드" onclick="location.href='${pageContext.request.contextPath}/manager/calendarUploadForm'">
  </div>
</div>
</form>

	<div align="center">
        <!-- 5. paging view -->    
        <ul class="pagination">
        
            <c:if test="${paging.pageStartNum ne 1}">
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>이전</a></li>
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'>다음</a></li>
            </c:if>
            
            <!--페이지번호 -->
            <%-- <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1">  --%>
            <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1"> 
                <li class="page-item pageIndex${i}"><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
            </c:forEach>
            
            <c:if test="${paging.lastChk}">
                <li class="page-item"><a class="page-link" onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging1.pageCnt});'>›</a></li>
                <li class="page-item"><a class="page-link" onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging1.pageCnt});'>»</a></li>
            </c:if>
            
        </ul>

	
        <form action="${pageContext.request.contextPath }/manager/calendarManage" method="post"  id="frmPaging">
            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
            <input type="hidden" name='index' id='index' value='${paging.index}'>
            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
        </form>
     </div>
<script src="../resources/js/paging.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>

</html>
