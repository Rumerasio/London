<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="uTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>main</title>
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
		width:140px;
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
	#end{
		background-color: rgb(224, 224, 224);
		padding-top: 30px;
		padding-bottom: 30px;
		font-size: 10px;
		position: relative;
		top:50px;
	}
	.main_top { overflow: hidden; width:90%;}
	.main_top_list .main_top_item { position: relative; overflow: hidden;}
	.main_top_list .main_top_item.mti_1 { float: left;width: 50%; height: 515px; }
	.main_top_list .main_top_item.mti_2 { float: right;width: 50%; height: 305px; }
	.main_top_list .main_top_item.mti_3 { float: right;width: 25%; height: 210px; }
	.main_top_list .main_top_item.mti_4 { float: right;width: 25%; height: 210px; }
	.main_top_list .main_top_item .thumb { position: absolute; top: 0; right: 0; bottom: 0; left: 0; -webkit-background-size:cover; background-size:cover; background-repeat: no-repeat; background-position: center center; z-index: 1;-webkit-transition: all 0.5s ease; /* Safari and Chrome */ -moz-transition: all 0.5s ease; /* Firefox */ -o-transition: all 0.5s ease; /* IE 9 */ -ms-transition: all 0.5s ease; /* Opera */ transition: all 0.5s ease;}
	.main_top_list .main_top_item:hover .thumb { filter: alpha(opacity=80); transform: scale(1.15,1.17); /* Change these numbers to suit your needs */ -webkit-transform: scale(1.15,1.17); -moz-transform: scale(1.15,1.17); -ms-transform: scale(1.15,1.17); -o-transform: scale(1.15,1.17);}
	.main_top_list .main_top_item a { position: absolute;display: block;width: 100%;height:100%;box-sizing:border-box;padding:20px; text-align: center;background-color: rgba(0,0,0,0.2); z-index: 2;}
	.main_top_list .main_top_item a p { position: relative; top: 50%;transform:translateY(-50%);}
	.main_top_list .main_top_item a p .subject { display: block;font-size: 28px; letter-spacing: -1px; color: #ffffff;text-shadow:2px 2px 2px rgba(0,0,0,0.4);word-break:keep-all;line-height:130%}
	.main_top_list .main_top_item a p .description { display: block;font-size: 14px; letter-spacing: -1px; color: #ffffff;text-shadow:2px 2px 2px rgba(0,0,0,0.4);word-break:keep-all; line-height: 130%;}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="./main.html">Simsim</a>
	</div>
</nav>
<div class="container" id="total">
	<div class="container" style="position: relative;top:-8px;">
		<div class="row" style="width: 1200px;position: relative;">
			<div class="main_top" style="display: inline-block;"> 
				<ul class="main_top_list"> 
					<li class="main_top_item mti_1"> 
						<div class="thumb" style="background-image:url('/resources/images/stars_hugeBanner.jpg')"></div> 
						<a href="../survey/survey1.html" title="별자리 테스트"> 
							<p> 
								<span class="subject font-serif">별자리 테스트</span> 
								<span class="description">나는 무슨 별자리일까?</span> 
							</p> 
						</a> 
					</li> 
					<li class="main_top_item mti_2">
						<div class="thumb" style="background-image:url('/resources/images/fox.jpg')"></div>
						<a href="" title="꽃말 테스트"> 
							<p> 
								<span class="subject font-serif">꽃말 테스트</span> 
								<span class="description">당신을 위한 꽃말은?</span>
							</p> 
						</a> 
					</li> 
					<li class="main_top_item mti_3"> 
						<div class="thumb" style="background-image:url('/resources/images/watermelon.jpg')"></div> 
						<a href=" " title="여행지 테스트"> 
							<p> 
								<span class="subject font-serif">여행지 테스트</span> 
								<span class="description">올 여름 어디로 여행을 갈까!?</span> 
							</p> 
						</a> 
					</li> 
					<li class="main_top_item mti_4">
					<div class="thumb" style="background-image:url('/resources/images/ai.jpg')"></div> 
					<a href=" " title="물고기 테스트"> 
						<p> 
							<span class="subject font-serif">나는 뇌를 얼마나 쓰고 있을까?</span> 
							<span class="description">퀴즈로 알아보는 뇌사용률!</span> 
						</p> 
					</a> 
					</li>
				</ul> 
			</div>
			<div id ="user_box">
				<a href="./memberLogin.html"><button type="button" class="btn btn-sm m-1" style="width:120px; color:white; background-color:rgba(197, 59, 222, 0.54)">로그인</button></a>
				<a href="./memberRegForm.html"><button type="button" class="btn btn-sm m-1" style="width:120px; background-color:#e6e6e6;">회원가입</button></a>
			</div>
		</div>
		<div class="container mt-5">
			<h4>다른 컨텐츠</h4>
			<div class="row row-cols-3 g-4" style="width:1050px;">
			  <div class="col">
			    <div class="card h-100">
			      <a href="#"><img src="/resources/images/card/desert.png" class="card-img-top" alt="..."></a>
			      <div class="card-body">
			        <a href="#"><h6 class="card-title">당신이 사막을 건너기 위한 준비물</h6></a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <a href="#"><img src="/resources/images/card/ai_card.jpg" class="card-img-top" alt="..."></a>
			      <div class="card-body">
			        <a href="#"><h6 class="card-title">나는 뇌를 얼마나 쓰고 있을까?</h6></a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <a href="#"><img src="/resources/images/card/fox_card.jpg" class="card-img-top" alt="..."></a>
			      <div class="card-body">
			        <a href="#"><h6 class="card-title">꽃말 테스트</h6></a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <a href="#"><img src="/resources/images/card/watermelon_card.jpg" class="card-img-top" alt="..."></a>
			      <div class="card-body">
			        <a href="#"><h6 class="card-title">여행지 테스트</h6></a>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <a href="../survey/survey1.html"><img src="/resources/images/card/star_card.jpg" class="card-img-top" alt="..."></a>
			      <div class="card-body">
			        <a href="../survey/survey1.html"><h6 class="card-title">별자리 테스트</h6></a>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</div>
<nav class="container-fluid" id="end">
	<div class="row">
		<div class="col-auto">
			<span><a href="#">이용약관</a></span>
		</div>
		<div class="col-auto me-auto">
			<span><a href="#">개인정보 취급방침</a></span>
		</div>
		<div class="col-auto">
			<span>© 2022-2022. 심심</span>
		</div>
	</div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
</body>
</html>