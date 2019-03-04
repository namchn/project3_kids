<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
#plusfriend-addfriend-button>a>img{
width: 130px;
}
</style>
</head>
<body class="default">

<footer>
      <div class="MOD_FOOTER2" data-theme="_bgd">
         <div data-layout="_r">
            <!-- <div data-layout="al16 ch8 ch-o1 ec-third ec-o1">
               <h3>Links</h3>
               <nav>
                  <ul>
                     <li><a href="#" class="f" style="color: white;">Footer Link 1</a></li>
                     <li><a href="#" class="f" style="color: white;">Footer Link 2</a></li>
                     <li><a href="#" class="f" style="color: white;">Footer Link 3</a></li>
                     <li><a href="#" class="f" style="color: white;">Footer Link 4</a></li>
                     <li><a href="#" class="f" style="color: white;">Footer Link 5</a></li>
                  </ul>
               </nav>
            </div> -->
            <div data-layout="al16 ch8 ch-o1 ec-third ec-o1">
            <div id="plusfriend-addfriend-button" style="margin-top: 50px;"></div>
<script type='text/javascript'>
  //<![CDATA[
    
    Kakao.init('b252e724ff8dc026ff00d1148871176b');
   
    Kakao.PlusFriend.createAddFriendButton({
      container: '#plusfriend-addfriend-button',
      plusFriendId: '_iKxcxej' 
    });
  //]]>
</script>

             </div>
            <div data-layout="al16 ch-o3 ec-third ec-o2">
               <h3 style="color: #A6A6A6;">Contact</h3>
               <p>
                  Email : <a href="mailto:#" class="f" style="color: #A6A6A6; font-size:13px;">kitriChild@email.com</a><br>
                  TEL 대표전화 : 02)1234-1234<br>
                  FAX 팩스 : 02)4567-4567
               </p>
               <p>Copyright &copy; 2019 Company</p>
            </div>
            <div data-layout="al16 ch8 ch-o2 ec-third ec-o3">
               <h3>Address</h3>
               <address>
                  	서울시 구로구 디지털로 34길 43<br>
					코오롱사이언스벨리 1차 4층
               </address>
            </div>
         </div>
      </div>
   </footer>
</body>
</html>