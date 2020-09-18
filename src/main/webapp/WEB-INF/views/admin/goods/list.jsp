<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>상품 목록 페이지</title>
<style>
	.table1{
		text-align:center; vertical-align:middle
	}
	.th1{
		text-align:center; vertical-align:middle
	}
</style>

</head>
<body>
<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
	<header id="header">
					<div id="header_box">
						<%@ include file="/WEB-INF/views/include/aside.jsp"%>
						<%@ include file="/WEB-INF/views/include/header.jsp"%>
					</div>
				</header>
	<section id ="container">
		<div id = "container_box">
			<table class="alt">
				<thead>
					<tr>
						<th class ="th1">이미지</th>
						<th class ="th1">이름</th>
						<th class ="th1">카테고리</th>
						<th class ="th1">가격</th>
						<th class ="th1">수량</th>
						<th class ="th1">등록날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var = "list">
						<tr>
						 <td class = "table1">
						  <img src="<spring:url value='/resources${list.gdsThumbImg}'/>" />
						 </td>
						 <td class = "table1">
						  <a href="/shopping/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
						 </td>
						 <td class = "table1">
						  ${list.cateName}
						 </td>
						 <td class = "table1">
						  <fmt:formatNumber value="${list.gdsPrice}"  pattern="###,###,###"/>
						 </td>
						 <td class = "table1">
						 ${list.gdsStock}
						 </td>
						 <td class = "table1">
						  <fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd" />
						 </td>
						</tr>    
					</c:forEach>
				</tbody>
			</table>


		</div>
	</section>
	
</div>
</div>
<div id="sidebar">
			<div class="inner">

				<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>

			</div>
		</div>


</div>

</body>
</html>

