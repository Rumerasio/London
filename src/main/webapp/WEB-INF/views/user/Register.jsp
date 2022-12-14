<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>RegisterPage</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script defer type="text/javascript" src="/resources/zdmin/js/validationZdmin.js"></script>
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
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container col-6 rounded-5" style="background-color:rgba(255, 51, 153, 0.16); text-align: center; position:relative; top:150px;">
	<form class="g-3 p-1" method="post" id="myForm" name="myForm" autocomplete="off">
		<input type="hidden" id="idAllowedNy" name="idAllowedNy" value="0">
		<input type="hidden" id="emailAllowedNy" name="emailAllowedNy" value="0">
		<input type="hidden" name="seq" id="seq" value="0">
		<input type="hidden" name="delNy" id="delNy" value=0>
		<h4 class="pt-4">회원가입</h4>
		<div class="row justify-content-center mt-5">
			<div class="col-7 mb-3">
			  <input type="text" class="form-control" placeholder="닉네임" id="nickname" name="nickname">
			  <div class="invalid-feedback" id="nicknameFeedback"></div>
			</div>
			<div class="col-7 mb-3">
			  <input type="text" class="form-control" placeholder="생년월일 ex)891114" id="dob" name="dob">
			  <div class="invalid-feedback" id="dobFeedback"></div>
			</div>
			<div class="col-7 mb-3">
			  <select class="form-select" id="gender" name="gender">
			  	<option value="" selected>성별</option>
			  	<option value=101>남성</option>
			  	<option value=102>여성</option>
			  </select>
			  <div class="invalid-feedback" id="genderFeedback"></div>
			</div>
			<div class="col-7 mb-3">
			  <input type="text" class="form-control" placeholder="이메일" id="email" name="email">
			  <div class="invalid-feedback" id="emailFeedback"></div>
			  <!-- 뒷부분 SELECT로 받고 @ 기점으로 분리할 것 -->
			</div>
			<div class="col-7 mb-3">
			  <input type="text" class="form-control" placeholder="아이디" id="id" name="id">
			  <div class="invalid-feedback" id="idFeedback"></div>
			</div>
			<div class="col-7 mb-3">
			  <input type="password" class="form-control" placeholder="비밀번호" id="password" name="password">
			  <div class="invalid-feedback" id="passwordFeedback"></div>
			</div>
			<div class="col-7 mb-3">
			  <input type="password" class="form-control" placeholder="비밀번호 확인" id="passwordCheck">
			  <div class="invalid-feedback" id="passwordCheckFeedback"></div>
			  <!-- <input type="text" class="form-control-plaintext" value="비밀번호가 일치합니다" style="font-size: 10px;"> -->
			</div>
		</div>
		<div class="row mb-3">
			<span><button type="button" class="btn" id="btnReg" style="background-color:rgb(197, 59, 222); color:white; width:320px;">계정 생성</button></span>
		</div>
	</form>
	<div class="container pb-5" style="font-size:14px;">
		<p>이미 계정이 있으신가요?</p>
		<a href="/loginPage"><b>로그인 화면으로</b></a>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$( function() {
		$( "#dob" ).datepicker({
	    	changeYear: true,
	    	changeMonth: true,
	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	    	yearRange:"1900:2023",
	    	monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    	monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dateFormat: "yymmdd"
		});
	} );
</script>
<script type="text/javascript">
<!-- validation -->
	var goUrlInst = "/userReg";		
	
	var form = $("form[name=myForm]");
	
	$("#btnReg").on("click",function(){
	   		if (validationInst() == false){
	   			return false;
	   		} else {
	   			form.attr("action", goUrlInst).submit();
	   		}
	});
	
	validationInst = function() {
		if(!checkOnlyKoreanEnglishNumber('nickname',2,0,"닉네임을 입력해 주세요")) return false;
		if(!checkOnlyNumber('dob',2,0,0,0,0,"생일을 선택해주세요")) return false;
		if(!checkSelectNull('gender',2 ,"성별을 선택해 주세요.")) return false;
		if(!checkEmail('email',2,0,"이메일 주소를 입력해 주세요")) return false;
		if(!checkId('id',2,0,"ID를 입력해 주세요")) return false;
		if(!checkSelectNull('password',2 ,"비밀번호를 설정해 주세요.")) return false;
		if(!checkSelectNull('passwordCheck',2 ,"비밀번호를 확인해 주세요.")) return false;
		/* if(validationUpdt() == false) return false; */
	}
	
	validationUpdt = function() {}
	
	$("#nickname").on("focusout", function(){
		if(!checkOnlyKoreanEnglishNumber('nickname', 2, 1, "닉네임은 특수문자, 공백없이 입력해 주세요")) {
			return false;
		} 
	});
	
//	$("#dob").on("focusout", function(){
//		if(!checkOnlyNumber('dob',2,0,0,0,0, "생년월일을 양식에 맞게 입력해주세요. ex) 891114")) {
//			return false;
//		} 
//	});
	
	$("#gender").on("focusout", function(){
		if(!checkSelectNull('gender',2 ,"성별을 선택해 주세요.")) {
			return false;
		} 
	});
	$("#email").on("focusout", function(){
		if(!checkEmail('email',2,1,"이메일 주소를 올바르게 입력해 주세요")) {
			return false;
		} 
	});
	$("#id").on("focusout", function(){
		if(!checkId('id', 2, 1, "영대소문자,숫자,특수문자(-_.),4~20자리만 입력 가능합니다")) {
			return false;
		} 
	});
	$("#password").on("focusout", function(){
		if(!checkSelectNull('password',2 ,"비밀번호를 설정해 주세요.")) {
			return false;
		} 
	});
	$("#passwordCheck").on("focusout", function(){
		if(!checkSelectNull('password',2 ,"비밀번호를 확인해 주세요.")) {
			document.getElementById("passwordFeedback").classList.remove('valid-feedback');
			document.getElementById("passwordFeedback").classList.add('invalid-feedback');
			return false;
		} 
	});
	$("#id").on("focusout", function(){
		if(!checkId('id',2,0,"영대소문자,숫자,특수문자(-_.),4~20자리만 입력 가능합니다")) {
			document.getElementById("idFeedback").classList.remove('valid-feedback');
			document.getElementById("idFeedback").classList.add('invalid-feedback');
			return false;
		} else {
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "/checkId"
				/* ,data : $("#formLogin").serialize() */
				,data : { "id" : $("#id").val() }
				,success: function(response) {
					if(response.rt == "success") {
						document.getElementById("id").classList.add('is-valid');
						document.getElementById("id").classList.remove('is-invalid');
	
						document.getElementById("idFeedback").classList.remove('invalid-feedback');
						document.getElementById("idFeedback").classList.add('valid-feedback');
						document.getElementById("idFeedback").innerText = "사용 가능 합니다.";
						
						document.getElementById("idAllowedNy").value = 1;
						
					} else {
						document.getElementById("id").classList.add('is-invalid');
						document.getElementById("id").classList.remove('is-valid');
						
						document.getElementById("idFeedback").classList.remove('valid-feedback');
						document.getElementById("idFeedback").classList.add('invalid-feedback');
						document.getElementById("idFeedback").innerText = "사용 불가능 합니다";
						
						document.getElementById("idAllowedNy").value = 0;
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
	});
</script>
</body>
</html>
