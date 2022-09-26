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
	<title>AdminContentViewAndMod</title>
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
	li{
		padding-top:5px;
		padding-bottom:5px;
	}
	#input-file-button {
		padding: 6px 20px;
		background-color:#0080ff;
		border-radius: 4px;
		color: white;
		cursor: pointer;
	}
	#remoteControl {
		position: fixed;
		bottom: 20px;
		left:40px;
		width: 150px;
		background-color: white;
		text-align: center;
		font-size:12px;
	}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="./ZdminMain.html" style="display: inline-block;">S</a>
	</div>
</nav>
<div class="container" style="text-align: center;">
	<h4 style="position: relative; bottom: 50px;">관리자 페이지</h4>
</div>
<div class="row" style="width:1400px">
	<div class="col-2">
		<div class="pt-2" style="background-color: white; text-align: center;">
			<h6><b>이솔빈</b> 관리자님</h6>
			<a href="./ZdminLogin.html"><span style="font-size: 10px;">로그아웃</span></a>
		</div>
		<!-- 메뉴단 s -->
		<%@include file="../Menu.jsp" %>
		<!-- 메뉴단 e -->
		<div id="remoteControl">
			<h6 class="py-1" style="background-color:#f5f5dc;"><b>바로가기</b></h6>
			<ul class="list-unstyled">
				<a href="#contentMainDisplay"><li>메인화면</li></a>
				<a href="#contentImageRegistration"><li>이미지 등록</li></a>
				<a href="#contentPageRegistration"><li>페이지 작성</li></a>
				<a href="#contentResultRegistration"><li>결과 페이지 작성</li></a>
			</ul>
			<div class="py-1" style="background-color:#f5f5dc; font-size:10px;">
				<div class="row">
					<div class="col-4 offset-2">
						<i class="fa-solid fa-sort-up"></i>
						<a href="#topNav"><p>맨위로</p></a>
					</div>
					<div class="col-4">
						<i class="fa-solid fa-sort-down"></i>
						<a href="#contentRegisterFinishButton"><p>아래로</p></a>
					</div>
				</div>
			</div>			
		</div>
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>컨텐츠 관리</b></h5>
		<h6 style="color:gray;"><b>컨텐츠 등록</b></h6>
		<form method="post", id="myForm" name="myForm">
			<div class="p-5 mb-5" style="background-color: white; position:relative;">
				<div class="my-3 pt-3 float-start" id="contentMainDisplay"><h6 style="display: inline-block;"><b>컨텐츠 메인화면</b></h6></div>
				<div class="form-check form-switch float-end my-3 pt-3" style="display: inline-block;">
				  <input class="form-check-input" type="checkbox" role="switch" id="multichoiceNy">
				  <label class="form-check-label" for="multichoiceNy">컨텐츠 공개</label>
				</div>
				<div style="clear:both;"></div>
				<div class="mb-3">
				  <label for="contentTitleInput" class="form-label">컨텐츠 제목</label>
				  <input type="text" class="form-control form-control-sm" id="survey" name="survey" value="<c:out value="${item. }"></c:out>">
				</div>
				<div class="mb-3">
				  <label for="contentLittleTitleInput" class="form-label">컨텐츠 소제목</label>
				  <input type="text" class="form-control form-control-sm" id="surveyPhrase" name="surveyPhrase" value="나는 무슨 별자리일까?">
				</div>
				<div class="mb-3">
				  <label for="contentIntroduceInput" class="form-label">컨텐츠 설명</label>
				  <textarea type="text" class="form-control form-control-sm" id="surveyExplain" name="surveyExplain" style="resize:none; height:6.25em;">도시에선 보기 힘든 밤하늘의 아름다운 별!
	나를 뜻하는 별자리가 무엇일지 궁금하지 않으세요?</textarea>
				</div>
				<div class="my-3 pt-3" id="contentImageRegistration"><h6><b>컨텐츠 이미지 등록</b></h6></div>
				<div class="row">
					<div class="col-4">
						<div class="row justify-content-center">
							<img class="img-thumbnail" alt="" id="preview0" style="width:157px; height:210px;">
						</div>
						<div class="row justify-content-center">
							<h6 class="my-3" style="text-align: center;">컨텐츠 이미지<br>대형배너(385 x 515)</h6>
							<label class="btn btn-sm mb-4" id="input-file-button" for="input-file0" style="width:100px; background-color:#525252">첨부파일</label>
							<input type="file" onchange="readURL0(this);" id="input-file0" style="display:none;">
						</div>
					</div>
					<div class="col-4">
						<div class="row justify-content-center">
							<img class="img-thumbnail" alt="" id="preview1" style="width:290px; height:210px;">
						</div>
						<div class="row justify-content-center">
							<h6 class="my-3" style="text-align: center;">컨텐츠 이미지<br>중형배너(420 x 305)</h6>
							<label class="btn btn-sm mb-4" id="input-file-button" for="input-file1" style="width:100px; background-color:#525252">첨부파일</label>
							<input type="file" onchange="readURL1(this);" id="input-file1" style="display:none;">
						</div>
					</div>
					<div class="col-4">
						<div class="row justify-content-center">
							<img class="img-thumbnail" alt="" id="preview2" style="width:210px; height:210px;">
						</div>
						<div class="row justify-content-center">
							<h6 class="my-3" style="text-align: center;">컨텐츠 이미지<br>소형배너(210 x 210)</h6>
							<label class="btn btn-sm mb-4" id="input-file-button" for="input-file2" style="width:100px; background-color:#525252">첨부파일</label>
							<input type="file" onchange="readURL2(this);" id="input-file2" style="display:none;">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<div class="row justify-content-center">
							<img class="img-thumbnail" alt="" id="preview3" style="width:315px; height:210px;">
						</div>
						<div class="row justify-content-center">
							<h6 class="my-3" style="text-align: center;">컨텐츠 이미지<br>카드형(240 x 160)</h6>
							<label class="btn btn-sm mb-4" id="input-file-button" for="input-file3" style="width:100px; background-color:#525252">첨부파일</label>
							<input type="file" onchange="readURL3(this);" id="input-file3" style="display:none;">
						</div>
					</div>
					<div class="col-8">
						<div class="row justify-content-center">
							<img class="img-thumbnail" alt="" id="preview4" style="width:400px; height:210px;">
						</div>
						<div class="row justify-content-center">
							<h6 class="my-3" style="text-align: center;">컨텐츠 이미지<br>컨텐츠 메인 이미지(730 x *)</h6>
							<label class="btn btn-sm mb-4" id="input-file-button" for="input-file4" style="width:100px; background-color:#525252">첨부파일</label>
							<input type="file" onchange="readURL4(this);" id="input-file4" style="display:none;">
						</div>
					</div>
				</div>
				
				<div class="my-3 pt-3" id="contentPageRegistration"><h6><b>컨텐츠 페이지 작성</b></h6></div>
				<div class="container" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>Page 1</h5></div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="questionContent" name="questionContent" placeholder="질문">
					</div>
					<div class="my-3 row">
						<h6 class="col-2"><b>선택지</b></h6>
						<div class="form-check form-switch col-2">
						  <input class="form-check-input" type="checkbox" role="switch" id="multiChoiceNy">
						  <label class="form-check-label" for="multiChoiceNy">중복 선택</label>
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지1 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지2 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지3 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지4 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지5 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id="choice2" placeholder="선택지6 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choice2score" placeholder="배점">
						</div>
						<div class="col-12 mt-3">
							<div class="row justify-content-center">
								<div class="row justify-content-center">
									<img class="img-thumbnail" alt="" id="preview5" style="width:400px; height:210px;">
								</div>
								<h6 class="my-3" style="text-align: center;">질문 이미지<br>(730 x *)</h6>
								<label class="btn btn-sm mb-4" id="input-file-button" for="input-file5" style="width:100px; background-color:#525252">첨부파일</label>
								<input type="file" onchange="readURL5(this);" id="input-file5" style="display:none;">
							</div>
						</div>
					</div>
				</div>
				<div class="container" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>Page 2</h5></div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="contentTitleInput" name="questionContent" placeholder="질문">
					</div>
					<div class="my-3 row">
						<h6 class="col-2"><b>선택지</b></h6>
						<div class="form-check form-switch col-2">
						  <input class="form-check-input" type="checkbox" role="switch" id="multiChoiceNy">
						  <label class="form-check-label" for="multiChoiceNy">중복 선택</label>
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지1 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지2 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지3 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지4 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지5 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id="choice2" placeholder="선택지6 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choice2score" placeholder="배점">
						</div>
						<div class="col-12 mt-3">
							<div class="row justify-content-center">
								<div class="row justify-content-center">
									<img class="img-thumbnail" alt="" id="preview5" style="width:400px; height:210px;">
								</div>
								<h6 class="my-3" style="text-align: center;">질문 이미지<br>(730 x *)</h6>
								<label class="btn btn-sm mb-4" id="input-file-button" for="input-file5" style="width:100px; background-color:#525252">첨부파일</label>
								<input type="file" onchange="readURL5(this);" id="input-file5" style="display:none;">
							</div>
						</div>
					</div>
				</div>
				<div class="container" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>Page 3</h5></div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="contentTitleInput" name="questionContent" placeholder="질문">
					</div>
					<div class="my-3 row">
						<h6 class="col-2"><b>선택지</b></h6>
						<div class="form-check form-switch col-2">
						  <input class="form-check-input" type="checkbox" role="switch" id="multiChoiceNy">
						  <label class="form-check-label" for="multiChoiceNy">중복 선택</label>
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지1 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지2 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지3 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지4 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지5 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id="choice2" placeholder="선택지6 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choice2score" placeholder="배점">
						</div>
						<div class="col-12 mt-3">
							<div class="row justify-content-center">
								<div class="row justify-content-center">
									<img class="img-thumbnail" alt="" id="preview5" style="width:400px; height:210px;">
								</div>
								<h6 class="my-3" style="text-align: center;">질문 이미지<br>(730 x *)</h6>
								<label class="btn btn-sm mb-4" id="input-file-button" for="input-file5" style="width:100px; background-color:#525252">첨부파일</label>
								<input type="file" onchange="readURL5(this);" id="input-file5" style="display:none;">
							</div>
						</div>
					</div>
				</div>
				<div class="container" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>Page 4</h5></div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="contentTitleInput" name="questionContent" placeholder="질문">
					</div>
					<div class="my-3 row">
						<h6 class="col-2"><b>선택지</b></h6>
						<div class="form-check form-switch col-2">
						  <input class="form-check-input" type="checkbox" role="switch" id="multiChoiceNy">
						  <label class="form-check-label" for="multiChoiceNy">중복 선택</label>
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지1 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지2 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지3 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지4 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지5 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id="choice2" placeholder="선택지6 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choice2score" placeholder="배점">
						</div>
						<div class="col-12 mt-3">
							<div class="row justify-content-center">
								<div class="row justify-content-center">
									<img class="img-thumbnail" alt="" id="preview5" style="width:400px; height:210px;">
								</div>
								<h6 class="my-3" style="text-align: center;">질문 이미지<br>(730 x *)</h6>
								<label class="btn btn-sm mb-4" id="input-file-button" for="input-file5" style="width:100px; background-color:#525252">첨부파일</label>
								<input type="file" onchange="readURL5(this);" id="input-file5" style="display:none;">
							</div>
						</div>
					</div>
				</div>
				<div class="container" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>Page 5</h5></div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="contentTitleInput" name="questionContent" placeholder="질문">
					</div>
					<div class="my-3 row">
						<h6 class="col-2"><b>선택지</b></h6>
						<div class="form-check form-switch col-2">
						  <input class="form-check-input" type="checkbox" role="switch" id="multiChoiceNy">
						  <label class="form-check-label" for="multiChoiceNy">중복 선택</label>
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지1 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지2 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지3 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지4 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id=choiceContent name="choiceContent" placeholder="선택지5 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choiceScore" placeholder="배점">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id="choice2" placeholder="선택지6 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choice2score" placeholder="배점">
						</div>
						<div class="col-12 mt-3">
							<div class="row justify-content-center">
								<div class="row justify-content-center">
									<img class="img-thumbnail" alt="" id="preview5" style="width:400px; height:210px;">
								</div>
								<h6 class="my-3" style="text-align: center;">질문 이미지<br>(730 x *)</h6>
								<label class="btn btn-sm mb-4" id="input-file-button" for="input-file5" style="width:100px; background-color:#525252">첨부파일</label>
								<input type="file" onchange="readURL5(this);" id="input-file5" style="display:none;">
							</div>
						</div>
					</div>
				</div>
				
				<div class="my-3 pt-3" id="contentResultRegistration"><h6><b>결과 페이지 작성</b></h6></div>
				<div class="container my-5" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>#1</h5></div>
					<div class="float-end my-3">
						<button class="btn btn-light btn-sm" style="border:none;"><i class="fa-solid fa-plus"></i></button>
						<button class="btn btn-secondary btn-sm" style="border:none;"><i class="fa-solid fa-minus"></i></button>
					</div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="contentTitleInput" placeholder="결과 제목" value="열정적으로 늘 새로운 가능성을 찾는 궁수자리">
					</div>
					<div class="row">
						<div class="col-3 mt-3">
							<div class="row justify-content-center">
								<div class="row justify-content-center">
									<img class="img-thumbnail" alt="" id="preview7" style="width:220px; height:170px;">
								</div>
								<h6 class="my-3" style="text-align: center;">결과 이미지<br>(200 x 170)</h6>
								<label class="btn btn-sm mb-4" id="input-file-button" for="input-file7" style="width:100px; background-color:#525252">첨부파일</label>
								<input type="file" onchange="readURL7(this);" id="input-file7" style="display:none;">
							</div>
						</div>
						<div class="col-9">
				  			<textarea type="text" class="form-control form-control-sm" id="contentIntroduceInput" placeholder="내용을 입력해주세요" style="resize:none; height:20em;">뭐든지 하고자 하는 일이 있을때는 자유롭고 싶어해요.
	늘 새로운 가능성을 열어두면서 새롭게 시도하는걸 즐기기도 한답니다.
	그때그대의 일시적인 즐거움 보다는 다른 사람들과 깊은 관계를 맺으면서 행복을 느껴요.
	그래서인지 항상 활발하고 활기가 넘치며 새로운 모임이나 술자리에서도 분위기 메이커를 담당하고 있어요.
	어쩔때는 관종 같아보이지만 은근히 내향적이며 조금 과한 독립심을 품고 있어요.
	반복적인 일상, 틀에 박힌걸 무지 싫어해요.
	그래서 계획적인 약속은 싫어하고, 즉흥적인 약속을 좋아해요.
	내가 생각지도 못한 충동구매를 즐기곤해요.
	안정적이고 안전한 삶을 추구하기 보다는 창의적인 삶을 추구하기 때문에
	잘 질려하고 권태로움을 잘 느끼기도 한답니다.</textarea>
						</div>
					</div>
					<div class="mb-3 row">
					  <label for="resultScoreRange" class="col-2 col-form-label">결과 점수합 범위</label>
					  <div class="col-1">
					    <input type="text" class="form-control" id="resultScoreRange" placeholder="이상" value="3">
					  </div>
					  <div class="col-auto" style="font-size: 24px;">~</div>
					  <div class="col-1">
					    <input type="text" class="form-control" id="resultScoreRange" placeholder="이하" value="7">
					  </div>
					</div>
				</div>
				<div class="container my-5" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>#2</h5></div>
					<div class="float-end my-3">
						<button class="btn btn-light btn-sm" style="border:none;"><i class="fa-solid fa-plus"></i></button>
						<button class="btn btn-light btn-sm" style="border:none;"><i class="fa-solid fa-minus"></i></button>
					</div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="contentTitleInput" placeholder="결과 제목" value="어떤 사람인지 파악하기 힘든 독특하고 복잡한 염소자리">
					</div>
					<div class="row">
						<div class="col-3 mt-3">
							<div class="row justify-content-center">
								<div class="row justify-content-center">
									<img class="img-thumbnail" alt="" id="preview8" style="width:220px; height:170px;">
								</div>
								<h6 class="my-3" style="text-align: center;">결과 이미지<br>(200 x 170)</h6>
								<label class="btn btn-sm mb-4" id="input-file-button" for="input-file8" style="width:100px; background-color:#525252">첨부파일</label>
								<input type="file" onchange="readURL8(this);" id="input-file8" style="display:none;">
							</div>
						</div>
						<div class="col-9">
				  			<textarea type="text" class="form-control form-control-sm" id="contentIntroduceInput" placeholder="내용을 입력해주세요" style="resize:none; height:20em;">공감능력이 매우 뛰어나고 동정심이 너무나도 많아서 내가 피곤하더라도 남들을 배려해주는게 속편해요.
	이사람은 내사람이다! 하는 순간 너무너무 잘해준답니다.
	내성적이고 조용해서 겉으로는 차가워 보인다는 말을 무지 많이 듣지만
	친해지도 나면 이런 애였어? 라며 따뜻한 사람이라고 다들 말해요.
	어딜가나 눈에 띄는 리더 타입은 아니지만 조용하게 자신의 영향력을 미치는 타입이랍니다.
	조용히 다니는데 가끔은 조금 튀고싶어하기도해요.
	계획세우는걸 너무나도 좋아해요. 뭐든지 할 일이 있으면 계획부터!
	상상력이 너무 풍부해서 내가 생각하는걸 오나벽하게 공감해 줄 사람은 이세상에 없다고 생각해요.
	그래서 감정이 앞설땐 혼자 생각할 시간이 필요하답니다.
	평소에 내성적인 타입이라 무리 지어 놀기보다는 내 마음이 아주 잘 맞는 친구랑 단둘이 노는게 더 편하다고 생각해요!
	새로운 일이나 새로운 사람들을 만나는걸 기피하는 편이예요.
	다른 사람에게 거절당하거나 상처받는걸 민감해해서
	새롭게 친해지고 싶은 사람이 생겨도 상대방이 먼저 다가와주길 원한답니다.
	생각이 많아서 타인으로 부터 지속적인 지적과 비판을 받는다면 자신감을 쉽게 상실하고 무너지는 타입입니다.</textarea>
						</div>
					</div>
					<div class="mb-3 row">
					  <label for="resultScoreRange" class="col-2 col-form-label">결과 점수합 범위</label>
					  <div class="col-1">
					    <input type="text" class="form-control" id="resultScoreRange" placeholder="이상" value="8">
					  </div>
					  <div class="col-auto" style="font-size: 24px;">~</div>
					  <div class="col-1">
					    <input type="text" class="form-control" id="resultScoreRange" placeholder="이하" value="15">
					  </div>
					</div>
				</div>
				<a href="./ZdminContentList.html"><input type="button" class="float-end btn btn-dark btn-sm" id="contentRegisterFinishButton" value="컨텐츠 수정 완료"></a>
			</div>
		</form>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
function readURL0(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview0').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} 
	else {
		document.getElementById('preview0').src = "";
	}
}
function readURL1(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview1').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} 
	else {
		document.getElementById('preview1').src = "";
	}
}
function readURL2(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview2').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} 
	else {
		document.getElementById('preview2').src = "";
	}
}
function readURL3(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview3').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} 
	else {
		document.getElementById('preview3').src = "";
	}
}
function readURL4(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview4').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} 
	else {
		document.getElementById('preview4').src = "";
	}
}
function readURL5(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview5').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} 
	else {
		document.getElementById('preview5').src = "";
	}
}
function readURL6(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview6').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} 
	else {
		document.getElementById('preview6').src = "";
	}
}
function readURL7(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview7').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} 
	else {
		document.getElementById('preview7').src = "";
	}
}
function readURL8(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview8').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} 
	else {
		document.getElementById('preview8').src = "";
	}
}
</script>
</body>
</html>
