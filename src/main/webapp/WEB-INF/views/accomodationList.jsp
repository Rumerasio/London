<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="uTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>main</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>

<body>
accomodationList

<br>aaa : <c:out value="${status }"/>
<br>aaa : <c:out value="${total }"/>
<br>aaa : <c:out value="${fn:length(data) }"/>

<c:forEach items="${data}" var="item" varStatus="status">
	<c:out value="${item.num }"/>
	<br><c:out value="${item.shop }"/>	
	<br><c:out value="${item.address }"/>	
	<br><c:out value="${item.tel }"/>	
	<br><c:out value="${item.korean_style }"/>
	<br><c:out value="${item.western_style }"/>	
</c:forEach>

</body>
</html>