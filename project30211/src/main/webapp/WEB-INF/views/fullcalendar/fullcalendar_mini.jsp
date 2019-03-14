<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- <META HTTP-EQUIV="refresh" CONTENT="60"> -->
</head>

<link rel='stylesheet' href='${pageContext.request.contextPath }/resources/fullcalendar/fullcalendar.css?ver=1' />
<script src='${pageContext.request.contextPath }/resources/fullcalendar/lib/jquery.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/fullcalendar.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/lang/ko.js'></script>


<script type="text/javascript">


var id_id = 'manager'; //num는 jsp에서 id로 구분하기 위해 사용된다. id_id가 진짜 아이디 
//var roomname = '${roomname}';
//var username = '${username}';
//var chief = '${chief}';
//console.log(roomname);
//console.log(username);
var mana = "${sessionScope.id}";
console.log(mana);

var events_array = [];


//getAll =================================
$.ajax({
    type: 'POST',
    url: "${pageContext.request.contextPath }/fullcalendar/calJsonAll",
    data:{
       //"roomname": roomname
    },
    success: function(data) {//json data
      var list = JSON.parse(data);
      //console.log(data);
      for(var i = 0 ; i<list.length; i++){
         var start_date = new Date(list[i].start_date);
         var end_date = new Date(list[i].end_date);
         
         
         var row = {
               calnum: list[i].num+"",
               id_id: list[i].id+"",
               id: list[i].num+"",
               title: list[i].event+"",
               start: moment(list[i].start_date),
               end: moment(list[i].end_date)
         };
         
         row.color = 'grey';
      /*    if((list[i].username+"") == username ){
            row.color = 'red';
         } */
         
         if((end_date-start_date)%86400000 == 0){
            row.allDay = true
         }
         
               events_array.push(row); // set default event
         
      } //for end
      
       

  // Create calendar when document is ready
  $(document).ready(function() {
     

       $('#calendar').fullCalendar('option', 'aspectRatio', 1);
     
    // We will refer to $calendar in future code
    var $calendar = $("#calendar").fullCalendar({ //start of options

        //weekends : false, // do not show saturday/sunday

        header: {
          //left: 'prevYear,nextYear',
          //center: 'title',
          right: 'today,month prev,next'
        },
        // Make possible to respond to clicks and selections
        selectable: true,
        // allow "more" link when too many events
        eventLimit: true,
        navLinks: true,
        // Make events editable, globally
        editable: true,
        
        //defaultView: 'listWeek',
        
      //Drop =================================
        eventDrop: function(event, delta, revertFunc) {
           console.log(event);

              if (mana == id_id) {
                 
                 if(confirm("정말 변경하시겠습니까?")){
                    /* var data = {
                              calnum: event.num,
                                title: event.title,
                                start: event.start,
                                end: event.end,
                                id: event.id
                              };
                      console.log(data); */
                      $.ajax({
                          type: 'POST',
                          url: "${pageContext.request.contextPath }/fullcalendar/fullcalendarEdit",
                          data: {
                            //"event": JSON.stringify(data),
                              "num": event.calnum,
                          //"num": event.id,
                             "event": event.title,
                         "start_date": JSON.stringify(event.start).substring(1,11),
                         "end_date": JSON.stringify(event.end).substring(1,11),
                          "id": event.id_id,
                          },
                          success: function(data) {
                           console.log(data);
                              // Call the "updateEvent" method
                              $calendar.fullCalendar("updateEvent", event);
                              
                              return;
                          }
                        });
                 }else{
                        revertFunc();
                       return;   
                      }
                      
                    
               }else{
                    console.log("관리자만 변경할 수 있습니다.");
                   //alert("관리자만 변경할 수 있습니다.")
                    revertFunc();
                   return;                  
                  
               }


        },
        
        eventResize: function(event, delta, revertFunc) {
           console.log(event);
        
          if (mana == id_id) {
             
             if(confirm("정말 변경하시겠습니까?")){
             /*    var data = {
                          calnum: event.calnum,
                            title: event.title,
                            start: event.start,
                            end: event.end
                          };
                  console.log(data); */
                  console.log(event.title);
                  $.ajax({
                      type: 'POST',
                      url: "${pageContext.request.contextPath }/fullcalendar/fullcalendarEdit",
                      data: {
                        //"event": JSON.stringify(data),
                              "num": JSON.stringify(event.calnum).split('"')[1],
                            "event": JSON.stringify(event.title).split('"')[1],
                      "start_date": JSON.stringify(event.start).substring(1,11),
                       "end_date": JSON.stringify(event.end).substring(1,11),
                        "id": JSON.stringify(event.id_id).split('"')[1],
                      },
                      success: function(data) {
                       console.log(data);
                          // Call the "updateEvent" method
                          $calendar.fullCalendar("updateEvent", event);
                          console.log(event);
                          return;
                      }
                    });
             }else{
                    revertFunc();
                   return;   
                  }
                  
                
           }else{
              console.log("관리자만 변경할 수 있습니다.");
               //alert("관리자만 변경할 수 있습니다.")
                revertFunc();
               return;                  
              
           }

        },
        //This is the callback that will be triggered when a selection is made
        /*select: function(start, end, jsEvent, view) {
          alert(start.format("MM/DD/YYYY hh:mm a") + " to " + end.format("MM/DD/YYYY h\
          h:mm a") + " in view " + view.name);
        },*/


        eventRender: function(event, element, view) {
           console.log(event);
                 if (view.name == 'listDay') {
                    element.find(".fc-list-item-time").append("<span class='closeon'>**</span>");
                 } else {
                    element.find(".fc-content").prepend("<span class='closeon'>**</span>");
                 }
                   element.find(".closeon").on('click', function(e) {
                      
                      
                      if (mana == id_id) {
                         
                         if(confirm("정말 삭제하시겠습니까?")){
                            
                            var data = {
                                  num: event.calnum,
                                        title: event.title,
                                        start: event.start,
                                        end: event.end
                                      };
                                
                                $.ajax({
                                    type: 'POST',
                                    url: "${pageContext.request.contextPath }/fullcalendar/fullcalendardelete",
                                    data: {
                                      //"event": JSON.stringify(data),
                                        "num": event.calnum,
                                    },
                                    success: function(data) {
                                       //console.log(data);
                                     $('#calendar').fullCalendar('removeEvents',event._id);
                              console.log(event._id);
                                    }
                                  });
                                 e.stopPropagation();
                                 return;
                              
                         }else{
                            e.stopPropagation();
                                 return;   
                              }
                              
                            
                       }else{
                          
                          e.stopPropagation();
                          console.log("관리자만 변경할 수 있습니다.");
                          //alert("관리자만 삭제하실 수 있습니다.")
                             return;                  
                          
                       }      
                      
                      
                    });
              },


        select: function(start, end, jsEvent, view) {
           console.log(event);
           if (mana == id_id) {
          // Ask for a title. If empty it will default to "New event"
          var title = prompt("Enter a title for this event", "New event");
          // If did not pressed Cancel button
          if (title != null) {
            // Create event
            var data = {
              'event': title.trim() != "" ? title : "New event",
              'start_date': start,
              'end_date': end,
              //'roomname': roomname,
              'id_id': id_id
              
            };
            console.log(list);
            console.log(JSON.stringify(start).substring(1,11));
          //console.log(JSON.stringify(start).split('"')[1]);
          
            $.ajax({
              type: 'POST',
              url: "${pageContext.request.contextPath }/fullcalendar/fullcalendarJoin",
              data: {
                //"event": JSON.stringify(data),
                 "event": title,
              "start_date": JSON.stringify(start).substring(1,11),
              "end_date": JSON.stringify(end).substring(1,11),
               "id": id_id,
              },
              success: function(data) {
                 //console.log(data);
                 var list2 =eval("("+data+")"); //object형태
                 var list1 = JSON.parse(data); //  Array  형태
                 
               /*    var event = {
                        'calnum': data,
                          'title': title.trim() != "" ? title : "New event",
                          'start': start,
                          'end': end,
                          'username': username,
                          'color': 'red'
                        }; */
                  var event = {
                        'calnum': list1.num,
                          'title': list1.event != "" ? list1.event : "New event",
                          'start': list1.start_date,
                          'end': list1.end_date,
                          'id_id': list1.id,
                          'id': list1.num,
                          
                        }; 
                  
                  
                  
                  
                  console.log(event);
                $calendar.fullCalendar("renderEvent", event, true);
              }
            });


            // Push event into fullCalendar's array of events
            // and displays it. The last argument is the
            // "stick" value. If set to true the event
            // will "stick" even after you move to other
            // year, month, day or week.

          };
          // Whatever happens, unselect selection
          $calendar.fullCalendar("unselect");
          
            }else{
                console.log("관리자만 변경할 수 있습니다.");
               //alert("관리자만 변경할 수 있습니다.")
                //revertFunc();
               return;                  
             } 
        }, // End select callback

        // Callback triggered when we click on an event
        eventClick: function(event, jsEvent, view) {
           console.log(event);
           
          if (mana == id_id) {
             
             
             // Ask for a title. If empty it will default to "New event"
                 var newTitle = prompt("변경할 제목을 입력해 주세요", event.title);

                 // If did not pressed Cancel button
                 if (newTitle != null) {
                   // Update event
                   event.title = newTitle.trim() != "" ? newTitle : event.title;//?
                   
                     var data = {
                           calnum: event.calnum,
                             title: event.title,
                             start: event.start,
                             end: event.end
                           };
                   
                    console.log(event.calnum);
                     console.log(event.title);
                    console.log(JSON.stringify(event.start).substring(1,11));
                    console.log(event.id);
                    
                   $.ajax({
                       type: 'POST',
                       url: "${pageContext.request.contextPath }/fullcalendar/fullcalendarEdit",
                       data: {
                         //"event": JSON.stringify(data),
                          "num": event.calnum,
                           "event": event.title,
                      "start_date": JSON.stringify(event.start).substring(1,11),
                       "end_date": JSON.stringify(event.end).substring(1,11),
                        "id": event.id_id,
                       },
                       success: function(data) {
                      //console.log(data);
                           // Call the "updateEvent" method
                           $calendar.fullCalendar("updateEvent", event);
                       }
                     });
                 }else{
                    revertFunc();
                   return;    
                 }
             
           }else{
                console.log("관리자만 변경할 수 있습니다.");
               //alert("관리자만 변경할 수 있습니다.");
                revertFunc();
               return;    
           }
       
           
        }, // End callback eventClick
        events: events_array
      } //End of options
    );
    
  });//$ready
  
   //console.log(events_array);
    }
    
  });//ajax end

  
</script>

<style media="screen">
  #calendar {
    width: 90%;
    display: block;
    margin-left: auto;
    margin-right: auto;
    padding-top: 20px;
     border: solid 1px lightgray; 
    background-color: #fff0ff78;
      }

  .centered {
    text-align: center;
  }
  
   #calendar .fc-left h2{
  font-size: 10em;
  } 
  
     #calendar .fc-right button{
  font-size: 2em;
  } 
  
/*       #calendar .fc-right button{
  font-size: .4em;
  }  */
  
    #calendar .fc-body a{
  font-size: 0.5em;
  }   
/*   @media only screen and (max-width: 1300px) {
  #calendar{
    display: none;
  }
} */
  
  
</style>

<body>

<!-- 접속자 아이디 -->
 <input type="hidden" name=manag value="${sessionScope.id}">

  <!-- The calendar container -->
  <div id="calendar"  style="width: 25%; text-align: right; font-size: 0.1em;">
  <button id="viewcal" style="background-color: grey;color:white">크게보기</button></div>  
  
  <!-- font-size: 0.1em; -->
<!--   <div id="callist"  style="width: 60%; height: 60%; text-align: left; 
        margin-top:5%; margin-left:20%;"></div> -->
  <!-- Calendar creation script -->
  <!-- <script src="fcbasic.js"></script> -->


<!-- <p id="maincal1">f</p> -->
<script type="text/javascript">
$(document).ready(function(){
   $("#viewcal").on("click",function(){
      //alert("sndj");
      location.href="${pageContext.request.contextPath }/fullcalendar/fullcalendarAll";
   });
});

function cal(){
   location.href="http://www.daum.net";
}
</script>
</body>

<!-- <script type="text/javascript">
var title =$(".fc-left");
console.log(title);
</script>
 -->

</html>