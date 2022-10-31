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
	<title>MemberForm</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Edu+NSW+ACT+Foundation:wght@700&display=swap');
	body {
	background-color: rgba(0, 86, 102, 0.07);
	}
	table,td{
		text-align:center;
		border:1px solid #0F52BA20;
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
	.addScroll{
		overflow-y:auto;
		height: 200px;
		background-color:#E9ECEF;
		padding-top:5px; 
		padding-left:5px;
	}
	.input-file-button{
		padding: 4px 25px;
		background-color:#FF6600;
		border-radius: 4px;
		color: white;
		cursor: pointer;
	}
	#multipleContainer {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
	}
	.image {
	    display: block;
	    width: 100%;
	}
	.image-label {
	    position: relative;
	    bottom: 22px;
	    left: 5px;
	    color: white;
	    text-shadow: 2px 2px 2px black;
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
		<h5 class="mt-3"><b>회원관리</b></h5>
		<div>
			<button type="button" id="btnList" class="btn btn-sm" style="width:60px; font-size:10px; background-color:#e6e6e6;">뒤로가기</button>
		</div>
		<form method="post" id="myForm" name="myForm" autocomplete="off">
			<input type="hidden" name="delNy" id="delNy" value=0>
			<!-- *Vo.jsp s -->
			<%@include file="MemberVo.jsp"%>		<!-- #-> -->
			<!-- *Vo.jsp e -->
			<div class="p-5">
				<!-- <div class="row pt-4 py-2">
					<div class="col-5">
						<div class="row justify-content-center">
							<img class="img-thumbnail" alt="" id="preview" style="width:160px; height:144px;">
						</div>
						<h6 class="my-3" style="text-align: center;">컨텐츠 이미지<br>대형배너(385 x 515)</h6>
						<label class="btn btn-sm mb-4" id="input-file-button" for="input-file" style="width:100px; background-color:#525252">첨부파일</label>
						<input type="file" id="input-file" style="display:none;">
					</div>
					<img style="width: 174px; height: 150px;" id="previewImage" src=" ">
					<input style="display: block;" multiple="multiple" type="file" id="inputImage" onChange="test('inputImage',2,2,1,0,0,2);">
					<div class="addScroll">
						<div style="display: inline-block; height: 95px;">
							<img src="/resources/images/antic.jpg" class="rounded" width= "85px" height="85px">
							<ul id="ulFile2" class="list-group">
							</ul>
							<div style="position: relative; top:-85px; left:5px"><span style="color: red;">X</span></div>
						</div>
		 			</div>
				</div> -->
				<div class="row pt-4 py-2">
					<label for="nickname" class="col-1 col-form-label">닉네임</label>
				    <div class="col-4">
				      <input type="text" class="form-control" id="nickname" name="nickname" value="">
				    </div>
				</div>
				<div class="row py-2">
					<label for="dob" class="col-1 col-form-label">생년월일</label>
				    <div class="col-4">
				      <input type="text" class="form-control" id="dob" name="dob" placeholder="ex)080101" value="">
				    </div>
				</div>
				<div class="row py-2">
					<label for="gender" class="col-1 col-form-label">성별</label>
				    <div class="col-2">
				      <select class="form-select" id="gender" name="gender">
				      	<option value = 0 selected>성별</option>
				      	<option value = 101>남성</option>
				      	<option value = 102>여성</option>
				      </select>
				    </div>
				</div>
				<div class="row py-2">
					<label for="email" class="col-1 col-form-label">이메일</label>
					<div class="col-4">
				      <input type="text" class="form-control" id="email" name="email" placeholder="abcde@gmail.com" value="">
				    </div>
				</div>
				<div class="row py-2">
					<label for="id" class="col-1 col-form-label">아이디</label>
				    <div class="col-4">
				      <input type="text" class="form-control" id="id" name="id" placeholder="ID" value="">
				    </div>
				</div>
				<div class="row py-2">
					<label for="password" class="col-1 col-form-label">비밀번호</label>
				    <div class="col-4">
				      <input type="password" class="form-control" id="password" name="password" placeholder="">
				    </div>
				</div>
				<div class="row py-2">
					<label for="user_password_check" class="col-1 col-form-label" style="font-size: 14px;">비밀번호 확인</label>
				    <div class="col-4">
				      <input type="password" class="form-control" id="user_password_check" placeholder="">
				      <input type="text" class="form-control-plaintext" value="비밀번호가 일치합니다" style="font-size: 10px;">
				    </div>
				</div>
				<!-- <div class="row mt-sm-4">
			        <div class="col-sm-6 mt-3 mt-sm-0">
			            <label for="ifmmUploadedImage" class="form-label input-file-button">이미지첨부</label>
			 			<input class="form-control form-control-sm" id="ifmmUploadedImage" name="ifmmUploadedImage" type="file" multiple="multiple" style="display: none;" onChange="upload('ifmmUploadedImage', 1, 0, 1, 0, 0, 1);">
			        </div>
			    </div>
			    <h2>멀티파일 처리</h2>
				<input style="display: block;" type="file" id="inputMultipleImage" multiple>
				<div id="multipleContainer" style="width: 400px; height: 400px;" ></div> -->
				<div class="row mb-3">
					<span class="col-2 offset-4"><button type="button" class="btn btn-sm" id="btnSave" name="btnSave" style="background-color:rgb(197, 59, 222); color:white;">계정생성</button></span>
				</div>
			</div>
		</form>
		<form name="formVo" id="formVo" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="MemberVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
		</form>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/resources/zdmin/js/commonZdmin.js"></script>
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
	var goUrlList = "/member/memberList"; 			/* #-> */
	var goUrlInst = "/member/memberInst";				/* #-> */
	
	var form = $("form[name=myForm]");
	var formVo = $("form[name=formVo]");
	
	var seq = $("input:hidden[name=seq]");				/* #-> */
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}
	
	$("#btnList").on("click", function(){
		formVo.attr("action", goUrlList).submit();
	});
	
	$("#btnSave").on("click",function(){
		form.attr("action",goUrlInst).submit();
	});
	
	test = function(objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
//		objName 과 seq 는 jsp 내에서 유일 하여야 함.
//		memberProfileImage: 1
//		memberImage: 2
//		memberFile : 3
		
		var obj = $("#" + objName +"")[0].files;	
		var totalsize = 0;
//		var maxLength = 5;
//		var maxSingleSize = 1024*1*1024;
//		var maxTotalSize = 1024*5;
		
		alert(obj);
		alert(obj.length);
		
		allowedMaxTotalFileNumber = allowedMaxTotalFileNumber == 0 ? MAX_TOTAL_FILE_NUMBER : allowedMaxTotalFileNumber;
		allowedEachFileSize = allowedEachFileSize == 0 ? MAX_EACH_FILE_SIZE : allowedEachFileSize;
		allowedTotalFileSize = allowedTotalFileSize == 0 ? MAX_TOTAL_FILE_SIZE : allowedTotalFileSize;
		
		if(obj.length > allowedMaxTotalFileNumber){
			alert('파일 갯수 '+allowedMaxTotalFileNumber+'개 초과여');
			return false;
		} else{
			for(var i =0; i<obj.length; i++){
				if(checkUploadedExt($("#" + objName +"")[0].files[i].name, seq, allowedExtdiv) == false) { return false; }
				if(obj[i].size > allowedEachFileSize) {
					alert('개별 파일의 용량이 5Mb초과여');
					return false;
				} else{
					alert(obj[i].name +" : " + obj[i].size);
					totalsize += obj[i].size;
				}
			}
		}
		if(totalsize > allowedTotalFileSize) {
			alert('전체 파일 용량이 5Mb초과여');
			return false;
		} else{
			alert("총 파일 용량 : "+totalsize);	
		}
		
		if(uiType ==2){
			$("#ulFile" + seq).children().remove();
			for (var i = 0 ; i < obj.length ; i++) {
				addUploadLi(seq, i, $("#" + objName +"")[0].files[i].name);
			} 
		} else{
			return false;
		}
	}
	addUploadLi = function (seq, index, name){
		
		var ul_list = $("#ulFile0");
		
		li = '<li id="li_'+seq+'_'+index+'" class="list-group-item d-flex justify-content-between align-items-center">';
		li = li + name;
		li = li + '<span class="badge bg-danger rounded-pill" onClick="delLi('+ seq +','+ index +')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>';
		li = li + '</li>';
		
		$("#ulFile"+seq).append(li);
	}
	delLi = function(seq, index) {
		$("#li_"+seq+"_"+index).remove();
	}
	
	$("#go").on("click",function(){
		test1();
	});
</script>
<script type="text/javascript">
	function checkOnlyKoreanEnglishNumber (objName, pattern, nullAllowedNy, message) {
	// checkOnlyKoreanEnglishNumber = function(obj, value, message) {
	    var regExp = /^[ㄱ-ㅎ가-힣A-Za-z0-9]+$/;
	    return checkLogic (objName, pattern, nullAllowedNy, message, regExp);
	}
/* 	
	function readImage(input) {
	    if (input.files && input.files[0]) {
	        const reader = new FileReader();
	        
	        reader.onload = (e) => {
	            const previewImage = document.getElementById('previewImage');
	            previewImage.src = e.target.result;
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	// 이벤트 리스너
	document.getElementById('inputImage').addEventListener('change', (e) => {
	    readImage(e.target);
	})
	function readMultipleImage(input) {
    const multipleContainer = document.getElementById('multipleContainer')
    
    if(input.files) {
        console.log(input.files)
        const fileArr = Array.from(input.files)
        const $colDiv1 = document.createElement('div')
        const $colDiv2 = document.createElement('div')
        $colDiv1.classList.add('column')
        $colDiv2.classList.add('column')
        fileArr.forEach((file, index) => {
            const reader = new FileReader()
            const $imgDiv = document.createElement('div')   
            const $img = document.createElement('img')
            $img.classList.add('image')
            const $label = document.createElement('label')
            $label.classList.add('image-label')
            $label.textContent = file.name
            $imgDiv.appendChild($img)
            $imgDiv.appendChild($label)
            reader.onload = e => {
                $img.src = e.target.result
                
                //$imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px"
                //$imgDiv.style.height = ($img.naturalHeight) * 0.2 + "px"
            }
            
            console.log(file.name)
            if(index % 2 == 0) {
                $colDiv1.appendChild($imgDiv)
            } else {
                $colDiv2.appendChild($imgDiv)
            }
            
            reader.readAsDataURL(file)
        })
        multipleContainer.appendChild($colDiv1)
        multipleContainer.appendChild($colDiv2)
    }
}
	 */
// 이벤트 리스너
document.getElementById('inputMultipleImage').addEventListener('change', (e) => {
    readMultipleImage(e.target);
})
</script>
</body>
</html>
