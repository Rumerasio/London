<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<%@ page session="false" %>


<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>AdminCodegroupReg</title>
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
		<%@include file="../../zdmin/Menu.jsp" %>
		<!-- 메뉴단 e -->
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>코드그룹 관리</b></h5>
		<h6 style="color:gray;"><b>코드그룹 추가</b></h6>
		<form method="post" id="codeGroupRegForm" name="codeGroupRegForm" autocomplete="off">
		<button type="button" class="btn btn-sm mt-2" id="btnList" name="btnList" style="width:60px; font-size:10px; background-color:#fcfcfc;">뒤로가기</button>
		<!-- *Vo.jsp s -->
		<%@include file="codeGroupVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
			<div class="row justify-content-center py-2">
				<input type="hidden" id="codeGroupCodeAllowedNy" name="codeGroupCodeAllowedNy" value="0">
				<input type="hidden" id="codeGroupCodeAnotherAllowedNy" name="codeGroupCodeAnotherAllowedNy" value="0">
				<label for="codeGroupCode" class="col-2 col-form-label">코드그룹 코드</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeGroupCode" name="codeGroupCode" placeholder="숫자" value="">
			      <div class="invalid-feedback" id="codeGroupCodeFeedback"></div>
			    </div>
			    <label for="codeGroupCodeAnother" class="col-2 col-form-label">코드그룹 코드(Another)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeGroupCodeAnother" name="codeGroupCodeAnother" placeholder="숫자" value="">
			      <div class="invalid-feedback" id="codeGroupCodeAnotherFeedback"></div>
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="codeGroupNameKor" class="col-2 col-form-label">코드그룹 이름(한글)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeGroupNameKor" name="codeGroupNameKor" value="">
			    </div>
			    <label for="codeGroupNameEng" class="col-2 col-form-label">코드그룹 이름(영문)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeGroupNameEng" name="codeGroupNameEng" value="">
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
				<label for="intType3" class="col-2 col-form-label">예비3 (int type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="intType3" name="intType3" value="" placeholder="숫자">
			    </div>
			</div>
			<!-- <div class="row py-2">
				<label for="gender" class="col-2 col-form-label">성별(test)</label>
			    <div class="col-4">
			      <input type="radio" id="gender1" name="gender" value="1">남성
			      <input type="radio" id="gender2" name="gender" value="2">여성
			      <input type="radio" id="gender3" name="gender" value="3">기타
			    </div>
			</div>
			<div class="row py-2">
				<label for="hobby" class="col-2 col-form-label">취미(test)</label>
			    <div class="col-4">
			      <input type="checkbox" id="hobby1" name="hobby" value="1">수영
			      <input type="checkbox" id="hobby2" name="hobby" value="2">게임
			      <input type="checkbox" id="hobby3" name="hobby" value="3">클라리넷
			    </div>
			</div>	 -->		
			<div class="position-relative">
		    	<div class="position-absolute end-0">
			    	<button type="button" id="btnSave" name="btnSave" class="btn btn-info">등록하기</button>
		    	</div>
		    </div>
		</form>
		<form name="formVo" id="formVo" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="codeGroupVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
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
<script type="text/javascript">
	function test(){
		
		/* 
		// 선택된 목록 가져오기
		  const selectedEls = document.querySelectorAll('input[name="hobby"]:checked');
		  
		  // 선택된 목록에서 value 찾기
		  var result = '';
		  selectedEls.forEach((el) => {
		    result += el.value + ' ';
		  });
		  
		  // 출력
		  alert(result);
		   */
		/* if (document.querySelector('input[type=radio][name=gender]:checked') == null) {
				alert("성별을 선택하세요");
			} else {
				alert(document.querySelector('input[name=gender]:checked').value);
			}
		 */
		if(document.getElementById('codeGroupCode').value == null || document.getElementById('codeGroupCode').value =="") {
			alert("그룹코드값을 날래날래 입력하라우!");
			document.getElementById('codeGroupCode').focus();
			return false;
		} 
		
		if(document.getElementById('codeGroupNameKor').value == null || document.getElementById('codeGroupNameKor').value == "") {
			alert("코드그룹 이름(한글) 값을 입력해주세요");
			document.getElementById('codeGroupNameKor').focus();
			return false;
		}
		
		alert("정보 잘~ 받았습니다");
/*	
		alert("useNy");
		alert(document.getElementById('useNy').value);
		alert(document.getElementById('useNy').options[document.getElementById('useNy').selectedIndex].value);
		alert("gender값");
		alert(document.querySelector("input[name='gender']:checked").value);
*/
		
		document.getElementById('codeGroupRegForm').submit();
	}
</script>
<script type="text/javascript">
	$("#codeGroupCode").on("focusout", function(){
//		if(!checkId('ifmmId', 2, 0, "영대소문자,숫자,특수문자(-_.),4~20자리만 입력 가능합니다")) {
//			return false;
//		} else {
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "/codeGroup/checkCode"
				/* ,data : $("#formLogin").serialize() */
				,data : { "codeGroupCode" : $("#codeGroupCode").val() }
				,success: function(response) {
					if(response.rt == "success") {
						document.getElementById("codeGroupCode").classList.add('is-valid');
						document.getElementById("codeGroupCode").classList.remove('is-invalid');
	
						document.getElementById("codeGroupCodeFeedback").classList.remove('invalid-feedback');
						document.getElementById("codeGroupCodeFeedback").classList.add('valid-feedback');
						document.getElementById("codeGroupCodeFeedback").innerText = "사용 가능 합니다.";
						
						document.getElementById("codeGroupCodeAllowedNy").value = 1;
						
					} else {
						document.getElementById("codeGroupCode").classList.add('is-invalid');
						document.getElementById("codeGroupCode").classList.remove('is-valid');
						
						document.getElementById("codeGroupCodeFeedback").classList.remove('valid-feedback');
						document.getElementById("codeGroupCodeFeedback").classList.add('invalid-feedback');
						document.getElementById("codeGroupCodeFeedback").innerText = "사용 불가능 합니다";
						
						document.getElementById("codeGroupCodeAllowedNy").value = 0;
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
//		}
	});
	
	$("#codeGroupCodeAnother").on("focusout", function(){
//		if(!checkId('ifmmId', 2, 0, "영대소문자,숫자,특수문자(-_.),4~20자리만 입력 가능합니다")) {
//			return false;
//		} else {
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "/codeGroup/checkCodeAnother"
				/* ,data : $("#formLogin").serialize() */
				,data : { "codeGroupCodeAnother" : $("#codeGroupCodeAnother").val() }
				,success: function(response) {
					if(response.rt == "success") {
						document.getElementById("codeGroupCodeAnother").classList.add('is-valid');
						document.getElementById("codeGroupCodeAnother").classList.remove('is-invalid');
	
						document.getElementById("codeGroupCodeAnotherFeedback").classList.remove('invalid-feedback');
						document.getElementById("codeGroupCodeAnotherFeedback").classList.add('valid-feedback');
						document.getElementById("codeGroupCodeAnotherFeedback").innerText = "사용 가능 합니다.";
						
						document.getElementById("codeGroupCodeAnotherAllowedNy").value = 1;
						
					} else {
						document.getElementById("codeGroupCodeAnother").classList.add('is-invalid');
						document.getElementById("codeGroupCodeAnother").classList.remove('is-valid');
						
						document.getElementById("codeGroupCodeAnotherFeedback").classList.remove('valid-feedback');
						document.getElementById("codeGroupCodeAnotherFeedback").classList.add('invalid-feedback');
						document.getElementById("codeGroupCodeAnotherFeedback").innerText = "사용 불가능 합니다";
						
						document.getElementById("codeGroupCodeAnotherAllowedNy").value = 0;
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
//		}
	});

	var goUrlList = "/codeGroup/AdminCodegroupList"; 			/* #-> */
	var goUrlUpdt = "/codeGroup/codeGroupUpdt";				/* #-> */
	var goUrlVele = "/codeGroup/codeGroupVele";				/* #-> */
	var goUrlDele = "/codeGroup/codeGroupDele";				/* #-> */
	var goUrlInst = "/codeGroup/codeGroupInst";				/* #-> */
	
	var seq = $("input:hidden[name=seq]");				/* #-> */
	
	var form = $("form[name=codeGroupRegForm]");
	var formVo = $("form[name=formVo]");
	
	$("#btnSave").on("click",function(){
		form.attr("action",goUrlInst).submit();
	});
	
	$("#btnList").on("click", function(){
		formVo.attr("action", goUrlList).submit();
	});
</script>
</body>
</html>
