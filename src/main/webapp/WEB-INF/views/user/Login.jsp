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
	<form name="form">
		<input type="hidden" name="nickname"/>
		<input type="hidden" name="snsId"/>
		<input type="hidden" name="email"/>
		<input type="hidden" name="gender"/>
		<input type="hidden" name="dob"/>
		<input type="hidden" name="token"/>
		<div class="row justify-content-center pb-5 mb-2">
			<span><button type="button" id="btnKakaoLogin" name="btnKakaoLogin" class="btn" style="background-color:#FCE51E; color:black; width:320px;">카카오톡으로 로그인</button></span>
		</div>
		<div class="row justify-content-center pb-5 mb-2">
			<span><button type="button" id="btnNaverLogin" name="btnNaverLogin" class="btn" style="background-color:green; color:black; width:320px;">네이버로 로그인</button></span>
		</div>
		 <div>
	      <div id="naverIdLogin"></div>
	    </div>
		<!-- <div class="row justify-content-center mb-2">
			<span><input type="button" class="btn" value="Facebook으로 로그인" style="background-color:#1877F2; color:white; width:320px;"></span>
		</div>
		<div class="row justify-content-center mb-2">
			<span><a href=""><input type="button" class="btn" value="네이버로 로그인" style="background-color:#28D111; color:white; width:320px;"></a></span>
		</div> -->
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 카카오 연동 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
	
	Kakao.init('983700957186f54b5dea5b9569f37c10'); // test 용
	console.log(Kakao.isInitialized());
/*     	Kakao.init('ec2655da82c3779d622f0aff959060e6');
	console.log(Kakao.isInitialized()); */
	
	$("#btnKakaoLogin").on("click", function() {
		/* Kakao.Auth.authorize({
		      redirectUri: 'http://localhost:8080/member/kakaoCallback',
		    }); */
		Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  var accessToken = Kakao.Auth.getAccessToken();
		        	  Kakao.Auth.setAccessToken(accessToken);

		        	  var account = response.kakao_account;
		        	  
		        	  console.log(response)
		        	  console.log("email : " + account.email);
		        	  console.log("name : " + account.name);
		        	  console.log("nickname : " + account.profile.nickname);
		        	  console.log("picture : " + account.profile.thumbnail_image_url);
		        	  console.log("picture : " + account.gender);
		        	  console.log("picture : " + account.birthday);
		        	  console.log("picture : " + account.birthday.substring(0,2) + "-" + account.birthday.substring(2,account.birthday.length));
	        	  
  	        	  $("input[name=snsId]").val("카카오로그인");
  	        	  $("input[name=nickname]").val(account.profile.nickname);
  	        	  //$("input[name=phone]").val(account.profile.phone_number);
  	        	  $("input[name=email]").val(account.email);
  	        	  //$("input[name=dob]").val(account.birthday.substring(0,2) + "-" + account.birthday.substring(2,account.birthday.length));
  	        	 // $("input[name=snsImg]").val(account.profile.thumbnail_image_url);
  	        	  $("input[name=token]").val(accessToken);
  	        	  
  	        	  if (account.gender === "male") {
  	        		  $("input[name=gender]").val(101);
          		  } else {
          			  $("input[name=gender]").val(102);
     			  } 
  	        	 /*  $("form[name=form]").attr("action", "/member/kakaoLoginProc").submit(); */
  	        	  $.ajax({
					async: true
					,cache: false
					,type:"post"
					,url: "/kakaoLoginProc"
					,data: {"nickname": $("input[name=nickname]").val(), "snsId": $("input[name=snsId]").val(), "email": $("input[name=email]").val(), "gender": $("input[name=gender]").val(), "token": $("input[name=token]").val()}
					,success : function(response) {
						if (response.rt == "fail") {
							alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
							return false;
						} else {
							alert("카카오톡 로그인이 완료되었습니다.");
							window.location.href = "/";
						}
					},
					error : function(jqXHR, status, error) {
						alert("알 수 없는 에러 [ " + error + " ]");
					}
				});
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
	});
</script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">
	$("#btnNaverLogin").on("click", function() {
		
			
		
		/* var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "7ONlz7Bim5hRaiHfpGsf",
				callbackUrl: "http://localhost:8080/loginPage",
				isPopup: false,
				callbackHandle: true
			}
		); */
			var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "7ONlz7Bim5hRaiHfpGsf",
					callbackUrl: "http://localhost:8080/loginPage",
					isPopup: true,
					callbackHandle: true
				}
			);
		
			naverLogin.init();
			
			naverLogin.getLoginStatus(function (status) {
   				if (status) {
   					/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
   					setLoginStatus();
   				} else {
   					naverLogin.authorize();
   					setLoginStatus();
   				}   				
   					console.log(naverLogin.user);
   			});
			
// 			window.addEventListener('load', function () {
//				naverLogin.getLoginStatus(function (status) {
//					if (status) {
//						/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
//						setLoginStatus();
//					}
//				});
//			});
 			
			function setLoginStatus() {
				
				if (naverLogin.user.gender == 'M'){
					$("input[name=gender]").val(101);
				} else {
					$("input[name=gender]").val(102);
				} 
				
				$.ajax({
					async: true
					,cache: false
					,type:"POST"
					,url: "/naverLoginProc"
					,data: {"nickname": naverLogin.user.nickname, "snsId": "네이버로그인", "email": naverLogin.user.email, "gender": $("input[name=gender]").val(), "dob": naverLogin.user.birthyear+"-"+naverLogin.user.birthday}
					,success : function(response) {
						if (response.rt == "fail") {
							alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
							return false;
						} else {
							alert("네이버 로그인이 완료되었습니다.");
							window.location.href = "/";
						}
					},
					error : function(jqXHR, status, error) {
						alert("알 수 없는 에러 [ " + error + " ]");
					}
				});
			}
	});
/* naver login test e */
</script>
</body>
</html>
