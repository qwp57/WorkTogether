<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css"
	integrity="sha384-eoTu3+HydHRBIjnCVwsFyCpUDZHZSFKEJD0mc3ZqSBSb6YhZzRHeiomAUWCstIWo"
	crossorigin="anonymous">

<style>
</style>
</head>
<body>
	<h2>연락처</h2>
	<div class="tel-tab-wrap">
		<div class="search-box">
			<span id="tel-search"> </span> <input type="text"
				id="tel-search-input" class="form-control"
				placeholder="사원명 검색">
		</div>
		<hr>
		<div class="tel-scroll-box">
			<div class="dragbar"></div>
			<div class="tel-name">
				<p class="tel-title">내 프로필</p>
				<div class="tel-my">
					<img alt="image" src="resources/assets/img/avatar/avatar-1.png"
						class="rounded-circle ml-3" width="35px" height="35px"> <span
						class="tel-my-desc ml-3"> <a href="#">사원명</a>
					</span>
				</div>
				<hr>
				<p class="tel-title">전체 연락처</p>
				<div class="tel-all">
				</div>
				<div class="prof-info-dim"></div>
				<div class="prof-info-wrap">
					<div class="prof-bg-img"></div>
					<div class="prof-info">
						<div class="prof-top">
							<p class="prof-name"></p>
							<p class="prof-cname"></p>
						</div>
						<div class="prof-bottom">
							<c:forEach begin="1" end="15">
								<p class="prof-content">
									<img alt="image" src="resources/assets/img/avatar/avatar-1.png"
										class="rounded-circle ml-3" width="35px" height="35px">
									<span class="prof-email ml-3">사원명</span>
									<span class='bi bi-chat fa-lg' style="float:right; margin-right:30px;"></span>

								</p>
								<br>
							</c:forEach>
							<br> <span class="prof-chat-wrap"> </span>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>