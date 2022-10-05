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
	<title>별자리 테스트</title>
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
	#user_box {
		text-align:center;
		width:110px;
		font-size:16px;
		display: inline-block; 
		position: absolute; 
		left: 1080px;
		background-color: #ffa99970;
		border-radius: 10px;
		padding: 5px;
	}
	a{
	text-decoration: none;
	color:black;
	}
	#comment_btn{
		--bs-btn-font-size: 14px;
		width: 70px;
		height: 70px;
		background-color: rgb(190, 190, 190);
	}
	.like_btn, .report_btn, #comment_delete_btn{
		color:white;
		font-size: 12px;
		width: 70px;
		height:33px;
	}
	.like_btn{
		 background-color:rgba(52, 152, 219, 0.56);
	}
	.report_btn{
		background-color:rgba(192, 57, 43, 0.61);
	}
	.survey_back{
		width:56px; 
		font-size: 10px; 
		padding:0px;
		padding-top:2px;
		padding-bottom:2px;
		margin-left: 12px;
	}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="../member/mainLogedin.html">Simsim</a>
	</div>
</nav>
<div class="container" id="total">
	<div style="width:1000px; background-color: white; margin-left: 12px;">
		<h6 class="pt-2" style="color:gray;">별자리 테스트</h6><hr>
		<div class="container content_page_1">
			<div>
				<h5>고민거리가 생겼을 때 나는?</h5>
			</div>
			<div class="row choice_box my-5	">
				<div class="col-4 mx-auto">
					<button type="button" class="btn btn-outline-secondary" style="width:226px; font-size: 13px;">다른 사람들에게 조언을 구한다.</button>
				</div>
				<div class="col-4 mx-auto">
					<button type="button" class="btn btn-outline-secondary" style="width:226px; font-size: 13px;">혼자 생각하고 판단한다.</button>
				</div>
			</div>
		</div>
		<div class="container content_page_2">
			<div>
				<h5>친구와 술마시는 도중, 지인을 부른다고 할 때, 나는?</h5>
			</div>
			<div class="row choice_box my-5	">
				<div class="col-4 mx-auto">
					<button type="button" class="btn btn-outline-secondary" style="width:226px; font-size: 13px;">당연히 괜찮다며 얼른 부르라고한다.</button>
				</div>
				<div class="col-4 mx-auto">
					<button type="button" class="btn btn-outline-secondary" style="width:226px; font-size: 13px;">불편할 것 같다고 말한다.</button>
				</div>
			</div>
			<div class="row choice_box my-5	">
				<div class="col-4 mx-auto">
					<button type="button" class="btn btn-outline-secondary" style="width:226px; font-size: 13px;">조금 얼버무리며 알겠다한다.</button>
				</div>
				<div class="col-4 mx-auto">
					<button type="button" class="btn btn-outline-secondary" style="width:226px; font-size: 13px;">이만 자리를 뜬다.</button>
				</div>
			</div>
		</div>
		<div class="container content_page_3">
			<div>
				<h5 style="display: inline-block;">5일의 연휴가 곧 다가온다! 내가 하고 싶은 일은?(중복 선택 가능)</h5>
				<span style="float:right;"><button type="button" class="btn btn-outline-info" style="height: 32px;font-size: 14px;">다음</button></span>
			</div>
			<div class="row choice_box my-5	">
				<div class="col-4 mx-auto">
					<input type="checkbox" class="btn-check" id="survey1_q3_c1_btn" autocomplete="off">
					<label class="btn btn-outline-secondary" for="survey1_q3_c1_btn" style="width:226px; font-size: 13px;">운동을 한다.</label>
				</div>
				<div class="col-4 mx-auto">
					<input type="checkbox" class="btn-check" id="survey1_q3_c2_btn" autocomplete="off">
					<label class="btn btn-outline-secondary" for="survey1_q3_c2_btn" style="width:226px; font-size: 13px;">각종 액티비티를 하러간다.</label>
				</div>
				<div class="col-4 mx-auto">
					<input type="checkbox" class="btn-check" id="survey1_q3_c3_btn" autocomplete="off">
					<label class="btn btn-outline-secondary" for="survey1_q3_c3_btn" style="width:226px; font-size: 13px;">친구들을 만난다.</label>
				</div>
			</div>
			<div class="row choice_box my-5	">
				<div class="col-4 mx-auto">
					<input type="checkbox" class="btn-check" id="survey1_q3_c4_btn" autocomplete="off">
					<label class="btn btn-outline-secondary" for="survey1_q3_c4_btn" style="width:226px; font-size: 13px;">개인취미활동을 한다.</label>
				</div>
				<div class="col-4 mx-auto">
					<input type="checkbox" class="btn-check" id="survey1_q3_c5_btn" autocomplete="off">
					<label class="btn btn-outline-secondary" for="survey1_q3_c5_btn" style="width:226px; font-size: 13px;">무엇인가를 보며 쉰다.</label>
				</div>
				<div class="col-4 mx-auto">
					<input type="checkbox" class="btn-check" id="survey1_q3_c6_btn" autocomplete="off">
					<label class="btn btn-outline-secondary" for="survey1_q3_c6_btn" style="width:226px; font-size: 13px;">잔다.</label>
				</div>
			</div>
		</div>
		<div class="container content_page_4">
			<div>
				<h5>연인과 맛집을 가려는 나는?</h5>
				<img alt="..." src="../images/hamburger.jpg" style="width: 1000px; margin-left: -12px;">
			</div>
			<div class="row choice_box my-5	">
				<div class="col-4 mx-auto">
					<a href="./survey1Result.html"><button type="button" class="btn btn-outline-secondary" style="width:226px; font-size: 13px;">평소에 맛있게 먹었던 가게 중 하나로 향한다.</button></a>
				</div>
				<div class="col-4 mx-auto">
					<a href="./survey1Result.html"><button type="button" class="btn btn-outline-secondary" style="width:226px; font-size: 13px;">색다른 맛집을 알아본다.</button></a>
				</div>
			</div>
		</div>
		<div class="progress">
		  <div class="progress-bar" role="progressbar" style="width: 25%; background-color:#a5d610;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
		</div>
	</div>
	<button type="button" class="btn btn-secondary survey_back">이전으로</button>
	<div class="container">
		<img alt="" src="../images/lighthouse_mainbanner.jpg" style="width: 1000px;">
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
</body>
</html>
