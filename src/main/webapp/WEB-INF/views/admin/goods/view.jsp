<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>상품 조회 페이지</title>
<style>
.oriImg {
	width: 500px;
	height: auto;
}

.thumbImg {
	
}

.gdsDes img {
	max-width: 600px;
	height: auto;
}

.table1 {
	text-align: center;
	vertical-align: middle
}

.th1 {
	text-align: center;
	vertical-align: middle
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
						<h2>상품 조회</h2>

						<form role="form" method="post" autocomplete="off">
							<input type="hidden" name="n" value="${goods.gdsNum}" />

							<table class="alt">
								<thead>
									<tr>
										<th class="th1">카테고리</th>
										<th class="th1">상품명</th>
										<th class="th1">상품가격</th>
										<th class="th1">상품수량</th>
									</tr>
								</thead>
								<tbody>
										<tr>
										<td class="table1">${goods.cateName}</td>
										<td class="table1">${goods.gdsName}</td>
										<td class="table1"><fmt:formatNumber
										value="${goods.gdsPrice}" pattern="###,###,###" /></td>
										<td class="table1">${goods.gdsStock}</td>
										</tr>
								</tbody>
							</table>

							<div class="inputArea">
								<h3><label for="gdsDes">상품소개</label></h3>
								<div class="gdsDes">${goods.gdsDes}</div>
							</div>

							<div class="inputArea">
								<h3><label for="gdsImg">이미지</label></h3>
								<h4>원본 이미지</h4>
								<img src="<spring:url value='/resources${goods.gdsImg}'/>"
									class="oriImg" />

								<h4>썸네일</h4>
								<img src="<spring:url value='/resources${goods.gdsThumbImg}'/>"
									class="thumbImg" />
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

