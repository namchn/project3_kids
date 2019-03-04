<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
   var pvoter = $('#pvoter').val();//총참여자
   var poll_candidate_num =  $('input[name="radio"]:checked').val();
   var votenum = $('#votenum'+poll_candidate_num).val();
   var params="poll_num="+poll_num+"&poll_candidate_num="+poll_candidate_num;
      
   $.ajax ({
      type:"POST",
        url:"${pageContext.request.contextPath}/poll/update", //보낼곳
        data:params, //전송할 데이터
        success:function(data){ //응답제대로받았을때 호출되는 함수 (서버에서 처리된값을 가져오는 함수)
           var obj = eval('('+data+')'); //obj:멤버변수 flag //eval : json 표현을 바꿔주다
           if(obj.id == "no"){ //첫투표
              var str = "";
              
                var eachPortion = "참여자대비선택된값";
               str += obj.voter; //전체 투표 인원
               $('#voter').html(str);
               var str2 = obj.cnt; //득표 수
               var str3 = ((obj.cnt/obj.voter)*100);//득표율
               $('#'+poll_candidate_num).html(str2);
               $('#myBar'+poll_candidate_num).css("width", str2+"%");    
               //$('#myBar2'+poll_candidate_num).css("width", str3+"%"); 
               $('#myBar3'+poll_candidate_num).css("width", str3+"%"); 
               $('#myBar2'+poll_candidate_num).html(obj.cnt+"명");
             $('#poll').css("display", "none");
             //$('#result').css("display", "");
             $('#result2').css("display", "");
           }
           else{//중복투표
              alert("이미 참여한 투표입니다");
           }
        }
   });
   
});
   $('#pbtn2').click(function(){
      $('#poll').css("display", "none");
      //$('#result').css("display", "");
      $('#result2').css("display", "");
   })
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
<div style="margin-top: 40px; margin-left: 175px;">
    <jsp:include page="/WEB-INF/views/common/side_com.jsp"/>
    </div>

<div id="wrapper">
<h3 style="margin-left: 14%;">투표하기</h3>
<hr>
<input type="hidden" value="${p.poll_num }" id="pn" name="poll_num">
<div class="container" id="poll">
	<div class="card shadow mb-4" style="width: 70%;">
	<div class="card-header py-3" style="margin-bottom: 20px;">
		<h4 class="m-0 font-weight-bold text-primary">${p.poll_subject }</h4>
	</div>
	<ul style="margin-top: 20px;">
		<li>참여자 수 : ${p.voter }</li>
		<li>시작일: ${p.start_date }</li>
		<li>종료일: ${p.end_date }</li>
	</ul>
<table style="margin-bottom: 30px; margin-left: 5%; margin-top: 20px;">
<c:forEach var="pc" items="${pc }">
<tr>
<td style="width: 30px;">
<input type="radio" value="${pc.poll_candidate_num }" name="radio" class="radio" id="radio${pc.poll_candidate_num }">
</td>
<td>
<label for="radio${pc.poll_candidate_num }">${pc.poll_candidate }</label>
</td>
</tr>
<input type="hidden" id="votenum${pc.poll_candidate_num }" value="${pc.vote_num }">
</c:forEach>
</table>
	</div>
<input type="hidden" id="pvoter" value="${p.voter }">
<div style="position: relative; left: 43%;">
	<c:if test="${sessionScope.id != null }">
	<button id="pbtn" class="btn btn-primary">투표하기</button></c:if>
	<c:if test="${sessionScope.id == pch.id }">
	<button id="pbtn2" class="btn btn-primary">결과보기</button></c:if>
	<button id="btn2" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/poll/list'">목록으로</button>
	<c:if test="${sessionScope.id eq 'manager'}">
	<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/poll/delete?poll_num=${p.poll_num }'">삭제</button>
	</c:if>
</div>
</div>

<!-- Project Card Example -->
<div class="container" id="result2" style="display: none;">
<form style="height:550px; display: inline;">

              <div class="card shadow mb-4" style="width: 70%;">
                <div class="card-header py-3" style="margin-bottom: 20px;">
                  <h4 class="m-0 font-weight-bold text-primary">${p.poll_subject }</h4>
                </div>
                
                <div class="card-body">
                <ul style="margin-bottom: 20px;">
               <li>참여자 수 : <b id="voter">${p.voter }</b></li>
               <li>시작일: ${p.start_date }</li>
               <li>종료일: ${p.end_date }</li>
            </ul>
                   
                  <c:forEach var="pc" items="${pc }">
                  <%-- <div id="myBar${pc.poll_candidate_num }" class="w3-container" style="height:20px; width:${pc.vote_num}%; padding:0; float:left;"></div> --%>
                   <%-- <b id="${pc.poll_candidate_num}" style="margin-left: 10px;">후보 : ${pc.vote_num }</b><br><br> --%>
                  
                  <div style="margin-right: 15px;">
                  <ul>
                  <li><b>${pc.poll_candidate }</b></li>
                  </ul>
                  </div>
                   <div style="display: flex;">
                  <div class="progress mb-4" style="width: 40%; margin-left: 20px;" >
                    <div class="progress-bar" id="myBar3${pc.poll_candidate_num }" style="width: ${pc.vote_num/p.voter*100}%;" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <div style="margin-left: 15px;">
                  <span class="float-right" id="myBar2${pc.poll_candidate_num }">${pc.vote_num}명</span>
                  </div>
                  </div>
                  </c:forEach>


                 </div>

         </div>
         </form>
                       <div style="position: relative; left: 53%;">
                <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/poll/list'" style="width: 80px; margin-right: 5px;">목록으로</button>
				<c:if test="${sessionScope.id eq 'manager'}">
				<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/poll/delete?poll_num=${p.poll_num }'" style="width: 80px;">삭제</button>
				</c:if>
			  </div>
</div>


</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

   <script src="../resources/js/index.js"></script>
</body>
</html>