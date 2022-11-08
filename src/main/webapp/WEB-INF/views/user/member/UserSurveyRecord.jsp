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
	<title>참여테스트 기록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<style type="text/css">
	/* 폰트: Edu NSW ACT Foundation, sans-serif, Noto Sans KR */
	@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Edu+NSW+ACT+Foundation:wght@700&family=Noto+Sans+KR:wght@500&display=swap');
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
	table, th, td {
		border: solid;
		border-width: 1px;
	}
	th, td {
		text-align: center;
	}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container my-5">
	<div style="text-align:center; position:relative;">
		<button type="button" id="btnMypage" class="btn btn-sm" style="position:absolute; left:0px; width: 80px; background-color:#e6e6e6;">뒤로가기</button>
		<h3 style="font-family: sans-serif;"><b><i class="fa-solid fa-clock-rotate-left"></i> 참여테스트 기록</b></h3>
	</div>
	<form method="post" name="formList">
		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
		<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
		<table class="table table-striped mt-5">
		  <tr>
		  	<th style="width: 50px;">번호</th>
		  	<th>테스트 이름</th>
		  	<th>결과</th>
		  	<th>날짜</th>
		  </tr>
			<c:choose>
				<c:when test="${fn:length(list) eq 0 }">
					<tr>
						<td colspan="4" style="text-align: center;">테스트 기록이 없습니다.</td>
					</tr>
				</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="list" varStatus="status">
					<tr>
						<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
						<%-- <td><c:out value="${list.srcSeq }"></c:out></td> --%>
						<td><c:out value="${list.survey }"></c:out></td>
						<td><c:out value="${list.resultTitle }"></c:out></td>
						<td><c:out value="${list.datetime }"></c:out></td>
					</tr>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		<!-- pagination s -->
		<%@include file="../../commoncode/pagination.jsp"%>
		<!-- pagination e -->
	</form>
	<!-- <nav class="nav justify-content-center mt-4">
	  <ul class="pagination pagination-sm">
	  	<li class="page-item">
	      <a class="page-link" href="#" style="background-color:#c6c6c6;">
	        <span><i class="fa-solid fa-backward-step"></i></span>
	      </a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous" style="background-color:#c6c6c6;">
	        <span><i class="fa-solid fa-chevron-left"></i></span>
	      </a>
	    </li>
	    <li class="page-item active"><a class="page-link" href="#" style="background-color:#c6c6c6;">1</a></li>
	    <li class="page-item"><a class="page-link" href="#" style="background-color:#c6c6c6;">2</a></li>
	    <li class="page-item"><a class="page-link" href="#" style="background-color:#c6c6c6;">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next" style="background-color:#c6c6c6;">
	        <span aria-hidden="true"><i class="fa-solid fa-chevron-right"></i></span>
	      </a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="#" style="background-color:#c6c6c6;">
	        <span><i class="fa-solid fa-forward-step"></i></span>
	      </a>
	    </li>
	  </ul>
	</nav> -->
</div>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var sessVal = '<%=(String)session.getAttribute("sessSeq")%>';
		if(sessVal == '' || sessVal =='null'){
			alert('세션이 만료되어 로그인 창으로 이동됩니다.');
			location.href='/loginPage'
		}
	});
	
	var goUrlMypage = "/myPage";
	var goUrlList ="/myPage/surveyRecord";
	
	var form = $("form[name=formList]");
	
	$("#btnMypage").on("click", function(){
		$(location).attr("href",goUrlMypage);
	});
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}
</script>
</body>
</html>
