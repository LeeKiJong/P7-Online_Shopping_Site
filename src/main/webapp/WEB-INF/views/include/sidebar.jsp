<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- Menu -->
<c:if test = "${member == null or member.verify == 0}">
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
</c:if>
<c:if test = "${member.verify == 9}">


	<%@ include file="/WEB-INF/views/admin/include/aside.jsp"%>
</c:if>
				

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>