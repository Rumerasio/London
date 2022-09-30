<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>AdminCodegroupMod</title>
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
		<h5 class="mt-3"><b>코드그룹 관리</b></h5>
		<h6 style="color:gray;"><b>코드그룹 추가</b></h6>
		<form method="post" id="myForm" name="myForm" autocomplete="off">
			<!-- *Vo.jsp s -->
			<%@include file="codeGroupVo.jsp"%>		<!-- #-> -->
			<!-- *Vo.jsp e -->
			<button type="button" id="btnList" name="btnList" class="btn btn-sm mt-2" style="width:60px; font-size:10px; background-color:#fcfcfc;">뒤로가기</button>
			<%-- <input type="hidden" id="seq" name="seq" value="<c:out value="${item.seq}"></c:out>"> --%>
			<div class="row justify-content-center py-2">
				<label for="codeGroupCode" class="col-2 col-form-label">코드그룹 코드</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeGroupCode" name="codeGroupCode" placeholder="영문(대소문자), 숫자" value='<c:out value="${item.codeGroupCode }"></c:out>'>
			    </div>
			    <label for="codeGroupCodeAnother" class="col-2 col-form-label">코드그룹 코드(Another)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeGroupCodeAnother" name="codeGroupCodeAnother" placeholder="영문(대소문자), 숫자" value="<c:out value="${item.codeGroupCodeAnother }"></c:out>">
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="codeGroupNameKor" class="col-2 col-form-label">코드그룹 이름(한글)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeGroupNameKor" name="codeGroupNameKor" value="<c:out value="${item.codeGroupNameKor }"></c:out>">
			    </div>
			    <label for="codeGroupNameEng" class="col-2 col-form-label">코드그룹 이름(영문)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="codeGroupNameEng" name="codeGroupNameEng" value="<c:out value="${item.codeGroupNameEng }"></c:out>">
			    </div>
			</div>
			<div class="row py-2">
				<label for="useNy" class="col-2 col-form-label">사용여부</label>
			    <div class="col-4">
			      <select class="form-select col-2" id="useNy" name="useNy">
			      	<option value = 0 <c:if test="${item.useNy eq 0 }" >selected</c:if>>Y</option>
			      	<option value = 1 <c:if test="${item.useNy eq 1 }" >selected</c:if>>N</option>
			      </select>
			    </div>
			    <label for="turn" class="col-2 col-form-label">순서</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="turn" name="turn" placeholder="숫자" value="<c:out value="${item.turn }"></c:out>">
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="content" class="col-2 col-form-label">설명</label>
			    <div class="col-4">
			      <textarea class="form-control" id="content" name="content" value="<c:out value="${item.content }"></c:out>"></textarea>
			    </div>
			    <label for="delNy" class="col-2 col-form-label">삭제여부</label>
			    <div class="col-4">
			      <select class="form-select col-2" id="delNy" name="delNy">
			      	<option value = "0" <c:if test="${item.delNy eq 0 }" >selected</c:if>>N</option>
			      	<option value = "1" <c:if test="${item.delNy eq 1 }" >selected</c:if>>Y</option>
			      </select>
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="varcharType1" class="col-2 col-form-label">예비1 (varchar type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="varcharType1" name="varcharType1" value="<c:out value="${item.varcharType1 }"></c:out>" placeholder="영문(대소문자), 숫자">
			    </div>
			    <label for="varcharType2" class="col-2 col-form-label">예비2 (varchar type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="varcharType2" name="varcharType2" value="<c:out value="${item.varcharType2 }"></c:out>" placeholder="영문(대소문자), 숫자">
			    </div>
			</div>
			<div class="row py-2">
				<label for="varcharType3" class="col-2 col-form-label">예비3 (varchar type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="varcharType3" name="varcharType3" value="<c:out value="${item.varcharType3 }"></c:out>" placeholder="영문(대소문자), 숫자">
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="intType1" class="col-2 col-form-label">예비1 (int type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="intType1" name="intType1" value="<c:out value="${item.intType1 }"></c:out>" placeholder="숫자">
			    </div>
			    <label for="intType2" class="col-2 col-form-label">예비2 (int type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="intType2" name="intType2" value="<c:out value="${item.intType2 }"></c:out>" placeholder="숫자">
			    </div>
			</div>
			<div class="row py-2">
				<label for="intType3" class="col-2 col-form-label">예비3 (int type)</label>
			    <div class="col-4">
			      <input type="text" class="form-control" id="intType3" name="intType3" value="<c:out value="${item.intType3 }"></c:out>" placeholder="숫자">
			    </div>
			</div>
			<div class="position-relative">
		    	<div class="position-absolute top-0">
			    	<button type="button" class="btn btn-danger" title="데이터 삭제" data-bs-toggle="modal" data-bs-target="#data_delete_modal">데이터 삭제</button> <!-- <i class="fa-solid fa-skull"></i> -->
			    	<button type="button" class="btn btn-warning" title="삭제처리" id="btnDel">삭제처리</button>
		    	</div>
		    	<div class="position-absolute end-0">
			    	<button type="button" class="btn btn-info" id="modify" name="modify">수정하기</button>
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
				        <button type="button" id="btnErase" class="btn btn-danger">삭제</button>
				      </div>
				    </div>
				  </div>
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
	var goUrlList = "/codeGroup/AdminCodegroupList"; 			/* #-> */
	var goUrlInst = "/codeGroup/codeGroupInst"; 			/* #-> */
	var goUrlUpdt = "/codeGroup/codeGroupUpdt";				/* #-> */
	var goUrlVele = "/codeGroup/codeGroupVele";				/* #-> */
	var goUrlDele = "/codeGroup/codeGroupDele";				/* #-> */
	
	var seq = $("input:hidden[name=seq]");				/* #-> */
	
	var form = $("form[name=myForm]");
	var formVo = $("form[name=formVo]");
	
	/* var seq = $("input:hidden[name=seq]"); */
	
	$("#modify").on("click", function(){
		if (seq.val() == "0" || seq.val() == ""){
	   		// insert
	   		/* if (validationInst() == false) return false; */
	   		form.attr("action", goUrlInst).submit();
	   	} else {
	   		// update
	   		/* keyName.val(atob(keyName.val())); */
	   		/* if (validationUpdt() == false) return false; */
	   		form.attr("action", goUrlUpdt).submit();
	  	}
	}); 
	
	$("#btnDel").on("click",function(){
		form.attr("action",goUrlVele).submit();
	});
	
	$("#btnErase").on("click",function(){
		form.attr("action",goUrlDele).submit();
	});
	
	$("#btnList").on("click",function(){
		formVo.attr("action", goUrlList).submit();
	});
	
</script>
</body>
</html>
