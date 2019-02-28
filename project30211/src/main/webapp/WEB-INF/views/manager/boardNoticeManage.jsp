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
<script type="text/javascript">
function CheckAll() {
   var chk = document.getElementsByName("check_notice_num");
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
<title>Insert title here</title>
</head>


<body class="default">
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <form action="${pageContext.request.contextPath}/manager/boardDelete3">
		<hr>
		<div class="container">
	<h2>공지사항 관리</h2>
 <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/manager">  >  관리 페이지</a>
  </div><br><br>   

			<table class="table table-hover">
				<thead>
					<tr>
						<th><input type="checkbox" id="checkall" name="checkall"
							onclick="javascript:CheckAll()"></th>
						<th>게시판분류</th>
						<th>공지사항num</th>
						<th>ID</th>
						<th>title</th>
						<th>작성시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n_list" items="${n_list}">
						<tr>
							<td><input type="checkbox" name="check_notice_num" value="${n_list.notice_num }"></td>
							<td>n_list</td>
							<td>${n_list.notice_num}</td>
							<td>${n_list.id }</td>
							<td><a href="${pageContext.request.contextPath}/boardNotice/noticeView?notice_num=${n_list.notice_num}&sort=1">${n_list.title}</a></td>
							<td>${n_list.time }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="right">
			<input class="btn btn-primary" type="submit" value="삭제">
			<input class="btn btn-primary" type="button" value="업로드" onclick="location.href='${pageContext.request.contextPath}/boardNotice/noticeWriteForm?sort=1'">
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
                <li class="page-item"><a class="page-link" onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>이전</a></li>
                <li class="page-item"><a class="page-link" onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>다음</a></li>
            </c:if>
            
        </ul>

	
        <form action="${pageContext.request.contextPath }/manager/boardNoticeManage" method="post"  id="frmPaging">
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
