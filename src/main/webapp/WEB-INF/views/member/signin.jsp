<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="<spring:url value='/resources/assets/css/main.css'/>" />
</head>
<body>
<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="index.html" class="logo"><strong>LKJ</strong> Online Shopping Mall</a>
									<ul class="icons">
										<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon fa-medium"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>Hello, I'm LKJ</h1>
											<p>You can buy to your heart and soul.</p>
										</header>
										<p>There are many products on this site. Put the product you want in your shopping cart and order it!!</p>
									</div>
									<span class="image object">
										<img src="<spring:url value='/resources/images/pic10.jpg'/>"/>
									</span>
								</section>
								<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Category</h2>
									</header>
									<ul>
										<li>
											<span class="opener">상의</span>
											<ul>
												<li><a href="/shopping/shop/list?c=101&l=2">티셔츠</a></li>
												<li><a href="/shopping/shop/list?c=102&l=2">셔츠</a></li>
												<li><a href="/shopping/shop/list?c=103&l=2">반팔</a></li>
												<li><a href="/shopping/shop/list?c=104&l=2">긴팔</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">하의</span>
											<ul>
												<li><a href="/shopping/shop/list?c=201&l=2">슬랙스</a></li>
												<li><a href="/shopping/shop/list?c=202&l=2">청바지</a></li>
												<li><a href="/shopping/shop/list?c=203&l=2">면바지</a></li>
											</ul>
										</li>
										<li><a href="/shopping/shop/list?c=300&l=2">기타</a></li>
									</ul>
								</nav>

								

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<ul class="contact">
										<li class="fa-envelope-o">rl00822@naver.com</li>
										<li class="fa-phone">(010) 8762-4001</li>
										<li class="fa-home">충청북도  청주시 *** *** ***<br /></li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>
							<div id = "root">
								<header id = "header">
									<div id = "header_box">
										<%@ include file = "/WEB-INF/views/include/header.jsp" %>
									</div>
								</header>
								<nav id = "nav">
									<div id = "nav_box">
										<%@ include file = "/WEB-INF/views/include/nav.jsp" %>
									</div>
								</nav>
								<section id ="container">
																
								<div id = "container_box">
									<section id="content">
										<c:if test = "${member==null}">
											<form role="form" method="post" autocomplete="off">
														<div class="row uniform">
															<div class="6u 12u$(xsmall)">
																 <input type="email" id="userId" name="userId" required="required" placeholder="ID(Email)"/>
															</div>
															<div class="6u$ 12u$(xsmall)">
																<input type="password" id="userPass" name="userPass" required="required" placeholder="Password"/>      
															</div>
															<div class="12u$">
																<ul class="actions">
																	<li><button type="submit" id="signin_btn" name="signin_btn" class = "special">로그인</button></li>
																	<c:if test = "${member==null}">
																		<li><a href="/shopping/member/signup" class="button special">회원가입</a></li>
																	</c:if>
																</ul>
															</div>
														</div>
														<c:out value = "${msg}"/>
													</form>
										 </c:if>   
									</section>
								</div>
								</section>
								<footer id = "footer">
									<div id = "footer-box">
										<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
									</div>
								</footer>
						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="<spring:url value='/resources/assets/js/jquery.min.js'/>"></script>
			<script src="<spring:url value='/resources/assets/js/skel.min.js'/>"></script>
			<script src="<spring:url value='/resources/assets/js/util.js'/>"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<spring:url value='/resources/assets/js/main.js'/>"></script>

</div>

</body>
</html>

