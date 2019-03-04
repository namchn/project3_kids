<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="../resources/css/style.min.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/modules.css" />" rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//갤러리 게시판 댓글 작성 및 조회
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
		var param = "gallery_num=${gb.gallery_num}&id=${sessionScope.id}&content="+content;
		$.ajax({
			type:"POST",
         	url:"${pageContext.request.contextPath}/boardGallery/galleryReplyList",
         	data:param,
         	success:function(data) {
				var arr = eval('('+data+')');
				var str = '';   
				for(i=0; i<arr.length; i++) {
					str += "<div style='border:1px solid lightgray; margin-top:5px; padding:5px; width:682px; overflow: auto;'>";
					str += "<div class='glyphicon glyphicon-user' style='float:left;'>" + arr[i].id + "</div>";
					str += "<div style='margin-left:571px;'>" + arr[i].time + "</div>";
					str += "<div id='replyContent"+arr[i].reply_num+"' style='margin-left:5px; float:left; word-break: break-all; width: 480px;'>"+arr[i].content+"</div>";      
					if("${sessionScope.id}"== arr[i].id) {
						str += "<div style='margin-left: 85%;'><button type='button' id='replyEditForm"+arr[i].reply_num+"' name='replyEditForm' value='"+arr[i].reply_num+"' class='replyEditForm btn btn-default btn-xs' style='float:left;'>수정</button>";
						str += "<button type='button' id='replyDelete"+arr[i].reply_num+"' name='replyDelete' value='"+arr[i].reply_num+"' class='replyDelete btn btn-default btn-xs'>삭제</button></div>";            
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
      
   //수정하기눌렀을때 댓글 수정 폼 생성
	$(document).on('click', '.replyEditForm', function() {
		var reply_num = $(this).val();
		$('#edit_div_'+reply_num).css('display','');
		$('#replyEditForm'+reply_num).hide();
		$('#replyDelete'+reply_num).hide();
		$('#replyContent'+reply_num).hide();
	})
   
	//수정취소눌렀을때 폼사라지기
	$(document).on('click', '.replyEditCancel', function() {
		var reply_num = $(this).val();
		$("#edit_div_"+reply_num).css('display','none');
		$('#replyEditForm'+reply_num).show();
		$('#replyDelete'+reply_num).show();
		$('#replyContent'+reply_num).show();
	})
      
	//수정완료눌렀을때 반영하기(ajax)
	$(document).on('click', '.replyEditComplete', function() {
		var reply_num = $(this).val();
		var content = $('#replyEditContent'+reply_num).val();
		var param = "gallery_num=${gb.gallery_num}&reply_num="+reply_num+"&content="+content;
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/boardGallery/galleryReplyEdit",
			data:param,            
			success:function(data) {
				var arr = eval('('+data+')');
				var str = '';   
				for(i=0; i<arr.length; i++) {
					str += "<div style='border:1px solid lightgray; margin-top:5px; padding:5px; width:682px; overflow: auto;'>";
					str += "<div class='glyphicon glyphicon-user' style='float:left;'>" + arr[i].id + "</div>";
					str += "<div style='margin-left:571px;'>" + arr[i].time + "</div>";
					str += "<div id='replyContent"+arr[i].reply_num+"' style='margin-left:5px; float:left; word-break: break-all; width: 480px;'>"+arr[i].content+"</div>";      
					if("${sessionScope.id}"== arr[i].id) {
						str += "<div style='margin-left: 85%;'><button type='button' id='replyEditForm"+arr[i].reply_num+"' name='replyEditForm' value='"+arr[i].reply_num+"' class='replyEditForm btn btn-default btn-xs' style='float:left;'>수정</button>";
						str += "<button type='button' id='replyDelete"+arr[i].reply_num+"' name='replyDelete' value='"+arr[i].reply_num+"' class='replyDelete btn btn-default btn-xs'>삭제</button></div>";            
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
		})
	})      
      
   //자유 게시판 댓글 삭제 및 조회
   $(document).on('click', '.replyDelete', function() {
      var reply_num = $(this).val();
      var param = "gallery_num=${gb.gallery_num}&reply_num="+reply_num;
   
      $.ajax({
         type:"POST",
         url:"${pageContext.request.contextPath}/boardGallery/galleryReplyDelete",
         data:param,            
                  
         success:function(data) {
            var arr = eval('('+data+')');
            var str = '';   

            for(i=0; i<arr.length; i++) {
                str += "<div style='border:1px solid lightgray; margin-top:5px; padding:5px; width:682px; overflow: auto;'>";
                str += "<div class='glyphicon glyphicon-user' style='float:left;'>" + arr[i].id + "</div>";
                str += "<div style='margin-left:571px;'>" + arr[i].time + "</div>";
                str += "<div id='replyContent"+arr[i].reply_num+"' style='margin-left:5px; float:left; word-break: break-all; width: 480px;'>"+arr[i].content+"</div>";      
                if("${sessionScope.id}"== arr[i].id) {
                   str += "<div style='margin-left: 85%;'><button type='button' id='replyEditForm"+arr[i].reply_num+"' name='replyEditForm' value='"+arr[i].reply_num+"' class='replyEditForm btn btn-default btn-xs' style='float:left;'>수정</button>";
                   str += "<button type='button' id='replyDelete"+arr[i].reply_num+"' name='replyDelete' value='"+arr[i].reply_num+"' class='replyDelete btn btn-default btn-xs'>삭제</button></div>";            
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
      })
   })   
   $('#content').keydown(function() {
       if (event.keyCode === 13) {
           $('#replyInsert').click();
       }
   });
});
</script>
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 사이드바 -->
	<div style="margin-top: 40px; margin-left: 175px;">
		<jsp:include page="/WEB-INF/views/common/side_com.jsp"></jsp:include>
	</div>

	<!-- 바디 -->
	<div class="container" style="margin-top:50px; margin-left: 22%; margin-bottom: 100px;">
		<!-- Page Heading -->
      	<h1 class="my-4">우리반이야기<small>장미반</small></h1>
		<hr>
		<!-- Project One -->
		<div class="row">
			<div class="col-md-5">
				<h3>${gb.title}</h3>
				<p>${fn:replace(gb.content,cn,br) }</p>
        	</div>
      	</div>
		<div class="row">
			<div class="col-md-7" style="margin-bottom: 20px; */" >
				<img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img1}" alt="">
			</div>      
			<c:if test="${null ne gb.img2 }">
				<div class="col-md-7" style="margin-bottom: 20px">
	            	<img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img2}" alt="">
	        	</div>   
			</c:if>      
			<c:if test="${null ne gb.img3 }">
				<div class="col-md-7" style="margin-bottom: 20px">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img3}" alt="">
		        </div> 
			</c:if>   
			<c:if test="${null ne gb.img4 }">
				<div class="col-md-7" style="margin-bottom: 20px">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img4}" alt="">
		        </div> 
			</c:if>      
			<c:if test="${null ne gb.img5 }">
				<div class="col-md-7" style="margin-bottom: 20px">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img5}" alt="">
		        </div> 
			</c:if>         
			<c:if test="${null ne gb.img6 }">
				<div class="col-md-7" style="margin-bottom: 20px">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img6}" alt="">
		        </div> 
			</c:if>         
			<c:if test="${null ne gb.img7 }">
				<div class="col-md-7" style="margin-bottom: 20px">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img7}" alt="">
		        </div> 
			</c:if>      
			<c:if test="${null ne gb.img8 }">
				<div class="col-md-7" style="margin-bottom: 20px">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img8}" alt="">
		        </div> 
			</c:if>      
			<c:if test="${null ne gb.img9 }">
				<div class="col-md-7" style="margin-bottom: 20px">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img9}" alt="">
		        </div> 
			</c:if>   
			<c:if test="${null ne gb.img10 }">
				<div class="col-md-7" style="margin-bottom: 20px">
		            <img class="img-fluid rounded mb-3 mb-md-0" src="../resources${gb.img10}" alt="">
		        </div> 
			</c:if>   
		</div>
		<hr>
		<table class="table" style="width: 700px">
			<tr>
				<td>  
					<div style="position: relative; left: 80%;">   
						<a href="${pageContext.request.contextPath}/boardGallery/galleryList?mng_group=${gb.mng_group}&sort=${sort}" class="btn btn-primary" style="color: white;">글목록</a>
						<c:if test="${sessionScope.id==gb.id}">
							<a href="${pageContext.request.contextPath}/boardGallery/galleryEditForm?gallery_num=${gb.gallery_num}&sort=${sort}" class="btn btn-primary" style="color: white;">글수정</a>
							<a href="${pageContext.request.contextPath}/boardGallery/galleryDelete?mng_group=${gb.mng_group }&gallery_num=${gb.gallery_num}&sort=${sort}" class="btn btn-primary" style="color: white;">글삭제</a>
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<td style="background-color: #f5f5f5;">
					<!-- 댓글작성 -->
					<form action="" method="post">
						<input type="text" id="content" name="content" style="max-width: 100%; width: 89%;" placeholder="댓글" maxlength="150">
						<input type="button" class="btn btn-primary" id="replyInsert" name="replyInsert" value="작성" style="width: 70px;">
					</form>
					<!-- 댓글목록 -->
					<span id="replyList" name="replyList">
						<c:forEach var="a" items="${replyList }">	            
			            <div style="border:1px solid lightgray; margin-top:5px; padding:5px; width:682px; overflow: auto;">
			           		<div class="glyphicon glyphicon-user" style="float:left;"> ${a.id }</div>
			           		<div style="margin-left:571px;">${a.time }</div>
			           	
			            	<div id="replyContent${a.reply_num }" style="margin-left:5px; float:left; word-break: break-all; width: 480px;">${a.content }</div>
			            	<c:if test="${sessionScope.id==a.id}">
			            		<div style="margin-left: 85%;"><button type="button" id="replyEditForm${a.reply_num }" name="replyEditForm" value="${a.reply_num }" class="replyEditForm btn btn-default btn-xs" style="float:left;">수정</button>
			            		<button type="button" id="replyDelete${a.reply_num }" name="replyDelete" value="${a.reply_num }" class="replyDelete btn btn-default btn-xs">삭제</button></div>
			            	</c:if>
		                 	<div id="edit_div_${a.reply_num}" style="display:none;">
		                  		<input type="text" id="replyEditContent${a.reply_num }" name="replyEditContent" value="${fn:replace(a.content,cn,br)}" style="max-width: 100%; width: 450px;">
		                  		<button type="button" id="replyEditCancel${a.reply_num }" name="replyEditCancel" value="${a.reply_num }" class="replyEditCancel btn btn-default btn-xs">수정취소</button>
		                  		<button type="button" id="replyEditComplete${a.reply_num }" name="replyEditComplete" value="${a.reply_num }" class="replyEditComplete btn btn-default btn-xs">수정완료</button>
		                 	</div>
			            </div>
			        	</c:forEach>
					</span>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 하단바 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script src="../resources/js/index.js"></script>
</body>
</html>