<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
	rel="stylesheet">
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<meta charset="UTF-8">

<script type="text/javascript">
$(document).ready(function(){
	var year = $('#year').val();
	var month = $('#month').val();
	var day = $('#day').val();
		
	$('#selectYearBox').val(year).prop('selected', true);
    $('#selectMonthBox').val(month).prop('selected', true);
    $('#selectDayBox').val(day).prop('selected', true);
    
    
})

	//회원가입 조건

	function stueditBtn() {
		
		var phone = $('#stueditPhone').val();
		var phoneLength = phone.length;
		
		if (phoneLength<10||phoneLength>11) {
			alert('연락처는 10자리 혹은 11자리이어야 합니다');
		} else {
			$('#stueditForm').submit();
		}

	}

	function stueditPhoneBtn() {

		var phone = $('#stueditPhone').val();
		var phoneLength = phone.length;
		var param = "phone=" + phone;

		$.ajax({ //비동기적 요청보내다
			type : "POST",
			url : "${pageContext.request.contextPath}/member/checkPhone", //보낼곳
			data : param, //전송할 데이터
			success : function(data) { //응답제대로받았을때 호출되는 함수 (서버에서 처리된값을 가져오는 함수)
				var obj = eval('(' + data + ')'); //obj:멤버변수 flag //eval : json 표현을 바꿔주다
				var str = '';
				if (obj.flag) {
					str = '사용가능한 연락처';
				} else {
					str = '중복된 연락처';
					$('#stueditPhone').val('');
				}
				$('#phonestueditResult').html(str);
			}
		});

	}

	function execDaumPostcode1() {

		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;

						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;

							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("stueditExtraAddress").value = extraAddr;

						} else {
							document.getElementById("stueditExtraAddress").value = '';
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("stueditPostcode").value = data.zonecode;
						document.getElementById("stueditAddress").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("stueditDetailAddress").focus();
						document.getElementById("stueditDetailAddress").value = '';
					}
				}).open();
	}
</script>
</head>

<body class="default">
	<!-- 상단바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container" style="width: 1000px; margin-bottom: 100px;">
		<h3>원생 수정</h3>
		<hr>
		<div align="right">
			<a class="glyphicon glyphicon-home"
				style="font-size: 12px; color: darkred; text-decoration: none"
				href="${pageContext.request.contextPath }"></a> <a
				style="font-size: 13px; color: gray; text-decoration: none"
				href="${pageContext.request.contextPath }/manager/manager"> >
				관리자페이지</a>
		</div>
		<br> <br>

		<form action="${pageContext.request.contextPath}/student/studentEdit"
			method="post" id="stueditForm">

			<div class="form-group" style="margin-left: 25%;">

				<p>*표시는 필수입력사항입니다.</p>
				
				<label for="stu_id">원생 ID</label> <input type="text"
					class="form-control" name="stu_id" id="stueditId"
					value="${s.stu_id}" required="required"><br>
				
				<label for="stu_name">원생 이름</label> <input type="text"
					class="form-control" name="stu_name" id="stueditName"
					required="required" value="${s.stu_name}" ><br>
				
				<label for="stu_group" style="width: max-content;">원아반&nbsp;&nbsp;</label>
				<select id="selectBox" name="stu_group"
					style="display: block; margin-bottom: 20px;">
				<c:choose>
                        <c:when test="${s.stu_group eq 1}">
                           <option value="1" selected>장미반</option>
                           <option value="2">해바라기반</option>
                           <option value="3">민들레반</option>
                           <option value="4">벚꽃반</option>
                        </c:when>
                        <c:when test="${s.stu_group eq 2}">
                           <option value="1">장미반</option>
                           <option value="2" selected>해바라기반</option>
                           <option value="3">민들레반</option>
                           <option value="4">벚꽃반</option>
                        </c:when>
                        <c:when test="${s.stu_group eq 3}">
                           <option value="1">장미반</option>
                           <option value="2">해바라기반</option>
                           <option value="3" selected>민들레반</option>
                           <option value="4">벚꽃반</option>
                        </c:when>
                        <c:otherwise>
                           <option value="1">장미반</option>
                           <option value="2">해바라기반</option>
                           <option value="3">민들레반</option>
                           <option value="4" selected>벚꽃반</option>
                        </c:otherwise>
                     </c:choose>
				</select> 
				
				<label for="stu_birthday" style="display: block;">생년월일</label> 
				<input type="hidden" id="year" name="year" value="${year }">
				<input type="hidden" id="month" name="month" value="${month }">
				<input type="hidden" id="day" name="day" value="${day }">
				<select
					id="selectYearBox" name="selectYearBox"
					style="margin-bottom: 20px;">
					<c:forEach var="i" begin="2010" end="2019" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select> 년 <select id="selectMonthBox" name="selectMonthBox"
					style="margin-bottom: 20px;">
					<c:forEach var="i" begin="1" end="12" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select> 월 <select id="selectDayBox" name="selectDayBox"
					style="margin-bottom: 20px;">
					<c:forEach var="i" begin="1" end="31" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select> 일<br> 
				<label for="stu_gender">성별</label><br>
				<div style="margin-left: -3%;">
				<c:choose>
                    <c:when test="${s.stu_gender eq '남'}">
					<input type="radio" name="stu_gender" value="남" class="rb" checked>남
					<input type="radio" name="stu_gender" value="여" class="rb" >여<br>
					</c:when>
					<c:when test="${s.stu_gender eq '여'}">
					<input type="radio" name="stu_gender" value="남" class="rb">남
					<input type="radio" name="stu_gender" value="여" class="rb" checked>여<br>
					</c:when>
				</c:choose>	
				</div><br>
				
				<label for="member_id">학부모ID</label> <input type="text"
					class="form-control" name="member_id" id="stueditmember_id"
					
					placeholder="학부모 ID" value="${s.member_id}"><br>

				<label for="phone">연락처</label> <input type="text"
					class="form-control" name="member_phone" id="stueditPhone"
					required="required" onkeyup="stueditPhoneBtn()"
					placeholder="Enter phone" value="${s.member_phone}"> <span
					id="phonestueditResult"></span><br> 
				<label
					for="stueditPostcode" style="display:block;">우편번호</label> 
					<input type="text"
					class="form-control" name="postcode" id="stueditPostcode" style="width: 140px;float:left;margin-right:10px;"
					placeholder="우편번호" value="${s.postcode}"> <input type="button" class="btn btn-primary" style="width: 140px;"
					onclick="execDaumPostcode1()" value="우편번호 찾기"><br> 
				
				<label
					for="stueditAddress" style="display:block;">주소</label> 
					 <input type="text" class="form-control" name="address" id="editAddress" placeholder="주소" value="${s.address}"> 
                  <input type="text" class="form-control" name="detailAddress" id="editDetailAddress" placeholder="상세주소" value="${s.detailAddress}"> 
                  <input type="text" class="form-control" name="extraAddress" id="editExtraAddress" placeholder="참고항목" value="${s.extraAddress}">
               </div>
              



			<!-- <input class="btn btn-primary" type="button" value="수정2" onclick="stueditBtn2()" style="width: 70px;">  -->
			<div style="position: relative; left: 45%;">
				<input class="btn btn-primary" type="button" value="수정"
					onclick="stueditBtn()" style="width: 70px;"> <input
					class="btn btn-primary" type="reset" value="리셋"
					style="width: 70px;"><br>
			</div>
			 </form>
		</div>


		
	
	<div style="position: absolute; width: 100%; left: 0%;">

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>


	<script src="../resources/js/index.js"></script>
</body>
</html>