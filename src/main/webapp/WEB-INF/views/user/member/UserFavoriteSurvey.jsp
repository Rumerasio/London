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
	<title>즐겨찾기</title>
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
	.radio-design input[type="radio"] {
		display: none;
	}
	.radio-design input[type="radio"] + span {
		display: inline-block;
		background: none;
		border:none;
		cursor:pointer;
	}
	.radio-design input[type="radio"]:checked + span {
		text-decoration: underline;
		font-weight: bold;
	}
</style>

<body>
<nav class="navbar">
	<div class="container-fluid" id="topNav">
		<a class="navbar-brand" id="logo" href="/">Simsim</a>
	</div>
</nav>
<div class="container my-5">
	<div class="container" style="width:900px;">
		<div style="text-align:center; position:relative;">
			<button type="button" id="btnMypage" class="btn btn-sm" style="position:absolute; left:0px; width: 80px; background-color:#e6e6e6;">뒤로가기</button>
			<h3 class="my-5"style="font-family: sans-serif;"><b><i class="fa-solid fa-heart"></i> 즐겨찾기</b></h3>
		</div>
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
						      <a href="#"><img src="" class="card-img-top" alt="..."></a>
						      <div class="card-body">
						        <a href="#"><h6 class="card-title"><c:out value="${list.survey}"></c:out></h6></a>
						      </div>
						    </div>
						  </div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<nav class="nav justify-content-center mt-4">
	  <ul class="pagination pagination-sm">
	  	<li class="page-item">
	      <a class="page-link" href="#"">
	        <span><i class="fa-solid fa-backward-step"></i></span>
	      </a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous"">
	        <span><i class="fa-solid fa-chevron-left"></i></span>
	      </a>
	    </li>
	    <li class="page-item active"><a class="page-link" href="#"">1</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next"">
	        <span aria-hidden="true"><i class="fa-solid fa-chevron-right"></i></span>
	      </a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="#"">
	        <span><i class="fa-solid fa-forward-step"></i></span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bf82a9a80d.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var sessVal = '<%=(String)session.getAttribute("sessSeq")%>';
		if(sessVal == '' || sessVal =='null'){
			alert('세션이 만료되어 로그인 창으로 이동됩니다.');
			location.href='/loginPage'
		}
	});
	
	var goUrlMypage = "/myPage";
	
	$("#btnMypage").on("click", function(){
		$(location).attr("href",goUrlMypage);
	});
</script>
</body>
</html>
