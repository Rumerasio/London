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
	<title>FindId</title>
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
	a[name=BtnToLogin] {
		cursor:pointer;
	}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container" style="background-color:white; text-align: center; position:relative; top:200px; width: 600px; padding-left:0px;padding-right: 0px;">
	<div>
		<ul class="nav nav-tabs">
			<li class="nav-item col-6">
				<button class="nav-link active find-tab col-12" id="find_ID_tab" data-bs-toggle="pill" data-bs-target="#find_ID" type="button">ID 찾기</button>
			</li>
	   		<li class="nav-item col-6">
	   			<button class="nav-link find-tab col-12" id="find_password_tab" data-bs-toggle="pill" data-bs-target="#find_password" type="button">비밀번호 찾기</button>
	   		</li>
   		</ul>
	</div>
	<div class="tab-content">
		<div class="tab-pane fade show active" id="find_ID" role="tabpanel">
			<div class="row p-1 mt-5">
				<div class="my-3 row justify-content-center">
				  <label for="dob" class="col-2 col-form-label">생년월일</label>
				  <div class="col-6">
				    <input type="text" class="form-control" id="dob" placeholder="ex)220101">
				  </div>
				</div>
				<div class="my-2 row justify-content-center">
				  <label for="email" class="col-2 col-form-label">이메일</label>
				  <div class="col-6">
				    <input type="text" class="form-control" id="email">
				  </div>
				</div>
				<div class="row mt-5 justify-content-center">
					<input type="button" class="btn" value="확인" data-bs-toggle="modal" data-bs-target="#find_ID_ID" style="background-color:#0072b3; color:white; width:180px;">
				</div>
				<div class="container pt-3 pb-5" style="font-size:14px;">
					<a name="BtnToLogin" onclick="toLoginPage()"><b>로그인 화면으로</b></a>
				</div>
				<div class="modal fade" id="find_ID_ID" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-body">
				        아이디는 'escaida15'입니다.
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary col-8 mx-auto" data-bs-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="find_password" role="tabpanel">
			<div class="row p-1 mt-5">
				<div class="my-3 row justify-content-center">
				  <label for="id" class="col-2 col-form-label">아이디</label>
				  <div class="col-6">
				    <input type="text" class="form-control" id="id">
				  </div>
				</div>
				<div class="my-3 row justify-content-center">
				  <label for="dob" class="col-2 col-form-label">생년월일</label>
				  <div class="col-6">
				    <input type="text" class="form-control" id="dob" placeholder="ex)220101">
				  </div>
				</div>
				<div class="my-2 row justify-content-center">
				  <label for="email" class="col-2 col-form-label">이메일</label>
				  <div class="col-6">
				    <input type="text" class="form-control" id="email">
				  </div>
				</div>
				<div class="row mt-5 justify-content-center">
					<input type="button" class="btn" value="확인"  data-bs-toggle="modal" data-bs-target="#find_password_initialize" style="background-color:#0072b3; color:white; width:180px;">
				</div>
				<div class="container pt-3 pb-5" style="font-size:14px;">
					<a name="BtnToLogin" onclick="toLoginPage()"><b>로그인 화면으로</b></a>
				</div>
				<div class="modal fade" id="find_password_initialize" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">비밀번호 재설정</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body mb-3 row">
					    <label for="newPassword" class="col-4 col-form-label my-1">비밀번호</label>
					    <div class="col-8">
					      <input type="password" class="form-control" id="newPassword">
					    </div>
					    <label for="inputPasswordCheck" class="col-4 col-form-label my-1">비밀번호 확인</label>
					    <div class="col-8">
					      <input type="password" class="form-control" id="inputPasswordCheck">
					    </div>
					  </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary col-8 mx-auto" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#find_password_initialize_alert">재설정</button>
				      </div>
				    </div>
				  </div>
				</div>
				<div class="modal fade" id="find_password_initialize_alert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-body">
				        비밀번호가 재설정되었습니다.
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary col-8 mx-auto" data-bs-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function toLoginPage(){
		$(location).attr("href","/loginPage");
	}
</script>
</body>
</html>
