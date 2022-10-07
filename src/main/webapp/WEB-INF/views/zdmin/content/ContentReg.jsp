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
	<title>ContentReg</title>
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
<!-- 로고단 s -->
<%@include file="../Logo.jsp" %>
<!-- 로고단 e -->
<div class="container" style="text-align: center;">
	<h4 style="position: relative; bottom: 50px;">관리자 페이지</h4>
</div>
<div class="row" style="width:1400px">
	<div class="col-2">
		<!-- 로그인정보태그단 s -->
		<%@include file="../zdminTag.jsp" %>
		<!-- 로그인정보태그단 e -->
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
						<a href="#btnSave"><p>아래로</p></a>
					</div>
				</div>
			</div>			
		</div>
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>컨텐츠 관리</b></h5>
		<h6 style="color:gray;"><b>컨텐츠 등록</b></h6>
		<form method="post" id="myForm" name="myForm" autocomplete="off">
			<div class="p-5 mb-5" style="background-color: white; position:relative;">
				<div class="my-3 pt-3 float-start" id="contentMainDisplay"><h6 style="display: inline-block;"><b>컨텐츠 메인화면</b></h6></div>
				<div class="form-check form-switch float-end my-3 pt-3" style="display: inline-block;">
				  <input class="form-check-input" type="checkbox" role="switch" name="openNy" id="openNy">
				  <label class="form-check-label" for="openNy">컨텐츠 공개</label>
				</div>
				<div style="clear:both;"></div>
				<div class="mb-3">
				  <label for="survey" class="form-label">컨텐츠 제목</label>
				  <input type="text" class="form-control form-control-sm" id="survey" name="survey">
				</div>
				<div class="mb-3">
				  <label for="surveyPhrase" class="form-label">컨텐츠 소제목</label>
				  <input type="text" class="form-control form-control-sm" id="surveyPhrase" name="surveyPhrase">
				</div>
				<div class="mb-3">
				  <label for="surveyExplain" class="form-label">컨텐츠 설명</label>
				  <textarea type="text" class="form-control form-control-sm" id="surveyExplain" name="surveyExplain" style="resize:none; height:6.25em;"></textarea>
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
				<div id="contentTotal">
					<div class="my-3 pt-3 mr-2" id="contentPageRegistration" style="display:inline-block; ;"><h6 style="display: inline;"><b>컨텐츠 페이지 작성</b></h6></div>
					<button type="button" class="btn btn-success btn-sm" id="btnPageAdd" onclick="PageAdd('btnPageAdd')" style="border:none;"><i class="fa-solid fa-plus"></i></button>
					<div class="container questionCon" id="contentPage" style="margin-left:0px; margin-bottom:20px; border:solid; border-width:2px; width:100%;">
						<div class="float-start my-3" style="display: inline-block;"><h5 style="display: inline-block;">Page 1</h5></div>
						<button type="button" id="btnPageDel" class="btn btn-danger btn-sm my-3 mx-3" style="border:none;"><i class="fa-solid fa-minus"></i></button>
						<div style="clear:both;"></div>
						<div class="mb-3">
						  <input type="text" class="form-control form-control-sm" id="" name="questionContent" placeholder="질문">
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
								<input type="text" class="form-control form-control-sm" id="choiceContent" name="choiceContent" placeholder="선택지1 내용">
							</div>
							<div class="col-1">
								<input type="text" class="form-control form-control-sm col-1" id="choiceScore" name="choiceScore" placeholder="배점">
							</div>
						</div>
						<div class="mb-3 row">
							<div class="col-10">
								<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지2 내용">
							</div>
							<div class="col-1">
								<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">
							</div>
						</div>
						<div class="mb-3 row">
							<div class="col-10">
								<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지3 내용">
							</div>
							<div class="col-1">
								<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">
							</div>
						</div>
						<div class="mb-3 row">
							<div class="col-10">
								<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지4 내용">
							</div>
							<div class="col-1">
								<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">
							</div>
						</div>
						<div class="mb-3 row">
							<div class="col-10">
								<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지5 내용">
							</div>
							<div class="col-1">
								<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">
							</div>
						</div>
						<div class="mb-3 row">
							<div class="col-10">
								<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지6 내용">
							</div>
							<div class="col-1">
								<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">
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
				</div>
				<!-- 임시 E -->
				<!-- 
				<div class="container my-5" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>Page 2</h5></div>
					<div class="float-end my-3">
						<button class="btn btn-light btn-sm" style="border:none;"><i class="fa-solid fa-plus"></i></button>
						<button class="btn btn-secondary btn-sm" style="border:none;"><i class="fa-solid fa-minus"></i></button>
					</div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="questionContent" name="questionContent" placeholder="질문">
					</div>
					<div class="my-3 row">
						<h6 class="col-2"><b>선택지</b></h6>
						<div class="form-check form-switch col-2">
						  <input class="form-check-input" type="checkbox" role="switch" id="multichoiceNy">
						  <label class="form-check-label" for="multichoiceNy">중복 선택</label>
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id="choice1" placeholder="선택지1 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choice1score" placeholder="배점">
						</div>
						<div class="col-1">
						  <button class="btn btn-light btn-sm" style="border:none;"><i class="fa-solid fa-plus"></i></button>
						  <button class="btn btn-secondary btn-sm" style="border:none;"><i class="fa-solid fa-minus"></i></button>
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-10">
							<input type="text" class="form-control form-control-sm" id="choice2" placeholder="선택지2 내용">
						</div>
						<div class="col-1">
							<input type="text" class="form-control form-control-sm col-1" id="choice2score" placeholder="배점">
						</div>
						<div class="col-1">
						  <button class="btn btn-light btn-sm" style="border:none;"><i class="fa-solid fa-plus"></i></button>
						  <button class="btn btn-light btn-sm" style="border:none;"><i class="fa-solid fa-minus"></i></button>
						</div>
						<div class="col-12 mt-3">
							<div class="row justify-content-center">
								<div class="row justify-content-center">
									<img class="img-thumbnail" alt="" id="preview6" style="width:400px; height:210px;">
								</div>
								<h6 class="my-3" style="text-align: center;">질문 이미지<br>(730 x *)</h6>
								<label class="btn btn-sm mb-4" id="input-file-button" for="input-file6" style="width:100px; background-color:#525252">첨부파일</label>
								<input type="file" onchange="readURL6(this);" id="input-file6" style="display:none;">
							</div>
						</div>
					</div>
				</div>
				 -->
				<div class="my-3 pt-3" id="contentResultRegistration"><h6><b>결과 페이지 작성</b></h6></div>
				<div class="container my-5" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>#1</h5></div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="resultTitle" placeholder="결과 제목">
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
				  			<textarea type="text" class="form-control form-control-sm" id="resultContent" placeholder="내용을 입력해주세요" style="resize:none; height:20em;"></textarea>
						</div>
					</div>
					<div class="mb-3 row">
					  <label for="resultScoreRange" class="col-2 col-form-label">결과 점수합 범위</label>
					  <div class="col-1">
					    <input type="text" class="form-control" id="scoreRangeStart" placeholder="이상">
					  </div>
					  <div class="col-auto" style="font-size: 24px;">~</div>
					  <div class="col-1">
					    <input type="text" class="form-control" id="scoreRangeEnd" placeholder="이하">
					  </div>
					</div>
					<div class="mb-3 row" style="text-align: center;">
					  <label for="resultRelation" class="col-2 col-form-label">관계성</label>
					  <div class="col-2">
					    <input type="text" class="form-control" id="relation1" placeholder="관계1">
					  </div>
					  <div class="col-2">
					    <input type="text" class="form-control" id="relation2" placeholder="관계2">
					  </div>
					</div>
				</div>
				<div class="container my-5" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>#2</h5></div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="resultTitle" placeholder="결과 제목">
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
				  			<textarea type="text" class="form-control form-control-sm" id="resultContent" placeholder="내용을 입력해주세요" style="resize:none; height:20em;"></textarea>
						</div>
					</div>
					<div class="mb-3 row">
					  <label for="resultScoreRange" class="col-2 col-form-label">결과 점수합 범위</label>
					  <div class="col-1">
					    <input type="text" class="form-control" id="scoreRangeStart" placeholder="이상">
					  </div>
					  <div class="col-auto" style="font-size: 24px;">~</div>
					  <div class="col-1">
					    <input type="text" class="form-control" id="scoreRangeEnd" placeholder="이하">
					  </div>
					</div>
					<div class="mb-3 row" style="text-align: center;">
					  <label for="resultRelation" class="col-2 col-form-label">관계성</label>
					  <div class="col-2">
					    <input type="text" class="form-control" id="relation1" placeholder="관계1">
					  </div>
					  <div class="col-2">
					    <input type="text" class="form-control" id="relation2" placeholder="관계2">
					  </div>
					</div>
				</div>
				<div class="container my-5" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>#3</h5></div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="resultTitle" placeholder="결과 제목">
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
				  			<textarea type="text" class="form-control form-control-sm" id="resultContent" placeholder="내용을 입력해주세요" style="resize:none; height:20em;"></textarea>
						</div>
					</div>
					<div class="mb-3 row">
					  <label for="resultScoreRange" class="col-2 col-form-label">결과 점수합 범위</label>
					  <div class="col-1">
					    <input type="text" class="form-control" id="scoreRangeStart" placeholder="이상">
					  </div>
					  <div class="col-auto" style="font-size: 24px;">~</div>
					  <div class="col-1">
					    <input type="text" class="form-control" id="scoreRangeEnd" placeholder="이하">
					  </div>
					</div>
					<div class="mb-3 row" style="text-align: center;">
					  <label for="resultRelation" class="col-2 col-form-label">관계성</label>
					  <div class="col-2">
					    <input type="text" class="form-control" id="relation1" placeholder="관계1">
					  </div>
					  <div class="col-2">
					    <input type="text" class="form-control" id="relation2" placeholder="관계2">
					  </div>
					</div>
				</div>
				<!-- 
				<div class="container my-5" style="margin-left:0px; border:solid; border-width:2px; width:100%;">
					<div class="float-start my-3"><h5>#2</h5></div>
					<div class="float-end my-3">
						<button class="btn btn-light btn-sm" style="border:none;"><i class="fa-solid fa-plus"></i></button>
						<button class="btn btn-light btn-sm" style="border:none;"><i class="fa-solid fa-minus"></i></button>
					</div>
					<div style="clear:both;"></div>
					<div class="mb-3">
					  <input type="text" class="form-control form-control-sm" id="contentTitleInput" placeholder="결과 제목">
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
				  			<textarea type="text" class="form-control form-control-sm" id="contentIntroduceInput" placeholder="내용을 입력해주세요" style="resize:none; height:20em;"></textarea>
						</div>
					</div>
					<div class="mb-3 row">
					  <label for="resultScoreRange" class="col-2 col-form-label">결과 점수합 범위</label>
					  <div class="col-1">
					    <input type="text" class="form-control" id="resultScoreStart" placeholder="이상">
					  </div>
					  <div class="col-auto" style="font-size: 24px;">~</div>
					  <div class="col-1">
					    <input type="text" class="form-control" id="resultScoreEnd" placeholder="이하">
					  </div>
					</div>
					<div class="mb-3 row" style="text-align: center;">
					  <label for="resultRelation" class="col-2 col-form-label">관계성</label>
					  <div class="col-2">
					    <input type="text" class="form-control" id="resultRelation" placeholder="관계1">
					  </div>
					  <div class="col-2">
					    <input type="text" class="form-control" id="resultRelation" placeholder="관계2">
					  </div>
					</div>
				</div>
				 -->
				<button type="button" class="float-end btn btn-dark btn-sm" id="btnSave"> 컨텐츠 작성완료</button>
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
<script type="text/javascript">
	var goUrlInst = "/content/contentInst";				/* #-> */

	var form = $("form[name=myForm]");
	
	$("#btnSave").on("click",function(){
		form.attr("action",goUrlInst).submit();
	});
	 
//	$("#btnPageAdd").on("click",function(){
//		const newDiv = document.createElement('div');
//		var test = document.getElementById('contentPage');
//		
//		const newText = test.cloneNode(true);
//		
//		newDiv.appendChild(newText);
//		document.body.appendChild(newDiv);
//		/* var test1 = test.cloneNode(true); */
//		
//		/* test1.insertAfter("#contentPageRegistration"); */
//	});

	PageAdd = function(objName) {
		
//		objName 과 seq 는 jsp 내에서 유일 하여야 함.
//		contentPage: 1
		
		var obj = $("#" + objName +"")[0].files;
		var objCount = obj.length;
		
		for (var i =0;i<objCount; i++) {
			var divContentPage ="";
			divContentPage +='<div class="container questionCon" id="contentPage" style="margin-left:0px; margin-bottom:20px; border:solid; border-width:2px; width:100%;">';
			divContentPage +='	<div class="float-start my-3" style="display: inline-block;"><h5 style="display: inline-block;">Page '+i+'</h5></div>';
			divContentPage +='	<button type="button" id="btnPageDel" class="btn btn-danger btn-sm my-3 mx-3" style="border:none;"><i class="fa-solid fa-minus"></i></button>';
			divContentPage +='	<div style="clear:both;"></div>';
			divContentPage +='	<div class="mb-3">';
			divContentPage +='	  <input type="text" class="form-control form-control-sm" id="" name="questionContent" placeholder="질문">';
			divContentPage +='	</div>';
			divContentPage +='	<div class="my-3 row">';
			divContentPage +='		<h6 class="col-2"><b>선택지</b></h6>';
			divContentPage +='		<div class="form-check form-switch col-2">';
			divContentPage +='		  <input class="form-check-input" type="checkbox" role="switch" id="multiChoiceNy">';
			divContentPage +='		  <label class="form-check-label" for="multiChoiceNy">중복 선택</label>';
			divContentPage +='		</div>';
			divContentPage +='	</div>';
			divContentPage +='	<div class="mb-3 row">';
			divContentPage +='		<div class="col-10">';
			divContentPage +='			<input type="text" class="form-control form-control-sm" id="choiceContent" name="choiceContent" placeholder="선택지1 내용">';
			divContentPage +='		</div>';
			divContentPage +='		<div class="col-1">';
			divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="choiceScore" name="choiceScore" placeholder="배점">';
			divContentPage +='		</div>';
			divContentPage +='	</div>';
			divContentPage +='	<div class="mb-3 row">';
			divContentPage +='		<div class="col-10">';
			divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지2 내용">';
			divContentPage +='		</div>';
			divContentPage +='		<div class="col-1">';
			divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
			divContentPage +='		</div>';
			divContentPage +='	</div>';
			divContentPage +='	<div class="mb-3 row">';
			divContentPage +='		<div class="col-10">';
			divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지3 내용">';
			divContentPage +='		</div>';
			divContentPage +='		<div class="col-1">';
			divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
			divContentPage +='		</div>';
			divContentPage +='	</div>';
			divContentPage +='	<div class="mb-3 row">';
			divContentPage +='		<div class="col-10">';
			divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지4 내용">';
			divContentPage +='		</div>';
			divContentPage +='		<div class="col-1">';
			divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
			divContentPage +='		</div>';
			divContentPage +='	</div>';
			divContentPage +='	<div class="mb-3 row">';
			divContentPage +='		<div class="col-10">';
			divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지5 내용">';
			divContentPage +='		</div>';
			divContentPage +='		<div class="col-1">';
			divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
			divContentPage +='		</div>';
			divContentPage +='	</div>';
			divContentPage +='	<div class="mb-3 row">';
			divContentPage +='		<div class="col-10">';
			divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지6 내용">';
			divContentPage +='		</div>';
			divContentPage +='		<div class="col-1">';
			divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
			divContentPage +='		</div>';
			divContentPage +='		<div class="col-12 mt-3">';
			divContentPage +='			<div class="row justify-content-center">';
			divContentPage +='				<div class="row justify-content-center">';
			divContentPage +='					<img class="img-thumbnail" alt="" id="preview5" style="width:400px; height:210px;">';
			divContentPage +='				</div>';
			divContentPage +='				<h6 class="my-3" style="text-align: center;">질문 이미지<br>(730 x *)</h6>';
			divContentPage +='				<label class="btn btn-sm mb-4" id="input-file-button" for="input-file5" style="width:100px; background-color:#525252">첨부파일</label>';
			divContentPage +='				<input type="file" onchange="readURL5(this);" id="input-file5" style="display:none;">';
			divContentPage +='			</div>';
			divContentPage +='		</div>';
			divContentPage +='	</div>';
			divContentPage +='</div>';
			$("#contentPage").after(divContentPage);
		}
	}
	
	/* 
		$("#btnPageAdd").click(function(){
		var divContentPage ="";
		divContentPage +='<div class="container questionCon" id="contentPage" style="margin-left:0px; margin-bottom:20px; border:solid; border-width:2px; width:100%;">';
		divContentPage +='	<div class="float-start my-3" style="display: inline-block;"><h5 style="display: inline-block;">Page 1</h5></div>';
		divContentPage +='	<button type="button" id="btnPageDel" class="btn btn-danger btn-sm my-3 mx-3" style="border:none;"><i class="fa-solid fa-minus"></i></button>';
		divContentPage +='	<div style="clear:both;"></div>';
		divContentPage +='	<div class="mb-3">';
		divContentPage +='	  <input type="text" class="form-control form-control-sm" id="" name="questionContent" placeholder="질문">';
		divContentPage +='	</div>';
		divContentPage +='	<div class="my-3 row">';
		divContentPage +='		<h6 class="col-2"><b>선택지</b></h6>';
		divContentPage +='		<div class="form-check form-switch col-2">';
		divContentPage +='		  <input class="form-check-input" type="checkbox" role="switch" id="multiChoiceNy">';
		divContentPage +='		  <label class="form-check-label" for="multiChoiceNy">중복 선택</label>';
		divContentPage +='		</div>';
		divContentPage +='	</div>';
		divContentPage +='	<div class="mb-3 row">';
		divContentPage +='		<div class="col-10">';
		divContentPage +='			<input type="text" class="form-control form-control-sm" id="choiceContent" name="choiceContent" placeholder="선택지1 내용">';
		divContentPage +='		</div>';
		divContentPage +='		<div class="col-1">';
		divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="choiceScore" name="choiceScore" placeholder="배점">';
		divContentPage +='		</div>';
		divContentPage +='	</div>';
		divContentPage +='	<div class="mb-3 row">';
		divContentPage +='		<div class="col-10">';
		divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지2 내용">';
		divContentPage +='		</div>';
		divContentPage +='		<div class="col-1">';
		divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
		divContentPage +='		</div>';
		divContentPage +='	</div>';
		divContentPage +='	<div class="mb-3 row">';
		divContentPage +='		<div class="col-10">';
		divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지3 내용">';
		divContentPage +='		</div>';
		divContentPage +='		<div class="col-1">';
		divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
		divContentPage +='		</div>';
		divContentPage +='	</div>';
		divContentPage +='	<div class="mb-3 row">';
		divContentPage +='		<div class="col-10">';
		divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지4 내용">';
		divContentPage +='		</div>';
		divContentPage +='		<div class="col-1">';
		divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
		divContentPage +='		</div>';
		divContentPage +='	</div>';
		divContentPage +='	<div class="mb-3 row">';
		divContentPage +='		<div class="col-10">';
		divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지5 내용">';
		divContentPage +='		</div>';
		divContentPage +='		<div class="col-1">';
		divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
		divContentPage +='		</div>';
		divContentPage +='	</div>';
		divContentPage +='	<div class="mb-3 row">';
		divContentPage +='		<div class="col-10">';
		divContentPage +='			<input type="text" class="form-control form-control-sm" id="" name="choiceContent" placeholder="선택지6 내용">';
		divContentPage +='		</div>';
		divContentPage +='		<div class="col-1">';
		divContentPage +='			<input type="text" class="form-control form-control-sm col-1" id="" name="choiceScore" placeholder="배점">';
		divContentPage +='		</div>';
		divContentPage +='		<div class="col-12 mt-3">';
		divContentPage +='			<div class="row justify-content-center">';
		divContentPage +='				<div class="row justify-content-center">';
		divContentPage +='					<img class="img-thumbnail" alt="" id="preview5" style="width:400px; height:210px;">';
		divContentPage +='				</div>';
		divContentPage +='				<h6 class="my-3" style="text-align: center;">질문 이미지<br>(730 x *)</h6>';
		divContentPage +='				<label class="btn btn-sm mb-4" id="input-file-button" for="input-file5" style="width:100px; background-color:#525252">첨부파일</label>';
		divContentPage +='				<input type="file" onchange="readURL5(this);" id="input-file5" style="display:none;">';
		divContentPage +='			</div>';
		divContentPage +='		</div>';
		divContentPage +='	</div>';
		divContentPage +='</div>';
		$("#contentPage").after(divContentPage);
	});
	 */
	$(document).ready(function() {
		$("#btnPageDel").click(function(){
		  $("#contentPage").remove();
		});
	});
	
	if($("#openNy").is(":checked")){
		$("#openNy").val(1);
	} else {
		$("#openNy").val(0);
	}
	
</script>
</body>
</html>
