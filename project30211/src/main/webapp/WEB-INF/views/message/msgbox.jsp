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
<title>Aperitif - Custom Template</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link href="<c:url value="../resources/css/style.min.css" />"
   rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
   rel="stylesheet">
   <script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/paging.js"></script>
<script type="text/javascript">
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
    })
})
</script>
<style type="text/css">

table{margin: 0 0 40px 0;
  width: 100%;
  /* box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2); */
  }
 .wrapper {
  margin: 0 auto;
  padding: 40px;
  max-width: 1000px;
}
.row {
  display: table-row;
  background: #f6f6f6;
}
.row:nth-of-type(odd) {
  background: #e9e9e9;
}
.row.header {
  font-weight: 900;
  color: #ffffff;
  background: #ea6153;
  text-align: center;
}
.row.green {
  background: #27ae60;
}
.row.blue {
  background: #2980b9;
}
.cell {
  padding: 6px 12px;
}
#delbtn{
font-size: 16px; float: right; width: 100px; color: #a51c1c;
margin-bottom: 5px; border: solid 1px #c1889c; border-radius: 10px; background-color: #ffc0c0;
}
</style>

</head>
<!-- End Head -->

<body class="default">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<div class="wrapper" style="overflow: hidden;">
<h3>${sessionScope.id }님의 쪽지함</h3>

<form action="${pageContext.request.contextPath}/msg/delete">
<a href="${pageContext.request.contextPath}/#"
                        style="font-size: 20px;">홈으로 돌아가기<span class="glyphicon glyphicon-log-out"></span></a>   
<a href="#sendmsg" data-toggle="modal" data-target="#sendmsg"
                        style="font-size: 20px;">쪽지 쓰기<span class="glyphicon glyphicon-log-out"></span></a>
<input class="btn btn-primary" type="submit" id="delbtn" value="선택 삭제" >   
        

<div class="container">     
  <table class="table table-hover">
    <thead>
      <tr>
          <th class="cell" style="width: 5%"><input type="checkbox" id="all"></th>
          <th class="cell" style="display: none">쪽지번호</th>
          <th class="cell" style="width: 10%; ">보낸 날짜</th>
          <th class="cell" style="width: 25%">내용</th>
          <th class="cell" style="width: 160px;" name="sender">보낸 사람</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach var="a" items="${list }">
      <tr >
      <td class="cell" style="width: 5% "><input type="checkbox" value="${a.message_num }" class="check" name="check"></td>
      <td class="cell" style="display: none">${a.message_num }</td>  
        
        <td class="cell" style="width: 20% ; font-size:0.9em" class="time">${a.time }</td>
        
        <td class="cell"  style="width: 25% ; font-size:1em; overflow: hidden;">
           <c:choose>
           <c:when test="${a.read eq 0 }">
           <a href="#msgViewModal" data-toggle="modal" data-target="#msgViewModal" style="color: black;  font-size:1em" class="content" value="${a.message_num }" id="${a.message_num }">${a.content }</a></c:when>
           <c:otherwise>
              <a href="#msgViewModal" data-toggle="modal" data-target="#msgViewModal" style="color: gray;  font-size:1em" class="content">${a.content }</a>
           </c:otherwise>
           </c:choose>
        </td>
        <td class="cell" style="width: 160px; font-size:1em" name="sender">${a.sender }</td>
      </tr>
    </c:forEach>
      
    </tbody>
  </table>
</div>
        
        
       
   <%--   <table style="font-size: 13px;">
        <tr class="row header">
           <th class="cell" style="width: 5%"><input type="checkbox" id="all"></th><th class="cell" style="display: none">쪽지번호</th><th class="cell" style="width: 10%">보낸 날짜</th><th class="cell" style="width: 25%">내용</th><th class="cell" style="width: 160px;" name="sender">보낸 사람</th>
        </tr>
        <c:forEach var="a" items="${list }">
        <tr class="row" id="tr${a.message_num }" name="row">
        <td class="cell" style="width: 5%"><input type="checkbox" value="${a.message_num }" class="check" name="check"></td>
        <td class="cell" style="display: none">${a.message_num }</td>
           <td class="cell" style="width: 10%" class="time">${a.time }</td>
           <td class="cell"  style="width: 25%; overflow: hidden;">
           <c:choose>
           <c:when test="${a.read eq 0 }">
           <a href="#msgViewModal" data-toggle="modal" data-target="#msgViewModal" style="color: black;" class="content" value="${a.message_num }" id="${a.message_num }">${a.content }</a></c:when>
           <c:otherwise>
              <a href="#msgViewModal" data-toggle="modal" data-target="#msgViewModal" style="color: gray;" class="content">${a.content }</a>
           </c:otherwise>
           </c:choose>
           </td>
           <td class="cell" style="width: 160px;" name="sender">${a.sender }</td>
        </tr>
        </c:forEach>
      </table> --%>
        
     
</form>
    
<ul class="pagination">
   
       <c:if test="${paging.pageStartNum ne 1}">
           <!--맨 첫페이지 이동 -->
           <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageCnt+1},${paging.pageCnt});'>«</a></li>
     <!--이전 페이지 이동 -->
           <li class="page-item"><a class="page-link" onclick='pagePre(${paging.pageStartNum},${paging.pageCnt});'>‹</a></li>
       </c:if>
       
       <!--페이지번호 -->
       <c:forEach var='i' begin="${paging.pageStartNum}" end="${paging.pageLastNum}" step="1"> 
           <li class="page-item pageIndex${i}"><a class="page-link" onclick='pageIndex(${i});'>${i}</a></li>
       </c:forEach>
       
       <c:if test="${paging.lastChk}">
           <!--다음 페이지 이동 -->
           <li class="page-item"><a class="page-link" onclick='pageNext(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>›</a></li>
           <!--마지막 페이지 이동 -->
           <li class="page-item"><a class="page-link" onclick='pageLast(${paging.pageStartNum},${paging.total},${paging.listCnt},${paging.pageCnt});'>»</a></li>
       </c:if>
             
         </ul>
        </div>
<form action="${pageContext.request.contextPath }/msg/msg" method="post" id="frmPaging">
            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 개수 -->
            <input type="hidden" name='index' id='index' value='${paging.index}'>
            <input type="hidden" name='pageStartNum' id='pageStartNum' value='${paging.pageStartNum}'>
            <input type="hidden" name='listCnt' id='listCnt' value='${paging.listCnt}'>
      </form>
  <script type="text/javascript">
     $(".content").click(function(){
        var row = $(this).parent().parent();
        var tr = row.children();
        var num = tr.eq(1).text(); 
        var time = tr.eq(2).text();
        var content = tr.eq(3).text();
        var sender = tr.eq(4).text();
        $("#sender1").text(sender);
        $("#time1").text(time);
        $("#content1").text(content);
        var param = "num="+num;
      $.ajax({
         type:"POST",
         url:"${pageContext.request.contextPath }/msg/read",
         data:param,
         success:function(data){
            }
            
         });
     });

  </script>
<div class="modal fade" id="msgViewModal">
      <div class="modal-dialog">
         <div class="modal-content" style="width: 250px;">
            <div class="modal-header">
               <h4 class="modal-title" style="font-size: 25px;">쪽지 보기</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            
               <div class="form-group">
                  <div class="modal-body">
                     
                        <div><label>보낸 사람</label>
                        <div id="sender1" style="border: 1px solid lightgray; border-radius: 3px; padding: 5px;"></div></div>
                        <div><label>보낸 시간</label>
                        <div id="time1" style="border: 1px solid lightgray; border-radius: 3px; padding: 5px;"></div>
                        </div>
                     
                     <div><label>내용</label>
                     <div id="content1" style="border: 1px solid lightgray; border-radius: 3px; padding: 5px; overflow-wrap: break-word; overflow: auto; max-height: 200px;"></div>
                     </div>
                  </div>
                  
                     <button class="btn btn-primary" type="button"
                        data-dismiss="modal" onclick="location.reload()" style="float: right; margin-right: 30px;">확인</button>
                     <button class="btn btn-primary" type="button"
                        data-toggle="modal" data-target="#sendmsg" id="rep" style="float: right; margin-right: 10px;">답장</button>
                     <!-- <a href="#sendmsg" class="btn btn-primary" data-toggle="modal" data-target="#sendmsg"
         style="color: white; background-color: #337ab7; border-color: #2e6da4; line-height: 1.42857143; border-radius: 4px;
         padding: 6px 12px; display: inline-block; font-size: 14px;"   >답장</a> -->
                  </div>
            
               </div></div></div>
<div class="modal fade" id="sendmsg" >
      <div class="modal-dialog" style="width: 250px;" align="center">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" style="font-size: 25px;">쪽지 보내기</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="container">
            <form action="${pageContext.request.contextPath}/msg/send" method="post" id="sendform">
               <div class="form-group" style="float: left; margin-right: 40px; display: inline;">
                  <div class="modal-body" style="text-align: left;">
                        <label>받는 사람</label><span>                        
                        <input type="button" class="btn btn-primary" onclick="location.href='#m1'" data-toggle="modal" data-target="#m1" style="font-size: 12px; width: 50px;" value="목록">
                        </span><br>
                        
                        <span style="display: inline;">
                        <input type="text" name="receiver" id="re" required="required" class="form-control" style="display: inline;">
                        </span><br>
                  <label>내용</label>
                     <textarea name="content" style="resize: none; height: 150px;" required="required" class="form-control"></textarea>
                  </div>
                     <button class="btn btn-primary" type="button"
                        data-dismiss="modal">닫기</button>
                  <input type="hidden" value="${sessionScope.id }" name="sender">
                     <button class="btn btn-primary">보내기</button>
                  
                  </div>
            </form>
            </div>
            
            
               </div></div></div>
      <div class="modal fade" id="m1" >
      <div class="modal-dialog" style="width: 300px;" align="center">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">우리 반 목록</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="container" style="width: 100%; overflow: auto;">
            
               
 
<div class="container" style="margin-top: 10px; width: 100%; font-size: 12px;">
  <div class="list-group">
  <c:forEach items="${mlist }" var="m">
     <c:choose>
        <c:when test="${m.mng_group ne null }">
           <a href="#" class="list-group-item" style="font-size: 14px;" data-dismiss="modal">
           <p>${m.id }</p>
              <p>선생님</p>
           </a>
        </c:when>
        <c:otherwise>
           <a href="#" class="list-group-item" style="font-size: 14px;" data-dismiss="modal">
           <p>${m.id }</p>
        <p>아이 이름  ${m.stu_name }</p>   </a>
        </c:otherwise>
     </c:choose>
       
    </c:forEach>
  </div>
</div>

                  <button class="btn btn-primary" type="button"
                        data-dismiss="modal" style="float: right; margin: 15px;">닫기</button>
         
            </div>            
               </div></div></div>
      <script type="text/javascript">
         $('#rep').click(function(){
            var re = $('#sender1').text();
            $('#re').val(re);
         });
         $('#submit').click(function(){
            
         });
         $('.list-group-item').click(function(){
            var r = $(this).children().first().html();
            $('#re').val(r);
         });
      </script>


   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

   <script src="../resources/js/index.js"></script>
</body>

</html>