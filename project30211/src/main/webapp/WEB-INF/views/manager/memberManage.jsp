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
<script>

//체크박스관리
var check = false;
function CheckAll() {
   var chk = document.getElementsByName("check_member");
   if(check == false) {
      check = true;
      for(var i = 0; i < chk.length; i++) {
         chk[i].checked = true;   // 모두 체크
      }
   } else {
      check = false;
      for(var i = 0; i < chk.length; i++) {
         chk[i].checked = false;   // 모두 해제
      }
   }
}

</script>	
<meta charset="UTF-8">
</head>


<body class="default">
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- 본문 - 관리자페이지 -->
<form action="${pageContext.request.contextPath}/manager/memberDelete">
<div class="container">

  <h2>회원 관리</h2>      
    <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/manager">  >  관리 페이지</a>
  </div><br><br>   
  
  <table class="table table-hover">
    <thead>
      <tr>
        <th><input type="checkbox" id="checkall" name="checkall" onclick="javascript:CheckAll()"></th>
        <th>회원코드</th>
        <th>ID</th>
        <th>이름</th>
        <th>주소</th>
        <th>연락처</th>
        <th>아이 이름</th>
        <th>아이 반</th>
        <th>담당 반</th>
      </tr>
    </thead>
    <c:forEach var="m" items="${m}">
    <tbody>
      <tr>
        <td><input type="checkbox" name="check_member" value="${m.id }"></td>
        <td>${m.mem_code }</td>
        <td>${m.id }</td>
        <td>${m.name }</td>
        <td>${m.address }</td>
        <td>${m.phone }</td>
        <td>${m.stu_name }</td>
        <td>${m.stu_group }</td>
        <td>${m.mng_group }</td>
      </tr>
    </tbody>
    </c:forEach>
  </table>
  <input type="submit" value="삭제">
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

	
        <form action="${pageContext.request.contextPath }/manager/memberManage" method="post"  id="frmPaging">
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
