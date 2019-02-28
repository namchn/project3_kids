<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
[
   <c:forEach var="a" items="${list}" varStatus="stat">
      <c:if test="${not stat.first }">,</c:if>
      {'reply_num':${a.reply_num}, 'id':'${a.id}', 'time':'${a.time}', 'content':'${a.content}'}
   </c:forEach>
]