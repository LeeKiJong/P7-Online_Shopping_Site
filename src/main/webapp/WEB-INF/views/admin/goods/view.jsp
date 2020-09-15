<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<style>
nav#nav ul li {
	display: inline-block;
	margin-left: 10px;
}

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

.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='gdsDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#gdsDes {
	width: 400px;
	height: 180px;
}
.oriImg {width:500px; height:auto;}
.thumbImg{}
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
						<h2>상품 조회</h2>

						<form role="form" method="post" autocomplete="off">

							<input type="hidden" name="n" value="${goods.gdsNum}" />
							<div class="inputArea">
								<label>1차 분류</label> <span class="category1">${goods.cateName}</span> <label>2차
									분류</label> <span class="category2">${goods.cateCode}</span>
							</div>

							<div class="inputArea">
								<label for="gdsName">상품명</label> <span>${goods.gdsName}</span>
							</div>

							<div class="inputArea">
								<label for="gdsPrice">상품가격</label> <span><fmt:formatNumber
										value="${goods.gdsPrice}" pattern="###,###,###" /></span>
							</div>

							<div class="inputArea">
								<label for="gdsStock">상품수량</label> <span>${goods.gdsStock}</span>
							</div>

							<div class="inputArea">
								<label for="gdsDes">상품소개</label> <span>${goods.gdsDes}</span>
							</div>

							<div class="inputArea">
								<label for="gdsImg">이미지</label>
								<p>원본 이미지</p>
								<img src="<spring:url value = 'file:///C:/Users/rl876/Downloads/apache-tomcat-7.0.99/apache-tomcat-7.0.99/wtpwebapps/Shopping_Site${goods.gdsImg}'/>  class="oriImg" />

								<p>썸네일</p>
								<img src="${goods.gdsThumbImg}" class="thumbImg" />
							</div>

							<div class="inputArea">
								<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
								<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>

								<script>
									var formObj = $("form[role='form']");

									$("#modify_Btn")
											.click(
													function() {
														formObj
																.attr("action",
																		"/shopping/admin/goods/modify");
														formObj.attr("method",
																"get")
														formObj.submit();
													});

									$("#delete_Btn")
											.click(
													function() {
														var con = confirm("정말로 삭제하시겠습니까?");

														if (con) {
															formObj
																	.attr(
																			"action",
																			"/shopping/admin/goods/delete");
															formObj.submit();
														}
													});
								</script>
							</div>

						</form>
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

