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
		<a class="navbar-brand" id="logo" href="./mainLogedin.html">Simsim</a>
	</div>
</nav>
<div class="container my-5">
	<div style="text-align:center; position:relative;">
		<a href="./memberMypage.html"><button type="button" class="btn btn-sm" style="position:absolute; left:0px; width: 80px; background-color:#e6e6e6;">뒤로가기</button></a>
		<h3 style="font-family: sans-serif;"><b><i class="fa-solid fa-clock-rotate-left"></i> 참여테스트 기록</b></h3>
	</div>
	<table class="table table-striped mt-5">
	  <tr>
	  	<th style="width: 50px;">번호</th>
	  	<th>테스트 이름</th>
	  	<th>결과</th>
	  	<th>날짜</th>
	  </tr>
	  <tr>
	  	<td>13</td>
	  	<td>별자리 테스트</td>
	  	<td>궁수자리</td>
	  	<td>2022.07.20 17:16:50</td>
	  </tr>
	  <tr>
	  	<td>12</td>
	  	<td>꽃말 테스트</td>
	  	<td>장미</td>
	  	<td>2022.07.20 17:10:28</td>
	  </tr>
	  <tr>
	  	<td>11</td>
	  	<td></td>
	  	<td></td>
	  	<td></td>
	  </tr>
	   <tr>
	  	<td>10</td>
	  	<td></td>
	  	<td></td>
	  	<td></td>
	  </tr>
	</table>
	<nav class="nav justify-content-center mt-4">
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
	</nav>
</div>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
</body>
</html>
