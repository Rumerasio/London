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
	<title>AdminContentRecord</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
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
	th {
		text-align: center;
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
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>테스트 관리</b></h5>
		<h6 style="color:gray;"><b>테스트 이용내역</b></h6>
		<form role="search" method="post" id="formList" name="formList" autocomplete="off">
			<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
			<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
			<input type="hidden" name="seq" id="seq" value="<c:out value="${vo.seq}"/>">
			<div class="mb-3" id="search_tab">
				<div class="my-2 row">
					<div class="col-2">
						<select class="form-select" id="shRegiMod" name="shRegiMod">
							<option value="" selected>날짜검색</option>
							<option value="0" >등록일</option>
						</select>
					</div>
					<div class="col-3">
						<input type="text" class="form-control" placeholder="시작일" autocomplete="off" id="shdateStart" name="shdateStart">
					</div>
					<div class="col-3">
						<input type="text" class="form-control" placeholder="종료일" autocomplete="off" id="shdateEnd" name="shdateEnd">
					</div>
				</div>
				<br>
				<div class="mb-5 row">
					<div class="col-2">
						<select class="form-select" id ="shOption" name="shOption">
						  <option value="" <c:if test="${empty vo.shOption}">selected</c:if>>검색구분</option>
						  <option value="1"<c:if test="${vo.shOption eq 1 }">selected</c:if>>닉네임</option>
						  <option value="2"<c:if test="${vo.shOption eq 2 }">selected</c:if>>ID</option>
						  <option value="3"<c:if test="${vo.shOption eq 3 }">selected</c:if>>테스트 이름</option>
						  <option value="4"<c:if test="${vo.shOption eq 4 }">selected</c:if>>결과</option>
						</select>
					</div>
					<div class="col-4 d-flex" id="search_box">
					      <input class="form-control" type="search" placeholder="검색어" autocomplete="off" aria-label="Search" id="shValue" name="shValue" value="<c:out value="${vo.shValue }"/>" style="margin-right: 5px;">
					      <button class="btn btn-outline-primary" type="submit" style="width: 140px;">검색</button> &nbsp;
					      <button type="button" class="btn btn-outline-danger" id="btnReset"><i class="fa-solid fa-rotate-right"></i></button>
				    </div>
			    </div>
		    </div>
			<div>
				<div class="col-1" style="text-align: center; font-size: 24px;">Total:<c:out value="${vo.totalRows }"/></div>
				<table class="table table-striped table-hover mt-3">
				  <tr>
				  	<th style="width: 50px;">번호</th>
				  	<th>닉네임</th>
				  	<th>UserId</th>
				  	<th>테스트이름</th>
				  	<th>점수</th>
				  	<th>결과</th>
				  	<th>일시</th>
				  </tr>
				  <c:choose>
				  	<c:when test="${fn:length(list) eq 0}">
				  		<tr>
				  			<td colspan="6"> There is no date</td>
				  		</tr>
				  	</c:when>
				  	<c:otherwise>
				  		<c:forEach items="${list}" var="list" varStatus="status">
				  			<tr>
							  	<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
							  	<td><c:out value="${list.nickname }"/></td>
							  	<td><c:out value="${list.id }"/></td>
							  	<td class="comment_SurveyName"><c:out value="${list.survey }"/></td>
							  	<td><c:out value="${list.totalScore }"/></td>
							  	<td class="comment_content"><c:out value="${list.resultTitle }"/></td>
							  	<td><c:out value="${list.datetime }"/></td>
							  </tr>
				  		</c:forEach>
				  	</c:otherwise>
				  </c:choose>
				</table>
				<!-- pagination s -->
				<%@include file="../../commoncode/pagination.jsp"%>
				<!-- pagination e -->
			</div>	
		</form>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$( function() {
		$( "#shdateStart" ).datepicker({
	    	changeYear: true, 
	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	    	yearRange:"1900:2023",
	    	monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dateFormat: "yy.mm.dd"
		});
		$( "#shdateEnd").datepicker({
			changeYear: true, 
	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	    	yearRange:"1900:2023",
	    	monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dateFormat: "yy.mm.dd"
		});
	} );
</script>
<script type="text/javascript">
	var goUrlList ="/content/contentRecord";
	
	var seq = $("input:hidden[name=seq]");
	
	var form = $("form[name=formList]");
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}
	
	
	$("#btnReset").on("click",function(){
		$(location).attr("href",goUrlList);
	});
</script>
</body>
</html>
