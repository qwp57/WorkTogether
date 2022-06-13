<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.title{
		color: black;
	}
	
	h3, h4, h5, h6{
		color: black;
	}
	
	.col-lg-4{
		height: 1000px;
		border-right: 1px solid lightgray;
		
	}
	
	#deptEdit{
		height: 700px;
		border-bottom: 1px solid lightgray;
	}
	
	.deptName{
		width: 20em;
	}
	
	.deptUpperName{
		width: 20em;
	}

</style>
</head>
<body>
	<div class="main-content">
		<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5">
				<h3>부서 관리</h3>
			</div>
			<hr>
			<div class="row">
				<!-- 부서 리스트 --> 
				<div class="col-lg-4">
					<h4 class="mt-2" id="allDeptCount">전체(6)</h4> <!-- 전체 하위 부서 수 -->
					
					<div class="my-4 mx-4" id="orgList">
						<h5><i class="bi bi-dash" id="minusIcon"></i>워크 투게더</h5>
						<div class="my-4 deptTree">
							<h6 class="dept"><i class="bi bi-dash" id="minusIcon"></i>관리부</h6>
							<div class="mx-4 deptUpper">인사팀</div>
							<div class="mx-4 deptUpper">재무회계팀</div>
						</div>
						<div class="my-4 deptTree">
							<h6 class="dept"><i class="bi bi-dash" id="minusIcon"></i>생산부</h6>
							<div class="mx-4 deptUpper">생산팀</div>
							<div class="mx-4 deptUpper">품질관리팀</div>
						</div>
						<div class="my-4 deptTree">
							<h6 class="dept"><i class="bi bi-dash" id="minusIcon"></i>영업부</h6>
							<div class="mx-4 deptUpper">영업팀</div>
							<div class="mx-4 deptUpper">고객지원팀</div>
						</div>
					</div>
				</div>
				<!-- 부서 추가 -->
				<div class="col-lg-8">
					<div class="row">
						<h4 class="col-lg-9 mt-2 ml-3">부서 편집</h4>					
						<button type="button" class="col-lg-2 btn btn-outline-secondary float-right" id="addBtn">
							<span><i class="bi bi-plus"></i></span>
							<span>부서 추가</span>
						</button> <!-- 추가하기를 누르면 아래 form이 하나 더 생김 -->
					</div>
					<div class="ml-4 mt-5">
						<form>
							<div  id="deptEdit"> 
								<div class="form-check">
									<label class="form-check-label">
									    <input type="checkbox" class="form-check-input" value="">
									    <input type="text" class="deptName" value="관리부">
									    <button type="button" class="btn btn-outline-secondary ml-2" id="addBtn">
											<span><i class="bi bi-plus"></i></span>
											<span>하위부서 추가</span>
										</button> <!-- 버튼을 클릭하면 아래의 deptUpper가 등장한다. -->
									</label>
								</div>
								<div class="form-check my-2 ml-3 deptUpper">
									<label class="form-check-label">
									    <input type="checkbox" class="form-check-input" value="">
									    <input type="text" class="deptUpperName" value="인사팀">
									</label>
								</div>
								<div class="form-check my-2 ml-3 deptUpper">
									<label class="form-check-label">
									    <input type="checkbox" class="form-check-input" value="">
									    <input type="text" class="deptUpperName" value="재무회계팀">
									</label>
								</div>
							</div>
							<div class="row mt-4">
								<div class="col-lg-9"><h6>0개 선택됨</h6></div> <!-- 체크박스 선택한 개수에 따라 나오는  -->						
								<div class="col-lg-3">
									<button type="button" class="btn btn-outline-danger float-right" id="deleteBtn">
										<span><i class="bi bi-trash-fill"></i></span>
										<span>삭제</span>
									</button>
								</div>
							</div>
							<div class="mt-5">
								<button type="submit" class="btn btn-primary form-control" id="saveBtn">저장</button>
							</div>
						</form>
					</div>
				</div>						
			</div>	
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>