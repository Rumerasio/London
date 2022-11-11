<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="uTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>심심 테스트</title>
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
	li {
		margin: 10px;
	}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div id="total">
	<div style="width:100%; position:relative; top: -8px; ">
		<c:choose>
			<c:when test="${fn:length(list) eq 0}">
				<div><p>결과내용이 없어요!</p></div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="list" varStatus="status">
					<c:choose>
						<c:when test="${list.srSeq eq item.srSeq}">
							<div class="container pt-5" style="text-align: center;">
								<c:forEach items="${list2}" var="list2" varStatus="status">
							    	<c:if test="${list2.type eq 4 && list2.pseq eq vo.snSeq && (list2.sort+1) eq list.resultNum}">
							    		<img class="result_img" src="<c:out value="${list2.path }"/><c:out value="${list2.uuidName }"/>" alt="..." style="width: 400px; margin-top:200px;">
							    	</c:if>
							    </c:forEach>
								<div class="mt-4 result_title" style="text-align: center;">
									<h4 style="font-size: 22px; width: 220px; display: inline-block;"><b><c:out value="${list.resultTitle }"/></b></h4>
								</div>
								<div class="result_content mx-auto" style="width: 368px; text-align:left; font-size: 16px;">
									<div style="white-space:pre-line;"><c:out value="${list.resultContent }"/></div>
									<%-- <div class="clearfix row" style="position: relative;">
										<div class="col-6">
											<a class="nav-link" href="#Capricornus"><img class="result_img float-start" alt="..." src="../images/stars_test/Capricornus.jpg" style="width: 180px;"></a>
										</div>
										<div class="col-6">
											<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 잘 맞는 궁합</h4>
											<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;"><c:out value="${list.relation1 }"/></h4>
											<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
										</div>
									</div>
									<div class="clearfix row" style="position: relative;">
										<div class="col-6">
											<a class="nav-link" href="#Taurus"><img class="result_img float-start" alt="..." src="../images/stars_test/Taurus.jpg" style="width: 180px;"></a>
										</div>
										<div class="col-6">
											<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 안 맞는 궁합</h4>
											<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;"><c:out value="${list.relation2 }"/></h4>
											<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
										</div>
									</div> --%>
								</div>
							</div>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<%-- <div class="container pt-5" style="text-align: center;">
						<img class="result_img" alt="..." src="../images/stars_test/Sagittarius.jpg" id="Sagittarius" style="width: 200px; margin-top:200px;">
						<div class="mt-4 result_title" style="text-align: center;">
							<h4 style="color:white; font-size: 22px; width: 220px; display: inline-block;"><b><c:out value="${list.resultTitle }"/></b></h4>
						</div>
						<div class="result_content mx-auto" style="width: 368px; color:white; text-align:left; font-size: 16px;">
							<div style="white-space:pre-line;"><c:out value="${list.resultContent }"/></div>
							<div class="clearfix row" style="position: relative;">
								<div class="col-6">
									<a class="nav-link" href="#Capricornus"><img class="result_img float-start" alt="..." src="../images/stars_test/Capricornus.jpg" style="width: 180px;"></a>
								</div>
								<div class="col-6">
									<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 잘 맞는 궁합</h4>
									<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;"><c:out value="${list.relation1 }"/></h4>
									<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
								</div>
							</div>
							<div class="clearfix row" style="position: relative;">
								<div class="col-6">
									<a class="nav-link" href="#Taurus"><img class="result_img float-start" alt="..." src="../images/stars_test/Taurus.jpg" style="width: 180px;"></a>
								</div>
								<div class="col-6">
									<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 안 맞는 궁합</h4>
									<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;"><c:out value="${list.relation2 }"/></h4>
									<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
								</div>
							</div>
						</div>
					</div> --%>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<!-- <div class="container pt-5" style="text-align: center;">
			<img class="result_img" alt="..." src="../images/stars_test/Sagittarius.jpg" id="Sagittarius" style="width: 200px; margin-top:200px;">
			<div class="mt-4 result_title" style="text-align: center;">
				<h4 style="color:white; font-size: 22px; width: 220px; display: inline-block;"><b>열정적으로 늘 새로운 가능성을 찾는 궁수 자리</b></h4>
			</div>
			<div class="result_content mx-auto" style="width: 368px; color:white; text-align:left; font-size: 16px;">
				<ul>
					<li>뭐든지 하고자 하는 일이 있을때는 자유롭고 싶어해요.</li>
					<li>늘 새로운 가능성을 열어두면서 새롭게 시도하는걸 즐기기도 한답니다.</li>
					<li>그때그대의 일시적인 즐거움 보다는 다른 사람들과 깊은 관계를 맺으면서 행복을 느껴요.</li>
					<li>그래서인지 항상 활발하고 활기가 넘치며 새로운 모임이나 술자리에서도 분위기 메이커를 담당하고 있어요.</li>
					<li>어쩔때는 관종 같아보이지만 은근히 내향적이며 조금 과한 독립심을 품고 있어요.</li>
					<li>반복적인 일상, 틀에 박힌걸 무지 싫어해요.</li>
					<li>그래서 계획적인 약속은 싫어하고, 즉흥적인 약속을 좋아해요.</li>
					<li>내가 생각지도 못한 충동구매를 즐기곤해요.</li>
					<li>안정적이고 안전한 삶을 추구하기 보다는 창의적인 삶을 추구하기 때문에</li>
					<li>잘 질려하고 권태로움을 잘 느끼기도 한답니다.</li>
				</ul>
				<div class="clearfix row" style="position: relative;">
					<div class="col-6">
						<a class="nav-link" href="#Capricornus"><img class="result_img float-start" alt="..." src="../images/stars_test/Capricornus.jpg" style="width: 180px;"></a>
					</div>
					<div class="col-6">
						<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 잘 맞는 궁합</h4>
						<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;">어떤 사람인지 파악하기 힘든 독특하고 복잡한 염소자리</h4>
						<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
					</div>
				</div>
				<div class="clearfix row" style="position: relative;">
					<div class="col-6">
						<a class="nav-link" href="#Taurus"><img class="result_img float-start" alt="..." src="../images/stars_test/Taurus.jpg" style="width: 180px;"></a>
					</div>
					<div class="col-6">
						<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 안 맞는 궁합</h4>
						<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;">성실하며 이해심이 많고 개방적인 황소자리</h4>
						<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="container pt-5" style="text-align: center;">
			<img class="result_img" alt="..." src="../images/stars_test/Capricornus.jpg" id="Capricornus" style="width: 200px; margin-top:200px;">
			<div class="mt-4 result_title" style="text-align: center;">
				<h4 style="color:white; font-size: 22px; width: 220px; display: inline-block;"><b>어떤 사람인지 파악하기 힘든 독특하고 복잡한 염소 자리</b></h4>
			</div>
			<div class="result_content mx-auto" style="width: 368px; color:white; text-align:left; font-size: 16px;">
				<ul>
					<li>공감능력이 매우 뛰어나고 동정심이 너무나도 많아서 내가 피곤하더라도 남들을 배려해주는게 속편해요.</li>
					<li>이사람은 내사람이다! 하는 순간 너무너무 잘해준답니다.</li>
					<li>내성적이고 조용해서 겉으로는 차가워 보인다는 말을 무지 많이 듣지만</li>
					<li>친해지도 나면 이런 애였어? 라며 따뜻한 사람이라고 다들 말해요.</li>
					<li>어딜가나 눈에 띄는 리더 타입은 아니지만 조용하게 자신의 영향력을 미치는 타입이랍니다.</li>
					<li>조용히 다니는데 가끔은 조금 튀고싶어하기도해요.</li>
					<li>계획세우는걸 너무나도 좋아해요. 뭐든지 할 일이 있으면 계획부터!</li>
					<li>상상력이 너무 풍부해서 내가 생각하는걸 오나벽하게 공감해 줄 사람은 이세상에 없다고 생각해요.</li>
					<li>그래서 감정이 앞설땐 혼자 생각할 시간이 필요하답니다.</li>
					<li>평소에 내성적인 타입이라 무리 지어 놀기보다는 내 마음이 아주 잘 맞는 친구랑 단둘이 노는게 더 편하다고 생각해요!</li>
					<li>새로운 일이나 새로운 사람들을 만나는걸 기피하는 편이예요.</li>
					<li>다른 사람에게 거절당하거나 상처받는걸 민감해해서</li>
					<li>새롭게 친해지고 싶은 사람이 생겨도 상대방이 먼저 다가와주길 원한답니다.</li>
					<li>생각이 많아서 타인으로 부터 지속적인 지적과 비판을 받는다면 자신감을 쉽게 상실하고 무너지는 타입입니다.</li>
				</ul>
				<div class="clearfix row" style="position: relative;">
					<div class="col-6">
						<a class="nav-link" href="#Sagittarius"><img class="result_img float-start" alt="..." src="../images/stars_test/Sagittarius.jpg" style="width: 180px;"></a>
					</div>
					<div class="col-6">
						<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 잘 맞는 궁합</h4>
						<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;">열정적으로 늘 새로운 가능성을 찾는 궁수 자리</h4>
						<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
					</div>
				</div>
				<div class="clearfix row" style="position: relative;">
					<div class="col-6">
						<a class="nav-link" href="#Taurus"><img class="result_img float-start" alt="..." src="../images/stars_test/Taurus.jpg" style="width: 180px;"></a>
					</div>
					<div class="col-6">
						<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 안 맞는 궁합</h4>
						<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;">성실하며 이해심이 많고 개방적인 황소자리</h4>
						<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="container pt-5" style="text-align: center;">
			<img class="result_img" alt="..." src="../images/stars_test/Taurus.jpg" id="Taurus" style="width: 200px; margin-top:200px;">
			<div class="mt-4 result_title" style="text-align: center;">
				<h4 style="color:white; font-size: 22px; width: 220px; display: inline-block;"><b>성실하며 이해심이 많고 개방적인 황소자리</b></h4>
			</div>
			<div class="result_content mx-auto" style="width: 368px; color:white; text-align:left; font-size: 16px;">
				<ul>
					<li>수줍음이 많고 부끄러움이 많아요.</li>
					<li>내면을 드러내지 않기 때문에 다른 사람들이 접근하기를 힘들어해요.</li>
					<li>사람에 대한 관심이 적지만 내 사람에게는 매우 잘한답니다.</li>
					<li>평소에 잡생각이 많고 망상을 많이 하는 편이라 감수성이 매우 풍부합니다.</li>
					<li>내적 성장을 매우매우 중요하게 생각하죠.</li>
					<li>그래서 고독과 깊은 생각을 매우 즐기는 타입으로</li>
					<li>우울한 감정을 느낄 때 벗어나려고 하기보다</li>
					<li>그 상황을 즐기는 경우가 많답니다.</li>
					<li>남을 잘 믿지 못하고 쉽게 마음의 문을 열지 않아요.</li>
					<li>무언가에 집중을 할때면 신중한 편이라서 오래 걸려요.</li>
					<li>매우매우 느리고 신중하답니다.</li>
					<li>한번 싫다는 감정이 들면 끝까지 싫어요! 그래서 연을 끊은 사람과는 호전 되기가 쉽지 않답니다.</li>
					<li>내적감정을 중요시하는 타입이기 때문에 남의가치관을 매우 중요하게 생각해요.</li>
				</ul>
				<div class="clearfix row" style="position: relative;">
					<div class="col-6">
						<a class="nav-link" href="#Sagittarius"><img class="result_img float-start" alt="..." src="../images/stars_test/Sagittarius.jpg" style="width: 180px;"></a>
					</div>
					<div class="col-6">
						<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 잘 맞는 궁합</h4>
						<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;">열정적으로 늘 새로운 가능성을 찾는 궁수 자리</h4>
						<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
					</div>
				</div>
				<div class="clearfix row" style="position: relative;">
					<div class="col-6">
						<a class="nav-link" href="#Capricornus"><img class="result_img float-start" alt="..." src="../images/stars_test/Capricornus.jpg" style="width: 180px;"></a>
					</div>
					<div class="col-6">
						<h4 class="mt-4" style="color:skyblue; text-align: center; font-size: 16px;"><i class="fa-solid fa-heart"></i> 안 맞는 궁합</h4>
						<h4 class="mx-4" style="color:white; font-size: 14px; text-align: center;">어떤 사람인지 파악하기 힘든 독특하고 복잡한 염소자리</h4>
						<div class="vertical_line" style="border-left: 2px solid skyblue; height: 100px; position: absolute; left: 50%; margin-left:-6px; top: 25px;"></div>
					</div>
				</div>
			</div>
		</div> -->
		<div class="result_End_Part mt-5" style="color: white; text-align: center;">
			<h6><b>친구에게 테스트 공유하기</b></h6>
			<div class="row my-3" style="width: 368px; margin: auto; font-size: 40px;">
				<div class="col-2 offset-3">
					<i class="fa-solid fa-share-nodes"></i>
				</div>
				<div class="col-2">
					<button type="button" onclick="shareKakao(<c:out value="${vo.snSeq}"/>)"><i class="fa-brands fa-twitter"></i></button>
				</div>
				<div class="col-2">
					<i class="fa-brands fa-facebook-f"></i>
				</div>
			</div>
			<form method="post" name="formVo">
				<input type="hidden" name="snSeq" id="snSeq" value="<c:out value="${vo.snSeq}"/>">
				<input type="hidden" name="survey" id="survey" value="<c:out value="${item2.survey }"/>">
				<input type="hidden" name="surveyExplain" id="surveyExplain" value="<c:out value="${item2.surveyExplain }"/>">
				<input type="hidden" name="Seq" id="Seq" value="<c:out value="${sessSeq }"/>">
				<div class="row">
					<div class="col-2 offset-4">
						<a href="javascript:goSurvey(<c:out value="${vo.snSeq}"/>)"><button type="button" class="btn btn-warning" style="color:white; width:180px; font-size: 14px;">테스트 다시하기</button></a>
					</div>
					<div class="col-2">
						<a href="/"><button type="button" class="btn btn-danger" style="width: 180px; font-size: 14px;">다른 테스트 하러가기</button></a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	var goUrlSurvey = "/survey";
	
	var snSeq = $("input:hidden[name=snSeq]");

	var formVo = $("form[name=formVo]");

	goSurvey = function(keyValue) {
		/* if(keyValue != 0) seq.val(btoa(keyValue)); */
		snSeq.val(keyValue);
		formVo.attr("action", goUrlSurvey).submit();
	}
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	var survey = $("#survey").val();
	var surveyExplain = $("#surveyExplain").val();
	//init 체크
	if (!Kakao.isInitialized()) {
	  Kakao.init('983700957186f54b5dea5b9569f37c10');
	}
	var shareKakao = function(keyValue) {
	    // 메시지 공유 함수
		Kakao.Link.sendDefault({
		    objectType: 'feed',
		    content: {
		      title: survey,
		      description: surveyExplain,
		      imageUrl:
		        '/resources/uploaded/survey/2022/10/31/ee60ee13-7e81-47ad-b3ab-9074a752f530.jpg',
		      imageWidth: 1200,
		      imageHeight: 630,
		      link: {
		        mobileWebUrl: 'http://localhost:8080/survey',
		        androidExecutionParams: 'test',
		      },
		    },
		    buttons: [
		      {
		        title: '테스트 하러가기',
		        link: {
		          mobileWebUrl: 'http://localhost:8080/survey?snSeq='+keyValue+'',
		          webUrl: 'http://localhost:8080/survey?snSeq='+keyValue+'',
		        },
		      },
		    ],
		});
	};

</script>
</body>
</html>
