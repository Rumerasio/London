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
	<title>마이페이지</title>
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
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container mt-5">
	sessSeq: <c:out value="${sessSeq }"/><br>
		sessId: <c:out value="${sessId }"/><br>
	<div style="text-align:center;">
		<h2 style="font-family: sans-serif;"><b>MyPage</b></h2>
		<div class="container" style="width: 300px; height: 300px; position: relative; top:150px;">
			<a href="/myPage/userViewMod"><button type="button" class="btn" style="font-family: 'Noto Sans KR';font-size:20px; background-image: url('/resources/images/antic.jpg'); width:190px;height:45px; position: absolute; top:-45px;left:0px;"><b>개인정보 수정</b></button></a>
			<a href="/myPage/favoriteList"><img alt="favoriteTest_btn" src="/resources/images/favorite.jpg" style="position: absolute; top:150px;left:-223px;"></a>
			<a href="/myPage/surveyRecord"><img alt="testRecord_btn" src="/resources/images/test_record.jpg" style="position: absolute; top:21px;right:-224px;"></a>
			<a href="/myPage/myComment"><img alt="Comment_btn" src="/resources/images/myComment.jpg" style="position: absolute; bottom:-108px;right:0px;"></a>
		</div>
	</div>
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
</script>
</body>
</html>
