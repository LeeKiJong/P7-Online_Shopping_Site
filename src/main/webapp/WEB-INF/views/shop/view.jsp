<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<script> 
				  function replyList(){
					 var gdsNum = ${view.gdsNum};
					 $.getJSON("/shopping/shop/view/replyList" + "?n=" + gdsNum, function(data){
					  var str = "";
					  
					  $(data).each(function(){
					   
					   console.log(data);
					   
					   var repDate = new Date(this.repDate);
					   repDate = repDate.toLocaleDateString("ko-US")
					   
					   str += "<li data-repNum='" + this.repNum + "'>" //"<li data-gdsNum='" + this.gdsNum + "'>"
					     + "<div class='userInfo'>"
					     + "<span class='userName'>" + this.userName + "</span>"
					     + "<span class='date'>" + repDate + "</span>"
					     + "</div>"
					     + "<div class='replyContent'>" + this.repCon + "</div>"
					 
					     + "<div class='replyFooter'>"
					     + "<button type='button' class='modify' data-repNum='" + this.repNum + "'>수정</button>"
					     + "<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
					     + "</div>"
					     + "</li>";           
					  });
					  
					  $("section.replyList ol").html(str);
					 });
				  }
				</script>
</head>
<body>

	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<header id="header">
					<div id="header_box">
						<%@ include file="/WEB-INF/views/include/aside.jsp"%>
						<%@ include file="/WEB-INF/views/include/header.jsp"%>
					</div>
				</header>

				<section id="container">
				<header id = "main">
					<h1>${view.gdsName}</h1>
				</header>
					<div id="container_box">
						<section id="content">
							<form role="form" method="post">
								<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
							</form>

							<div class="goods">
								<div class="goodsImg">
									<img src="${view.gdsImg}">
								</div>
								
								<div class="table-wrapper">
														<table>
															<tbody>
																<tr>
																	<td>상품명</td>
																	<td>${view.gdsName}</td>
																</tr>
																<tr>
																	<td>카테고리</td>
																	<td>${view.cateName}</td>
																</tr>
																<tr>
																	<td>가격</td>
																	<td><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />원</td>
																</tr>
																<tr>
																	<td>재고</td>
																	<td><fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" />EA</td>
																</tr>
															</tbody>
														</table>
													</div>
													
													
								<div class="goodsInfo">
									
									<c:if test="${view.gdsStock !=0}">
										<p class="cartStock">
											<span>구입 수량</span>
											<button type="button" id = "plus" class="button special small">+</button>
											<button type="button" id = "minus" class="button small">-</button>
											<input type="number" class="numBox" min="1"
												max="${view.gdsStock}" value="1" readonly="readonly" />
											

											<script>
					  $("#plus").click(function(){
					   var num = $(".numBox").val();
					   var plusNum = Number(num) + 1;
					   
					   if(plusNum >= ${view.gdsStock}) {
					    $(".numBox").val(num);
					   } else {
					    $(".numBox").val(plusNum);          
					   }
					  });
					  
					  $("#minus").click(function(){
					   var num = $(".numBox").val();
					   var minusNum = Number(num) - 1;
					   
					   if(minusNum <= 0) {
					    $(".numBox").val(num);
					   } else {
					    $(".numBox").val(minusNum);          
					   }
					  });
					 </script>

										</p>

										<p class="addToCart">
											<button type="button" class="addCart_btn">카트에 담기</button>

											<script>
						 $(".addCart_btn").click(function(){
						  var gdsNum = $("#gdsNum").val();
						  var cartStock = $(".numBox").val();
						           
						  var data = {
						    gdsNum : gdsNum,
						    cartStock : cartStock
						    };
						  
						  $.ajax({
						   url : "/shopping/shop/view/addCart",
						   type : "post",
						   data : data,
						   success : function(result){
						    
						    if(result == 1) {
						     alert("카트 담기 성공");
						     $(".numBox").val("1");
						    } else {
						     alert("회원만 사용할 수 있습니다.")
						     $(".numBox").val("1");
						    }
						   },
						   error : function(){
						    alert("카트 담기 실패");
						   }
						  });
						 });
					</script>

										</p>
									</c:if>

									<c:if test="${view.gdsStock ==0}">
										<p>상품 수량이 부족합니다.</p>
									</c:if>
								</div>

								<div class="gdsDes">${view.gdsDes}</div>
							</div>
							<div id="reply">

								<c:if test="${member == null }">
									<p>
										소감을 남기시려면 <a href="/shopping/member/signin">로그인</a>해주세요
									</p>
								</c:if>

								<c:if test="${member != null}">
									<section class="replyForm">
										<form role="form" method="post" autocomplete="off">
											<input type="hidden" name="gdsNum" id="gdsNum"
												value="${view.gdsNum}">
											<div class="input_area">
												<textarea name="repCon" id="repCon"></textarea>
											</div>

											<div class="input_area">
												<button type="button" id="reply_btn">소감 남기기</button>

												<script>
					 $("#reply_btn").click(function(){
					  
					  var formObj = $(".replyForm form[role='form']");
					  var gdsNum = $("#gdsNum").val();
					  var repCon = $("#repCon").val()
					  
					  var data = {
					    gdsNum : gdsNum,
					    repCon : repCon
					    };
					  
					  $.ajax({
					   url : "/shopping/shop/view/registReply",
					   type : "post",
					   data : data,
					   success : function(){
					    replyList();
					    $("#repCon").val("");
					   }
					  });
					 });
				    
					</script>

											</div>

										</form>
									</section>
								</c:if>

								<section class="replyList">
									<ol>
									</ol>
									<script>
				  	replyList();
				  </script>

									<script>
				  
				  $(document).on("click", ".modify", function(){
					
					  $(".replyModal").fadeIn(200);
					  
					  var repNum = $(this).attr("data-repNum");
					  var repCon = $(this).parent().parent().children(".replyContent").text();
					  
					  $(".modal_repCon").val(repCon);
					  $(".modal_modify_btn").attr("data-repNum", repNum);
					  
					 });
				  
				  	$(document).on("click", ".delete", function(){
				  		
				  		var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
				  		
				  		if(deleteConfirm){
					  
						  var data = {repNum : $(this).attr("data-repNum")};
						   
						  $.ajax({
							  url : "/shopping/shop/view/deleteReply",
							  type : "post",
							  data : data,
							  success : function(result){
							   
							   if(result == 1) {
							    replyList();
							   } else {
							    alert("작성자 본인만 할 수 있습니다.");    
							   }
							  },
								  error : function(){
								   alert("로그인하셔야합니다.")
								  }
							 });
				  		}
					 });
				  </script>
								</section>
							</div>

						</section>
					</div>
				</section>
			</div>
		</div>
	</div>

	<div class="replyModal">

		<div class="modalContent">

			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>

			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancel">취소</button>
			</div>

		</div>

		<div class="modalBackground"></div>

	</div>

	<script>
$(".modal_modify_btn").click(function(){
	 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	 
	 if(modifyConfirm) {
	  var data = {
	     repNum : $(this).attr("data-repNum"),
	     repCon : $(".modal_repCon").val()
	    };  // ReplyVO 형태로 데이터 생성
	  
	  $.ajax({
	   url : "/shopping/shop/view/modifyReply",
	   type : "post",
	   data : data,
	   success : function(result){
	    
	    if(result == 1) {
	     replyList();
	     $(".replyModal").fadeOut(200);
	    } else {
	     alert("작성자 본인만 할 수 있습니다.");       
	    }
	   },
	   error : function(){
	    alert("로그인하셔야합니다.")
	   }
	  });
	 }
	 
	});
$(".modal_cancel").click(function(){
 
	$(".replyModal").fadeOut(200);
});
</script>

</body>


</html>

