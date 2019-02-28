<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="../resources/css/style.min.css" />"
	rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />"
rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
       //공지사항 게시판 댓글 작성 및 조회
      $('#replyInsert').click(function() {
         if(${sessionScope.mem_code==3}) {
            alert('학부모와 선생님만 작성할 수 있습니다.');
            return;
         }
         var content = $('#content').val();
         if(content==null||content=="") {
            alert('댓글을 입력하세요.');
            return;
         }
         var param = "notice_num=${nb.notice_num}&id=${sessionScope.id}&content="+content;
         $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/boardNotice/noticeReplyList",
            data:param,
            success:function(data) {
               alert("success완료");
               var arr = eval('('+data+')');
               var str = '';   
               for(i=0; i<arr.length; i++) {
                   str += "<div style='border:1px solid gray; margin-top:5px; padding:5px; width:600px'>";
                   str += "<div class='glyphicon glyphicon-user' style='float:left;'>" + arr[i].id + "</div>";
                   str += "<div style='margin-left:500px;'>" + arr[i].time + "</div>";
                   str += "<div id='replyContent"+arr[i].reply_num+"' style='margin-left:5px; float:left;'>"+arr[i].content+"</div>";      
                   if("${sessionScope.id}"== arr[i].id) {
                      str += "<div><button type='button' id='replyEditForm"+arr[i].reply_num+"' name='replyEditForm' value='"+arr[i].reply_num+"' class='replyEditForm btn btn-default btn-xs' style='float:left;'>수정</button></div>";
                      str += "<div><button type='button' id='replyDelete"+arr[i].reply_num+"' name='replyDelete' value='"+arr[i].reply_num+"' class='replyDelete btn btn-default btn-xs'>삭제</button></div>";            
                   }
                   str += "<div id='edit_div_"+ arr[i].reply_num +"' style='display:none;'>";
                   str += "<input type='text' id='replyEditContent"+ arr[i].reply_num +"' name='replyEditContent' value="+arr[i].content+" style='max-width: 100%; width: 450px;'>";                
                   str += "<button type='button' id='replyEditCancel"+ arr[i].reply_num +"' name='replyEditCancel' value='"+ arr[i].reply_num +"' class='replyEditCancel btn btn-default btn-xs'>수정취소</button>";
                   str += "<button type='button' id='replyEditComplete"+ arr[i].reply_num +"' name='replyEditComplete' value='"+ arr[i].reply_num +"' class='replyEditComplete btn btn-default btn-xs'>수정완료</button>";            
                   str += "</div>"                  
                   str += "</div>";         
                
                }
               
               $('#replyList').html(str);
            }
       
         });
         $('#content').val('');
      });   
       
       
      //수정하기 눌렀을때 댓글 수정 폼 생성
      $(document).on('click', '.replyEditForm', function(){
         alert("수정하기 버튼 클릭");
         var reply_num = $(this).val();
         alert("reply_num"+reply_num);
         $('#edit_div_'+reply_num).css('display','');
         
         $('#replyEditForm'+reply_num).hide();
         $('#replyDelete'+reply_num).hide();
         $('#replyContent'+reply_num).hide();
      })
      
      //수정취소 눌렀을때 수정 폼 사라지기
      $(document).on('click', '.replyEditCancel', function(){
         alert("수정취소 버튼 클릭");
         var reply_num = $(this).val();
         alert("reply_num"+reply_num);
         $("#edit_div_"+reply_num).css('display','none');
         
         $('#replyEditForm'+reply_num).show();
         $('#replyDelete'+reply_num).show();
         $('#replyContent'+reply_num).show();
      })
      
      
      //수정완료눌렀을때 반영하기(ajax)
      $(document).on('click', '.replyEditComplete', function() {
         alert("수정완료 버튼클릭");
         var reply_num = $(this).val();
         alert("reply_num"+reply_num);

         
         var content = $('#replyEditContent'+reply_num).val();
         var param = "notice_num=${nb.notice_num}&reply_num="+reply_num+"&content="+content;
   
         $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/boardNotice/noticeReplyEdit",
            data:param,            
                     
            success:function(data) {
               alert("success완료");
            
               var arr = eval('('+data+')');
               var str = '';   
               for(i=0; i<arr.length; i++) {
                   str += "<div style='border:1px solid gray; margin-top:5px; padding:5px; width:600px'>";
                   str += "<div class='glyphicon glyphicon-user' style='float:left;'>" + arr[i].id + "</div>";
                   str += "<div style='margin-left:500px;'>" + arr[i].time + "</div>";
                   str += "<div id='replyContent"+arr[i].reply_num+"' style='margin-left:5px; float:left;'>"+arr[i].content+"</div>";      
                   if("${sessionScope.id}"== arr[i].id) {
                      str += "<div><button type='button' id='replyEditForm"+arr[i].reply_num+"' name='replyEditForm' value='"+arr[i].reply_num+"' class='replyEditForm btn btn-default btn-xs' style='float:left;'>수정</button></div>";
                      str += "<div><button type='button' id='replyDelete"+arr[i].reply_num+"' name='replyDelete' value='"+arr[i].reply_num+"' class='replyDelete btn btn-default btn-xs'>삭제</button></div>";            
                   }
                   str += "<div id='edit_div_"+ arr[i].reply_num +"' style='display:none;'>";
                   str += "<input type='text' id='replyEditContent"+ arr[i].reply_num +"' name='replyEditContent' value="+arr[i].content+" style='max-width: 100%; width: 450px;'>";                
                   str += "<button type='button' id='replyEditCancel"+ arr[i].reply_num +"' name='replyEditCancel' value='"+ arr[i].reply_num +"' class='replyEditCancel btn btn-default btn-xs'>수정취소</button>";
                   str += "<button type='button' id='replyEditComplete"+ arr[i].reply_num +"' name='replyEditComplete' value='"+ arr[i].reply_num +"' class='replyEditComplete btn btn-default btn-xs'>수정완료</button>";            
                   str += "</div>"                  
                   str += "</div>";         
                
                }
   
               
               $('#replyList').html(str);
            }
         });
            
      })
       


      
      //공지사항 게시판 댓글 삭제 및 조회
      $(document).on('click', '.replyDelete', function() {
         alert("delete onclick실행");
         var reply_num = $(this).val();
         var param = "notice_num=${nb.notice_num}&reply_num="+reply_num;
      
         $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/boardNotice/noticeReplyDelete",
            data:param,            
                     
            success:function(data) {
               alert("success완료");
               var arr = eval('('+data+')');
               var str = '';   
               for(i=0; i<arr.length; i++) {
                   str += "<div style='border:1px solid gray; margin-top:5px; padding:5px; width:600px'>";
                   str += "<div class='glyphicon glyphicon-user' style='float:left;'>" + arr[i].id + "</div>";
                   str += "<div style='margin-left:500px;'>" + arr[i].time + "</div>";
                   str += "<div id='replyContent"+arr[i].reply_num+"' style='margin-left:5px; float:left;'>"+arr[i].content+"</div>";      
                   if("${sessionScope.id}"== arr[i].id) {
                      str += "<div><button type='button' id='replyEditForm"+arr[i].reply_num+"' name='replyEditForm' value='"+arr[i].reply_num+"' class='replyEditForm btn btn-default btn-xs' style='float:left;'>수정</button></div>";
                      str += "<div><button type='button' id='replyDelete"+arr[i].reply_num+"' name='replyDelete' value='"+arr[i].reply_num+"' class='replyDelete btn btn-default btn-xs'>삭제</button></div>";            
                   }
                   str += "<div id='edit_div_"+ arr[i].reply_num +"' style='display:none;'>";
                   str += "<input type='text' id='replyEditContent"+ arr[i].reply_num +"' name='replyEditContent' value="+arr[i].content+" style='max-width: 100%; width: 450px;'>";                
                   str += "<button type='button' id='replyEditCancel"+ arr[i].reply_num +"' name='replyEditCancel' value='"+ arr[i].reply_num +"' class='replyEditCancel btn btn-default btn-xs'>수정취소</button>";
                   str += "<button type='button' id='replyEditComplete"+ arr[i].reply_num +"' name='replyEditComplete' value='"+ arr[i].reply_num +"' class='replyEditComplete btn btn-default btn-xs'>수정완료</button>";            
                   str += "</div>"                  
                   str += "</div>";         
                
                }
               
               $('#replyList').html(str);
            }
         });
      });
      
       
       
       
   }); 
</script>

</head>
<body>
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h3>공지사항  상세 조회</h3>
	<table border="1">

      <tr>
         <td colspan='3'>제목 : ${nb.title}</td>
      </tr>      
      <tr>
         <td>작성자 : ${nb.id}</td><td>작성시간 : ${nb.time}</td><td>조회수 : ${nb.viewcount}</td>
      </tr>      
      <tr>
         <td colspan='3'>내용 : ${nb.content}</td>
      </tr>         
      <tr>
         <td><a href="${pageContext.request.contextPath}/boardNotice/noticeList?sort=${sort}">목록</a></td>
         <c:if test="${sessionScope.id==nb.id}">
            <td><a href="${pageContext.request.contextPath}/boardNotice/noticeEditForm?notice_num=${nb.notice_num}&sort=${sort}">수정</a></td>
            <td><a href="${pageContext.request.contextPath}/boardNotice/noticeDelete?notice_num=${nb.notice_num}&sort=${sort}">삭제</a></td>
         </c:if>
      </tr>
      <tr>
         <td colspan='3'>첨부파일<a href="${pageContext.request.contextPath }/download/down?name=${nb.files}">${nb.files}</a></td>
         
      </tr>            
   </table>
   
   
   
   
			<!-- 댓글작성 -->
			<form action="" method="post">
				댓글<input type="text" id="content" name="content">
				<input type="button" id="replyInsert" name="replyInsert" value="작성">
			</form>   
   
      		<!-- 댓글목록 -->
			<span id="replyList" name="replyList">
				<c:forEach var="a" items="${replyList }">	            
	            <div style="border:1px solid gray; margin-top:5px; padding:5px; width:600px">
            		<div class="glyphicon glyphicon-user" style="float:left;"> ${a.id }</div>
            		<div style="margin-left:500px;">${a.time }</div>
            	
	            	<div id="replyContent${a.reply_num }" style="margin-left:5px; float:left;">${a.content }</div>
	            	<c:if test="${sessionScope.id==a.id}">
	            		<div><button type="button" id="replyEditForm${a.reply_num }" name="replyEditForm" value="${a.reply_num }" class="replyEditForm btn btn-default btn-xs" style="float:left;">수정</button></div>
	            		<div><button type="button" id="replyDelete${a.reply_num }" name="replyDelete" value="${a.reply_num }" class="replyDelete btn btn-default btn-xs">삭제</button></div>
	            	</c:if>
                  	<div id="edit_div_${a.reply_num}" style="display:none;">
                   		<input type="text" id="replyEditContent${a.reply_num }" name="replyEditContent" value=${a.content } style="max-width: 100%; width: 450px;">
                   		

                   		
                   		
                   		<button type="button" id="replyEditCancel${a.reply_num }" name="replyEditCancel" value="${a.reply_num }" class="replyEditCancel btn btn-default btn-xs">수정취소</button>
                   		<button type="button" id="replyEditComplete${a.reply_num }" name="replyEditComplete" value="${a.reply_num }" class="replyEditComplete btn btn-default btn-xs">수정완료</button>
                  	</div>
	            </div>
	        	</c:forEach>
			</span>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="../resources/js/index.js"></script>
</body>
</html>






