<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
	<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
	$('#pbtn').click(function(){
		
	var poll_num = $('#pn').val();
	var poll_candidate_num =  $('input[name="radio"]:checked').val();
	var params="poll_num="+poll_num+"&poll_candidate_num="+poll_candidate_num;
	$.ajax ({
		type:"POST",
        url:"${pageContext.request.contextPath}/poll/update", //보낼곳
        data:params, //전송할 데이터
        success:function(data){ //응답제대로받았을때 호출되는 함수 (서버에서 처리된값을 가져오는 함수)
           var obj = eval('('+data+')'); //obj:멤버변수 flag //eval : json 표현을 바꿔주다
           if(obj.id == "no"){ //첫투표
        	   var str = "참여자 수 : ";
               str += obj.voter;
               $('#voter').html(str);
               var str2 = obj.cnt;
               $('#'+poll_candidate_num).html(str2);
               $('#myBar'+poll_candidate_num).css("width", str2+"%");        	   
    			$('#poll').css("display", "none");
    			$('#result').css("display", "");
           }
           else{//중복투표
        	   alert("이미 참여한 투표입니다");
           }
        }
	});
	
});
	});
	
</script>
<style type="text/css">
#wrapper{
margin-left: 20%;
height: 600px;
margin-top: 5%;
overflow: auto;
}
.btn1{
background-color: #00BCD4;
border-radius: 100px;
color: white;
margin-bottom: 25px;
margin-top: 25px;
}
.w3-container{
background-color: #03a9f4;
}
</style>
</head>
<body class="default">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<div id="wrapper">
<h3>${p.poll_subject }</h3>
<input type="hidden" value="${p.poll_num }" id="pn" name="poll_num">
<div id="poll">
<table>
<c:forEach var="pc" items="${pc }">
<tr>
<td style="width: 30px;">
<input type="radio" value="${pc.poll_candidate_num }" name="radio" class="radio" id="radio${pc.poll_candidate_num }">
</td>
<td>
<label for="radio${pc.poll_candidate_num }">${pc.poll_candidate }</label>
</td>
</tr>
<input type="hidden" value="${pc.vote_num }">
</c:forEach>
</table>
<ul>
<li>참여자 수 : ${p.voter }</li>
<li>시작일: ${p.start_date }</li>
<li>종료일: ${p.end_date }</li>
</ul>
<c:if test="${sessionScope.id != null }">
<button id="pbtn" class="btn1">투표하기</button></c:if>
<button id="btn2" class="btn1" onclick="location.href='${pageContext.request.contextPath}/poll/list'">목록으로</button>
<c:if test="${sessionScope.id eq 'manager'}">
<button class="btn1" onclick="location.href='${pageContext.request.contextPath }/poll/delete?poll_num=${p.poll_num }'">삭제</button>
</c:if>
</div>

<div id="result" style="display: none">
<b id="voter"></b><br><br>
<table border="1">
<c:forEach var="pc" items="${pc }">
<%-- <ul>
<li>${pc.poll_candidate }  : <br>
<div id="myBar${pc.poll_candidate_num }" class="w3-container w3-green" style="height:20px; width:${pc.vote_num}%; padding:0; float:left;">
</div>
<b id="${pc.poll_candidate_num}" style="margin-left: 10px;">${pc.vote_num }</b>
</li>
</ul> --%>
<div style="float: left; width: 5%;">${pc.poll_candidate }</div>
<div id="myBar${pc.poll_candidate_num }" class="w3-container" style="height:20px; width:${pc.vote_num}%; padding:0; float:left;">
</div>
<b id="${pc.poll_candidate_num}" style="margin-left: 10px;">${pc.vote_num }</b><br><br>

</c:forEach>
</table>
<button id="btn2" class="btn1" onclick="location.href='${pageContext.request.contextPath}/poll/list'">목록으로</button>
<c:if test="${sessionScope.id eq 'manager'}">
<button class="btn1" onclick="location.href='${pageContext.request.contextPath }/poll/delete?poll_num=${p.poll_num }'">삭제</button>
</c:if>
</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="../resources/js/index.js"></script>
</body>
</html>