<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">   

<style type="text/css">
a:visited {color: black;}
a:link {color: black;}
a{text-decoration: none;}
table>tbody>tr>td:first-child{
	font-weight: bolder;
}
</style>
</head>

<body class="default">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 175px;">
   <jsp:include page="/WEB-INF/views/common/side_my.jsp"></jsp:include>
</div>

<div style="margin-top:50px; margin-left: 23%; margin-bottom: 90px; max-width: 500px">
<h3>${m.id}님의 마이페이지</h3>
<hr style="width: 800px">
<div style="position: absolute; left: 55%;">
	<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
</div><br><br>                                                    
<table class="table">
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
        <td>이름</td>
        <td>${m.name}</td>
      </tr>     
      <tr>
        <td>연락처</td>
        <td>${m.phone}</td>
      </tr>
      <tr>
        <td>주소</td>
        <td>${m.address}</td>
      </tr>
      <tr>
        <td>상세주소</td>
        <td>${m.detailAddress}</td>
      </tr>
      <tr>
        <td>참고주소</td>
        <td>${m.extraAddress}</td>
      </tr>
      <tr>
        <td>우편번호</td>
        <td>${m.postcode}</td>
      </tr>
       <c:if test="${m.mem_code eq 2}">	<!-- 학부모 -->
      <tr>
        <td>아이 이름</td>
        <td>${m.stu_name}</td>
      </tr>
      <tr>
        <td>반</td>
        <td>${m.stu_group}</td>
      </tr>
      </c:if>
       <c:if test="${m.mem_code eq 1}">	<!-- 선생님 -->
      <tr>
        <td>담당 반</td>
        <td>${m.mng_group}</td>
      </tr>
      </c:if>
   </tbody> 
  </table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>
         