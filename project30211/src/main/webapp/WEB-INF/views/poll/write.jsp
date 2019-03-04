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
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#btn1').click(function(){
		var html='<div><input type="text" name="poll_candidate" style="max-width: 50%"><input type="button" class="remove btn btn-primary" style="width: 70px; vertical-align: unset;" value="삭제" ></div>';
		$('#div2').append(html);
	});
	$('#sbtn').click(function(){
		var d = $('#day').val();
		var s = $('#s').val();
		var e = $('#e').val();
		if(s > e || s<d){
			alert("시작일을 다시 선택하십시오");
		}
		else{
			$('#f').submit();
		}
		
	})
});
$(document).on("click", ".remove", function() {
    $(this).parent().remove(); 
});
</script>
<style type="text/css">
#wrapper{
height: 600px;
 overflow: auto;
}
#d1{
margin-left: 20%;
margin-top: 30px;
}
.btn1{
background-color: #00BCD4;
border-radius: 100px;
color: white;
margin-bottom: 25px;
margin-top: 25px;
border: 0;
margin-left: 15px;
padding: 7px;
width: 100px;
}
.remove{
background-color: #00BCD4;
border-radius: 100px;
color: white;
margin-bottom: 25px;
margin-top: 25px;
border: 0;
margin-left: 15px;
padding: 7px;
width: 100px;
}
#div1{
height: 50px;
}
#div2{
margin-left: 57.5px;
}
#div2>div{
height: 50px;
}
</style>
</head>
<body class="default">
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
<input type="hidden" id="day" value="<%=strDate %>"/>
<div id="wrapper" style="margin-left: 20%;">
<div id="d1">
<form action="${pageContext.request.contextPath }/poll/write" id="f">
<div style="margin-bottom: 20px;"><b style="margin-right: 30px;">주제</b><input type="text" required="required" name="poll_subject" style="max-width: 50%" maxlength="25"></div>

<div id="div1">
<b style="margin-right: 16px;">선택지</b><input type="text" required="required" name="poll_candidate" id="in1" style="max-width: 50%" maxlength="13"><input type="button" id="btn1" class="btn btn-primary" style="width: 70px; margin-left: 20px;" value="추가">
</div>
<div id="div2"></div>
<br>
<b>시작일</b><input type="date" required="required" name="start_date" id="s" style="margin-left: 20px;"required="required">
<b>종료일</b><input type="date" required="required" name="end_date" id="e" style="margin-left: 20px;" required="required"><br>
<div style="margin-top: 30px;">
<input type="button" id="sbtn" class="btn btn-primary" style="width: 70px;" value="완료">
<input type="button" class="btn btn-primary" style="width: 70px;" value="목록" onclick="location.href='${pageContext.request.contextPath }/poll/list'">
</div>
</form>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="../resources/js/index.js"></script>
</body>
</html>