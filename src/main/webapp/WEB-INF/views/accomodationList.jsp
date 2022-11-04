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

<p>지하철</p>
<br>aaa : <c:out value="${currentCount }"/>
<br>aaa : <c:out value="${matchCount }"/>
<br>aaa : <c:out value="${page }"/>
<br>aaa : <c:out value="${perPage }"/>
<br>aaa : <c:out value="${totalCount }"/>
<p>대구 우수 숙박</p>
<br>aaa : <c:out value="${status }"/>
<br>aaa : <c:out value="${total }"/>
<br>aaa : <c:out value="${fn:length(data) }"/>

<p>데이터 표기</p><br>
<c:forEach items="${status}" var="item" varStatus="status">
	<c:out value="${item.name }"/> : <c:out value="${item.value }"/><br>	
	<%-- <br><c:out value="${item.address }"/>	
	<br><c:out value="${item.tel }"/>	
	<br><c:out value="${item.korean_style }"/>
	<br><c:out value="${item.western_style }"/>	 --%>
</c:forEach>

<c:forEach items="${status2}" var="item2" varStatus="status">
	<c:out value="${item2.name }"/> : <c:out value="${item2.value }"/><br>	
</c:forEach>

<c:forEach items="${status3}" var="item3" varStatus="status">
	<c:out value="${item3.name }"/> : <c:out value="${item3.value }"/><br>	
</c:forEach>

</body>
</html>