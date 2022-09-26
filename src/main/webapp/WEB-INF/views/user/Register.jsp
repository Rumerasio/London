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
	<title>RegisterPage</title>
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
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="./mainLogedin.html">Simsim</a>
	</div>
</nav>
<div class="container col-6 rounded-5" style="background-color:rgba(255, 51, 153, 0.16); text-align: center; position:relative; top:150px;">
	<form class="g-3 p-1" method="post" id="myForm" name="myForm" autocomplete="off">
		<input type="hidden" name="delNy" id="delNy" value=0>
		<h4 class="pt-4">회원가입</h4>
		<div class="row justify-content-center mt-5">
			<div class="col-7 mb-3">
			  <input type="text" class="form-control" placeholder="닉네임" id="nickname" name="nickname">
			</div>
			<div class="col-7 mb-3">
			  <input type="text" class="form-control" placeholder="생년월일 ex)891114" id="dob" name="dob">
			</div>
			<div class="col-7 mb-3">
			  <select class="form-select" id="gender" name="gender">
			  	<option selected>성별</option>
			  	<option value="101">남성</option>
			  	<option value="102">여성</option>
			  </select>
			</div>
			<div class="col-7 mb-3">
			  <input type="text" class="form-control" placeholder="이메일" id="email" name="email">
			  <!-- 뒷부분 SELECT로 받고 @ 기점으로 분리할 것 -->
			</div>
			<div class="col-7 mb-3">
			  <input type="text" class="form-control" placeholder="아이디" id="id" name="id">
			</div>
			<div class="col-7 mb-3">
			  <input type="password" class="form-control" placeholder="비밀번호" id="password" name="password">
			</div>
			<div class="col-7 mb-3">
			  <input type="password" class="form-control" placeholder="비밀번호 확인">
			  <input type="text" class="form-control-plaintext" value="비밀번호가 일치합니다" style="font-size: 10px;">
			</div>
		</div>
		<div class="row mb-3">
			<span><button type="button" class="btn" id="btnReg" style="background-color:rgb(197, 59, 222); color:white; width:320px;">계정 생성</button></span>
		</div>
	</form>
	<div class="container pb-5" style="font-size:14px;">
		<p>이미 계정이 있으신가요?</p>
		<a href="/login"><b>로그인 화면으로</b></a>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	var goUrlInst = "/userReg";				/* #-> */
	
	var form = $("form[name=myForm]");
	
	$("#btnReg").on("click",function(){
		form.attr("action",goUrlInst).submit();
	});
	
</script>
</body>
</html>
