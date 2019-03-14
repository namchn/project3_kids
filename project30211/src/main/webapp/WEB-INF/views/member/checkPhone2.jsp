<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    [
    <c:forEach var="list" items="${list}" varStatus="stat">
    <c:if test="${not stat.first }">,</c:if>
       {
        'flag':${flag}, 
        'stu_name':'${list.stu_name}',
        'stu_group':'${list.stu_group}'
       }
    </c:forEach>
    ]
     <!-- json / 객체(배열X) -->
