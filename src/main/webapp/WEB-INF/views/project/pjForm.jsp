<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- 프로젝트 초대 모달창 -->
	<div class="modal fade" id="makePj" style="z-index: 15000;"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content row">
				<!-- modal header : 제목 -->
				<div class="modal-header">
					<span><h3 class="modal-title text-left">프로젝트 생성</h3></span> <span><input
						type="image" data-dismiss="modal"
						src="resources/assets/img/close.png/" style="width: 20px;"></span>
				</div>
				<!-- modal body : 내용 -->
				<form class="form" id="">
					<div class="modal-body">
						<div class="col-lg-12 text-center mt-5">
							<hr>
						</div>
						<div class="col-lg-12 text-center mt-5">
							<div class="form-group mr-5 ml-5">
								<input type="text" class="form-control" placeholder="제목을 입력하세요.">
							</div>
							<div class="form-group mr-5 ml-5">
								<input type="text" class="form-control" style="height: 150px;"
									placeholder="프로젝트에 관한 설명 입력 (옵션)">
							</div>
						</div>
						<div class="col-lg-12 text-left mr-5 ml-5 mt-5">
							<h5>게시글 권한 설정</h5>
							<br> <a>작성 권한</a>

							<div class="dropdown d-inline"
								style="margin-left: 150px; width: 300px;">
								<button class="btn btn-dark dropdown-toggle" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">모두</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">모두</a> <a
										class="dropdown-item" href="#">프로젝트 관리자</a>
								</div>
							</div>
						</div>
						<div class="col-lg-12 text-left mr-5 ml-5 mt-5">
							<h5>댓글 권한 설정</h5>
							<br> <a>작성 권한</a>

							<div class="dropdown d-inline"
								style="margin-left: 150px; width: 300px;">
								<button class="btn btn-dark dropdown-toggle" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">모두</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">모두</a> <a
										class="dropdown-item" href="#">프로젝트 관리자</a>
								</div>
							</div>
						</div>
						<div class="col-lg-12 text-left mr-5 ml-5 mt-5">
							<h5>파일 권한 설정</h5>
							<br> <a>조회/다운로드 권한</a>

							<div class="dropdown d-inline"
								style="margin-left: 150px; width: 300px;">
								<button class="btn btn-dark dropdown-toggle" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">모두</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">모두</a> <a
										class="dropdown-item" href="#">프로젝트 관리자</a>
								</div>
							</div>
						
						</div>
							<div class="col-lg-12 text-left mr-5 ml-5 mt-5">
							<h5>프로젝트 설정 설정</h5>
							<div class="col-lg-5 text-left">
							 <a href="#" class="btn btn-outline-warning mr-5">프로젝트 보관</a>
		                       <a href="#" class="btn btn-outline-danger">프로젝트 삭제</a>
							 
							</div> 
							
						</div>
							<hr>
					</div>
					<div class="modal-footer">
						<div class="col-lg-12 text-center">
							<button type="submit" class="btn btn-primary btn-lg mb-3">생성</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>