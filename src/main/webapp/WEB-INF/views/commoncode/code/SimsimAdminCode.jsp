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
						<a href="/member/memberList"><li style="font-weight: normal;">회원관리</li></a>
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
						<a href="/codeGroup/AdminCodegroupList"><li style="font-weight: normal;">코드그룹 관리</li></a>
						<a href="/code/AdminCodeList"><li style="font-weight: normal;">코드 관리</li></a>
					</ul>
				</li>
				<li class="fw-semibold">통계</li>
			</ul>
		</div>
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>코드 관리</b></h5>
		<form role="search" method="post" action="/code/AdminCodeList">
			<div class="mb-3" id="search_tab">
				<div class="my-2 row">
					<div class="col-2">
						<select class="form-select" id="shuseNy" name="shuseNy">
							<option value="" <c:if test="${empty vo.shuseNy }">selected</c:if>>사용여부</option>
							<option value="1" <c:if test="${vo.shuseNy eq 1 }">selected</c:if>>Y</option>
							<option value="0" <c:if test="${vo.shuseNy eq 0 }">selected</c:if>>N</option>
						</select>
					</div>
					<div class="col">
						<select class="form-select" id="shRegiMod" name="shRegiMod">
							<option value="" <c:if test="${empty vo.shRegiMod }">selected</c:if>>날짜검색</option>
							<option value="0" <c:if test="${vo.shRegiMod eq 0 }">selected</c:if>>등록일</option>
							<option value="1" <c:if test="${vo.shRegiMod eq 1 }">selected</c:if>>수정일</option>
						</select>
					</div>
					<div class="col">
						<input type="text" class="form-control" placeholder="시작일" autocomplete="off" id="dateStart">
					</div>
					<div class="col">
						<input type="text" class="form-control" placeholder="종료일" autocomplete="off" id="dateEnd">
					</div>
				</div>
				<br>
				<div class="mb-5 row">
					<div class="col-2">
						<select class="form-select" id ="shOption" name="shOption">
						  <option value="" <c:if test="${empty vo.shOption}">selected</c:if>>검색구분</option>
						  <option value="1"<c:if test="${vo.shOption eq 1 }">selected</c:if>>코드그룹 코드</option>
						  <option value="2"<c:if test="${vo.shOption eq 2 }">selected</c:if>>코드그룹 이름(한글)</option>
						  <option value="3"<c:if test="${vo.shOption eq 3 }">selected</c:if>>코드그룹 이름(영문)</option>
						  <option value="4"<c:if test="${vo.shOption eq 4 }">selected</c:if>>코드 이름(한글)</option>
						  <option value="5"<c:if test="${vo.shOption eq 5 }">selected</c:if>>코드 이름(영문)</option>
						</select>
					</div>
					<div class="col-4 d-flex" id="search_box">
					      <input class="form-control" type="search" placeholder="검색어" autocomplete="off" aria-label="Search" id="shValue" name="shValue" style="margin-right: 5px;">
					      <button class="btn btn-outline-primary" type="submit" style="width: 140px;">검색</button> &nbsp;
					      <button class="btn btn-outline-danger"><i class="fa-solid fa-rotate-right"></i></button>
				    </div>
			    </div>
		    </div>
		</form>
	    <div class="row mb-3">
	    	<div class="col-1" style="text-align: center; font-size: 24px;">Total:12</div>
	    	<div class="col-1 offset-10">
			    <select class="form-select">
			    	<option selected value="1">5</option>
			    	<option value="2">10</option>
			    	<option value="3">15</option>
			    </select>
			</div>
	    </div>
	    <div class="mb-3" id="list_box">
	    	<table class="table table-striped table-hover">
	    		<tr id="list_box_th">
	    			<th><input type="checkbox" class="form-check-input" name="ChkA" id="ChkA"></th>
					<th>#</th>
					<th>코드그룹 코드</th>
					<th>코드그룹 이름(한글)</th>
					<th>코드</th>
					<th>대체 코드</th>
					<th>코드 이름(한글)</th>
					<th>코드 이름(영문)</th>
					<th>사용</th>
					<th>순서</th>
					<th>등록일</th>
					<th>수정일</th>
	    		</tr>
	    		<c:choose>
	    			<c:when test="${fn:length(list) eq 0}">
	    				<tr>
	    					<td style="text-align: center;" colspan="12">There is no data</td>
	    				</tr>
	    			</c:when>
	    			<c:otherwise>
			    		<c:forEach items="${list}" var="list" varStatus="status">
			    		<tr>
			    			<td><input type="checkbox" class="form-check-input" name="Chk"></td>
			    			<td><c:out value="${list.seq }"/></td>
			    			<td><c:out value="${list.codeGroupCode }"/></td>
			    			<td><c:out value="${list.codeGroupNameKor }"/></td>
			    			<td><a href="./ZdminCodeMod.html"></a></td>
			    			<td><c:out value="${list.codeAnother }"/></td>
			    			<td><a href="./ZdminCodeMod.html"><c:out value="${list.codeGroupNameKor }"/> - <c:out value="${list.codeNameKor }"/></a></td>
			    			<td><a href="./ZdminCodeMod.html"><c:out value="${list.codeGroupNameEng }"/> - <c:out value="${list.codeNameEng }"/></a></td>
			    			<td><c:out value="${list.useNy }"/></td>
			    			<td><c:out value="${list.turn }"/></td>
			    			<td>2018.05.07 11:25:30</td>
			    			<td>2021.07.02 16:30:58</td>
			    		</tr>
			    		</c:forEach>
			    	</c:otherwise>
	    		</c:choose>
	    	</table>
	    	<br>
	    	<nav class="nav justify-content-center">
			  <ul class="pagination">
			    <li class="page-item active"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			  </ul>
			</nav>
	    </div>
	    <div class="position-relative">
	    	<div class="position-absolute top-0">
		    	<button type="button" class="btn btn-warning" title="삭제여부 삭제처리" data-bs-toggle="modal" data-bs-target="#state_delete_modal">삭제 처리</button> <!-- <i class="fa-solid fa-trash-can"></i> -->
		    	<button type="button" class="btn btn-danger" title="데이터 삭제" data-bs-toggle="modal" data-bs-target="#data_delete_modal">데이터 삭제</button> <!-- <i class="fa-solid fa-skull"></i> -->
	    	</div>
	    	<div class="position-absolute end-0">
		    	<button type="button" class="btn btn-success"><i class="fa-solid fa-file-excel"></i></button>
		    	<a href="/code/codeForm"><button type="button" class="btn btn-info"><i class="fa-solid fa-plus"></i></button></a>
	    	</div>
	    	<div class="modal" tabindex="-1" id="state_delete_modal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">삭제여부 삭제처리</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p>정말 삭제처리하시겠습니까?</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-warning">삭제처리</button>
			      </div>
			    </div>
			  </div>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$( function() {
		$( "#dateStart" ).datepicker({
	    	changeYear: true, 
	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	    	yearRange:"1900:2023",
	    	monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dateFormat: "yy.mm.dd"
		});
		$( "#dateEnd").datepicker({
			changeYear: true, 
	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	    	yearRange:"1900:2023",
	    	monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dateFormat: "yy.mm.dd"
		});
	} );
</script>
</body>
</html>