    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
   <c:forEach var="list" items="${list}" varStatus="stat">  <!-- varStatus속성변수의 이름 -->
       <c:if test="${not stat.first}">,</c:if>          <!-- 루프가 첫번째 실행이 아니면 (두번째것부터) ,를 찍다 -->
      {'poll_num':${list.poll_num },
      'poll_candidate':${list.poll_candidate },
      'poll_candidate_num':${list.poll_candidate_num },
      'id':${list.id } '}
   </c:forEach>
   
]
    