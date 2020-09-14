<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<style>
		 body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
		 ul { padding:0; margin:0; list-style:none;  }
		
		 div#root { width:90%; margin:0 auto; }
		 
		 header#header { font-size:60px; padding:20px 0; }
		 header#header h1 a { color:#000; font-weight:bold; }
		 
		 nav#nav { padding:10px; text-align:right; }
		 nav#nav ul li { display:inline-block; margin-left:10px; }
		
		 section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
		 section#container::after { content:""; display:block; clear:both; }
		 aside { float:left; width:200px; }
		 div#container_box { float:right; width:calc(100% - 200px - 20px); }
		 
		 aside ul li { text-align:center; margin-bottom:10px; }
		 aside ul li a { display:block; width:100%; padding:10px 0;}
 	     aside ul li a:hover { background:#eee; }
 
		 footer#footer { background:#f9f9f9; padding:20px; }
		 footer#footer ul li { display:inline-block; margin-right:10px; }
	</style>
	<style>
	
	#container_box ul li { margin-bottom:20px; border:10px solid #eee; }
	.replyInfo { background:#eee; padding:10px; font-size:18px; }
	.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
	.replyContent { padding:10px; }
	.replyControll {text-align:right; padding:10px; }
	.replyControll button { border:2px solid #999; background:#fff; }
	</style>
</head>
<body>
<div id = "root">
	<header id = "header">
		<div id = "header_box">
			<%@ include file = "/WEB-INF/views/admin/include/header.jsp" %>
		</div>
	</header>
	<nav id = "nav">
		<div id = "nav_box">
			<%@ include file = "/WEB-INF/views/admin/include/nav.jsp" %>
		</div>
	</nav>
	<section id ="container">
		<div id="container_box">
		 <ul>
		  <c:forEach items="${reply}" var="reply">
		  <li>
		   <div class="replyInfo">
		    <p>
		     <span>작성자</span>${reply.userName} (${reply.userId})
		    </p>
		    <p>
		     <span>작성된 상품</span> <a href="/shopping/admin/shop/view?n=${reply.gdsNum}">바로가기</a>
		    </p>
		   </div>
		   <div class="replyContent">
		    ${reply.repCon}
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
		<aside>
			<%@ include file = "/WEB-INF/views/admin/include/aside.jsp" %>
		</aside>
		
	</section>
	<footer id = "footer">
		<div id = "footeer-box">
			<%@ include file = "/WEB-INF/views/admin/include/footer.jsp" %>
		</div>
	</footer>
	
</div>

</body>
</html>
