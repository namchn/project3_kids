<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="allc" items="${allc }" varStatus="stat">
<c:if test="${not stat.first }">,</c:if>
{"num":${allc.num }, "id":"${allc.id }", 
"start_date":"${allc.start_date }", "end_date":"${allc.end_date }",
"event":"${allc.event }"}
</c:forEach>
]