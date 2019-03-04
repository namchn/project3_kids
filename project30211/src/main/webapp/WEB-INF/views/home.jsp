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
<link href="<c:url value="resources/css/style.min.css" />"
   rel="stylesheet">
<link href="<c:url value="resources/css/modules.css?ver=1" />"
   rel="stylesheet">
<style type="text/css">
.rb {
   width: 50px;
}

</style>

<style type="text/css">
.submenu1 {
   font-size: 1em;
   color: white;
   background: #efb11f;
   padding: 10px;
   font-weight: bolder;
   
}

.submenu2 {
   font-size: 0.6em;
   color: white;
   background: #D2691E;
   font-weight: bolder;
}

.submenu3 {
   font-size: 1em;
   color: white;
   background: #007bffa8;
   padding: 10px;
   font-weight: bolder;
}

.submenu4 {
   font-size: 0.6em;
   color: white;
   background: #FF7F50;
   font-weight: bolder;
}

.submenu5 {
   font-size: 1em;
   color: white;
   background: #28a745c9;
   padding: 10px;
   font-weight: bolder;
}

.submenu6 {
   font-size: 0.6em;
   color: white;
   background: #DC143C;
   font-weight: bolder;
}

.submenu7 {
   font-size: 1em;
   color: white;
   background: #dc3545d6;
   padding: 10px;
   font-weight: bolder;
}

.submenu8 {
   font-size: 0.6em;
   color: white;
   background: #B8860B;
   font-weight: bolder;
}
</style>

<!-- 탭 스타일 -->
<style>
body {
   font-family: "Lato", sans-serif;
}

.tablink {
   background-color: #EAEAEA;
   color: #353535;
   float: left;

   cursor: pointer;
   padding: 14px 16px;
   font-size: 16px;
   width: 25%;
}



/* Style the tab content */
.tabcontent {
   color: #353535;
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
.MOD_FEATURE_Container{
   text-decoration: none;
   font-family: 'Varela Round', sans-serif;
}

.MOD_FEATURE_Container:hover{
   text-decoration: none;
   font-family: 'Varela Round', sans-serif;
}
.abc{
font-family: 'Varela Round', sans-serif;
}
.innerDiv{
margin-top: 20px;
margin-bottom: 8px;
word-break: break-all;
width: 276px;
text-overflow: ellipsis;
white-space: nowrap;
overflow: hidden;
}
.innerDiv>li{
text-overflow: ellipsis;
white-space: nowrap;
overflow: hidden;
}
@media only screen and (max-width: 1300px) {
  #pic{
    display: none;
  }
}
.tablink{
border: 1px solid #EAEAEA;
}
.tablink:hover {
   background-color: white;
}
.tablink:focus{
   background-color: white;
   border-bottom: solid 1px red;
   outline: none;
}
[data-layout=_r]{
	padding: 0;
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

   <section class="MOD_PROMOBOX1" style="" id="side1">
      <span data-layout="_r" style=" margin: 0 auto; padding-left: 0;">
         <span data-layout="ch8 ec4" style="float:left; width: 25%;">
            <a href="${pageContext.request.contextPath }/introduce/introduce" class="MOD_FEATURE_Container">
               <div class="submenu1" style="float: left;"><i class="fas fa-school" style="font-size: 50px;"></i></div>
               <div class="submenu1" style="height: 70px; display: grid;">
               유치원소개<span class="abc" style="font-size:12px;">우리유치원을 소개합니다.</span></div>
            </a>
         </span>
         <span data-layout="ch8 ec4" style="float:left;  width: 25%; ">
            <a href="${pageContext.request.contextPath }/book/booklistForm" class="MOD_FEATURE_Container">
              <div class="submenu3" style="width: fit-content; float: left;">
              <i class="fas fa-book" style="font-size: 50px;"></i>
              </div>
               <div class="submenu3" style="font-family: 'Varela Round', sans-serif; height: 70px; display: grid;">도서관 서비스<span class="abc"  style="font-size:12px;">우리유치원 도서관 서비스입니다.</span></div>
     
            </a>
         </span>
         <span data-layout="ch8 ec4" style="float:left;  width: 25%;">
            <a href="#" class="MOD_FEATURE_Container">
               <div class="submenu5" style="width: fit-content; float: left;">
               <i class="fas fa-baby" style="font-size: 50px;"></i>
               </div><div class="submenu5" style="height: 70px; display: grid;"></i>우리반소개<span class="abc"  style="font-size:12px">귀여운 우리아이들 봐요.</span></div>
             
            </a>
         </span>
         <span data-layout="ch8 ec4" style=" width: 25%;">
            <a href="${pageContext.request.contextPath }/info/map" class="MOD_FEATURE_Container">
               <div class="submenu7" style="width: fit-content; float: left;">
               <i class="fas fa-map-marked-alt" style="font-size: 50px;"></i>
               </div>
               <div class="submenu7" style="height: 70px; display: grid;">오시는길<span class="abc"  style="font-size:12px;">오시는길을 안내합니다.</span></div>
   
            </a>
         </span>
      </span>
   </section>
   <section class="MOD_FEATURE" style="padding-bottom: 100px;background-color:white">
      
      <div data-layout="_r">
     
         <!-- 식단표 -->
         <div data-layout="ch8 ec4" style="border:solid 1px lightgray; background-color: #eae0995e;" id="pic">
          <div style="margin-top: 20px; margin-bottom: 20px;text-align: center; font-weight: bolder; font-size: 15px;">식단표</div>
            <a href="${pageContext.request.contextPath}/boardDiet/detailDiet?diet_num=${db.diet_num}"
               class="MOD_FEATURE_Container"> 
               <a href="${pageContext.request.contextPath}/boardDiet/detailDiet?diet_num=${db.diet_num}">
                   <img src="resources/img/${db.files}" width="100px;" height="100" alt="식단표 업로드 불가">
                  <p style="padding-top:30px; padding-left:50px;">
                     <a align="center" href="${pageContext.request.contextPath}/boardDiet/detailDiet?diet_num=${db.diet_num}"
                           align="center" style="font-color:lightgray;">${db.title}</a>                        
                     </p>
               </a>
            </a>
        </div>
        
        <!-- 공지사항 -->       
        <div data-layout="ch8 ec4" style="border:solid 1px lightgray; background-color: #007bff17;">
           <div style="margin-top: 20px; text-align: center; font-weight: bolder; font-size: 15px;">공지사항</div>
         <c:forEach var="n_list" items="${n_list}">
        <div class="innerDiv"><li><a href="${pageContext.request.contextPath }/boardNotice/noticeView?sort=2&notice_num=${n_list.notice_num}">${n_list.title}</a></li></div>
         </c:forEach>   
                       <div align="right"><a href="${pageContext.request.contextPath }/boardNotice/noticeList?sort=2">
                       more..</a>
                       </div>
        </div>
        
        <!-- 자유게시판 -->
        <div data-layout="ch8 ec4" style="border:solid 1px lightgray; background-color: #3c763d1c;">
        <div style="margin-top: 20px; text-align: center; font-weight: bolder; font-size: 15px;">자유게시판</div>
            <c:forEach var="b_list" items="${b_list}">
        
             <div class="innerDiv"><li><a href="${pageContext.request.contextPath}/boardBulletin/bulletinView?bulletin_num=${b_list.bulletin_num}&sort=2">${b_list.title}</a></li></div>
       
         </c:forEach>   
              <div align="right"><a href="${pageContext.request.contextPath }/boardBulletin/bulletinList?sort=2">
              more..</a>
              </div>
        </div>
      
      <%-- <div style="height: 215px; width: 570px; border: 1px solid lightgray;">
      <div id="notice" class="tabcontent" style="padding-bottom: 40px;">
         <!-- <p>공지사항</p> -->
         <table>
         <c:forEach var="n_list" items="${n_list}">
         <tr>
             <td align="left" style="width: 78%;"><div class="innerDiv"><ul><li>${n_list.title}</ul></li></div></td>
              <td align="right">${n_list.time}</td>
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
             <td align="left" style="width: 78%;"><div class="innerDiv"><ul><li>${b_list.title}</li></ul></div></td>
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
             <td align="left" style="width: 45%;"><div class="innerDiv" style="width: 300px;"><ul><li>${poll.poll_subject}</li></ul></div></td>
              <td>${poll.start_date}</td>
              <td>~${poll.end_date}</td>
         </tr>
         </c:forEach>   
         </table> 
      </div>

      <div style="width: 570px; position: relative; left: -2%;">
      <button class="tablink" onclick="openTab('notice', this, 'white','yellow')"
         id="defaultOpen">공지사항</button>
      <button class="tablink" onclick="openTab('event', this, 'white','yellow')">이달의 아이</button>
      <button class="tablink" onclick="openTab('bulletin', this, 'white','yellow')">자유게시판</button>
      <input type="button" value="설문조사" style="text-align: center;" class="tablink" onclick="openTab('poll', this, 'white','yellow')">
      </div>     
      </div> --%>
     
         <jsp:include
               page="/WEB-INF/views/fullcalendar/fullcalendar_mini.jsp" />
       
      
      
      </div>
      </section>

      
      <!-- 탭 스크립트 -->
      <script>
         function openTab(cityName, elmnt, color, bcolor) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
               tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
               tablinks[i].style.backgroundColor = "";
               //tablinks[i].style.borderColor = "";
            }
            document.getElementById(cityName).style.display = "block";
            
            

         }
         // Get the element with id="defaultOpen" and click on it
         document.getElementById("defaultOpen").click();
      </script>
   
   

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
   <script src="resources/js/index.js"></script>
</body>

</html>