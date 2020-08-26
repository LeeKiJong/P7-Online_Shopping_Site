<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>LKJ Online Shopping Mall</title>
</head>
<body>
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
				  <div class="input_area">
					   <label for="userId">아이디</label>
					   <input type="email" id="userId" name="userId" required="required" />      
				  </div>
					  
				  <div class="input_area">
					   <label for="userPass">패스워드</label>
					   <input type="password" id="userPass" name="userPass" required="required" />      
				  </div>
					       
				  <button type="submit" id="signin_btn" name="signin_btn">로그인</button>
				  <c:out value = "${msg}"/>
			 </form>
			 </c:if>   
		</section>
	</div>
	</section>
	<footer id = "footer">
		<div id = "footeer-box">
			<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
		</div>
	</footer>
	
</div>

</body>
</html>

