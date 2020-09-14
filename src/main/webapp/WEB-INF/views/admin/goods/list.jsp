<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
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
						<th>번호</th>
						<th>이름</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>수량</th>
						<th>등록날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var = "list">
						<tr>
						 <td>
						  <img src="${list.gdsThumbImg}">
						 </td>
						 <td>
						  <a href="/shopping/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
						 </td>
						 <td>
						  ${list.cateName}
						 </td>
						 <td>
						  <fmt:formatNumber value="${list.gdsPrice}"  pattern="###,###,###"/>
						 </td>
						 <td>${list.gdsStock}</td>
						 <td>
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

