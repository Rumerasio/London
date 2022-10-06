<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="uTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>AdminCode</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
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
<!-- 로고단 s -->
<%@include file="../../zdmin/Logo.jsp" %>
<!-- 로고단 e -->
<div class="container" style="text-align: center;">
	<h4 style="position: relative; bottom: 50px;">관리자 페이지</h4>
</div>
<div class="row" style="width:1400px">
	<div class="col-2">
		<!-- 로그인정보태그단 s -->
		<%@include file="../../zdmin/zdminTag.jsp" %>
		<!-- 로그인정보태그단 e -->
		<!-- 메뉴단 s -->
		<%@include file="../../zdmin/Menu.jsp" %>
		<!-- 메뉴단 e -->
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>코드 관리</b></h5>
		<h6 style="color:gray;"><b>코드 추가</b></h6>
		<button type="button" class="btn btn-sm mt-2" id="btnList" name="btnList" style="width:60px; font-size:10px; background-color:#fcfcfc;">뒤로가기</button>
		<form method="post" id="myForm" name="myForm" autocomplete="off">
		<!-- *Vo.jsp s -->
		<%@include file="codeVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
			<div class="row py-2">
				<input type="hidden" id="codeAnotherAllowedNy" name="codeAnotherAllowedNy" value="0">
				<label for="codeGroup_seq" class="col-2 col-form-label">코드그룹 선택</label>
			    <div class="col-4">
			      <select class="form-select col-2" id="codeGroup_seq" name="codeGroup_seq">
			      	<option selected value = "">선택하세요</option>
			      	<c:forEach items="${CGlist}" var="CGlist" varStatus="status">
			      		<option value = "<c:out value="${CGlist.seq }"></c:out>"><c:out value="${CGlist.codeGroupNameKor }"></c:out></option>
			      	</c:forEach>
			      </select>
			      <div class="invalid-feedback" id="codeGroup_seqFeedback"></div>
			    </div>
			    <label for="codeGroupcode" class="col-2 col-form-label">코드그룹 코드</label>
			    <div class="col-4">
			      <input type="text" disabled class="form-control" id="codeGroupcode" name="codeGroupcode" placeholder="" value=""><%-- <c:if test="${codeGroup_seq eq CGlist.seq}"><c:out value="${CGlist.codeGroupcode }"/></c:if> --%>
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="seq" class="col-2 col-form-label">코드</label>
			    <div class="col-4">
			      <input type="text" class="form-control" disabled id="seq" name="seq" placeholder="자동생성" value="">
			    </div>
			    <label for="codeAnother" class="col-2 col-form-label">코드(Another)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeAnother" name="codeAnother" placeholder="" value="">
			      <div class="invalid-feedback" id="codeAnotherFeedback"></div>
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="codeNameKor" class="col-2 col-form-label">코드 이름(한글)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeNameKor" name="codeNameKor" value="">
			      <div class="invalid-feedback" id="codeNameKorFeedback"></div>
			    </div>
			    <label for="codeNameEng" class="col-2 col-form-label">코드 이름(영문)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeNameEng" name="codeNameEng" value="">
			      <div class="invalid-feedback" id="codeNameEngFeedback"></div>
			    </div>
			</div>
			<div class="row py-2">
				<label for="useNy" class="col-2 col-form-label">사용여부</label>
			    <div class="col-4">
			      <select class="form-select col-2" id="useNy" name="useNy">
			      	<option selected value = 1>Y</option>
			      	<option value = 0>N</option>
			      </select>
			    </div>
			    <label for="turn" class="col-2 col-form-label">순서</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="turn" name="turn" placeholder="숫자" value="">
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
		    	<div class="position-absolute end-0">
			    	<button type="button" id="btnSave" name="btnSave" class="btn btn-info">등록하기</button>
		    	</div>
		    </div>
		</form>
		<form name="formVo" id="formVo" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="codeVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
		</form>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/resources/zdmin/js/validationZdmin.js"></script>
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
<!-- <script type="text/javascript">
	function checkAndReg(){
		
		alert("작동여부");
		
		if(document.getElementById('codeGroup_seq').value == "" || document.getElementById('codeGroup_seq').value == null) {
			alert("코드가 종속될 코드그룹을 골라주세요");
			return false;
		}
		
		if(document.getElementById('codeAnother').value == "" || document.getElementById('codeAnother').value == null) {
			alert("코드(another) 값을 입력해주세요");
			document.getElementById('codeAnother').focus();
			return false;
		}
		
		if(document.getElementById('codeNameKor').value == "" || document.getElementById('codeNameKor').value == null) {
			alert("코드 이름(한글)을 입력해주세요");
			document.getElementById('codeNameKor').focus();
			return false;
		}
		
		document.getElementById('codeRegForm').submit();
		
	}
</script> -->
<!-- validation -->
<script type="text/javascript">
	$("#codeNameKor").on("focusout", function(){
		if(!checkOnlyKorean('codeNameKor', 2, 1, "코드 이름(한글)은 공백없이 한글만 입력해 주세요")) {
			return false;
		} 
	});
	$("#codeNameEng").on("focusout", function(){
		if(!checkOnlyEnglish('codeNameEng', 2, 1, "코드 이름(영어)은 공백없이 영어만 입력해 주세요")) {
			return false;
		} 
	});
	$("#codeAnother").on("focusout", function(){
		if(!checkOnlyNumber('codeAnother', 2, 1, 0, 0, 0, "코드(Anotehr)는 숫자만 입력해 주세요")) {
			return false;
		} else {
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "/code/checkCode"
				/* ,data : $("#formLogin").serialize() */
				,data : { "codeAnother" : $("#codeAnother").val() }
				,success: function(response) {
					if(response.rt == "success") {
						document.getElementById("codeAnother").classList.add('is-valid');
						document.getElementById("codeAnother").classList.remove('is-invalid');
	
						document.getElementById("codeAnotherFeedback").classList.remove('invalid-feedback');
						document.getElementById("codeAnotherFeedback").classList.add('valid-feedback');
						document.getElementById("codeAnotherFeedback").innerText = "사용 가능 합니다.";
						
						document.getElementById("codeAnotherAllowedNy").value = 1;
						
					} else {
						document.getElementById("codeAnother").classList.add('is-invalid');
						document.getElementById("codeAnother").classList.remove('is-valid');
						
						document.getElementById("codeAnotherFeedback").classList.remove('valid-feedback');
						document.getElementById("codeAnotherFeedback").classList.add('invalid-feedback');
						document.getElementById("codeAnotherFeedback").innerText = "사용 불가능 합니다";
						
						document.getElementById("codeAnotherAllowedNy").value = 0;
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
	});
</script>
<script type="text/javascript">
	var goUrlList = "/code/codeList"; 			/* #-> */
	var goUrlInst = "/code/codeInst"; 			/* #-> */
	
	var seq = $("input:hidden[name=seq]");				/* #-> */
	
	var form = $("form[name=myForm]");
	var formVo = $("form[name=formVo]");
	
	$("#btnSave").on("click",function(){
		if (seq.val() == "0" || seq.val() == ""){
	   		// insert
	   		if (validationInst() == false) return false;
	   		form.attr("action", goUrlInst).submit();
	   	} else {
	   		if (validationUpdt() == false) return false;
	   	}
	});
	
	$("#btnList").on("click",function(){
		formVo.attr("action",goUrlList).submit();
	});
	
	validationInst = function() {
		if(!checkSelectNull('codeGroup_seq', 2, "코드그룹 값을 선택해 주세요.")) return false;
		if(!checkOnlyNumber('codeAnother', 2, 0, 0, 0, 0, "코드(Another)를 입력해 주세요")) return false;
		if(!checkOnlyKorean('codeNameKor', 2, 0, "코드 이름(한글)을 입력해주세요")) return false;
		if(!checkOnlyEnglish('codeNameEng', 2, 0, "코드 이름(영어)을 입력해 주세요")) return false;
		if(validationUpdt() == false) return false;
	}
	
	validationUpdt = function() {
		
	}
</script>

</body>
</html>