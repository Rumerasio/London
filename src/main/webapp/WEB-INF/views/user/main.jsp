<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="uTF-8">
	<meta name="viewport" content = "width=device-width, initial-scale=1.0">
	<title>main</title>
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
		width:140px;
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
	#btnLogOut, #btnMypage{
		cursor:pointer;
	}
	#btnLogOut:hover, #btnMypage:hover{
		color:blue;
	}
	#end{
		background-color: rgb(224, 224, 224);
		padding-top: 30px;
		padding-bottom: 30px;
		font-size: 10px;
		position: relative;
		top:50px;
	}
	.main_top { overflow: hidden; width:90%;}
	.main_top_list .main_top_item { position: relative; overflow: hidden;}
	.main_top_list .main_top_item.mti_1 { float: left;width: 50%; height: 515px; }
	.main_top_list .main_top_item.mti_2 { float: right;width: 50%; height: 305px; }
	.main_top_list .main_top_item.mti_3 { float: right;width: 25%; height: 210px; }
	.main_top_list .main_top_item.mti_4 { float: right;width: 25%; height: 210px; }
	.main_top_list .main_top_item .thumb { position: absolute; top: 0; right: 0; bottom: 0; left: 0; -webkit-background-size:cover; background-size:cover; background-repeat: no-repeat; background-position: center center; z-index: 1;-webkit-transition: all 0.5s ease; /* Safari and Chrome */ -moz-transition: all 0.5s ease; /* Firefox */ -o-transition: all 0.5s ease; /* IE 9 */ -ms-transition: all 0.5s ease; /* Opera */ transition: all 0.5s ease;}
	.main_top_list .main_top_item:hover .thumb { filter: alpha(opacity=80); transform: scale(1.15,1.17); /* Change these numbers to suit your needs */ -webkit-transform: scale(1.15,1.17); -moz-transform: scale(1.15,1.17); -ms-transform: scale(1.15,1.17); -o-transform: scale(1.15,1.17);}
	.main_top_list .main_top_item a { position: absolute;display: block;width: 100%;height:100%;box-sizing:border-box;padding:20px; text-align: center;background-color: rgba(0,0,0,0.2); z-index: 2;}
	.main_top_list .main_top_item a p { position: relative; top: 50%;transform:translateY(-50%);}
	.main_top_list .main_top_item a p .subject { display: block;font-size: 28px; letter-spacing: -1px; color: #ffffff;text-shadow:2px 2px 2px rgba(0,0,0,0.4);word-break:keep-all;line-height:130%}
	.main_top_list .main_top_item a p .description { display: block;font-size: 14px; letter-spacing: -1px; color: #ffffff;text-shadow:2px 2px 2px rgba(0,0,0,0.4);word-break:keep-all; line-height: 130%;}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container" id="total">
	<div class="container" style="position: relative;top:-8px;">
		<div class="row" style="width: 1200px;position: relative;">
			<form method="post" name=formList id="formList">
				<input type="hidden" name="snSeq" id="snSeq" value="<c:out value="${vo.snSeq}"/>">
				<input type="hidden" name="seq" id="seq" value="<c:out value="${sessSeq }"/>">
				<div class="main_top" style="display: inline-block;"> 
					<ul class="main_top_list"> 
						<li class="main_top_item mti_1"> 
							<div class="thumb" style="background-image:url('/resources/images/stars_hugeBanner.jpg')"></div> 
							<a href="javascript:goSurvey(5)" title="별자리 테스트"> 
								<p> 
									<span class="subject font-serif">별자리 테스트</span> 
									<span class="description">나는 무슨 별자리일까?</span> 
								</p> 
							</a> 
						</li> 
						<li class="main_top_item mti_2">
							<div class="thumb" style="background-image:url('/resources/images/fox.jpg')"></div>
							<a href="javascript:goSurvey(19)" title="꽃말 테스트"> 
								<p> 
									<span class="subject font-serif">꽃말 테스트</span> 
									<span class="description">당신을 위한 꽃말은?</span>
								</p> 
							</a> 
						</li> 
						<li class="main_top_item mti_3"> 
							<div class="thumb" style="background-image:url('/resources/images/watermelon.jpg')"></div> 
							<a href="javascript:goSurvey(4)" title="여행지 테스트"> 
								<p> 
									<span class="subject font-serif">여행지 테스트</span> 
									<span class="description">올 여름 어디로 여행을 갈까!?</span> 
								</p> 
							</a> 
						</li> 
						<li class="main_top_item mti_4">
						<div class="thumb" style="background-image:url('/resources/images/ai.jpg')"></div> 
						<a href="javascript:goSurvey(2)" title=""> 
							<p> 
								<span class="subject font-serif">나는 뇌를 얼마나 쓰고 있을까?</span> 
								<span class="description">퀴즈로 알아보는 뇌사용률!</span> 
							</p> 
						</a> 
						</li>
					</ul> 
				</div>
				<c:choose>
					<c:when test="${sessSeq eq null}">
						<div id ="user_box">
							<a href="/loginPage"><button type="button" class="btn btn-sm m-1" style="width:120px; color:white; background-color:rgba(197, 59, 222, 0.54)">로그인</button></a>
							<a href="/register"><button type="button" class="btn btn-sm m-1" style="width:120px; background-color:#e6e6e6;">회원가입</button></a>
						</div>
					</c:when>
					<c:otherwise>
						<div id ="user_box">
							<b><c:out value="${item.nickname }"/></b> 님<br>
							<!-- <a href=""><i class="fa-solid fa-heart"></i></a> -->
							<a id="btnMypage"><i class="fa-solid fa-clipboard-user mx-1"></i></a>
							<a id="btnLogOut"><i class="fa-solid fa-arrow-right-from-bracket mx-1"></i></a>
							<!-- <button type="button" class="btn" id="btnLogOut"><i class="fa-solid fa-arrow-right-from-bracket mx-1"></i></button> -->
							<!-- <a href=""><i class="fa-solid fa-clock-rotate-left"></i></a> -->
						</div>
					</c:otherwise>
				</c:choose>
				<!-- <div id ="user_box">
					<a href="/loginPage"><button type="button" class="btn btn-sm m-1" style="width:120px; color:white; background-color:rgba(197, 59, 222, 0.54)">로그인</button></a>
					<a href="/register"><button type="button" class="btn btn-sm m-1" style="width:120px; background-color:#e6e6e6;">회원가입</button></a>
				</div>
				<div id ="user_box">
					<b>로제</b> 님<br>
					<a href=""><i class="fa-solid fa-heart"></i></a>
					<a href="./memberMypage.html"><i class="fa-solid fa-clipboard-user mx-1"></i></a>
					<a href="./main.html"><i class="fa-solid fa-arrow-right-from-bracket mx-1"></i></a>
					<a href=""><i class="fa-solid fa-clock-rotate-left"></i></a>
				</div> -->
			</div>
			<div class="container mt-5">
				<h4>다른 컨텐츠</h4>
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
									      		<a href="javascript:goSurvey(<c:out value="${list.snSeq }"/>)">
									      			<img src="<c:out value="${list2.path }"/><c:out value="${list2.uuidName }"/>" class="card-img-top" alt="...">
									      		</a>
									      	</c:if>
									      </c:forEach>
									      <div class="card-body">
									        <a href="javascript:goSurvey(<c:out value="${list.snSeq }"/>)"><h6 class="card-title"><c:out value="${list.survey}"></c:out></h6></a>
									      </div>
								    </div>
								  </div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form>
		<!-- 소중한 주소를 통한 상세주소, 좌표 받아오기 -->
		<%-- sessSeq: <c:out value="${sessSeq }"/><br>
		sessId: <c:out value="${sessId }"/><br>
		<div class="row justify-content-center py-2">
			<label class="col-2 col-form-label">주소</label>
			<div class="row">
				<div class="col-4">
			      <input type="text" class="form-control" id="adressNum"  placeholder="우편번호">
			    </div>
			    <div class="col-2">
			    	<input type="button" class="btn btn-warning" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			    </div>
			    <div class="col-2">
			    	<input type="button" id="btnAdrClear" class="btn btn-danger" value="refresh">
			    </div>
			</div>
			<div class="row">
				<div class="col-6">
					<input type="text" class="form-control" id="adress" placeholder="주소">
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<input type="text" class="form-control" id="adressDetail" placeholder="상세주소">
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<input type="text" class="form-control" id="latitude" placeholder="위도">
				</div>
				<div class="col-6">
					<input type="text" class="form-control" id="longitude" placeholder="경도">
				</div>
			</div>
		</div> --%>
	</div>
</div>
<nav class="container-fluid" id="end">
	<div class="row">
		<div class="col-auto">
			<span><a href="#">이용약관</a></span>
		</div>
		<div class="col-auto me-auto">
			<span><a href="#">개인정보 취급방침</a></span>
		</div>
		<div class="col-auto">
			<span>© 2022-2022. 심심</span>
		</div>
	</div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67fc6337fd44ffa65501244b4df0a284&libraries=services"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                /* var extraAddr = ''; // 참고항목 변수 */
                
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        /* extraAddr += data.bname; */
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        /* extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); */
                    }
                    /* // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr; */
                
                } else {
                    /* document.getElementById("sample6_extraAddress").value = ''; */
                }
                
				
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('adressNum').value = data.zonecode;
                document.getElementById("adress").value = addr;
                
                var geocoder = new daum.maps.services.Geocoder();
                
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용
                        
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        document.getElementById('latitude').value = coords.getLat();
                        document.getElementById('longitude').value = coords.getLng();
                    }
                });
                
                		
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("adressDetail").focus();
            }
        }).open();
        /* 
        new daum.Postcode({
            onclose: function(state) {
                //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
                if(state === 'FORCE_CLOSE'){
                    //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.

                } else if(state === 'COMPLETE_CLOSE'){
                	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('adressNum').value = data.zonecode;
                    document.getElementById("adress").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("adressDetail").focus();
                    
                }
            }
        });
         */
    }
	
    $("#btnAdrClear").on("click", function(){
		$("#adressNum").val("");
		$("#adress").val('');
		$("#adressDetail").val('');
		$("#latitude").val('');
		$("#longitude").val('');
	});
    
	var goUrlMain = "/"; 			/* #-> */
	var goUrlMypage = "/myPage"; 			/* #-> */
	var goUrlLogO = "/logoutProc"; 			/* #-> */
	var goUrlSurvey = "/survey";
    
	var snSeq = $("input:hidden[name=snSeq]");
	
	var form = $("form[name=formList]");
	
    $("#btnLogOut").on("click", function(){
    	$.ajax({
			async: true 
			,cache: false
			,type: "post"
			/* ,dataType:"json" */
			,url: "/logoutProc"
			/* ,data : $("#formLogin").serialize() */
			,success: function(response) {
				if(response.rt == "success") {
					/* if(response.changePwd == "true") {
						location.href = URL_CHANGE_PWD_FORM;
					} else { */
						$(location).attr("href",goUrlMain);
					/* } */
				} else {
					
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	});
  
    $("#btnMypage").on("click", function(){
    	$(location).attr("href",goUrlMypage);
    });
    
    goSurvey = function(keyValue) {
    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
    	snSeq.val(keyValue);
		form.attr("action", goUrlSurvey).submit();
	}
    
</script>
</body>
</html>
