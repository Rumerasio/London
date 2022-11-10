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
	<title>시작</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<style type="text/css">
	body {
		height: 100vh;
		background-image: url("/resources/images/start6.jpg"); ;
	    background-size: cover;
	    display: flex; 
	    align-items: center;
	}
</style>

<body>

	<!-- <div class="mx-auto row">
		<div class="card text-bg col-4 offset-1 position-relative">
		  <img src="/resources/images/adminPage.png" class="card-img" alt="...">
		  <div class="card-img-overlay">
		    <h2 class="card-title text-center position-absolute bottom-0" style="left: 30px;">관리자 페이지</h2>
		  </div>
		</div>
		<div class="card text-bg col-4 offset-2 position-relative">
		  <img src="/resources/images/userPage.png" class="card-img" alt="...">
		  <div class="card-img-overlay">
		    <h2 class="card-title text-center position-absolute bottom-0" style="left: 30px;">Simsim 홈페이지</h2>
		  </div>
		</div>
	</div> -->
<div class="table mx-auto row">
	<div class="card text-bg col-4 offset-1 position-relative">
		<a href="/">
		  <img src="/resources/images/userPage.PNG" class="card-img" alt="userPage">
		  <div class="card-img-overlay">
		    <h2 class="card-title text-center position-absolute bottom-0" style="left: 30px;">사용자 홈페이지</h2>
		  </div>
		</a>
	</div>
	<div class="card text-bg col-4 offset-2 position-relative">
		<a href="/zdminLogin">
		  <img src="/resources/images/adminPage.PNG" class="card-img" alt="adminPage">
		  <div class="card-img-overlay">
		    <h2 class="card-title text-center position-absolute bottom-0" style="left: 30px;">관리자 페이지</h2>
		  </div>
		</a>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
