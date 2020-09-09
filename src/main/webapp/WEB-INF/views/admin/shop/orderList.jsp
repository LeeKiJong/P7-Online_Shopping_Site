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
		 div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
		 div#container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
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
		<div id = "container_box">
			<section id = "content">
				<ul class="orderList">
				 <c:forEach items="${orderList}" var="orderList">
				 <li>
				 <div>
				  <p><span>주문번호</span><a href="/shopping/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
				  <p><span>주문자</span>${orderList.userId}</p>
				  <p><span>수령인</span>${orderList.orderRec}</p>
				  <p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
				  <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p> 
				  <p><span>상태</span>${orderList.delivery}</p>
				 </div>
				 </li>
				 </c:forEach>
				</ul>
			
			</section>
		
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

