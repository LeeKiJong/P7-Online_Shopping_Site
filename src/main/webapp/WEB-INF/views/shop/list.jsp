<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>상품 목록 페이지</title>
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->

				<header id="header">
					<div id="header_box">
						<%@ include file="/WEB-INF/views/include/aside.jsp"%>
						<%@ include file="/WEB-INF/views/include/header.jsp"%>
					</div>
				</header>
				<section>
					<div class="posts">
						<c:forEach items="${list}" var="list">
							<article>
								<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
								<!--  
							<div class="goodsThumb">
								<img src="${list.gdsThumbImg}">
							</div>
						-->
								<h3>${list.gdsName}</h3>
								<p>${list.gdsDes}</p>
								<ul class="actions">
									<li><a href="/shopping/shop/view?n=${list.gdsNum}"
										class="button">More</a></li>
								</ul>
							</article>
						</c:forEach>

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



