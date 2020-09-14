<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<c:if test = "${member.verify ==9}">
<a href="/shopping/member/signin" class="logo"><strong>LKJ(Admin)</strong> Online Shopping Mall</a>
</c:if>

<c:if test = "${member.verify ==0}">
<a href="/shopping/member/signin" class="logo"><strong>LKJ</strong> Online Shopping Mall</a>
</c:if>
	<ul class="icons">
		<c:if test = "${member == null}">
			<li><a href="/shopping/member/signin"><span class="label">로그인</span></a></li>
			<li><a href="/shopping/member/signup"><span class="label">회원가입</span></a></li>
		</c:if>
		<c:if test = "${member != null}">
			<li>${member.userName}님 환영합니다.</li>
			<c:if test = "${member.verify == 0}">
			<li><a href="/shopping/shop/cartList"><span class="label">장바구니</span></a></li>
			<li><a href="/shopping/shop/orderList"><span class="label">주문목록</span></a></li>
			</c:if>
			<li><a href="/shopping/member/signout"><span class="label">로그아웃</span></a></li>
			
		</c:if>
	</ul>