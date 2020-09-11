<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
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
				<c:if test="${member==null}">
					<section id="header">
						<div id="header_box">
							<section id="content">
								<h2>Login</h2>
								<form role="form" method="post" autocomplete="off">
									<div class="row uniform">
										<div class="6u 12u$(xsmall)">
											<input type="email" id="userId" name="userId"
												required="required" placeholder="ID(Email)" />
										</div>
										<div class="6u$ 12u$(xsmall)">
											<input type="password" id="userPass" name="userPass"
												required="required" placeholder="Password" />
										</div>
										<div class="12u$">
											<ul class="actions">
												<li><button type="submit" id="signin_btn"
														name="signin_btn" class="special">로그인</button></li>
												<c:if test="${member==null}">
													<li><a href="/shopping/member/signup"
														class="button special">회원가입</a></li>
												</c:if>
											</ul>
										</div>
									</div>
									<c:out value="${msg}" />
								</form>

							</section>
						</div>
					</section>
				</c:if>
				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<c:if test="${member==null}">
						<header>
							<h2>
								Hello, I'm LKJ
							</h2>
							<p>You can buy to your heart and soul.</p>
						</header>
						<p>There are many products on this site. Put the product you
							want in your shopping cart and order it!!!</p>
						</c:if>
						<c:if test="${member.verify==0}">
						<header>
							<h2>
								Welcome, ${member.userName}
							</h2>
							<p>You can buy to your heart and soul.</p>
						</header>
						<p>There are many products on this site. Put the product you
							want in your shopping cart and order it!!!</p>
						</c:if>
						<c:if test="${member.verify==9}">
						<header>
							<h2>
								${member.userName}
							</h2>
							<p>관리자 모드로 접속 중입니다.</p>
							</header>
						</c:if>
					</div>
					<span class="image object"> <img
						src="<spring:url value='/resources/images/pic10.jpg'/>" />
					</span>
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

