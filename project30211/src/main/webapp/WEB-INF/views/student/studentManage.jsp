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
	   $("#ebtn").click(function(){
	   var checked = $('input:checkbox[name="check_stu_id"]:checked').length;
	      if(checked!=1){
	         alert("한개만 선택하세요");
	      }
	      else{
	         $("#form").attr("action", "${pageContext.request.contextPath }/student/studentEditForm");
	         $("#form").submit();
	      }
	   })
	   $("#dbtn").click(function(){
  		 var checked = $('input:checkbox[name="check_stu_id"]:checked').length;
      if(checked==0){
         alert("선택을 해야합니다");
      }
      else{
    	 $("#form").attr("action", "${pageContext.request.contextPath }/student/studentDelete");
         $("#form").submit();
      }
   })
	})
</script>

	
<meta charset="UTF-8">
</head>


<body class="default">
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- 본문 - 관리자페이지 -->
<form  id="form">
<div class="container">

  <h3>원아 관리</h3>   
  <hr>   
    <div align="right">
      <a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/manager/manager">  >  관리자 페이지</a>
      <a style="font-size: 13px; color: gray; text-decoration:none" href="#">  >  원아 관리</a>
  </div><br><br>   
  
  <table class="table table-hover">
    <thead>
      <tr>
        <th><input type="checkbox" id="all" name="checkall"></th>
        <th>원아ID</th>
        <th>이름</th>
        <th>원아 반</th>
        <th>연락처</th>
        <th>주소</th>
        <th>학부모ID</th>
      </tr>
    </thead>
    <c:forEach var="s" items="${s}">
    <tbody>
      <tr>
        <td><input type="checkbox" name="check_stu_id" class="check"  value="${s.stu_id}"></td>       
        <td>${s.stu_id }</td>
        <td>${s.stu_name }</td>
        <td>${s.stu_group }</td>
        <td>${s.member_phone }</td>
        <td>${s.address}</td>
        <td>${s.member_id}</td>
      </tr>
    </tbody>
    </c:forEach>
  </table>
 
  <div align="right">
  <input class="btn btn-primary" type="button" value="삭제" id="dbtn" style="width: 70px;">
  <input class="btn btn-primary" type="button" value="상세보기/수정" id="ebtn" style="width: 140px;"> 
  </div>

 </div>       
</form>   

	<div align="center">
        <!-- 5. paging view -->    
        <ul class="pagination">
        
            <c:if test="${paging.pageStartNum ne 1}">
                <!--맨 첫페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>«</a></li>
              <!--이전 페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'>‹</a></li>
            </c:if>
            
            <!--페이지번호 -->
            <%-- <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1">  --%>
            <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1"> 
                <li class="page-item pageIndex${i}"><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
            </c:forEach>
            
            <c:if test="${paging.lastChk}">
                <li class="page-item"><a class="page-link" onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>›</a></li>
                <li class="page-item"><a class="page-link" onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>»</a></li>
            </c:if>
            
        </ul>

	
        <form action="${pageContext.request.contextPath }/student/studentManage" method="post"  id="frmPaging">
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