<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-content">
	<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5 row">
				<span><i class="bi bi-clipboard2-check-fill"></i></span>
				<span><h3>문서 제목</h3></span> 
			</div>	
			<section class="section-body">
					<div id="letterOfApproval">
						<div><h2 class="text-center pt-3">품의서</h2></div>							
						<button type="button" class="btn btn-primary float-right mr-3" data-toggle="modal" data-target="#approvalLineModal">결재선 선택</button> <br><br><br>
						<table class="table table-bordered float-right" id="approvalLine1">
							<tr>
								<th rowspan="2" style="width:10px">결재선</th>
								<td style="height:15px">대표이사</td>
							</tr>
							<tr>
								<td>김대표</td>								
							</tr>
						</table>
						<table class="table table-bordered float-right" id="approvalLine2">
							<tr>
								<th rowspan="2" style="width:10%">결재선</th>
								<td style="height:15px">대표이사</td>
							</tr>
							<tr>
								<td>김대표</td>								
							</tr>
						</table>
						<table class="table table-bordered mt-3">							
							<tr>
								<th style="width: 15%">기안부서</th>
								<td name="appDept">인사팀</td>
								<th style="width: 15%">기안일</th>
								<td name="appCreateDate">2022-06-13</td>
								<th style="width: 15%">문서번호</th>
								<td></td>
							</tr>
							<tr>
								<th>기안자</th>
								<td name="appEmployee">홍사원</td>
								<th>보존년한</th>
								<td>
									<div class="input-group mt-3 mb-3">
					    				<div class="input-group-prepend">
					    					<select class="form-control rounded-1" id="retentionPeriod" name="retentionPeriod">
												<option ${(param.retentionPeriod == "") ? "selected" : "" } value="">5년</option>
												<option ${(param.retentionPeriod == "") ? "selected" : "" } value="">10년</option>	
												<option ${(param.retentionPeriod == "") ? "selected" : "" } value="">15년</option>										
											</select>
					    				</div>
					    			</div>
			    				</td>
								<th>긴급여부</th>
								<td>
									<div class="form-check mt-3 mb-3">
										<label class="form-check-label">
											 <input type="checkbox" class="form-check-input" value="">긴급
										</label>
					    			</div>
								</td>									
							</tr>
							<tr>
								<th>수신참조</th>
								<td colspan="5" name="referee">김대리</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="5">
									<input type="text" class="form-control" id="appTitle" name="appTitle">
								</td>
							</tr>							
						</table>		
										
						<div class="" id="summernote" name="loaContent"></div>	
						
						<div class="" >
							<div class="mt-5" style="font-size:15px"><strong>첨부파일</strong></div>
							<div id="fileUpload" class="text-center mt-2 pt-5">클릭하여 파일을 추가하세요.</div>
							<div id="fileArea">
								<input type="file" class="" id="upfile" name="upfile" style="display:none"/>									
							</div>
						</div>									
					</div>
					<div class="float-right mt-3">						
						<button type="button" class="btn btn-primary" onclick="location.href='approvalMain.do'">목록</button>
					</div>	
			</section>
		</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>