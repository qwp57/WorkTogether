<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/sidebar.jsp" />

<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#newPj {
	position:relative;
	width: 180px;
	height: 70px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 700;
	font-size: x-large;
	border-radius: 20px;
	font-family: 'Nanum Gothic', sans-serif;
	top: -30px;
}
.container{
	display: inline-block;
}
</style>
</head>
<body>
	<div class="main-content">
		<div style="height: 50px;"></div>
	<button class="btn btn-primary" id="newPj">+ 새 프로젝트</button>

		<div class="container" style="text-align: center;">
			<section class="section">
				<div class="section-body">
					<div class="row mt-sm-4 body-1">
						
						<div class="col-12 col-md-10 col-lg-12">
							<div class="card h-100">
								<div class="card-body "></div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>