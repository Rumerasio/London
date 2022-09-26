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
	<title>AdminMemberRecord</title>
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
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="./ZdminMain.html" style="display: inline-block;">S</a>
	</div>
</nav>
<div class="container" style="text-align: center;">
	<h4 style="position: relative; bottom: 50px;">관리자 페이지</h4>
</div>
<div class="row" style="width:1400px">
	<div class="col-2">
		<div class="pt-2" style="background-color: white; text-align: center;">
			<h6><b>이솔빈</b> 관리자님</h6>
			<a href="./ZdminLogin.html"><span style="font-size: 10px;">로그아웃</span></a>
		</div>
		<!-- 메뉴단 s -->
		<%@include file="../Menu.jsp" %>
		<!-- 메뉴단 e -->
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>회원관리</b></h5>
		<h6 style="color:gray;"><b>회원 상세 정보</b></h6>
		<div>
			<a href="./zdminMemberInfo.html"><button type="button" class="btn btn-sm" style="width:60px; font-size:10px; background-color:#e6e6e6;">뒤로가기</button></a>
		</div>
		<div class="p-5" style="background-color: white;">
			<div class="mt-3 pt-3"><h6>'<b>로제</b>' 회원 컨텐츠 기록</h6></div>
			<table class="table table-info table-striped mt-3">
			  <tr>
			  	<th style="width: 50px;">번호</th>
			  	<th>테스트이름</th>
			  	<th>결과</th>
			  	<th>일시</th>
			  </tr>
			  <tr>
			  	<td>1025</td>
			  	<td>별자리 테스트</td>
			  	<td>궁수자리</td>
			  	<td>2022.07.20 17:16:50</td>
			  </tr>
			  <tr>
			  	<td>1020</td>
			  	<td>꽃말 테스트</td>
			  	<td>장미</td>
			  	<td>2022.07.20 17:10:28</td>
			  </tr>
			  <tr>
			  	<td>1002</td>
			  	<td></td>
			  	<td></td>
			  	<td></td>
			  </tr>
			   <tr>
			  	<td>758</td>
			  	<td></td>
			  	<td></td>
			  	<td></td>
			  </tr>
			</table>	
		</div>	
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
</body>
</html>
