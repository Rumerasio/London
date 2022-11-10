<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- <div class="pt-2" style="background-color: white; text-align: center;">
	<h6><b>이솔빈</b> 관리자님</h6>
	<a href="/zdminLogin"><span style="font-size: 10px;">로그아웃</span></a>
</div> -->
<style type="text/css">
	#btnLogout:hover {
		cursor: pointer;
	}
</style>


<c:choose>
	<c:when test="${sessSeq eq null}">
		<div>
			<p>세션값으면 로그인화면으로 가야지</p>
		</div>
	</c:when>
	<c:otherwise>
		<div class="pt-2" style="background-color: white; text-align: center;">
			<ul class="list-unstyled">
				<li><h6><b><c:out value="${sessNickname }"/></b> 관리자님</h6></li>
				<li id="btnLogout" style="font-size: 10px;">로그아웃</li>
			</ul>
		</div>
		<%-- <div id ="user_box">
			<b><c:out value="${item.nickname }"/></b> 님<br>
			<!-- <a href=""><i class="fa-solid fa-heart"></i></a> -->
			<a id="btnMypage"><i class="fa-solid fa-clipboard-user mx-1"></i></a>
			<a id="btnLogOut"><i class="fa-solid fa-arrow-right-from-bracket mx-1"></i></a>
			<!-- <button type="button" class="btn" id="btnLogOut"><i class="fa-solid fa-arrow-right-from-bracket mx-1"></i></button> -->
			<!-- <a href=""><i class="fa-solid fa-clock-rotate-left"></i></a> -->
		</div> --%>
	</c:otherwise>
</c:choose>	

<!-- 로그아웃 script 따로 넣을것 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	var goUrlLogin = "/zdminLogin";

	$("#btnLogout").on("click", function(){
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			/* ,dataType:"json" */
			,url: "/logoutProc"
			/* ,data : $("#formLogin").serialize() */
			,success: function(response) {
				if(response.rt == "success") {
						$(location).attr("href",goUrlLogin);
				} else {
					
				}
			}
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	});
</script>