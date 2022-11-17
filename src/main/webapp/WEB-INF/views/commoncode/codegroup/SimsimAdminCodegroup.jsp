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
	<title>AdminCodegroup</title>
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
		<h5 class="mt-3"><b>코드그룹 관리</b></h5>
		<form role="search" method="post" id="formList" name="formList" autocomplete="off">
			<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
			<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
			<input type="hidden" name="seq" id="seq" value="<c:out value="${vo.seq}"/>">
			<div class="mb-3" id="search_tab">
				<div class="my-2 row">
					<div class="col-3">
						<select class="form-select" id="shdelNy" name="shdelNy">
							<option value="9" <c:if test="${vo.shdelNy eq 9}">selected</c:if>>삭제여부</option>
							<option value="0" <c:if test="${vo.shdelNy eq 0}">selected</c:if>>N</option>
							<option value="1" <c:if test="${vo.shdelNy eq 1}">selected</c:if>>Y</option>
						</select>
					</div>
					<div class="col">
						<select class="form-select">
							<option selected>수정일</option>
							<option>등록일</option>
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
					<div class="col-3">
						<select class="form-select" id ="shOption" name="shOption">
						  <option value="" <c:if test="${empty vo.shOption}">selected</c:if>>검색구분</option>
						  <option value="1"<c:if test="${vo.shOption eq 1 }">selected</c:if>>코드그룹 코드</option>
						  <option value="2"<c:if test="${vo.shOption eq 2 }">selected</c:if>>코드그룹 이름(한글)</option>
						  <option value="3"<c:if test="${vo.shOption eq 3 }">selected</c:if>>코드그룹 이름(영문)</option>
						</select>
					</div>
					<div class="col-4 d-flex" id="search_box">
						<input class="form-control" type="search" placeholder="검색어" aria-label="Search" id="shValue" name="shValue" value="<c:out value="${vo.shValue }"/>" style="margin-right: 5px;">
						<button class="btn btn-outline-primary" type="submit" style="width: 80px;">검색</button> &nbsp;
						<button type="button" class="btn btn-outline-danger" id="btnReset"><i class="fa-solid fa-rotate-right"></i></button>
				    </div>
			    </div>
	   		 </div>
		    <div class="row mb-3">
		    	<div class="col-1" style="text-align: center; font-size: 24px;">Total: <c:out value="${vo.totalRows}"/></div>
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
						<th>코드그룹 이름(영문)</th>
						<th>코드갯수</th>
						<th>삭제여부</th>
						<th>등록일시</th>
						<th>수정일시</th>
		    		</tr>
		    		<c:choose>
						<c:when test="${fn:length(list) eq 0}">
							<tr>
								<td style="text-align:center;" colspan="8">There is no data</td>
							</tr>
						</c:when>
						<c:otherwise>
				    		<c:forEach items="${list}" var="list" varStatus="status">
				    		<tr>
				    			<td><input type="checkbox" class="form-check-input" name="Chk"></td>
				    			<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
				    			<td><c:out value="${list.codeGroupCode }"/></td>
				    			<td><a href="javascript:goView(<c:out value="${list.seq }"/>)"><c:out value="${list.codeGroupNameKor }"/></a></td>
				    			<td><a href="javascript:goView(<c:out value="${list.seq }"/>)"><c:out value="${list.codeGroupNameEng }"/></a></td>
				    			<td><c:out value="${list.codeNum }"/></td>
				    			<td>
							  		<c:if test="${list.delNy eq 0 }">N</c:if>
							  		<c:if test="${list.delNy eq 1 }">Y</c:if>
							  	</td>
				    			<td>2018.05.07 11:25:30</td>
				    			<td>2021.07.02 16:30:58</td>
				    		</tr>
				    		</c:forEach>
				    	</c:otherwise>
				    </c:choose>
		    	</table>
		    	<br>
		    	<!-- pagination s -->
				<%@include file="../pagination.jsp"%>
				<!-- pagination e -->
		    </div>
		    <div class="position-relative">
		    	<div class="position-absolute top-0">
			    	<button type="button" class="btn btn-warning" title="삭제처리" data-bs-toggle="modal" data-bs-target="#state_delete_modal">삭제 처리</button> <!-- <i class="fa-solid fa-trash-can"></i> -->
			    	<button type="button" class="btn btn-danger" title="데이터 삭제" data-bs-toggle="modal" data-bs-target="#data_delete_modal">데이터 삭제</button> <!-- <i class="fa-solid fa-skull"></i> -->
		    	</div>
		    	<div class="position-absolute end-0">
			    	<button type="button" class="btn btn-success"><i class="fa-solid fa-file-excel"></i></button>
			    	<button type="button" id="btnForm" name="btnForm" class="btn btn-info"><i class="fa-solid fa-plus"></i></button>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$( function() {
		$( "#dateStart" ).datepicker({
			dateFormat: "yy.mm.dd"
		});
		$( "#dateEnd").datepicker({
			dateFormat: "yy.mm.dd"
		});
	} );
</script>
<script type="text/javascript">
	var goUrlList = "/codeGroup/AdminCodegroupList"; 			/* #-> */
	var goUrlUpdt = "/codeGroup/codeGroupUpdt";				/* #-> */
	var goUrlVele = "/codeGroup/codeGroupVele";				/* #-> */
	var goUrlDele = "/codeGroup/codeGroupDele";				/* #-> */
	var goUrlForm = "/codeGroup/AdminCodegroupReg";
	var goUrlView = "/codeGroup/codeGroupViewMod"; 

	
	var seq = $("input:hidden[name=seq]");				/* #-> */
	
	var form = $("form[name=formList]");
	
	
	goForm = function(keyValue) {
    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
    	seq.val(keyValue);
		form.attr("action", goUrlForm).submit();
	}
	
	goView = function(keyValue) {
    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
    	seq.val(keyValue);
		form.attr("action", goUrlView).submit();
	}
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}
	
	$('#btnForm').on("click", function() {
		goForm(0);                
	});
	
	$("#btnReset").on("click",function(){
		$(location).attr("href",goUrlList);
	});
	
</script>
</body>
</html>