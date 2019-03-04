<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
<script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
<style type="text/css">
.rb {
	width: 50px;
}
</style>
<!-- End Head -->

<body class="default">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>



<!-- 측면 메뉴바 -->
<section>
  <div data-layout="_r">
  <div style="margin-left: 400px;">
  
<section class="MOD_FEATURE">

<h3 align="center">식단표 페이지</h3>

 <c:if test="${sessionScope.id =='manager'}">
	<p></p>
	<div>	
	<p align="right"><input type="button" value="식단표 업로드" onclick="location.href='./uploadDietForm'">	</p>
	</div>
</c:if> 
<p></p>

 <div data-layout="_r" border="1px"><p></p>
	<p></p>
<c:forEach var="db" items="${db}">
 	
  
    <div data-layout="ch8 ec4">
      <a href="#" class="MOD_FEATURE_Container">
                  <img src="../resources/img/${db.files}" width="150" height="150" alt="식단표 업로드 불가">
        <div class="MOD_FEATURE_TextContainer">
          <p class="MOD_FEATURE_Title" data-theme="_ts2">			 

			<a href="${pageContext.request.contextPath}/boardDiet/dietNumForm?diet_num=${db.diet_num}">${db.title}</a></p>
          <!-- <p class="MOD_FEATURE_Description">fdgdg</p> -->
        </div>
      </a>
   
    </div>
 </c:forEach>   
</div>

    <!-- 5. paging view -->    
        <ul class="pagination">
        
            <c:if test="${paging.pageStartNum ne 1}">
                <!--맨 첫페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>이전</a></li>
              <!--이전 페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'>처음</a></li>
            </c:if>
            
            <!--페이지번호 -->
            <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1"> 
                <li class="page-item pageIndex${i}"><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
            </c:forEach>
            
            <c:if test="${paging.lastChk}">
                <!--다음 페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>다음</a></li>
                <!--마지막 페이지 이동 -->
                <li class="page-item"><a class="page-link" onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>끝</a></li>
            </c:if>
            
        </ul>
        
      <form action="${pageContext.request.contextPath}/boardDiet/dietListForm" method="post" id="frmPaging">
            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
            <input type="hidden" name='index' id='index' value='${paging.index}'>
            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
        </form>

    </div>
    
</section>
  
   </div>
    
    <div data-layout="al16 al-o2 de-o1 de6 ec4" style="position: absolute;">
      <div data-layout="ch-half">
      <nav class="MOD_SUBNAVIGATION1_Menu" data-theme="_bo2">
        <p class="MOD_SUBNAVIGATION1_Menutitle" data-theme="_bgs">유치원소개</p>
        <ul>
          <li><a href="">유치원 소개</a></li>
          <li><a href="#">오시는길</a></li>
          <li><a href="#">모집요강</a></li>
        </ul>
      </nav>
    </div>
  </div>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>

</html>
