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
			  	<th>댓글내용</th>
			  	<th>좋아요수</th>
			  	<th>신고수</th>
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
						  	<td><c:out value="${list.scSeq }"/></td>
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
						  	<td><c:out value="${list.delNy }"/></td>
						  </tr>
			  		</c:forEach>
			  	</c:otherwise>
			  </c:choose>
			</table>
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
</body>
</html>
