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


				<div id="root">
					<header id="header">
						<div id="header_box">
							<%@ include file="/WEB-INF/views/include/header.jsp"%>
						</div>
					</header>
					<section id="container">

						<div id="container_box">
							<section id="content">
								<form role="form" method="post" autocomplete="off">
									<div class="6u 12u$(xsmall)">
										<label for="userId">아이디</label> <input type="email"
											id="userId" name="userId" placeholder="example@email.com"
											required="required" />
									</div>

									<div class="6u 12u$(xsmall)">
										<label for="userPass">패스워드</label> <input type="password"
											id="userPass" name="userPass" required="required" />
									</div>

									<div class="6u 12u$(xsmall)">
										<label for="userName">닉네임</label> <input type="text"
											id="userName" name="userName" placeholder="닉네임을 입력해주세요"
											required="required" />
									</div>

									<div class="6u 12u$(xsmall)">
										<label for="userPhone">연락처</label> <input type="text"
											id="userPhone" name="userPhone" placeholder="연락처를 입력해주세요"
											required="required" />
									</div>
									<div class="6u$ 12u$(medium)">
												<ul class="actions">
													<li><button type="submit" id="signup_btn"
															name="signup_btn" class="special">회원가입</button></li>
													
												</ul>
											</div>
									
								</form>
							</section>
						</div>
						</section>
				</div>

			</div>


		</div>
		
		
		
		
		</div>
</body>
</html>