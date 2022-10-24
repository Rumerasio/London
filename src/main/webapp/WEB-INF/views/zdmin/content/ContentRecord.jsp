<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="uTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>AdminContentRecord</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Edu+NSW+ACT+Foundation:wght@700&display=swap');
	body {
	background-color: rgba(0, 86, 102, 0.07);
	}
	#topNav{
		background-color:white;
		border-bottom: solid;
		border-bottom-color: gray;
		border-bottom-width: thin;
	}
	#logo{
	font-size: 40px;
	font-family: Edu NSW ACT Foundation;
	color:rgb(197, 59, 222);
	}
	a{
	text-decoration: none;
	color:black;
	}
	li{
		padding-top:5px;
		padding-bottom:5px;
	}
</style>

<body>
<!-- 로고단 s -->
<%@include file="../Logo.jsp" %>
<!-- 로고단 e -->
<div class="container" style="text-align: center;">
	<h4 style="position: relative; bottom: 50px;">관리자 페이지</h4>
</div>
<div class="row" style="width:1400px">
	<div class="col-2">
		<!-- 로그인정보태그단 s -->
		<%@include file="../zdminTag.jsp" %>
		<!-- 로그인정보태그단 e -->
		<!-- 메뉴단 s -->
		<%@include file="../Menu.jsp" %>
		<!-- 메뉴단 e -->
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>컨텐츠 관리</b></h5>
		<h6 style="color:gray;"><b>컨텐츠 이용내역</b></h6>
		<div>
			<div class="mt-3 pt-3"><h6><b>전체 컨텐츠 이용내역</b></h6></div>
			<table class="table table-striped table-hover mt-3">
			  <tr>
			  	<th style="width: 50px;">번호</th>
			  	<th>닉네임</th>
			  	<th>UserId</th>
			  	<th>테스트이름</th>
			  	<th>점수</th>
			  	<th>결과</th>
			  	<th>일시</th>
			  </tr>
			  <c:choose>
			  	<c:when test="${fn:length(list) eq 0}">
			  		<tr>
			  			<td colspan="6"> There is no date</td>
			  		</tr>
			  	</c:when>
			  	<c:otherwise>
			  		<c:forEach items="${list}" var="list" varStatus="status">
			  			<tr>
						  	<td><c:out value="${list.srcSeq }"/></td>
						  	<td><c:out value="${list.nickname }"/></td>
						  	<td><c:out value="${list.id }"/></td>
						  	<td class="comment_SurveyName"><c:out value="${list.survey }"/></td>
						  	<td><c:out value="${list.totalScore }"/></td>
						  	<td class="comment_content"><c:out value="${list.resultTitle }"/></td>
						  	<td><c:out value="${list.datetime }"/></td>
						  </tr>
			  		</c:forEach>
			  	</c:otherwise>
			  </c:choose>
			</table>	
		</div>	
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
</body>
</html>
