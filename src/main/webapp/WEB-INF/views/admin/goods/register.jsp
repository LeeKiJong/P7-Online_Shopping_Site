<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>(Admin)LKJ Online Shopping Mall</title>
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
		<aside>
			<%@ include file = "/WEB-INF/views/admin/include/aside.jsp" %>
		</aside>
		<div id = "container_box">
			<h2>상품 등록</h2>>
			
			<form role = "form" method = "post" autocomplete = "off">
				<label>1차 분류</label>
				<select class = "category1">
					<option value = "">전체</option>
				</select>
				<label>2차 분류</label>
				<select class = "category2">
					<option value = "">전체</option>
				</select>
			</form>
		</div>
	</section>
	<footer id = "footer">
		<div id = "footeer-box">
			<%@ include file = "/WEB-INF/views/admin/include/footer.jsp" %>
		</div>
	</footer>
	
</div>
<script>
	// 컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	 
	 if(jsonData[i].level == "1") {
	  cate1Obj = new Object();  //초기화
	  cate1Obj.cateCode = jsonData[i].cateCode;
	  cate1Obj.cateName = jsonData[i].cateName;
	  cate1Arr.push(cate1Obj);
	 }
	}
	
	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")
	
	for(var i = 0; i < cate1Arr.length; i++) {
	 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
	      + cate1Arr[i].cateName + "</option>"); 
	}
	$(document).on("change", "select.category1", function(){

	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.cateCode = jsonData[i].cateCode;
	   cate2Obj.cateName = jsonData[i].cateName;
	   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.category2");

	 /*
	 for(var i = 0; i < cate2Arr.length; i++) {
	   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	        + cate2Arr[i].cateName + "</option>");
	 }
	 기존 데이터에 추가하는 코드 */
	 
	 cate2Select.children().remove();

	 $("option:selected", this).each(function(){
	  
	  var selectVal = $(this).val();  
	  cate2Select.append("<option value=''>전체</option>");
	  
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].cateCodeRef) {
	    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	         + cate2Arr[i].cateName + "</option>");
	   }
	  }
	  
	 });
	 
	});
	
</script>

</body>
</html>

