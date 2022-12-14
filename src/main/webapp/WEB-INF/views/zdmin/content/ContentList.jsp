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
	<title>AdminContentList</title>
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
	table tr td {
		max-width: 180px;
		text-align: center;
	}
	th {
		text-align: center;
	}
	.comment_content{
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
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
		<h6 style="color:gray;"><b>테스트 관리</b></h6>
		<form role="search" method="post" id="formList" name="formList" autocomplete="off">
			<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
			<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
			<input type="hidden" name="snSeq" id="snSeq" value="">
			<div class="col-4 d-flex my-3" id="search_box">
			      <input class="form-control" type="search" placeholder="검색어" autocomplete="off" aria-label="Search" id="shValue" name="shValue" value="<c:out value="${vo.shValue }"/>" style="margin-right: 5px;">
			      <button class="btn btn-outline-primary" type="submit" style="width: 140px;">검색</button> &nbsp;
			      <button type="button" class="btn btn-outline-danger" id="btnReset"><i class="fa-solid fa-rotate-right"></i></button>
		    </div>
		    <div class="float-start" style="text-align: center; font-size: 24px;">총:<c:out value="${vo.totalRows }"/></div>
			<div class="p-5" style="position:relative;">
				<a href="contentReg"><button type="button" class="btn btn-sm" style="position:absolute; right:0px; top:-50px; width: 160px; background-color:#e6e6e6;">새 테스트 등록하기</button></a>
				<div class="container mt-5">
					<div class="row row-cols-3 g-4" style="width:1050px;">
						<c:choose>
							<c:when test="${fn:length(list) eq 0}">
								<div class="container">
									<h2>There is no Survey!!!</h2>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list" varStatus="status">
									<div class="col">
									    <div class="card h-100">
									      <c:forEach items="${list2}" var="list2" varStatus="status">
									      	<c:if test="${list2.type eq 1 && list2.pseq eq list.snSeq}">
									      		<a href="javascript:goView(<c:out value="${list.snSeq }"/>)">
									      			<img src="<c:out value="${list2.path }"/><c:out value="${list2.uuidName }"/>" class="card-img-top" alt="...">
									      		</a>
									      	</c:if>
									      </c:forEach>
									      <div class="card-body">
									        <a href="javascript:goView(<c:out value="${list.snSeq }"/>)"><h6 class="card-title"><c:out value="${list.survey}"></c:out></h6></a>
									      </div>
									    </div>
									  </div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- pagination s -->
					<%@include file="../../commoncode/pagination.jsp"%>
					<!-- pagination e -->
				</div>
			</div>
		</form>	
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	var goUrlList ="/content/contentList";
	var goUrlView ="/content/contentViewMod"
	
	var form = $("form[name=formList]");
	
	var snSeq = $("input:hidden[name=snSeq]");
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}
	
	goView = function(keyValue) {
    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
    	snSeq.val(keyValue);
		form.attr("action", goUrlView).submit();
	}
	
	$("#btnReset").on("click",function(){
		$(location).attr("href",goUrlList);
	});
</script>
</body>
</html>
