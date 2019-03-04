<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#mySidenav a{
  position: absolute;
  transition: 0.3s;
  padding: 10px;
  width: 200px;
  height: 40px;
  text-decoration: none;
  font-size: 15px;
  color: black;
  border-radius: 5px 5px 5px 5px;
  background-color: lightgray;
}

#mySidenav a:hover {
  background-color: #555;
  color: white;
}

#info {
  position: absolute;
  transition: 0.3s;
  padding: 15px;
  width: 200px;
  text-decoration: none;
  text-align: center;
  font-size: 20px;
  font-weight: bolder;
  color: white;
  border-radius: 5px 5px 5px 5px;
  top: 200px;
  background-color: #f9ca5b;
}

@media only screen and (max-width: 1300px) {
  #side1{
    display: none;
  }
}
</style>

<script> 
	var mem_code = $('#mem_code').val();
	var mng_group = $('#mng_group').val();
	 var stu_group = $('#stu_group').val();
	 var id1 = $('#AccessId').val();
	 
	 function group1() {
			/* mem code 0: 관리자 1:선생 2:학부모 */
			   /* 관리자가 0이 아니고 stu code가 1일 때 링크 */
			   if(id1!=""){
			   if(mem_code==0) {
			      location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=1&sort=2";
			   }else if(mem_code==1){
			      if(mng_group!="1") {
			         alert("장미반 선생님만 접근할 수 있습니다.");
			         return;
			      } else if(mng_group=="1"){
			            location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=1&sort=2";
			         }      
			   }else if(mem_code==2){
			         if(stu_group!="1") {
			            alert("장미반 학부모만 접근할 수 있습니다.");
			            return;
			         }
			         else if(stu_group=="1"){
			            location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=1&sort=2";
			         }      
			   }
		}
	 }

		function group2() {
			if(id1!=""){
		        if(mem_code==0) {
		           location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=2&sort=2";
		        }else if(mem_code==1){
		           if(mng_group!="2") {
		              alert("해바라기반 선생님만 접근할 수 있습니다.");
		              return;
		           } else if(mng_group=="2"){
		                 location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=2&sort=2";
		              }      
		        }else if(mem_code==2){
		              if(stu_group!="2") {
		                 alert("해바라기반 학부모만 접근할 수 있습니다.");
		                 return;
		              }
		              else if(stu_group=="2"){
		                 location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=2&sort=2";
		              }      
		        }
		        }
		}

		function group3() {
			if(id1!=""){
		        if(mem_code==0) {
		           location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=3&sort=2";
		        }else if(mem_code==1){
		           if(mng_group!="3") {
		              alert("민들레반 선생님만 접근할 수 있습니다.");
		              return;
		           } else if(mng_group=="3"){
		                 location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=3&sort=2";
		              }      
		        }else if(mem_code==2){
		              if(stu_group!="3") {
		                 alert("민들레반 학부모만 접근할 수 있습니다.");
		                 return;
		              }
		              else if(stu_group=="3"){
		                 location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=3&sort=2";
		              }      
		        }
		        }
		}

		function group4() {
			if(id1!=""){
		        if(mem_code==0) {
		           location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=4&sort=2";
		        }else if(mem_code==1){
		           if(mng_group!="4") {
		              alert("벚꽃반 선생님만 접근할 수 있습니다.");
		              return;
		           } else if(mng_group=="4"){
		                 location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=4&sort=2";
		              }      
		        }else if(mem_code==2){
		              if(stu_group!="4") {
		                 alert("벚꽃반 학부모만 접근할 수 있습니다.");
		                 return;
		              }
		              else if(stu_group=="4"){
		                 location.href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=4&sort=2";
		              }      
		        }
		        }
		}
</script>
</head>

<body>
<div id="side1">
<input type="hidden" value="${sessionScope.id}" id="AccessId">
<input type="hidden" value="${sessionScope.mem_code}" id="mem_code">
<input type="hidden" value="${sessionScope.mng_group}" id="mng_group">
<input type="hidden" value="${sessionScope.stu_group}" id="stu_group">
<a id="info">우리반 이야기</a>
<div id="mySidenav" class="sidenav">
  <a href='javascript:void(0);' style="top: 265px" onclick="group1();">장미반</a>
  <a href='javascript:void(0);' style="top: 310px" onclick="group2();">해바라기반</a>
  <a href='javascript:void(0);' style="top: 355px" onclick="group3();">민들레반</a>
  <a href='javascript:void(0);' style="top: 400px" onclick="group4();">벚꽃반</a>
</div>
</div>
<script src="../resources/js/index.js"></script>
</body>
</html> 
