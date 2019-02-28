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
<title>Aperitif - Custom Template</title>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">

<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://unpkg.com/jquery"></script>
<script src="https://surveyjs.azureedge.net/1.0.69/survey.jquery.js"></script>
<link href="https://surveyjs.azureedge.net/1.0.69/survey.css"
	type="text/css" rel="stylesheet" />
<!--         <link rel="stylesheet" href="./index.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
.rb {
	width: 50px;
}
</style>
</head>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aperitif - Custom Template</title>

<link rel="stylesheet" href="../resources/css/style.min.css">
<link rel="stylesheet" href="../resources/css/modules.css">

<!-- Canonical URL usage -->
<link rel="canonical" href="https://aperitif.io/">

<!-- Facebook Open Graph -->
<meta property="og:url" content="https://aperitif.io/" />
<meta property="og:title"
	content="Aperitif | The web template generator" />
<meta property="og:description"
	content="Aperitif is a rapid web template generation tool." />
<meta property="og:image"
	content="https://aperitif.io/img/aperitif-facebook.png" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />

<!-- Twitter Cards -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@Aperitif">
<meta name="twitter:creator" content="@Aperitif">
<meta name="twitter:title"
	content="Aperitif - The web template generator">
<meta name="twitter:description"
	content="Aperitif is a rapid web template generation tool.">
<meta name="twitter:image"
	content="https://aperitif.io/img/aperitif-card.png">

</head>

<!-- End Head -->

<body class="default">

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<script type="text/javascript"
		src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function() {
	
			//투표결과 ajax 띄우기
	/* 		 $('#resultJson').click(function(){//$('#check')아이디 / $('.check')클래스
				alert("학원가서 ajax만들것이다");
				var poll_num = $('#poll_num').val();
				var poll_candidate_num = $('#poll_candidate_num').val();
				alert(poll_num);

				var param = "poll_num=" + poll_num;
				alert(param);
				
				$.ajax({ //비동기적 요청보내다
					type : "POST",
					url : "${pageContext.request.contextPath}/poll/pollResult", //보낼곳
					data : param, //전송할 데이터
					success : function(data) { //응답제대로받았을때 호출되는 함수 (서버에서 처리된값을 가져오는 함수)
						var obj = eval('(' + data + ')'); //obj:멤버변수 flag //eval : json 표현을 바꿔주다
						var str = '';
						 var poll_num_json = obj.poll_num;
						var poll_candidate_json = obj.poll_candidate;
						var poll_candidate__json = obj.poll_candidate_num;
						var id_json = obj.id; 
						alert("ajax에서 if가기 직전");
			      
						str += "poll_num: " + obj.poll_num;
 				        str += "<br/>poll_candidate: " + obj.poll_candidate;
				        str += "<br/>poll_candidate_num: " + poll_candidate_num;
				        str += "<br/>id: " + obj.id; */

				        $('#pollResultSpan').html(str);
				        $('#pollResultSpan').css("display", "block");	
					}
				});
			});  */
			
		});
		
		function imgBtnOn() {
			$('#editImgBtn').show();
			$('#edit1').hide()//기존투표수정 버튼 hide
			$('#edit2').show()//기존투표에서 새로운 이미지로 버튼한 후 투표 수정 버튼 show
		}

		function deletepoll() {
			alert("해당 투표를 삭제합니다");
		}

		function goPoll() {
			alert("선택하신 항목으로 투표합니다");
			$('#pResult').submit();
		}
		function pollResult() {
			alert("투표 결과를 봅니다");
		}

		
	</script>
</head>

<body class="default">

	<!-- 본문-->
	투표 페이지
	<h3>투표 상세 페이지</h3>
	<form action="${pageContext.request.contextPath}/poll/pollUpdate"
		method="post" id="pResult">

		<td>투표 번호 ${p.poll_num}<br></td> <br>
		<td>주제<br></td> <br>
		<td>날짜 ${p.time}<br></td> <br> 투표 후보 리스트123

		<%-- <table border="1px">
		<c:forEach var="pc" items="${pc}">
			<tr>
				<td><input type="radio" name="poll_candidate_num" value="${pc.poll_candidate_num}" class="rb"><b>${pc.poll_candidate}</b><td>
			</tr>	
		</c:forEach>
		</table>  --%>

		<!--  투표 목록 페이지 -->
		<div class="w3-content w3-margin-top" style="max-width: 3000px;">
			<div class="w3-row-padding">
				<div class="w3-third">

					<div class="w3-white w3-text-grey w3-card-4" position="static">

						<div class="w3-display-container">
							<p align="right" style="height: 25px; background-color: #F6F6F6;">답변공개형</p>
							<p>투표 주제 : 월례 회의 장소</p>
							<hr>
							<div class="w3-display-bottomleft w3-container w3-text-black">
							</div>
						</div>

						<div class="w3-container">
							<c:forEach var="pc" items="${pc}">
								<input type="radio" name="pc.poll_candidate_num"
									value="${pc.poll_candidate_num}">
								<b> ${pc.poll_candidate}</b>
								<br>
							</c:forEach>

							<hr>
							<input type="button" class="btn btn-info" value="투표 하기"
								onclick="goPoll()">
							<!-- 
								<a href="pollResult.jsp">
								투표결과</a>
							<a href="pollResult2.jsp?">투표결과2</a> <br> -->
						</div>
						<!-- / 투표 목록 페이지 -->
						<%-- 	<input type="hidden" name="id" value="${sessionScope.id}"> --%>
						<input type="button" value="투표 하기" onclick="goPoll()">
						<!-- <input type="button" value="투표 하기" onclick="location.href='pollResult'">  -->
						<input type="button" value="투표 결과보기" onclick="pollResult()">
	</form>
	
	<form action="${pageContext.request.contextPath}/poll/pollResult">
	<input type="submit" class="btn btn-primary"
		value="투표 결과보기(pollResultjsp로 연결)">
	<input type="hidden" value="${p.poll_num}" name="poll_num" id="poll_num">
	<input type="hidden" value="${p.poll_num}" name="poll_num" id="poll_num">
	
	<%-- <input type="hidden" value="${p.poll_candidate_num}" name="poll_candidate_num" id="poll_candidate_num"> --%>
	</form>	
	
	
	<input type="button" class="btn btn-primary" value="투표 결과ajax보기"
		id="resultJson">
	<span id="pollResultSpan"></span>
	<br> span놓을 자리



	<script src="../resources/js/index.js"></script>
</body>

</html>
