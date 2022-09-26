<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!-- 공통그룹 코드 한글매칭용 -->
<jsp:useBean id="CodeServiceImpl" class="com.simsim.modules.code.CodeServiceImpl"/>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="uTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>MemberList</title>
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
		<%@include file="../Menu.jsp" %>
		<!-- 메뉴단 e -->
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>회원관리</b></h5>
		<form role="search" method="post" id="formList" name="formList">
			<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
			<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
			<input type="hidden" name="seq" id="seq" value="<c:out value="${vo.seq}"/>">
			<div class="mb-3" id="search_tab">
				<div class="my-2 row">
					<div class="col">
						<select class="form-select" id="shdelNy" name="shdelNy">
							<option value="9" <c:if test="${empty vo.shdelNy}">selected</c:if>>삭제여부</option>
							<option value="1" <c:if test="${vo.shdelNy eq 1 }">selected</c:if>>Y</option>
							<option value="0" <c:if test="${vo.shdelNy eq 0 }">selected</c:if>>N</option>
						</select>
					</div>
					<div class="col">
						<select class="form-select" id ="shgender" name="shgender">
							<option value="" <c:if test="${empty vo.shgender }">selected</c:if>>성별</option>
							<option value="1" <c:if test="${vo.shgender eq 1 }">selected</c:if>>남성</option>
							<option value="2" <c:if test="${vo.shgender eq 0 }">selected</c:if>>여성</option>
						</select>
					</div>
					<div class="col">
						<select class="form-select">
							<option selected>나이</option>
							<option>10대 미만(~9)</option>
							<option>10대(10~19)</option>
							<option>20대(20~29)</option>
							<option>30대(30~39)</option>
							<option>40대(40~49)</option>
							<option>50대(50~59)</option>
							<option>60대 이상(60~)</option>
						</select>
					</div>
					<div class="col">
						<input type="text" class="form-control" placeholder="가입 시작일" autocomplete="off" id="dateStart">
					</div>
					<div class="col">
						<input type="text" class="form-control" placeholder="가입 종료일" autocomplete="off" id="dateEnd">
					</div>
				</div>
				<br>
				<div class="mb-5 row">
					<div class="col-2">
						<select class="form-select" aria-label="Default select example" id="shOption" name="shOption">
						  <option value="" <c:if test="${empty vo.shOption }">seleceted</c:if>>검색구분</option>
						  <option value="1" <c:if test="${vo.shOption eq 1 }">seleceted</c:if>>닉네임</option>
						  <option value="2" <c:if test="${vo.shOption eq 2 }">seleceted</c:if>>이메일</option>
						  <option value="3" <c:if test="${vo.shOption eq 3 }">seleceted</c:if>>아이디</option>
						</select>
					</div>
					<div class="col-4" id="search_box" style="height:30px;">
						<div class="d-flex">
					      <input class="form-control" type="search" placeholder="검색어" aria-label="Search" autocomplete="off" id="shValue" name="shValue" style="margin-right: 5px;">
					      <button class="btn btn-outline-primary" type="submit" style="width: 140px;">검색</button> &nbsp;
					      <button type="button" id="btnReset" class="btn btn-outline-danger"><i class="fa-solid fa-rotate-right"></i></button>
					    </div>
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
						<th>고유번호</th>
						<th>닉네임</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>이메일</th>
						<th>아이디</th>
						<th>작성댓글수</th>
						<th>댓글 좋아요수</th>
						<th>최종 접속일시</th>
						<th>가입날짜</th>
						<th>삭제여부</th>
		    		</tr>
		    		<c:choose>
		    			<c:when test="${fn:length(list) eq 0 }">
		    				<tr>
		    					<td colspan="12" style="text-align: center;">There is no data</td>
		    				</tr>
		    			</c:when>
		    			<c:otherwise>
		    				<!-- 공통 코드 내용 표기하기 -->
		    				<c:set var="listCodeGender" value="${CodeServiceImpl.selectListCachedCode('1')}"/>
		    				<%-- <c:set var="listCodePhoneAgency" value="${CodeServiceImpl.selectListCachedCode('2')}"/>
		    				<c:set var="listCodeEmailDomain" value="${CodeServiceImpl.selectListCachedCode('3')}"/> --%>
		    				<c:forEach items="${list}" var="list" varStatus="status">
		    					<tr>
		    						<td><input type="checkbox" class="form-check-input" name="Chk"></td>
		    						<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
		    						<td><a href="javascript:goView(<c:out value="${list.seq }"/>)"><c:out value="${list.nickname }"></c:out></a></td>
		    						<td><c:out value="${list.dob }"></c:out></td>
		    						<td>
		    							<c:forEach items="${listCodeGender}" var="listGender" varStatus="statusGender">
											<c:if test="${list.gender eq listGender.codeAnother}"><c:out value="${listGender.codeNameKor }"/></c:if>
										</c:forEach>
		    						</td>
		    						<td><c:out value="${list.email }"></c:out></td>
		    						<td><c:out value="${list.id }"></c:out></td>
		    						<td>
		    							<!-- 공통 코드 내용 표기하기 -->
		    							<%-- <c:forEach items="${listCodePhoneAgency}" var="listPhoneAgency" varStatus="statusPhoneAgency">
											<c:if test="${list.phoneAgency eq listPhoneAgency.codeAnother}"><c:out value="${listPhoneAgency.codeNameKor }"/></c:if>
										</c:forEach> --%>
		    						</td>
		    						<td>
		    							<%-- <c:forEach items="${listCodeEmailDomain}" var="listEmailDomain" varStatus="statusEmailDomain">
											<c:if test="${list.emailDomain eq listEmailDomain.codeAnother}"><c:out value="${listEmailDomain.codeNameKor }"/></c:if>
										</c:forEach> --%>
		    						</td>
		    						<td></td>
		    						<td><c:out value="${list.registerDateTime }"></c:out></td>
		    						<td><c:out value="${list.delNy }"></c:out> </td>
		    					</tr>
		    				</c:forEach>
		    			</c:otherwise>
		    		</c:choose>
		    	</table>
		    	<br>
		    	<!-- pagination s -->
				<%@include file="../../commoncode/pagination.jsp"%>
				<!-- pagination e -->
		    </div>
	    </form>
	    <div class="position-relative">
	    	<div class="position-absolute top-0">
		    	<button type="button" class="btn btn-warning" title="삭제여부 삭제처리" data-bs-toggle="modal" data-bs-target="#state_delete_modal">삭제처리</button> <!-- <i class="fa-solid fa-trash-can"></i> -->
		    	<button type="button" class="btn btn-danger" title="데이터 삭제" data-bs-toggle="modal" data-bs-target="#data_delete_modal">데이터 삭제</button> <!-- <i class="fa-solid fa-skull"></i> -->
	    	</div>
	    	<div class="position-absolute end-0">
		    	<button type="button" class="btn btn-success"><i class="fa-solid fa-file-excel"></i></button>
		    	<button type="button" id="btnForm" class="btn btn-info"><i class="fa-solid fa-plus"></i></button>
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
<script type="text/javascript">
	var goUrlList = "/member/memberList"; 			/* #-> */
	var goUrlVele = "/member/codeGroupVele";				/* #-> */
	var goUrlDele = "/member/codeGroupDele";				/* #-> */
	var goUrlForm = "/member/memberForm";
	var goUrlView = "/member/memberViewMod";
	
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
