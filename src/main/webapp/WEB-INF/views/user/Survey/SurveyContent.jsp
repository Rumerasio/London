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
		position: absolute;
		bottom:-22px;
	}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container" id="total">
	<div style="width:1000px; background-color: white; margin-left: 12px; position: relative;">
		<div class="progress">
		  <div class="progress-bar" role="progressbar" style="width: 25%; background-color:#a5d610;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
		</div>
		<h6 class="pt-2" style="color:gray;"><c:out value="${item.survey }"/></h6><hr>
		<form method="post" name="myForm">
			<input type="hidden" name="snSeq" id="snSeq" value="<c:out value="${vo.snSeq}"/>">
			<c:choose>
				<c:when test="${empty sessSeq }">
					<input type="hidden" name="Seq" id="Seq" value=1>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="Seq" id="Seq" value="<c:out value="${sessSeq }"/>">
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="ssQuestionGroup" id="ssQuestionGroup" value="">
			<input type="hidden" name="ssChoosedGroup" id="ssChoosedGroup" value="">
			<c:choose>
				<c:when test="${fn:length(list) eq 0}">
					<div><p class="text-center">질문, 선택지가 없어요</p></div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="list" varStatus="status">
						<c:choose>
							<c:when test="${list.question eq 1}">
								<div class="container" id="content_page_<c:out value="${list.question}"/>">
									<div>
										<h5><c:out value="${list.questionContent }"/></h5>
										<c:out value="${list.question}"/>문제 번호
									</div>
									<div class="row choice_box my-5	">
										<c:forEach items="${list2}" var="list2" varStatus="status">
											<c:choose>
												<c:when test="${list2.sqSeq eq list.sqSeq }">
													<div class="col-6 my-3">
														<c:out value="${list2.choice}"/>선택지 번호
														<input type="radio" class="btn-check" value="<c:out value="${list2.choice}"/>" name="btn_<c:out value="${list.question}"/>" id="btn_<c:out value="${list.question}"/>_<c:out value="${list2.choice}"/>" onclick="selectAndHide(<c:out value="${list.question}"/>)" value="<c:out value="${list2.choice}"/>">
														<label class="btn btn-outline-secondary" style="width:226px; font-size: 13px;" for="btn_<c:out value="${list.question}"/>_<c:out value="${list2.choice}"/>"><c:out value="${list2.choiceContent }"/></label>
													</div>
												</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
								<a href="javascript:goSurvey(<c:out value="${vo.snSeq}"/>)"><button type="button" class="btn btn-secondary survey_back" id="btnBack_<c:out value="${list.question}"/>">이전으로</button></a>
							</c:when>
							<c:when test="${status.last}">
								<div class="container visually-hidden" id="content_page_<c:out value="${list.question}"/>">
									<div>
										<h5><c:out value="${list.questionContent }"/></h5>
										<c:out value="${list.question}"/>문제 번호(마지막)
									</div>
									<div class="row choice_box my-5	">
										<c:forEach items="${list2}" var="list2" varStatus="status">
											<c:choose>
												<c:when test="${list2.sqSeq eq list.sqSeq }">
													<div class="col-6 my-3">
														<c:out value="${list2.choice}"/>선택지 번호
														<input type="radio" class="btn-check" value="<c:out value="${list2.choice}"/>" name="btn_<c:out value="${list.question}"/>" id="btn_<c:out value="${list.question}"/>_<c:out value="${list2.choice}"/>" onclick="sendChoice(<c:out value="${list.question}"/>)" value="<c:out value="${list2.choice}"/>">
														<label class="btn btn-outline-secondary" style="width:226px; font-size: 13px;" for="btn_<c:out value="${list.question}"/>_<c:out value="${list2.choice}"/>"><c:out value="${list2.choiceContent }"/></label>
													</div>
												</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
								<button type="button" class="btn btn-secondary survey_back visually-hidden" id="btnBack_<c:out value="${list.question}"/>" onclick="back(<c:out value="${list.question}"/>)">이전으로</button>
							</c:when>
							<c:otherwise>
								<div class="container visually-hidden" id="content_page_<c:out value="${list.question}"/>">
									<div>
										<h5><c:out value="${list.questionContent }"/></h5>
										<c:out value="${list.question}"/>문제 번호
									</div>
									<div class="row choice_box my-5	">
										<c:forEach items="${list2}" var="list2" varStatus="status">
											<c:choose>
												<c:when test="${list2.sqSeq eq list.sqSeq }">
													<div class="col-6 my-3">
														<c:out value="${list2.choice}"/>선택지 번호
														<input type="radio" class="btn-check" value="<c:out value="${list2.choice}"/>" name="btn_<c:out value="${list.question}"/>" id="btn_<c:out value="${list.question}"/>_<c:out value="${list2.choice}"/>" onclick="selectAndHide(<c:out value="${list.question}"/>)" value="<c:out value="${list2.choice}"/>">
														<label class="btn btn-outline-secondary" style="width:226px; font-size: 13px;" for="btn_<c:out value="${list.question}"/>_<c:out value="${list2.choice}"/>"><c:out value="${list2.choiceContent }"/></label>
													</div>
												</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
								<button type="button" class="btn btn-secondary survey_back visually-hidden" id="btnBack_<c:out value="${list.question}"/>" onclick="back(<c:out value="${list.question}"/>)">이전으로</button>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</form>
		<form method="post" name="formVo">
			<input type="hidden" name="snSeq" id="snSeq" value="<c:out value="${vo.snSeq}"/>">
			<input type="hidden" name="Seq" id="Seq" value="<c:out value="${sessSeq }"/>">
		</form>
	</div>
	<!-- <button type="button" class="btn btn-secondary survey_back">이전으로</button> -->
	<div class="container">
		<img alt="" src="/resources/images/lighthouse_mainbanner.jpg" style="width: 1000px;">
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	selectAndHide = function(keyValue) {
		var num = keyValue;
		document.getElementById("content_page_"+num).classList.add('visually-hidden');
		document.getElementById("content_page_"+(num+1)).classList.remove('visually-hidden');
		
		document.getElementById("btnBack_"+num).classList.add('visually-hidden');
		document.getElementById("btnBack_"+(num+1)).classList.remove('visually-hidden');
	}
	
	back = function(keyValue) {
		var num = keyValue;
		document.getElementById("content_page_"+num).classList.add('visually-hidden');
		document.getElementById("content_page_"+(num-1)).classList.remove('visually-hidden');
		
		document.getElementById("btnBack_"+num).classList.add('visually-hidden');
		document.getElementById("btnBack_"+(num-1)).classList.remove('visually-hidden');
	}
	
	var goUrlSsInst = "/survey/surveyChoosedInst";
	var goUrlSurvey = "/survey";
	
	var snSeq = $("input:hidden[name=snSeq]");
	
	var form = $("form[name=myForm]");
	var formVo = $("form[name=formVo]");
	
	// survey 값 제출 및 결과페이지로 Ing 
	var ssQuestion = [];
	var ssChoosed = [];
	sendChoice = function(question) {
		var num = question;
		for(var i = 1; i <= num;i++){
//			$("#ssQuestion").push(i);
//			$("#ssChoosed").push($("input[type=radio][name=btn_"+i+"]:checked").val());
			ssQuestion.push(i);
			ssChoosed.push($("input[type=radio][name=btn_"+i+"]:checked").val());
		}
		/* for(var i =0;i<num;i++){
			alert(ssQuestion[i]+" answer: "+ssChoosed[i]);
		} */
		
		$("#ssQuestionGroup").val(ssQuestion);
		$("#ssChoosedGroup").val(ssChoosed);
			form.attr("action",goUrlSsInst).submit();
	}
	
	goSurvey = function(keyValue) {
    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
    	snSeq.val(keyValue);
		formVo.attr("action", goUrlSurvey).submit();
	}
</script>
</body>
</html>
