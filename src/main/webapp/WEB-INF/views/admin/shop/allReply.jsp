<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
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
</style>
<style>
#container_box ul li {
	margin-bottom: 20px;
	border: 10px solid;
}

.replyInfo {
	padding: 10px;
	font-size: 18px;
}

.replyInfo span {
	font-size: 20px;
	font-weight: bold;
	margin-right: 20px;
}

.replyContent {
	padding: 10px;
	font-size: 18px;
}

.replyContent span {
	font-size: 20px;
	font-weight: bold;
	margin-right: 20px;
}

.replyControll {
	text-align: right;
	padding: 10px;
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
						<ul>
							<c:forEach items="${reply}" var="reply">
								<li>
									<div class="replyInfo">
										<p>
											<span>작성자</span>${reply.userName} (${reply.userId})
										</p>
										<p>
											<span>작성된 상품</span> <a
												href="/shopping/admin/shop/view?n=${reply.gdsNum}">바로가기</a>
										</p>
									</div>
									<div class="replyContent">
									<p>
									<span>댓글 내용</span>${reply.repCon}
									</p>
									</div>

									<div class="replyControll">
										<form role="form" method="post">
											<input type="hidden" name="repNum" value="${reply.repNum}" />
											<button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
										</form>
									</div>





								</li>
							</c:forEach>
						</ul>
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

