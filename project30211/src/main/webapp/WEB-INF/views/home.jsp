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
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="<c:url value="resources/css/style.min.css" />"
   rel="stylesheet">
<link href="<c:url value="resources/css/modules.css?ver=1" />"
   rel="stylesheet">
<script type="text/javascript"
   src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
.rb {
   width: 50px;
}
</style>

<style type="text/css">
.submenu1 {
   font-size: 1em;
    font-style: italic; 
   color: white;
   background: #D2691E;
   padding: 10px;
   
}

.submenu2 {
   font-size: 0.6em;
    font-style: italic; 
   color: white;
   background: #D2691E;
   
}

.submenu3 {
   font-size: 1em;
   font-style: italic;
   color: white;
   background: #FF7F50;
   padding: 10px;
}

.submenu4 {
   font-size: 0.6em;
   font-style: italic;
   color: white;
   background: #FF7F50;
}

.submenu5 {
   font-size: 1em;
   font-style: italic;
   color: white;
   background: #DC143C;
   padding: 10px;
}

.submenu6 {
   font-size: 0.6em;
   font-style: italic;
   color: white;
   background: #DC143C;
}

.submenu7 {
   font-size: 1em;
   font-style: italic;
   color: white;
   background: #B8860B;
   padding: 10px;
}

.submenu8 {
   font-size: 0.6em;
   font-style: italic;
   color: white;
   background: #B8860B;
}
</style>

<!-- 탭 스타일 -->
<style>
body {
   font-family: "Lato", sans-serif;
}

.tablink {
   background-color: #D5D5D5;
   color: #353535;
   float: left;
   border: none;
   outline: none;
   cursor: pointer;
   padding: 14px 16px;
   font-size: 16px;
   width: 25%;
}

.tablink:hover {
   background-color: white;
}

/* Style the tab content */
.tabcontent {
   color: #C0C0C0;
   display: none;
   /* padding: 50px; */
   padding: 10px;
   padding-top: 20px;
   font-size: 16px;
   text-align: center;
   width: 550px; height: 213px;
   overflow: auto;
}

#notice {
   background-color: #FFFFFF;
}

#bulletin {
   background-color: #FFFFFF;
}

#event {
   background-color: #FFFFFF;
}

#poll {
   background-color: #FFFFFF;
}

.MOD_FEATURE{
   background-color: white;
}
@media only screen and (max-width: 899px) {
  #side1{
    display: none;
  }
}
</style>

</head>
<!-- End Head -->

<body class="default">

   <jsp:include page="/WEB-INF/views/common/header2.jsp"></jsp:include>

   <section class="MOD_PROMOBOX1">
      <span id="slide">
         <span data-layout="_r" class="MOD_PROMOBOX1_Background"
            style="height: 500px; display: block; overflow: hidden;"
            id="imgdiv1">
            <img src="resources/img/1.jpg" />
         </span>
         <span data-layout="_r" class="MOD_PROMOBOX1_Background"
            style="height: 500px; display: none; overflow: hidden;" id="imgdiv1">
            <img src="resources/img/2.jpg" />
         </span>
         <span data-layout="_r" class="MOD_PROMOBOX1_Background"
            style="height: 500px; display: none; overflow: hidden;" id="imgdiv1">
            <img src="resources/img/3.jpg" />
         </span>
         <span data-layout="_r" class="MOD_PROMOBOX1_Background"
            style="height: 500px; display: none; overflow: hidden;" id="imgdiv1">
            <img src="resources/img/4.jpg" />
         </span>
      </span>
   </section>

   <script>
      var $imglist = $('#slide>span');
      var imgcnt = $imglist.children().length;
      var d = 4000;
      var auto = true;
      var index = 0;
      if (auto == true) {
         setInterval(autoslide, d);
      }
      function autoslide() {
         var next = (++index % imgcnt);
         $($imglist.get(next - 1)).fadeOut(0);
         $($imglist.get(next)).fadeIn(1000);
      }
   </script>
   <!--
END MODULE AREA 3: Promo Box 1
-->

   <!--
START MODULE AREA 4: Feature 1
-->
   <section class="MOD_PROMOBOX1" style="" id="side1">
      <span data-layout="_r" style=" margin: 0 auto;">
         <span data-layout="ch8 ec4" style="float:left; width: 25%; padding-left:10px">
            <a href="${pageContext.request.contextPath }/introduce/introduce" class="MOD_FEATURE_Container">
               <div class="submenu1">유치원소개<br><span style="font-size:12px">우리유치원을 소개합니다.</span></div>
              
            </a>
         </span>
         <span data-layout="ch8 ec4" style="float:left;  width: 25%; ">
            <a href="${pageContext.request.contextPath }/book/booklistForm" class="MOD_FEATURE_Container">
               <div class="submenu3">도서관 서비스<br><span style="font-size:12px">우리유치원 도서관 서비스입니다.</span></div>
     
            </a>
         </span>
         <span data-layout="ch8 ec4" style="float:left;  width: 25%;">
            <a href="${pageContext.request.contextPath }/boardGallery/galleryList?mng_group=1&sort=2" class="MOD_FEATURE_Container">
               <div class="submenu5">우리반소개<br><span style="font-size:12px">귀여운 우리아이들 봐요.</span></div>
             
            </a>
         </span>
         <span data-layout="ch8 ec4" style=" width: 25%; padding-right:10px">
            <a href="${pageContext.request.contextPath }/info/map" class="MOD_FEATURE_Container">
               <div class="submenu7">오시는길<br><span style="font-size:12px">오시는길을 안내합니다.</span></div>
   
            </a>
         </span>
      </span>
   </section>
   <section class="MOD_FEATURE" style="padding-bottom: 100px;background-color:white">
      
      <div data-layout="_r">
     
     	 <!-- 식단표 -->
         <div data-layout="ch8 ec4" style="border-bottom:solid 1px lightgray;">
            <a href="${pageContext.request.contextPath}/boardDiet/detailDiet?diet_num=${db.diet_num}"
               class="MOD_FEATURE_Container"> 
               <a href="${pageContext.request.contextPath}/boardDiet/detailDiet?diet_num=${db.diet_num}">
             	  <p style="padding-top:30px; padding-left:50px;">
                     <a align="center" href="${pageContext.request.contextPath}/boardDiet/detailDiet?diet_num=${db.diet_num}"
                           align="center" style="font-weight:bold; font-color:lightgray;">${db.title}</a>                        
                     </p>
                   <img src="/img/${db.files}" width="100px;" height="100" alt="식단표 업로드 불가">
               </a>
            </a>
        </div>
      
      <div style="height: 215px; width: 570px; border: 1px solid lightgray;">
      <div id="notice" class="tabcontent" style="padding-bottom: 40px;">
         <!-- <p>공지사항</p> -->
         <table align="center">
         <c:forEach var="n_list" items="${n_list}">
         <tr>
             <td align="left" style="width: 78%;">*&nbsp;&nbsp;${n_list.title}&nbsp;</td>
              <td>${n_list.time}</td>
         </tr>
         </c:forEach>   
         </table>
      </div>

       <div id="event" class="tabcontent">
         <!-- <P>이달의 아이</P> -->
         <img src="resources/img/month_child.PNG" style="max-width: 100%; max-height: 100%; object-fit: contain;"/>
      </div>

      <div id="bulletin" class="tabcontent">
         <!-- <p>자유게시판</p> -->
         <table align="center">
         <c:forEach var="b_list" items="${b_list}">
         <tr>
             <td align="left" style="width: 78%;">*&nbsp;&nbsp;${b_list.title}&nbsp;</td>
              <td>${b_list.time}</td>
         </tr>
         </c:forEach>   
         </table>
      </div>

      <div id="poll" class="tabcontent">
         <!-- <p>투표</p> -->
         <table align="center">
         <c:forEach var="poll" items="${poll}">
         <tr>
             <td align="left" style="width: 56%;">*&nbsp;&nbsp;${poll.poll_subject}&nbsp;</td>
              <td>${poll.start_date}</td>
              <td>~${poll.end_date}</td>
         </tr>
         </c:forEach>   
         </table> 
      </div>

      <div style="width: 570px; position: relative; left: -2%;">
      <button class="tablink" onclick="openTab('notice', this, '#white')"
         id="defaultOpen">공지사항</button>
      <button class="tablink" onclick="openTab('event', this, 'white')">이달의 일정</button>
      <button class="tablink" onclick="openTab('bulletin', this, 'white')">자유게시판</button>
      <button class="tablink" onclick="openTab('poll', this, 'white')">투표</button>
      </div>
      
      </div>
      
                  
    
         <jsp:include
               page="/WEB-INF/views/fullcalendar/fullcalendar_mini.jsp" />
       
      
      
      </div>
      
     <%--    <jsp:include
               page="/WEB-INF/views/fullcalendar/fullcalendar_mini.jsp" />
                --%>
      </section>
      
      
      
      
      
      <!-- 탭 스크립트 -->
      <script>
         function openTab(cityName, elmnt, color) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
               tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
               tablinks[i].style.backgroundColor = "";
            }
            document.getElementById(cityName).style.display = "block";
            elmnt.style.backgroundColor = color;

         }
         // Get the element with id="defaultOpen" and click on it
         document.getElementById("defaultOpen").click();
      </script>
   
   

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   <script src="resources/js/index.js"></script>
</body>

</html>