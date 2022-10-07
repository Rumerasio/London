<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>LoginPage</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Edu+NSW+ACT+Foundation:wght@700&display=swap');
	body {
	background-color: rgba(0, 86, 102, 0.07);
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
	#btnFindId, #btnFindPassword{
		cursor:pointer;
	}
	#btnFindId:hover, #btnFindPassword:hover{
		color:blue;
	}
</style>

<body>

<div class="container col-6 rounded-5" style="background-color:rgba(255, 51, 153, 0.16); text-align: center; position:relative; top:200px;">
	<form class="row g-3 p-1" method="post"  id="myForm" name="myForm">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
		<div class="row justify-content-center pt-5">
			<div class="form-floating mb-3" style="width:340px;">
			  <input type="text" class="form-control" id="id" name="id" placeholder="id" value="escaida15">
			  <label for="id" style="text-align:left;">아이디</label>
			</div>
		</div>
		<div class="row justify-content-center pb-3">
			<div class="form-floating" style="width:340px;">
			  <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="1q2w3e4r">
			  <label for="password" style="text-align:left;">비밀번호</label>
			</div>
		</div>
		<div class="row mb-3">
			<span><button type="button" class="btn" id="btnLogin" name="btnLogin" style="background-color:rgb(197, 59, 222); color:white; width:320px;">로그인</button></span>
		</div>
		<div class="row mb-3">
			<span><button type="button" id="btnForm" class="btn btn-secondary" style="width:320px;">회원가입</button></span>
		</div>
	</form>
	<div class="container pb-5" style="font-size:14px;"><a id="btnFindId">아이디</a> / <a id="btnFindPassword">비밀번호 찾기</a></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	var goUrlMain = "/";
	var goUrlFind = "/findLoginInfo";
	var goUrlRegist = "/register";
	
	$("#btnLogin").on("click", function(){
/* 			if(validation() == false) return false; */
			
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "/loginProc"
				/* ,data : $("#formLogin").serialize() */
				,data : { "id" : $("#id").val(), "password" : $("#password").val()}
				,success: function(response) {
					if(response.rt == "success") {
						/* if(response.changePwd == "true") {
							location.href = URL_CHANGE_PWD_FORM;
						} else { */
							$(location).attr("href",goUrlMain);
						/* } */
					} else {
						alert("회원없음");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		});
	
	$("#btnFindId").on("click", function(){
    	$(location).attr("href",goUrlFind);
    });
	
	$("#btnFindPassword").on("click", function(){
    	$(location).attr("href",goUrlFind);
    });
	
	$("#btnForm").on("click", function(){
    	$(location).attr("href",goUrlRegist);
    });
</script>
</body>
</html>
