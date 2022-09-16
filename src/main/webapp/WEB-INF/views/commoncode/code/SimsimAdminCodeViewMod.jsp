<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="false" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="uTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>AdminCodeViewMod</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Edu+NSW+ACT+Foundation:wght@700&display=swap');
	body {
	background-color: rgba(0, 86, 102, 0.07);
	}
	table,td{
		text-align:center;
		border:1px solid #0F52BA20;
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
		<div class="mt-3 pt-2 ps-3" style="background-color:rgb(224, 224, 224);">
			<span style="text-align: center;"><h5>메뉴</h5></span>
			<ul class="list-unstyled">
				<li class="fw-semibold">회원 관리
					<ul class="list-unstyled ps-2">
						<a href="./ZdminMember.html"><li style="font-weight: normal;">회원관리</li></a>
						<a href="./ZdminCommentRecord.html"><li style="font-weight: normal;">댓글관리</li></a>
					</ul>
				</li>
				<li class="fw-semibold">컨텐츠 관리
					<ul class="list-unstyled ps-2">
						<a href="./ZdminContentRecord.html"><li style="font-weight: normal;">컨텐츠 이용내역</li></a>
						<a href="./ZdminContentList.html"><li style="font-weight: normal;">컨텐츠 목록</li></a>
					</ul>
				</li>
				<li class="fw-semibold">소스관리
					<ul class="list-unstyled ps-2">
						<a href="./ZdminCodegroup.html"><li style="font-weight: normal;">코드그룹 관리</li></a>
						<a href="./ZdminCode.html"><li style="font-weight: normal;">코드 관리</li></a>
					</ul>
				</li>
				<li class="fw-semibold">통계</li>
			</ul>
		</div>
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>코드 관리</b></h5>
		<h6 style="color:gray;"><b>코드 추가</b></h6>
		<a href="./ZdminCodegroup.html"><button type="button" class="btn btn-sm mt-2" style="width:60px; font-size:10px; background-color:#fcfcfc;">뒤로가기</button></a>
		<form method="post" id="myForm" name="myForm">
			<div class="row py-2">
				<label for="codeGroup_seq" class="col-2 col-form-label">코드그룹 선택</label>
			    <div class="col-4">
			     <select class="form-select col-2" id="codeGroup_seq" name="codeGroup_seq">
			      	<option selected value = "">선택하세요</option>
			      	<c:forEach items="${list1}" var="list1" varStatus="status">
			      		<option value = "<c:out value="${list1.seq }"></c:out>"><c:out value="${list1.codeGroupNameKor }"></c:out></option>
			      	</c:forEach>
			      </select>
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="seq" class="col-2 col-form-label">코드</label>
			    <div class="col-4">
			      <input type="text" class="form-control" disabled id="seq" name="seq" placeholder="자동생성" value="101">
			    </div>
			    <label for="codeAnother" class="col-2 col-form-label">코드(Another)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeAnother" name="codeAnother" placeholder="" value="">
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="codeNameKor" class="col-2 col-form-label">코드 이름(한글)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeNameKor" name="codeNameKor" value="남성">
			    </div>
			    <label for="codeNameEng" class="col-2 col-form-label">코드 이름(영문)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeNameEng" name="codeNameEng" value="Male">
			    </div>
			</div>
			<div class="row py-2">
				<label for="useNy" class="col-2 col-form-label">사용여부</label>
			    <div class="col-4">
			      <select class="form-select col-2" id="useNy" name="useNy">
			      	<option selected value = 0>Y</option>
			      	<option value = 1>N</option>
			      </select>
			    </div>
			    <label for="turn" class="col-2 col-form-label">순서</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="turn" name="turn" placeholder="숫자" value="1">
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="content" class="col-2 col-form-label">설명</label>
			    <div class="col-4">
			      <textarea class="form-control" id="content" name="content" value=""></textarea>
			    </div>
			    <label for="delNy" class="col-2 col-form-label">삭제여부</label>
			    <div class="col-4">
			      <select class="form-select col-2" id="delNy" name="delNy">
			      	<option selected value = 0>N</option>
			      	<option value = 1>Y</option>
			      </select>
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="varcharType1" class="col-2 col-form-label">예비1 (varchar type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="varcharType1" name="varcharType1" value="" placeholder="영문(대소문자), 숫자">
			    </div>
			    <label for="varcharType2" class="col-2 col-form-label">예비2 (varchar type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="varcharType2" name="varcharType2" value="" placeholder="영문(대소문자), 숫자">
			    </div>
			</div>
			<div class="row py-2">
				<label for="varcharType3" class="col-2 col-form-label">예비3 (varchar type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="varcharType3" name="varcharType3" value="" placeholder="영문(대소문자), 숫자">
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="intType1" class="col-2 col-form-label">예비1 (int type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="intType1" name="intType1" value="" placeholder="숫자">
			    </div>
			    <label for="intType2" class="col-2 col-form-label">예비2 (int type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="intType2" name="intType2" value="" placeholder="숫자">
			    </div>
			</div>
			<div class="row py-2">
				<label for="intType3" class="col-2 col-form-label">예비1 (int type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="intType3" name="intType3" value="" placeholder="숫자">
			    </div>
			</div>
		
			<div class="position-relative">
		    	<div class="position-relative">
			    	<div class="position-absolute top-0">
				    	<button type="button" class="btn btn-danger" title="데이터 삭제" data-bs-toggle="modal" data-bs-target="#data_delete_modal">데이터 삭제</button> <!-- <i class="fa-solid fa-skull"></i> -->
			    	</div>
			    	<div class="position-absolute end-0">
				    	<a href="./ZdminCode.html"><button type="button" class="btn btn-info">수정하기</button></a>
			    	</div>
					<div class="modal" tabindex="-1" id="data_delete_modal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">데이터 삭제</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <p>정말 삭제하시겠습니까?</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-danger">삭제</button>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
		    </div>
	    </form>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$("#ChkA").click(function(){
			if($("#ChkA").is(":checked")) $("input[name=Chk]").prop("checked", true);
			else $("input[name=Chk]").prop("checked",false);
		});
		
		$("input[name=Chk]").click(function(){
			var total = $("input[name=Chk]").length;
			var checked = $("input[name=Chk]:checked").length;
			
			if(total != checked) $("#ChkA").prop("checked",false);
			else $("#ChkA").prop("checked",true);
		})
	});
</script>
</body>
</html>
