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
	<title>AdminMemberInfo</title>
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
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>회원관리</b></h5>
		<h6 style="color:gray;"><b>회원 상세 정보</b></h6>
		<div>
			<button type="button" id="btnList" name="btnList" class="btn btn-sm" style="width:60px; font-size:10px; background-color:#e6e6e6;">뒤로가기</button>
		</div>
		<form method="post" id="myForm" name="myForm" autocomplete="off">
			<!-- *Vo.jsp s -->
			<%@include file="MemberVo.jsp"%>		<!-- #-> -->
			<!-- *Vo.jsp e -->
			<div class="p-5" style="background-color: white;">
				<div class="row pt-4 py-2">
					<label for="nickname" class="col-1 col-form-label">닉네임</label>
				    <div class="col-4">
				      <input type="text" class="form-control" id="nickname" name="nickname" value="<c:out value="${item.nickname }"></c:out>">
				    </div>
				</div>
				<div class="row py-2">
					<label for="dob" class="col-1 col-form-label">생년월일</label>
				    <div class="col-4">
				      <input type="text" class="form-control" id="dob" name="dob" placeholder="ex)080101" value="<c:out value="${item.dob }"></c:out>">
				    </div>
				</div>
				<div class="row py-2">
					<label for="gender" class="col-1 col-form-label">성별</label>
				    <div class="col-2">
				      <select class="form-select" id="gender" name="gender">
				      	<option value ="" <c:if test="${empty item.gender}" >selected</c:if>>성별</option>
				      	<option value = 1 <c:if test="${item.gender eq 1 }" >selected</c:if>>남성</option>
				      	<option value = 2 <c:if test="${item.gender eq 2 }" >selected</c:if>>여성</option>
				      </select>
				    </div>
				</div>
				<div class="row py-2">
					<label for="email" class="col-1 col-form-label">이메일</label>
					<div class="col-4">
				      <input type="text" class="form-control" id="email" name="email" placeholder="" value="<c:out value="${item.email }"></c:out>">
				    </div>
				</div>
				<div class="row py-2">
					<label for="id" class="col-1 col-form-label">아이디</label>
				    <div class="col-4">
				      <input type="text" class="form-control" id="id" name="id" placeholder="" value="<c:out value="${item.id }"></c:out>">
				    </div>
				</div>
				<div class="row py-2">
					<label for="dd" class="col-1 col-form-label">가입일시</label>
				    <div class="col-4">
				      <input type="text" class="form-control-plaintext" readonly id="dd" name="dd" placeholder="" value="">
				    </div>
				</div>
				<div class="row py-2">
					<label for="dd" class="col-1 col-form-label">삭제여부</label>
				   <div class="col-2">
				      <select class="form-select col-2" id="delNy" name="delNy">
				      	<option value = 0 <c:if test="${item.delNy eq 0 }" >selected</c:if>>N</option>
				      	<option value = 1 <c:if test="${item.delNy eq 1 }" >selected</c:if>>Y</option>
				      </select>
				    </div>
				</div>
				<div class="container mt-3" style="margin-left:0px; border:solid; border-width:2px; width: 500px;">
					<div style="display:inline-block; position: relative; top:-12px; left:5px; background-color: white;">유저 기록 총괄</div>
					<div class="row mb-3">
						<div class="col-auto">
							댓글수
						</div>
						<div class="col-auto">
							12
						</div>
						<div class="col-auto">
							좋아요 수
						</div>
						<div class="col-auto">
							320
						</div>
						<div class="col-auto">
							누적신고수
						</div>
						<div class="col-auto">
							0
						</div>
						<div class="col-auto" style="font-size:14px; font-family: Edu NSW ACT Foundation;">
							<a href="./ZdminMemberContent.html"><b>컨텐츠 기록</b></a>
						</div>
					</div>
				</div>
				<div class="row mt-4">
					<span class="col-2 offset-4"><button type="button" id="btnUpdt" name="btnUpdt" class="btn btn-sm btn-primary">수정하기</button></span>
				</div>
			</div>
		</form>
		<form name="formVo" id="formVo" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="MemberVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
		</form>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	var goUrlList = "/member/memberList"; 			/* #-> */
	var goUrlUpdt = "/member/memberUpdt";
	var goUrlInst = "/member/memberInst";
	
	var seq = $("input:hidden[name=seq]");				/* #-> */

	var form = $("form[name=myForm]");
	var formVo = $("form[name=formVo]");
	
	$("#btnList").on("click", function(){
		formVo.attr("action", goUrlList).submit();
	});
	
	$("#btnUpdt").on("click", function(){
		if (seq.val() == "0" || seq.val() == ""){
	   		form.attr("action", goUrlInst).submit();
	   	} else {
	   		form.attr("action", goUrlUpdt).submit();
	  	}
	});
	
</script>

</body>
</html>
