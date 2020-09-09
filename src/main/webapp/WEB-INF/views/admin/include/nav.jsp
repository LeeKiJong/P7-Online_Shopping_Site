<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<c:if test = "${member!=null}">
		<c:if test = "${member.verify == 0}">
		<li>
			<a href = "/shopping/member/index">일반 화면</a>
		</li>
		</c:if>
		
		<li>
			<a href = "/shopping/member/signout">로그아웃</a>
		</li>
	</c:if>
	
</ul>