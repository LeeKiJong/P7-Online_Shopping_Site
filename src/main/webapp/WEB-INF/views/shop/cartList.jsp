<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>장바구니 페이지</title>
	<style>
		 
		 section#container { }
		 
		

	 
	</style>	
	<style>
		 section#content ul li { margin:10px 0; }
		 section#content ul li img { width:250px; height:250px; }
		 section#content ul li::after { content:""; display:block; clear:both; }
		 section#content div.thumb { float:left; width:250px; }
		 section#content div.gdsInfo { float:right; width:calc(100% - 270px); }
		 section#content div.gdsInfo { font-size:20px; line-height:2; }
		 section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
		 section#content div.gdsInfo .delete { text-align:right; }
		 
 		.allCheck { float:left; width:200px; }
		.allCheck input { width:16px; height:16px; }
		.allCheck label { margin-left:10px; }
		.delBtn { float:right; width:300px; text-align:right; }
		
		
		.checkBox { float:left; width:30px; }
		.checkBox input { width:16px; height:16px; }
		
		.listResult { padding:20px; background:#eee; }
		.listResult .sum { float:left; width:45%; font-size:22px; }
		
		.listResult .orderOpne { float:right; width:45%; text-align:right; }
		
		.listResult::after { content:""; display:block; clear:both; }

		.orderInfo { border:5px solid #eee; padding:20px; display:none;}
		.orderInfo .inputArea { margin:10px 0; }
		.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
		.orderInfo .inputArea input { font-size:14px; padding:5px; }
		#userAddr2, #userAddr3 { width:250px; }
		
		.orderInfo .inputArea:last-child { margin-top:30px; }
		
		.orderInfo .inputArea #sample2_address { width:230px; }
		.orderInfo .inputArea #sample2_detailAddress { width:280px; }
		.orderInfo .inputArea #sample2_extraAddress { display:none; }

	</style>
	
</head>
<body>
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
			<section id="content">
			 <ul>
				 <li>
				  <div class="allCheck">
				   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
				  	<script>
					$("#allCheck").click(function(){
					 var chk = $("#allCheck").prop("checked");
					 if(chk) {
					  $(".chBox").prop("checked", true);
					 } else {
					  $(".chBox").prop("checked", false);
					 }
					});
					</script>
				  
				  </div>
				  
				  <div class="delBtn">
				   <button type="button" class="selectDelete_btn">선택 삭제</button> 
				  <script>
				 	$(".selectDelete_btn").click(function(){
				  var confirm_val = confirm("정말 삭제하시겠습니까?");
				  
				  if(confirm_val) {
				   var checkArr = new Array();
				   
				   $("input[class='chBox']:checked").each(function(){
					   checkArr.push($(this).attr("data-cartNum"));
				   });
				              
				   $.ajax({
				    url : "/shopping/shop/deleteCart",
				    type : "post",
				    data : { chbox : checkArr },
				    success : function(result){
				     if(result == 1) {            
				      location.href = "/shopping/shop/cartList";
				     } else {
				      alert("삭제 실패");
				     }
				    }
				   });
				  } 
				 });
				</script>
				  </div>
				  
				 </li>
				
				<c:set var="sum" value="0" />
				
				 <c:forEach items="${cartList}" var="cartList">
				 <li>
				  <div class="checkBox">
				   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
				  
				  	<script>
					 $(".chBox").click(function(){
					  $("#allCheck").prop("checked", false);
					 });
					</script>
				  </div>
				 
				  <div class="thumb">
				   <img src="<spring:url value='/resources${cartList.gdsThumbImg}'/>" />
				  </div>
				  <div class="gdsInfo">
				   <p>
				    <span>상품명</span>${cartList.gdsName}<br />
				    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 원<br />
				    <span>구입 수량</span>${cartList.cartStock} 개<br />
				    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /> 원
				   </p>
				   
				   <div class="delete">
					 <button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button>
					 
					 <script>
					  $(".delete_${cartList.cartNum}_btn").click(function(){
					   var confirm_val = confirm("정말 삭제하시겠습니까?");
					   
					   if(confirm_val) {
					    var checkArr = new Array();
					    
					    checkArr.push($(this).attr("data-cartNum"));
					               
					    $.ajax({
					     url : "/shopping/shop/deleteCart",
					     type : "post",
					     data : { chbox : checkArr },
					     success : function(result){
					      if(result == 1) {     
					       location.href = "/shopping/shop/cartList";
					      } else {
					       alert("삭제 실패");
					      }
					     }
					    });
					   } 
					  });
					 </script>
					</div>
				  </div>   
				 </li>
				 
				 <c:set var = "sum" value = "${sum + (cartList.gdsPrice * cartList.cartStock)}" />
				 </c:forEach>
				</ul>
				
			<div class="listResult">
			 <div class="sum">
			  총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
			 </div>
			 <div class="orderOpne">
			  <button type="button" class="orderOpne_bnt">주문 정보 입력</button>
			 	
			 	<script>
				 $(".orderOpne_bnt").click(function(){
				  $(".orderInfo").slideDown();
				  $(".orderOpne_bnt").slideUp();
				 });      
				</script>
			 </div>
			</div>
			<div class="orderInfo">
			 <form role="form" method="post" autocomplete="off">
			    
			  <input type="hidden" name="amount" value="${sum}" />
			    
			  <div class="inputArea">
			   <label for="">수령인</label>
			   <input type="text" name="orderRec" id="orderRec" required="required" />
			  </div>
			  
			  <div class="inputArea">
			   <label for="orderPhone">수령인 연락처</label>
			   <input type="text" name="orderPhone" id="orderPhone" required="required" />
			  </div>
			  
			  <div class="inputArea">
			  <p>
			  	<input type="text" id="sample2_postcode" placeholder="우편번호">
				<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
			</p>
			<p>
				<input type="text" name = "userAddr1" id="sample2_address" placeholder="주소"><br>
				<input type="text" name = "userAddr2" id="sample2_detailAddress" placeholder="상세주소">
				<input type="text" name = "userAddr3" id="sample2_extraAddress" placeholder="참고항목">
			  </p>
			  <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
							  
			  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) { 
            	var addr = ''; 
                var extraAddr = ''; 

               
                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

               
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                document.getElementById("sample2_detailAddress").focus();


                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);


        element_layer.style.display = 'block';


        initLayerPosition();
    }

		    function initLayerPosition(){
		        var width = 300; 
		        var height = 400; 
		        var borderWidth = 5; 
		
		        element_layer.style.width = width + 'px';
		        element_layer.style.height = height + 'px';
		        element_layer.style.border = borderWidth + 'px solid';
		         element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
		        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		    }
		</script>
			  
			  
			  </div>
			  <div class="inputArea">
			   <button type="submit" class="order_btn">주문</button>
			   <button type="button" class="cancel_btn">취소</button> 
			  
			  <script>
				$(".cancel_btn").click(function(){
				 $(".orderInfo").slideUp();
				 $(".orderOpne_bnt").slideDown();
				});      
				</script>

			  </div>
			  
			 </form> 
			</div>

			</section>
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

