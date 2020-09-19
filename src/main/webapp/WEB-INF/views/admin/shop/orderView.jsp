<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>주문 세부정보 페이지</title>
	<style>

		 section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
		 section#container::after { content:""; display:block; clear:both; }
		 div#container_box { float:right; width:calc(100% - 200px - 20px); }

	</style>
	<style>
	 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
	 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
	 
	 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
	 .orderView li::after { content:""; display:block; clear:both; }
	 
	 .thumb { float:left; width:200px; }
	 .thumb img { width:200px; height:200px; }
	 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
	 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	
	.deliveryChange { text-align:right; }
	.delivery1_btn,
	.delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
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
	<section id ="container">
		<div id = "container_box">
			<div class="orderInfo">
			  <c:forEach items="${orderView}" var="orderView" varStatus="status">
			  
			  <c:if test="${status.first}">
			   <p><span>주문자</span>${orderView.userId}</p>
			   <p><span>수령인</span>${orderView.orderRec}</p>
			   <p><span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
			   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
			   <p><span>상태</span>${orderView.delivery}</p>
			   
			  <div class="deliveryChange">
			 <form role="form" method="post" class="deliveryForm">
			 
			  <input type="hidden" name="orderId" value="${orderView.orderId}" />
			  <input type="hidden" name="delivery" class="delivery" value="" />
			  
			  <button type="button" class="delivery1_btn">배송 중</button>
			  <button type="button" class="delivery2_btn">배송 완료</button>
			  
			  <script>
			   $(".delivery1_btn").click(function(){
			    $(".delivery").val("배송 중");
			    run();
			   });
			   
			   $(".delivery2_btn").click(function(){
			    $(".delivery").val("배송 완료");
			    run();
			    
			   });
			   
			   function run(){
			    $(".deliveryForm").submit();
			   }
			  
			  </script>
			 </form>
			</div>
			  </c:if>
			  
			 </c:forEach>
			</div>
			
			<ul class="orderView">
			 <c:forEach items="${orderView}" var="orderView">     
			 <li>
			  <div class="thumb">
			   <img src="<spring:url value='/resources${orderView.gdsThumbImg}'/>" />
			  </div>
			  <div class="gdsInfo">
			   <p>
			    <span>상품명</span>${orderView.gdsName}<br />
			    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
			    <span>구입 수량</span>${orderView.cartStock} 개<br />
			    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원                  
			   </p>
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

