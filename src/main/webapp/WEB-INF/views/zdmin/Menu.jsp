<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="mt-3 pt-2 ps-3" style="background-color:rgb(224, 224, 224);">
	<span style="text-align: center;"><h5>메뉴</h5></span>
	<ul class="list-unstyled">
		<li class="fw-semibold">테스트 관리
			<ul class="list-unstyled ps-2">
				<a href="/content/contentList"><li style="font-weight: normal;">테스트 관리</li></a>
				<a href="/content/contentRecord"><li style="font-weight: normal;">테스트 이용기록</li></a>
			</ul>
		</li>
		<li class="fw-semibold">회원 관리
			<ul class="list-unstyled ps-2">
				<a href="/member/memberList"><li style="font-weight: normal;">회원관리</li></a>
				<a href="/member/memberComment"><li style="font-weight: normal;">댓글관리</li></a>
			</ul>
		</li>
		<li class="fw-semibold">소스관리
			<ul class="list-unstyled ps-2">
				<a href="/codeGroup/AdminCodegroupList"><li style="font-weight: normal;">코드그룹 관리</li></a>
				<a href="/code/codeList"><li style="font-weight: normal;">코드 관리</li></a>
			</ul>
		</li>
	</ul>
</div>