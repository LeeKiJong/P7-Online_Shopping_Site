<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
						<%@ include file="/WEB-INF/views/include/side.jsp"%>
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
						<header>
							<h2><c:if test="${member==null}">Hello, I'm LKJ</c:if> <c:if test="${member!=null}">Welcome, ${member.userName}</c:if></h2>
							<p>You can buy to your heart and soul.</p>
						</header>
						<p>There are many products on this site. Put the product you
							want in your shopping cart and order it!!!</p>
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

