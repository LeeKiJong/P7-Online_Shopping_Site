<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>주문 목록 페이지</title>
<style>
section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

div#container_box ul li {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
}

div#container_box .orderList span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
	margin-right: 10px;
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
				<section id="container">
					<div id="container_box">
						<section id="content">
							<ul class="orderList">
								<c:forEach items="${orderList}" var="orderList">
									<li>
										<div>
											<p>
												<span>주문번호</span><a
													href="/shopping/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
											</p>
											<p>
												<span>주문자</span>${orderList.userId}</p>
											<p>
												<span>수령인</span>${orderList.orderRec}</p>
											<p>
												<span>주소</span>(${orderList.userAddr1})
												${orderList.userAddr2} ${orderList.userAddr3}
											</p>
											<p>
												<span>가격</span>
												<fmt:formatNumber pattern="###,###,###"
													value="${orderList.amount}" />
												원
											</p>
											<p>
												<span>상태</span>${orderList.delivery}</p>
										</div>
									</li>
								</c:forEach>
							</ul>

						</section>

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

