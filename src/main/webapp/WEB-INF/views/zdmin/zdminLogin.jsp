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
	<title>AdminLogin</title>
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
<%@include file="Logo.jsp" %>
<div class="container" style="text-align: center;">
	<h4 style="position: relative; bottom: 50px;">관리자 페이지</h4>
</div>

<div class="container col-4" style="width:300px;background-color:white; text-align: center; position:relative; top:150px;">
	<div class="pt-3">
		<h5><b>관리자 로그인</b></h5>
	</div>
	<form method="post" name="myForm">
		<div class="row justify-content-center mt-3">
			<div class="col-1 offset-1 px-1" style="font-size: 22px;"><i class="fa-solid fa-user"></i></div>
			<div class="col-9 mb-3">
			  <input type="text" class="form-control" id="id" name="id" placeholder="ID" value="leejong">
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-1 offset-1 px-1" style="font-size: 22px;"><i class="fa-solid fa-key"></i></div>
			<div class="col-9 mb-3">
			  <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="l22j0ng">
			</div>
		</div>
	</form>
	<div class="pt-2 pb-4">
		<button type="button" class="btn btn-secondary" id="btnZdminLogin" style="width: 60px; font-size: 11px;">로그인</button>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	var goUrlMain = "/zdminMain"
	
	$("#btnZdminLogin").on("click",function(){
		
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "/zdminLoginProc"
			,data : { "id" : $("#id").val(), "password" : $("#password").val()}
			,success: function(response) {
				if(response.rt == "idfail"){
					alert("존재하지 않는 계정입니다.");
				} else if(response.rt =="passwordfail"){
					alert("비밀번호가 일치하지 않습니다.");
				} else if(response.rt =="success"){
					$(location).attr("href",goUrlMain);
				} else {
					alert("뭔데");
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	});
</script>
</body>
</html>
