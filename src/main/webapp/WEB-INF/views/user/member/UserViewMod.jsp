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
	<title>개인정보 수정</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
</head>
<style type="text/css">
	/* 폰트: Edu NSW ACT Foundation, sans-serif, Noto Sans KR */
	@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Edu+NSW+ACT+Foundation:wght@700&family=Noto+Sans+KR:wght@500&display=swap');
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
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container col-7">
	<div style="text-align:center; position: relative;">
		<button type="button" id="btnMypage" class="btn btn-sm" style="position:absolute; left:120px; width: 80px; background-color:#e6e6e6;">뒤로가기</button>
		<h3 class="my-5">개인정보수정</h3>
		<form method="post" id="myForm" name="myForm" autocomplete="off">
		<input type="hidden" name="seq" value="<c:out value="${item.seq}"/>"/>
		<input type="hidden" name="delNy" value= 0 />
			<div class="row justify-content-center py-2">
				<label for="nickname" class="col-sm-2 col-form-label">닉네임</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="nickname" name="nickname" value="<c:out value="${item.nickname }"></c:out>">
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="dob" class="col-sm-2 col-form-label">생년월일</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="dob" name="dob" placeholder="생일을 선택해주세요" value="<c:out value="${item.dob }"></c:out>">
			    </div>
			</div>
			<div class="row py-2">
				<label for="gender" class="col-sm-2 offset-2 col-form-label">성별</label>
			    <div class="col-sm-2">
			      <select class="form-select col-2" id="gender" name="gender">
			      	<option value = 103 <c:if test="${item.gender eq 103 }" >selected</c:if>>성별</option>
			      	<option value = 101 <c:if test="${item.gender eq 101 }" >selected</c:if>>남성</option>
			      	<option value = 102 <c:if test="${item.gender eq 102 }" >selected</c:if>>여성</option>
			      </select>
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="email" class="col-sm-2 col-form-label">이메일</label>
				<div class="col-6">
			      <input type="text" class="form-control" disabled="disabled" id="email" name="email" placeholder="" value="<c:out value="${item.email }"></c:out>">
			    </div>
			    <!-- 
			    <div class="col-3">
			      <input type="text" class="form-control" id="email_id" placeholder="" value="rozemari22">
			    </div>
			    <div class="col-3">
			    	<select class="form-select col-3">
					 	<option value = 0>메일주소</option>
					 	<option value = 1>naver.com</option>
					 	<option value = 2 selected>gmail.com</option>
					 </select>
			    </div> 
			    -->
			</div>
			<div class="row justify-content-center py-2">
				<label for="id" class="col-sm-2 col-form-label">아이디</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" disabled="disabled" id="id" name="id" placeholder="" value="<c:out value="${item.id }"></c:out>">
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="user_password" class="col-sm-2 col-form-label">비밀번호</label>
			    <div class="col-sm-6">
			      <input type="password" class="form-control" id="" placeholder="현재 비밀번호" value="">
			    </div>
			</div>
			<div class="row justify-content-center py-2">
				<label for="user_password_check" class="col-sm-2 col-form-label">비밀번호 확인</label>
			    <div class="col-sm-6">
			      <input type="password" class="form-control" id="" placeholder="">
			    </div>
			</div>
		</form>
		<div class="row mt-5" style="position: relative;">
			<div class="col-8 offset-2">
				<button type="button" id="btnMod" class="btn float-start" style="width: 100px; background-color:rgb(197, 59, 222); color:white;">수정하기</button>
				<button type="button" class="btn btn-danger float-end" data-bs-toggle="modal" data-bs-target="#member_leave" style="width: 100px;">탈퇴</button>
				<div style="clear: both;"></div>
				<p class="float-start mt-1" style="font-size: 12px;">수정되었습니다.</p>
			</div>
			
		</div>
		<div class="modal fade" tabindex="-1" id="member_leave">
			<div class="modal-dialog">
				<div class="modal-content">
				  <div class="modal-header">
				    <h5 class="modal-title">회원 탈퇴</h5>
				    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				  </div>
				  <div class="modal-body">
				    <p>계정을 다시 복구 할 수 없습니다. <br> 정말 탈퇴하시겠습니까?</p>
				  </div>
				  <div class="modal-footer">
				    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				    <button type="button" id="btnQuit" class="btn btn-danger" data-bs-dismiss="modal">탈퇴</button>
				    <!-- <button type="button" id="btnQuit" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#member_leave_alert">탈퇴</button> -->
				  </div>
				</div>
			</div>
		</div>
		<!-- <div class="modal fade" tabindex="-1" id="member_leave_alert">
			<div class="modal-dialog">
				<div class="modal-content">
				  <div class="modal-header">
				    <h5 class="modal-title">회원 탈퇴</h5>
				    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				  </div>
				  <div class="modal-body">
				    <p>탈퇴되었습니다.</p>
				  </div>
				  <div class="modal-footer">
				    <a href="./main.html"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button></a>
				  </div>
				</div>
			</div>
		</div> -->
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$( function() {
		$( "#dob" ).datepicker({
	    	changeYear: true,
	    	changeMonth: true,
	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	    	yearRange:"1900:2023",
	    	monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    	monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			dateFormat: "yy-mm-dd"
		});
	} );
</script>
<script type="text/javascript">
	$(document).ready(function(){
		var sessVal = '<%=(String)session.getAttribute("sessSeq")%>';
		if(sessVal == '' || sessVal =='null'){
			alert('세션이 만료되어 로그인 창으로 이동됩니다.');
			location.href='/loginPage'
		}
	});
	
	var goUrlMypage = "/myPage";
	var goUrlUpdt = "/myPage/userUpdt";
	var goUrlVele = "/myPage/userVele";
	
	var form = $("form[name=myForm]");
	
	$("#btnMypage").on("click", function(){
		$(location).attr("href",goUrlMypage);
	});
	
	$("#btnMod").on("click", function(){
		form.attr("action", goUrlUpdt).submit();
	});
	
//	$("#btnQuit").on("click", function(){
//		form.attr("action", goUrlVele).submit();
//	});

	$("#btnQuit").on("click", function(){
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
						alert("탈퇴되었습니다.");
						form.attr("action", goUrlVele).submit();
					/* } */
				} else {
					
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	});
	
</script>
</body>
</html>
