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
	#comment_btn{
		--bs-btn-font-size: 14px;
		width: 70px;
		height: 70px;
		background-color: rgb(190, 190, 190);
	}
	.like_btn, .report_btn, #comment_delete_btn{
		color:white;
		font-size: 12px;
		width: 70px;
		height:33px;
	}
	.like_btn{
		 background-color:rgba(52, 152, 219, 0.56);
	}
	.report_btn{
		background-color:rgba(192, 57, 43, 0.61);
	}
	.survey_back{
		width:56px; 
		font-size: 10px; 
		padding:0px;
		padding-top:2px;
		padding-bottom:2px;
		margin-left: 12px;
	}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container" id="total">
	<div style="width:1000px; background-color: white; margin-left: 12px;">
		<h6 class="pt-2" style="color:gray;"><c:out value="${item.survey }"/></h6><hr>
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<div><p class="text-center">질문, 선택지가 없어요</p></div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="list" varStatus="status">
					<div class="container content_page_<c:out value="${list.question}"/>">
						<div>
							<h5><c:out value="${list.questionContent }"/></h5>
							<c:out value="${list.question}"/>
						</div>
						<div class="row choice_box my-5	">
							<c:forEach items="${list2}" var="list2" varStatus="status">
								<c:choose>
									<c:when test="${list2.sqSeq eq list.sqSeq }">
										<div class="col-6 my-3">
											<c:out value="${list2.choice}"/>
											<button type="button" class="btn btn-outline-secondary" onclick="submitAndHide(<c:out value="${list.question}"/>)" value="<c:out value="${list2.choice}"/>" style="width:226px; font-size: 13px;"><c:out value="${list2.choiceContent }"/></button>
										</div>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<div class="progress">
		  <div class="progress-bar" role="progressbar" style="width: 25%; background-color:#a5d610;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
		</div>
	</div>
	<button type="button" class="btn btn-secondary survey_back">이전으로</button>
	<div class="container">
		<img alt="" src="../images/lighthouse_mainbanner.jpg" style="width: 1000px;">
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js">
	submitAndHide = function(keyValue) {
		var num = keyValue;
//		document.getElementByClass("content_page_"+num).classList.remove('visually-hidden');
		document.getElementsByClassName("content_page_"+num).classList.add('visually-hidden');
	}
	
</script>
</body>
</html>
