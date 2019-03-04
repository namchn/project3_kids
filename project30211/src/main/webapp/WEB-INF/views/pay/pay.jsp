<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html/loos.dtd">
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
.table{
	width: 60%;
}
</style>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body class="default">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div style="margin-top: 40px; margin-left: 175px;">
	<jsp:include page="/WEB-INF/views/common/side_my.jsp"/>
</div>

<form id="okForm" action="${pageContext.request.contextPath}/pay/okdk" method="post">
	<input type="hidden" id="id1" name="id" value="${m.id}">
	<input type="hidden" id="name" name="name" value="${m.name}">
	<input type="hidden" id="stu_name" name="stu_name" value="${m.stu_name}">
	<input type="hidden" id="phone" name="phone" value="${m.phone}">
</form>

<div class="container" style="margin-left: 23%; margin-bottom: 120px;"> 
<h3>원비 결제</h3>
<hr>
<div align="right"style="margin-bottom: 50px; margin-right: 20%;">
	<a class="glyphicon glyphicon-home" style="font-size: 12px; color: darkred; text-decoration:none" href="${pageContext.request.contextPath }"></a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfo">  >  마이페이지</a>
	<a style="font-size: 13px; color: gray; text-decoration:none" href="${pageContext.request.contextPath }/member/myInfoPay">  >  원비 결제</a>
</div>                                                        
  <table class="table" style="width: 50%;">
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
        <td>학부모 이름</td>
        <td>${m.name}</td>
      </tr>
      <tr>
        <td>아이 이름</td>
        <td>${m.stu_name}</td>
      </tr>
      <tr>
        <td>연락처</td>
        <td>${m.phone}</td>
      </tr>
      <c:choose>
   <c:when test="${p.id eq null}">
   	<tr class="warning">
        <td>이번 달&nbsp;&nbsp;결제금액</td>
        <td>30만원</td>
    </tr>
   </c:when>
   <c:otherwise>
    <tr class="warning">
        <td>결제금액</td>
        <td>0</td>
    </tr>
   </c:otherwise>
  </c:choose>
    </tbody>
  </table>
  <div style="margin-left: 40%;">
  <c:choose>
   <c:when test="${p.id eq null}">
   	<button class="btn btn-primary" id="check_module" type="button" name="aaaa">결제하기</button>
   </c:when>
   <c:otherwise>
  	 <b>이미 결제하셨습니다.</b>
   </c:otherwise>
  </c:choose>
  </div>
</div>
    
    <script>
$('#check_module').click(function() {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp30960322');  // 가맹점 식별 코드
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'KITRI 유치원',
	    amount : 300,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '홍길동',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456' 
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    			var msg = '결제가 완료되었습니다.';
	    			/* msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num; */
	    			//$("#Result").html("결제완료 되었습니다.");
	    			$("#okForm").submit();
	    			
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	        alert(msg);
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>
			