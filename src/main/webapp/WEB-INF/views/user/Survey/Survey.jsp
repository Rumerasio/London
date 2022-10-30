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
	<title>별자리 테스트</title>
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
	#user_box {
		text-align:center;
		width:110px;
		font-size:16px;
		display: inline-block; 
		position: absolute; 
		left: 1080px;
		background-color: #ffa99970;
		border-radius: 10px;
		padding: 5px;
	}
	a{
	text-decoration: none;
	color:black;
	}
	#btnComment{
		--bs-btn-font-size: 14px;
		width: 70px;
		height: 70px;
		background-color: rgb(190, 190, 190);
	}
	.like_btn, .report_btn, #btnToVele {
		color:white;
		font-size: 12px;
		width: 70px;
		height:33px;
	}
	.modify_btn {
		color:white;
		font-size: 11px;
		width: 70px;
		height:33px;
	}
	.like_btn{
		 background-color:rgba(52, 152, 219, 0.56);
	}
	.report_btn{
		background-color:rgba(192, 57, 43, 0.61);
	}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container" id="total">
	<div class="container" style="position: relative;top:-8px;">
		<div class="clearfix" style="width: 1000px; line-height:3;">
			<c:forEach items="${list2}" var="list2" varStatus="status">
		    	<c:if test="${list2.type eq 2 && list2.pseq eq vo.snSeq}">
		    		<a href="#"><img src="<c:out value="${list2.path }"/><c:out value="${list2.uuidName }"/>" alt="..." style="width:1000px; padding-bottom:20px;"></a>
		    	</c:if>
		    </c:forEach>
			<!-- <img alt="" src="/resources/images/lighthouse_mainbanner.jpg" style="width: 1000px; padding-bottom: 20px;"> -->
			<h2 style="display: inline-block"><b><c:out value="${item.survey }"/></b></h2>
			<div class="float-md-end">
				<input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
				<label class="btn" for="btn-check"><i class="fa-solid fa-heart float-me-end"></i> 60</label>
				<form method="post" name="snForm">
					<input type="hidden" name="snSeq" id="snSeq" value="<c:out value="${vo.snSeq}"/>">
					<button type="button" class="btn" id="btnContent" style="background-color:rgb(197, 59, 222); color:white; width:300px;">시작하기</button>
				</form>
			</div>
			<h4 style="font-style: italic; margin-top: 20px;"><c:out value="${item.surveyPhrase }"/></h4>
			<p class="mt-3" style="font-size: 18px;"><c:out value="${item.surveyExplain }"/></p>
		</div>
	</div>
	<div id="comment_box">
		<h6><b>댓글창(<c:out value="${Num}"/>)</b></h6	>
		<div class="p-4" style="background-color: rgb(224, 224, 224); width: 1000px;">
			<form method="post" id="myForm" name="myForm" autocomplete="off">
				<input type="hidden" name="snSeq" id="snSeq" value="<c:out value="${vo.snSeq}"/>">
				<c:choose>
					<c:when test="${empty sessSeq }">
						<input type="hidden" name="Seq" id="Seq" value=1>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="Seq" id="Seq" value="<c:out value="${sessSeq }"/>">
					</c:otherwise>
				</c:choose>
				<div class="input-group row">
					<div class="col-2">
						<input type="text" class="form-control col-1 mt-3" placeholder="닉네임" id="nickname" name="nickname" value="<c:out value="${sessNickname }"/>">
					</div>
					<div class="col-9">
						<textarea class="form-control m-3" placeholder="내용을 입력해주세요" id="commentContent" name="commentContent" style="width:95%; height: 4.25em; border:none; resize: none; display: inline;"></textarea>
					</div>
					<div class="col-1">
						<button type="button" class="btn mt-3" id="btnComment">등록</button>
					</div>
				</div>
			</form>
			<c:choose>
				<c:when test="${fn:length(list) eq 0}">
					<div class="row mt-3"><p class="text-center">작성된 댓글이 없습니다! 댓글을 작성해주세요</p></div>
				</c:when>
				<c:otherwise>
		    		<c:forEach items="${list}" var="list" varStatus="status">
		    			<form method="post" name="commentForm">
		    				<c:choose>
		    					<c:when test="${list.seq eq vo.seq}">
				    				<input type="hidden" name="scSeq" id="scSeq" value="<c:out value="${vo.scSeq}"/>">
						    			<div class="input-group row mt-3" id="commentBox_<c:out value="${list.scSeq}"/>" style="background-color:rgba(39, 174, 96, 0.11);">
											<div class="col-2" style="align-content: center;">
												<input type="text" readonly class="form-control-plaintext" id="" value="<c:out value="${list.nickname }"/>" style="text-align: center;">
												<input type="text" readonly class="form-control-plaintext" id="" value="<c:out value="${list.datetime }"/>" style="font-size: 10px; text-align: center;">
											</div>
											<div class="col-9">
												<input type="text" readonly class="form-control-plaintext" id="" value="<c:out value="${list.commentContent }"/>">
											</div>
											<div class="col-1">
												<button type="button" class="btn modify_btn">수정하기</button>
												<button type="button" class="btn btn-secondary" data-bs-toggle="modal" id="btnToVele" data-bs-target="#Velete_check_<c:out value="${list.scSeq}"/>">삭제</button>
												<div class="modal" tabindex="-1" id="Velete_check_<c:out value="${list.scSeq}"/>">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title">코멘트 삭제</h5>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												      </div>
												      <div class="modal-body">
												        <p>정말 삭제하시겠습니까?</p>
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
												        <button type="button" id="btnVele" class="btn btn-danger" onclick="veleComment(<c:out value="${list.scSeq}"/>)" data-bs-dismiss="modal">삭제</button>
												      </div>
												    </div>
												  </div>
												</div>
											</div>
										</div>
								</c:when>
								<c:otherwise>
									<div class="input-group row mt-3" style="background-color:rgba(39, 174, 96, 0.11);">
										<div class="col-2" style="align-content: center;">
											<input type="text" readonly class="form-control-plaintext" id="" value="<c:out value="${list.nickname }"/>" style="text-align: center;">
											<input type="text" readonly class="form-control-plaintext" id="" value="<c:out value="${list.datetime }"/>" style="font-size: 10px; text-align: center;">
										</div>
										<div class="col-9">
											<input type="text" readonly class="form-control-plaintext" id="" value="<c:out value="${list.commentContent }"/>">
										</div>
										<div class="col-1">
											<button type="button" class="btn like_btn"><i class="fa-solid fa-thumbs-up"></i> 0</button>
											<button type="button" class="btn report_btn" data-bs-toggle="modal" data-bs-target="#Report_check">신고</button>
											<div class="modal fade" id="Report_check" aria-hidden="true" tabindex="-1">
											  <div class="modal-dialog modal-dialog-centered">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h1 class="modal-title fs-5">코멘트 신고</h1>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
											        정말 신고하시겠습니까?
											      </div>
											      <div class="modal-footer">
											      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											        <button type="button" class="btn btn-primary" data-bs-target="#report_done" data-bs-toggle="modal">신고하기</button>
											      </div>
											    </div>
											  </div>
											</div>
											<div class="modal fade" id="report_done" aria-hidden="true" tabindex="-1">
											  <div class="modal-dialog modal-dialog-centered">
											    <div class="modal-content">
											      <div class="modal-header">
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
											        신고가 완료되었습니다.
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
											      </div>
											    </div>
											  </div>
											</div>
											<!-- <div class="modal fade" tabindex="-1" id="Report_check">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title">코멘트 신고</h5>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
											        <p>정말 신고하시겠습니까?</p>
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#Report_done">신고</button>
											      </div>
											    </div>
											  </div>
											</div> -->
										</div>
									</div>
								</c:otherwise>
							</c:choose>
								<div class="modal fade" aria-hidden="true" tabindex="-1" id="Report_done">
									<div class="modal-body">
										<p>신고가 완료되었습니다.</p>
									</div>
								    <div class="modal-footer">
								  		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
									</div>
								</div>
						</form>
		    		</c:forEach>
		    	</c:otherwise>
		    </c:choose>
			<!-- <nav class="nav justify-content-center mt-4">
			  <ul class="pagination pagination-sm">
			  	<li class="page-item">
			      <a class="page-link" href="#" style="background-color:#c6c6c6;">
			        <span><i class="fa-solid fa-backward-step"></i></span>
			      </a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous" style="background-color:#c6c6c6;">
			        <span><i class="fa-solid fa-chevron-left"></i></span>
			      </a>
			    </li>
			    <li class="page-item active"><a class="page-link" href="#" style="background-color:#c6c6c6;">1</a></li>
			    <li class="page-item"><a class="page-link" href="#" style="background-color:#c6c6c6;">2</a></li>
			    <li class="page-item"><a class="page-link" href="#" style="background-color:#c6c6c6;">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next" style="background-color:#c6c6c6;">
			        <span aria-hidden="true"><i class="fa-solid fa-chevron-right"></i></span>
			      </a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="#" style="background-color:#c6c6c6;">
			        <span><i class="fa-solid fa-forward-step"></i></span>
			      </a>
			    </li>
			  </ul>
			</nav> -->
		</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	var goUrlInst = "/survey/commentInst";
	var goUrlVele = "/survey/commentVele";
	var goUrlUpdt = "/survey/commentUpdt";
	var goUrlCont = "/survey/content";
	
	var scSeq = $("input:hidden[name=scSeq]");
	
	var form = $("form[name=myForm]");
	var form2 = $("form[name=commentForm]");
	var form3 = $("form[name=snForm]");

	$("#btnComment").on("click",function(){
		form.attr("action",goUrlInst).submit();
		/* if (seq == 1){
			alert("비로그인 상태입니다.");
   			return false;
   		} else {
   			form.attr("action",goUrlInst).submit();
   		} */
	});
	
	$("#btnContent").on("click",function(){
		form3.attr("action",goUrlCont).submit();
	});
//	 getscSeq = function(keyValue) {
//	    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
//	    	scSeq.val(keyValue);
//	 }

	veleComment = function(keyValue) {
		var num = keyValue;
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			/* ,dataType:"json" */
			,url: "/survey/commentVele"
			/* ,data : $("#formLogin").serialize() */
			,data : {"scSeq": keyValue }
			,success: function(aa) {
				document.getElementById("commentBox_"+num).remove();
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
//		scSeq.val(keyValue);
//		form2.attr("action",goUrlVele).submit();
	}
	
	/* $("#btnVele_"+seq).on("click",function(){
		form2.attr("action",goUrlVele).submit();
	}); */
</script>
</body>
</html>
