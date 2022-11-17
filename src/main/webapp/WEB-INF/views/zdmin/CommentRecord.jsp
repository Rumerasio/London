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
	<title>AdminCommentRecord</title>
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
	.comment_SurveyName{
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
</style>

<body>
<!-- 로고단 s -->
<%@include file="Logo.jsp" %>
<!-- 로고단 e -->
<div class="container" style="text-align: center;">
	<h4 style="position: relative; bottom: 50px;">관리자 페이지</h4>
</div>
<div class="row" style="width:1400px">
	<div class="col-2">
		<!-- 로그인정보태그단 s -->
		<%@include file="zdminTag.jsp" %>
		<!-- 로그인정보태그단 e -->
		<!-- 메뉴단 s -->
		<%@include file="Menu.jsp" %>
		<!-- 메뉴단 e -->
	</div>
	<div class="col-10" style="white-space:nowrap;">
		<h5 class="mt-3"><b>회원관리</b></h5>
		<h6 style="color:gray;"><b>회원 작성 댓글</b></h6>
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
							<option value="1" >수정일</option>
						</select>
					</div>
					<div class="col-3">
						<input type="text" class="form-control" placeholder="시작일" autocomplete="off" id="dateStart">
					</div>
					<div class="col-3">
						<input type="text" class="form-control" placeholder="종료일" autocomplete="off" id="dateEnd">
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
						  <option value="4"<c:if test="${vo.shOption eq 4 }">selected</c:if>>내용</option>
						</select>
					</div>
					<div class="col-4 d-flex" id="search_box">
					      <input class="form-control" type="search" placeholder="검색어" autocomplete="off" aria-label="Search" id="shValue" name="shValue" value="<c:out value="${vo.shValue }"/>" style="margin-right: 5px;">
					      <button class="btn btn-outline-primary" type="submit" style="width: 140px;">검색</button> &nbsp;
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
			<div>
				<table class="table table-striped mt-3">
				  <tr>
				  	<th><input type="checkbox" class="form-check-input" name="ChkA" id="ChkA"></th>
				  	<th style="width: 50px;">번호</th>
				  	<th>닉네임</th>
				  	<th>UserId</th>
				  	<th>테스트이름</th>
				  	<th>내용</th>
				  	<th>좋아요수</th>
				  	<th>수정일시</th>
				  	<th>등록일시</th>
				  	<th>삭제여부</th>
				  </tr>
				  <c:choose>
				  	<c:when test="${fn:length(list) eq 0}">
				  		<tr>
				  			<td colspan="10"> There is no date</td>
				  		</tr>
				  	</c:when>
				  	<c:otherwise>
				  		<c:forEach items="${list}" var="list" varStatus="status">
				  			<tr>
							  	<td><input type="checkbox" class="form-check-input" name="Chk"></td>
							  	<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
							  	<td><c:out value="${list.nickname }"/></td>
							  	<td>
							  		<c:forEach items="${list3}" var="list3" varStatus="status">
							  			<c:choose>
							  				<c:when test="${list.seq eq list3.seq}">
									  			<c:out value="${list3.id }"/>
									  		</c:when>
									  		<c:otherwise></c:otherwise> 
							  			</c:choose>
							  		</c:forEach>
							  	</td>
							  	<td class="comment_SurveyName">
							  		<c:forEach items="${list2}" var="list2" varStatus="status">
							  			<c:choose>
								  			<c:when test="${list.snSeq eq list2.snSeq}">
									  			<c:out value="${list2.survey }"/>
									  		</c:when>
									  		<c:otherwise></c:otherwise>  
								  		</c:choose>
							  		</c:forEach>
							  	</td>
							  	<td class="comment_content"><c:out value="${list.commentContent }"/></td>
							  	<td></td>
							  	<td></td>
							  	<td><c:out value="${list.datetime }"/></td>
							  	<td>
							  		<c:if test="${list.delNy eq 0 }">N</c:if>
							  		<c:if test="${list.delNy eq 1 }">Y</c:if>
							  	</td>
							  </tr>
				  		</c:forEach>
				  	</c:otherwise>
				  </c:choose>
				</table>
				<!-- pagination s -->
				<%@include file="../commoncode/pagination.jsp"%>
				<!-- pagination e -->
			</form>
			 <div class="position-relative my-5">
		    	<div class="position-absolute top-0">
			    	<button type="button" class="btn btn-warning" title="삭제여부 삭제처리" data-bs-toggle="modal" data-bs-target="#state_delete_modal">삭제처리</button> <!-- <i class="fa-solid fa-trash-can"></i> -->
			    	<button type="button" class="btn btn-danger" title="데이터 삭제" data-bs-toggle="modal" data-bs-target="#data_delete_modal">데이터 삭제</button> <!-- <i class="fa-solid fa-skull"></i> -->
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
	var goUrlList ="/member/memberComment";
	
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
