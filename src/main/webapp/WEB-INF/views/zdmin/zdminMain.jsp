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
	<title>AdminMain</title>
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
<%@include file="Logo.jsp" %>
<!-- 로고단 e -->
<div class="container" style="text-align: center;">
	<h4 style="position: relative; bottom: 50px;">관리자 페이지</h4>
</div>
<div class="row" style="width:1400px">
	<div class="col-2">
		<!-- 로그인정보태그단 s -->
		<%@include file="zdminTag.jsp" %>
		<!-- 로그인정보태그단 e -->
		<!-- 메뉴단 s -->
		<%@include file="Menu.jsp" %>
		<!-- 메뉴단 e -->
	</div>
	<div class="col-10">
		<div class="row">
			<div class="col-4">
				<div class="container col-10" style="background-color:#99CAE9; height:320px; text-align: center;">
					<a href="/content/contentList" style="color:white;">
						<div class="py-5">
							<span style="font-size: 24px;"><b>콘텐츠 수</b></span><br>
							<span style="color:black; font-size: 80px;"><i class="fa-regular fa-clipboard"></i></span><br>
							<span style="font-size: 20px;"><b>5개</b></span>
						</div>
					</a>
				</div>
			</div>
			<div class="col-4">
				<div class="container col-10" style="background-color:#C8ADD8; color:white; height:320px; text-align: center;">
					<a href="/member/memberList" style="color:white;">
						<div class="py-5">
							<span style="font-size: 24px;"><b>신규회원수</b></span><br>
							<span style="color:black; font-size: 80px;"><i class="fa-regular fa-id-card"></i></span><br>
							<span style="font-size: 20px;"><b>1명</b></span>
						</div>
					</a>
				</div>
			</div>
			<div class="col-4">
				<div class="container col-10" style="background-color:#EABE95; color:white; height:320px; text-align: center;">
					<a href="/member/memberComment" style="color:white;">
						<div class="py-5">
							<span style="font-size: 24px;"><b>오늘의 댓글수</b></span><br>
							<span style="color:black; font-size: 80px;"><i class="fa-regular fa-comment"></i></span><br>
							<span style="font-size: 20px;"><b>3개</b></span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
</body>
</html>
