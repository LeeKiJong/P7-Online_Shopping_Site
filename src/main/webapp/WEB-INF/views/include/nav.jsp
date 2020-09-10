<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<spring:url value='/resources/assets/css/main.css'/>" />
</head>
<ul>
	<c:if test = "${member!=null}">
		<c:if test = "${member.verify == 9}">
			<li>
				<a href = "/shopping/admin/index">관리자 화면</a>
			</li>
		</c:if>
		<c:if test = "${member.verify == 0}">
			<li>
				<a href = "/shopping/shop/index">일반 화면</a>
			</li>
		</c:if>
		<li>
			${member.userName}님 환영합니다.
		</li>
		<c:if test = "${member.verify == 0}">
			<li>
				<a href = "/shopping/shop/cartList">장바구니</a>
			</li>
			<li>
				<a href = "/shopping/shop/orderList">주문리스트</a>
			</li>
		</c:if>
		
		
		<li>
			<a href = "/shopping/member/signout">로그아웃</a>
		</li>
	</c:if>
</ul>