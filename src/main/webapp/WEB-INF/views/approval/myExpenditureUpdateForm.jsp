<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2, h3, h4, h5, h6{
		color: black;
	}
	
	.bi-clipboard2-check-fill{
		font-size: 25px;
		margin-right: 10px;
	}
	
	#expenditure{
		background-color: white;
		margin-top: 30px;
		border: 3px solid lightgray;
		padding: 20px;
	}
	
	#approvalLine1{
		width: 17%;		
	}
	
	#approvalLine2{
		width: 17%;		
	}
	
	#exContent{
		resize: none;
		height: 300px;
	}
	
	#fileUpload{
		border: 2px dotted black;
		height: 120px;
	}
	
	#lineList, #refList{
		background-color: lightgray;
		padding: 3px;
	}
	
	#addList{
		background-color: lightgray;
		height: 75%;
		padding: 3px;
	}
	
	#addExBtn{
		width: 100px;
		margin-left: 20px;
	}
	
	#delExBtn{
		width: 100px;
		margin-left: 15px;
	}
</style>
</head>
<body>
	<div class="main-content">
	<div style="height: 50px"></div>
		<div class="container">
			<div class="title mt-5 row">
				<span><i class="bi bi-clipboard2-check-fill"></i></span>
				<span><h3>지출 결의서</h3></span> 
			</div>
			<section class="section-body">
				<form id="expenditureForm"  method="post" action="/updateMyExpenditure.do" enctype="multipart/form-data">
					<div id="expenditure">
						<input type="hidden" name="approvalNo" value="${ app.approvalNo }"/>
						<div><h2 class="text-center pt-3">지출 결의서</h2></div>							
						<br><br><br>
						<table class="table table-bordered float-right" id="approvalLine2">
							<tr>
								<th colspan="2" style="height:20px;" class="text-center" >최종 결재자</th>
							</tr>
							<tr>								
								<th rowspan="2" style="width:10px">결재선</th>
								<td style="height:20px" id="job2">${ appL.finalApproverJob }</td>
							</tr>
							<tr>
								<td id="name2">${ appL.finalApproverName }</td>	
								<td class="d-none"><input type="hidden" name="finalApp" value="${ appL.finalApproverNo }"></td>							
							</tr>							
							<tr>
								<td colspan="2"><button type="button" class="btn btn-primary float-right mr-3" data-toggle="modal" data-target="#approvalLineModal2" id="lineBtn2">결재선 선택</button></td>
							</tr>

						</table>
						<table class="table table-bordered float-right" id="approvalLine1">
							<tr>
								<th colspan="2" style="height:20px;" class="text-center" >최초 결재자</th>
							</tr>
							<tr>
								<th rowspan="2" style="width:10%">결재선</th>
								<td style="height:20px" id="job1">${ appL.firstApproverJob }</td>
							</tr>
							<tr>
								<td id="name1">${ appL.firstApproverName }</td>
								<td class="d-none"><input type="hidden" name="firstApproverNo" value="${ appL.firstApproverNo }"></td>								
							</tr>
							<tr>
								<td colspan="2"><button type="button" class="btn btn-primary float-right mr-3" data-toggle="modal" data-target="#approvalLineModal1" >결재선 선택</button></td>
							</tr>
						</table>
						<table class="table table-bordered mt-3">							
							<tr>
								<th style="width: 15%">기안부서</th>
								<td id="deptName">${ app.deptName }</td>
								<th style="width: 15%">기안일</th>
								<td id="createDate">${ app.createDate }</td>
								<th style="width: 15%">문서번호</th>
								<td>${ app.approvalNo }</td>
							</tr>
							<tr>
								<th>기안자</th>
								<td id="writer">${ app.name }</td>
								<th>보존년한</th>
								<td>
									<div class="input-group mt-3 mb-3">
					    				<div class="input-group-prepend">
					    					<select class="form-control rounded-1" id="retentionPeriod" name="retentionPeriod">
												<option ${(app.retentionPeriod == "5") ? "selected" : "" } value="5">5년</option>
												<option ${(app.retentionPeriod == "10") ? "selected" : "" } value="10">10년</option>	
												<option ${(app.retentionPeriod == "15") ? "selected" : "" } value="15">15년</option>										
											</select>
					    				</div>
					    			</div>
			    				</td>
								<th>긴급여부</th>
								<td>
									<div class="form-check mt-3 mb-3">
										<label class="form-check-label">
											  <input type="checkbox" class="form-check-input" id="emergency" name="emergency" value="${ app.emergency }">긴급
										</label>
					    			</div>
								</td>									
							</tr>						
							<tr>
								<th>제목</th>
								<td colspan="5">
									<input type="text" class="form-control" id="title" name="title" value="${ app.title }">
								</td>
							</tr>							
						</table>	
						<table class="table table-bordered mt-3">
							<tr>
								<th style="width: 15%">구분</th>
								<td>
									<div class="form-check-inline">
										<label class="form-check-label">
											<input type="radio" class="form-check-input" name="exDivision" value="개인" checked>개인
										</label>
										<label class="form-check-label ml-3">
											<input type="radio" class="form-check-input" name="exDivision" value="법인">법인
										</label>
									</div>
								</td>
							</tr>
							<tr>
								<th>회계 기준월</th>
								<td>
									<input type="date" class="form-control" name="accountingMonth" id="accountingMonth" tabindex="8" value="${ appEx.accountingMonth }">	   
								</td>
							</tr>
							<tr>
								<th>지출자</th>
								<td><input type="text" class="form-control" name="spender" value="${ appEx.spender }"></td>
							</tr>
							<tr>
								<th>계좌 정보</th>
								<td>																										
									<input type="text" class="form-control rounded-1" id="indAccount" name="account" placeholder="은행 명, 계좌번호를 같이 작성하세요" value="${ appEx.account }"/>																			
									<div class="input-group">
					    				<div class="input-group-prepend" id="corAccount" style="display:none">
					    					<select class="form-control rounded-1" name="account">
												<option ${(appEx.account == "우리은행 1111-222-123456") ? "selected" : "" } value="우리은행 1111-222-123456">우리은행  1111-222-123456</option>
												<option ${(appEx.account == "신한은행 123-6666-7777-78") ? "selected" : "" } value="신한은행 123-6666-7777-78">신한은행 123-6666-7777-78</option>	
												<option ${(appEx.account == "하나은행 9876-99876-454") ? "selected" : "" } value="하나은행 9876-99876-454">하나은행 9876-99876-454</option>		
												<option ${(appEx.account == "국민은행 454-6666-777") ? "selected" : "" } value="국민은행 454-6666-777">국민은행 454-6666-777</option>		
												<option ${(appEx.account == "카카오뱅크 3333-76-9876934") ? "selected" : "" } value="카카오뱅크 3333-76-9876934">카카오뱅크 3333-76-9876934</option>									
											</select>
					    				</div>
				    				</div>			    				
								</td>
							</tr>
							<tr>
								<th>지출 사유</th>
								<td><textarea class="form-control" id="exContent" name="exContent">${ appEx.exContent }</textarea></td>
							</tr>
						</table>	
						
						<div class="row">
							<h6 class="col-lg-9">지출 내역</h6>
							<input type="button" class="form-control col-lg-1" value="내역 추가" id="addExBtn"/>
							<input type="button" class="form-control col-lg-1" value="내역 삭제" id="delExBtn"/>
						</div>
						<table class="table table-bordered mt-3 text-center" id="exTable">
							<thead>
								<tr>
									<th style="width:20%">지출 일자</th>
									<th style="width:20%">분류</th>
									<th style="width:20%">금액</th>
									<th style="width:20%">사용 내역</th>
									<th style="width:20%">비고</th>
								</tr>
							</thead>
							<tbody id="exTableTbody">
								<!-- 
								<tr>
									<td>
										<input type="date" class="form-control" name="exDateList" tabindex="8"/>	 
									</td>
									<td>
										<div class="input-group">
						    				<div class="input-group-prepend">
						    					<select class="form-control rounded-1" id="exClassification" name="exClassificationList">
													<option value="물품 구입비">물품 구입비</option>
													<option value="잡비">잡비</option>	
													<option value="회식비">회식비</option>		
													<option value="식비">식비</option>		
													<option value="교통비">교통비</option>	
													<option value="기타">기타</option>									
												</select>
						    				</div>
					    				</div>
									</td>
									<td><input type="text" class="form-control" name="amountList" required/></td>
									<td><input type="text" class="form-control" name="exHistoryList" required/></td>
									<td><input type="text" class="form-control" name="noteList"/></td>
								</tr>
								 -->
							</tbody>
						</table>
						<div>
							<div class="mt-5" style="font-size:15px"><strong>첨부파일</strong></div>
							<div id="fileUpload" class="mt-2 pt-5">
								<span id="file_text" class="ml-2">클릭하여 파일을 추가하세요.</span>
								<span id="file_name" class="ml-2"></span>
							</div>
							<div id="fileArea">
								<input type="file" class="" id="reUpfile" name="reUpfile" style="display:none"/>								
							</div>
							<c:if test="${ !empty app.orginal_name }">
								<input type="hidden" name="change_name" value="${ app.change_name }">
								<input type="hidden" name="orginal_name" value="${ app.orginal_name }">
								<input type="hidden" name="fileNo" value="${ app.fileNo }">
							</c:if>
						</div>											
					</div>													
					<div class="float-right mt-3">
						<button type="submit" class="btn btn-primary" onclick="">수정하기</button>
						<button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">취소하기</button>
					</div>				
				</form>
			</section>
		</div>
	</div>
	
	<!-- 결재선 선택 모달창 -->
	<div class="modal" id="approvalLineModal1" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">
	   				<h4 class="modal-title text-left" style="color:black">결재선 설정</h4>    
	   				<input type="image" class="text-right" data-dismiss="modal" src="resources/assets/img/close.png/" style="width:20px"> 				   				
				</div>
				
				<!-- modal body -->
				<form>
				<div class="modal-body">					
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<button class="btn btn-secondary" type="button">
									<i class="bi bi-search"></i>
								</button>
								<input type="text" class="form-control" placeholder="사원 이름, 부서 검색">
							</div>
						</div>
						
						<div class="row">
							<div class="ml-3">
								<div id="lineList1">
									<div class="orgListAll mt-3">																				
										<span><h5 style="color:rgb(111, 118, 237)">워크 투게더</h5></span>
									</div>
									
									<div id="allWT" class="collapse show">
										<div class="my-4 ml-4">
											<c:forEach items="${ deptList }" var="dl">					
												<div class="my-3 ">
													<c:if test="${ dl.deptLevel == 1 }">
														<h6 id="deptName"><i class="bi bi-dash" id="minusIcon1"></i>${ dl.deptName }</h6>
													</c:if>
													<c:if test="${ dl.deptLevel == 2 }">																														
														<a href="#deptEmp1${dl.deptCode}" data-toggle="collapse" class="ml-3" id="dept_collapse1">
															${ dl.deptName }
														</a>														
													</c:if>
													<c:forEach items="${ empList }" var="el">
														<c:if test="${ dl.deptCode == el.dept_code }">
															<div id="deptEmp1${dl.deptCode}" class="mx-5 my-2 deptUpper collapse">
																<input type="radio" class="form-check-input" name="empNo1" id="empNo1" value="${ el.emp_no }"><label for="empNo1">${ el.name }</label>
																<span>${el.job_name}</span>														
															</div>
														</c:if>
													</c:forEach>
												</div>
											</c:forEach>
										</div>
									</div>
								</div> 							
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary float-right" id="saveBtn1">등록</button>
					</div>
				</form>			
			</div>
		</div>	
	</div>
	
	<!-- 최종 결재선 선택 모달창 -->
	<div class="modal" id="approvalLineModal2" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">
	   				<h4 class="modal-title text-left" style="color:black">결재선 설정</h4>    
	   				<input type="image" class="text-right" data-dismiss="modal" src="resources/assets/img/close.png/" style="width:20px"> 				   				
				</div>
				
				<!-- modal body -->
				<form>
				<div class="modal-body">					
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<button class="btn btn-secondary" type="button">
								<i class="bi bi-search"></i>
							</button>
							<input type="text" class="form-control" placeholder="사원 이름, 부서 검색">
						</div>
					</div>
						
					<div class="row">
						<div class="ml-3">
							<div id="lineList2">
								<div class="orgListAll mt-3">																				
									<span><h5 style="color:rgb(111, 118, 237)">워크 투게더</h5></span>
								</div>
								
								<div id="allWT2" class="collapse show">
									<div class="my-4 ml-4">
										<c:forEach items="${ deptList }" var="dl">					
											<div class="my-3 ">
												<c:if test="${ dl.deptLevel == 1 }">
													<h6 id="deptName2"><i class="bi bi-dash" id="minusIcon2"></i>${ dl.deptName }</h6>
												</c:if>
												<c:if test="${ dl.deptLevel == 2 }">																														
													<a href="#deptEmp2${dl.deptCode}" data-toggle="collapse" class="ml-3" id="dept_collapse2">
														${ dl.deptName }
													</a>														
												</c:if>
												<c:forEach items="${ empList }" var="el">
														<c:if test="${ dl.deptCode == el.dept_code }">
															<div id="deptEmp2${dl.deptCode}" class="mx-5 my-2 deptUpper collapse">
																<input type="radio" class="form-check-input" name="empNo2" id="empNo2" value="${ el.emp_no }"><label for="empNo2">${ el.name }</label>
																<span>${el.job_name}</span>														
															</div>
														</c:if>
													</c:forEach>
											</div>
										</c:forEach>
									</div>
								</div>
							</div> 							
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary float-right" id="saveBtn2">등록</button>
				</div>
				</form>			
			</div>
		</div>	
	</div>
	
	<script>
		$(function(){
			//긴급 여부
	        if("${ app.emergency }" == 'Y') {
	        	$("input:checkbox[id='emergency']").prop("checked", true);
	        }
	        
	     	//emergency
	    	$('input:checkbox[id="emergency"]').on('change', function(){
              if($('input:checkbox[id="emergency"]').prop('checked')){
                 $(this).val('Y');
              }else {
                 $(this).val('N');
              }

          	});
	        
	        //파일이 있는 경우 없는 경우
	        if("${ app.orginal_name }" != null){
	        	$("#file_name").text("${app.orginal_name}");
				$("#file_text").attr('class', 'd-none');
	        }
	        
	     	//새로운 파일
	        $("#fileUpload").click(function(){
	        	$("#reUpfile").click();
	        });	
	        
	     	 //파일 업로드
			$("#reUpfile").on('change', function(){
				var fileName = $("#reUpfile").val(); //파일 이름 가지고 온다.
				console.log(fileName);
				$("#file_name").text(fileName);
				$("#file_text").attr('class', 'd-none');
			})
			
			//결재선 등록 버튼 누르면 결재자 칸에 값이 들어간다.
			$("#saveBtn1").click(function(){
				var empNo1 = $("input[name='empNo1']:checked").val(); //value에 담겨있는 사번
				var empName1 = $("input[name='empNo1']:checked").next().text(); //label에 있는 이름
				var jobName1 = $("input[name='empNo1']:checked").next().next().text(); //직급
							
				console.log("empNo1 : " + empNo1);
				console.log("empName1 : " + empName1);
				console.log("jobName1 : " + jobName1);			
				
				$("#job1").text(jobName1);
				$('#name1').text(empName1);
				$("input[name='firstApproverNo']").attr('value', empNo1);
				
				alert("등록이 완료 되었습니다.");
				$("#approvalLineModal1").modal("hide");
			});
			
			$("#saveBtn2").click(function(){
				var empNo2 = $("input[name='empNo2']:checked").val(); //value에 담겨있는 사번
				var empName2 = $("input[name='empNo2']:checked").next().text(); //label에 있는 이름
				var jobName2 = $("input[name='empNo2']:checked").next().next().text(); //직급
				//최초 결재자로 선택된 사람이 또 최종 결재자로 들어가면 안되기 때문에 if문으로 걸러준다.
				var empNo1 = $("input[name='firstApproverNo']").val(); //이미 선택된 사원의 사번을 가지고 온다.
							
				console.log("empNo2 : " + empNo2);
				console.log("empName2 : " + empName2);
				console.log("jobName2 : " + jobName2);			
				
				if(empNo1 == empNo2){ //최종 결재자와 최초 결재자 사번을 비교한다.
					alert("이미 선택된 결재자 입니다.");
				}else if(empNo1 == 0){ //최초 결재자를 선택하지 않고 최종 결재자를 선택할 경우
					alert("최초 결재자를 먼저 선택해주세요.");
				}else {
					$("#job2").text(jobName2);
					$('#name2').text(empName2);
					$("input[name='finalApp']").attr('value', empNo2);

					alert("등록이 완료 되었습니다.");
					$("#approvalLineModal2").modal("hide");
				}
			}); 
			
			//구분
			if("${ appEx.exDivision }" == '개인'){
				$("input:radio[name='exDivision']:radio[value='개인']").prop('checked', true);
				$("#corAccount").attr("style", "display:none");
				$("#corAccount").attr("disabled", "true"); 
				$("#indAccount").removeAttr("style", "display:none");
				$("#indAccount").removeAttr("disabled", "true");
			}else {
				$("input:radio[name='exDivision']:radio[value='법인']").prop('checked', true);
				$("#indAccount").attr("style", "display:none");
				$("#indAccount").attr("disabled", "true");
				$("#corAccount").removeAttr("style", "display:none");
				$("#corAccount").removeAttr("disabled", "ture"); 
			}
			
			$("input[name='exDivision']").click(function(){
				var accountInfo = $("input[name='exDivision']:checked").val();
				console.log(accountInfo);
				console.log(accountInfo === '법인');
				if(accountInfo === '법인'){
					$("#indAccount").attr("style", "display:none");
					$("#indAccount").attr("disabled", "true"); //데이터가 전송되지 않도록 한다.
					$("#corAccount").removeAttr("style", "display:none");
					$("#corAccount").removeAttr("disabled", "true"); 
				}else {
					$("#corAccount").attr("style", "display:none");
					$("#corAccount").attr("disabled", "true");
					$("#indAccount").removeAttr("style", "display:none");
					$("#indAccount").removeAttr("disabled", "true");
				}
			});
			
			//지출내역 추가
			$("#addExBtn").click(function(){
				var insertTr = "";
				
				insertTr += "<tr>";
				insertTr += "<td><input type='date' class='form-control' name='exDateList' tabindex='8'></td>";
				insertTr += "<td><div class='input-group'><div class='input-group-prepend'><select class='form-control rounded-1' id='exClassification' name='exClassificationList'>";
				insertTr += "<option value='물품 구입비'>물품 구입비</option><option value='잡비'>잡비</option><option value='회식비'>회식비</option><option value='식비'>식비</option>";
				insertTr += "<option value='교통비'>교통비</option><option value='기타'>기타</option></select></div></div></td>";
				insertTr += "<td><input type='text' class='form-control' name='amountList'></td>";
				insertTr += "<td><input type='text' class='form-control' name='exHistoryList'></td>";
				insertTr += "<td><input type='text' class='form-control' name='noteList'></td>"
				insertTr += "</tr>";
				
				$("#exTableTbody").append(insertTr);
			});
			
			//지출 내역 삭제
			$("#delExBtn").click(function(){				
				var tableData = document.getElementById("exTable");
				
				if(tableData.rows.length < 3){ //추가된 행이 없음 -> 맨 아래의 합계 삭제 불가
					return;
				}else {
					tableData.deleteRow(tableData.rows.length-1); //맨 아래 행은 합계, 맨 아래에서 두번째 행 삭제
				}
			});
	    });	
		
		$(function(){
			var exDateArray = "${appEx.exDate}".split(",");
			var exClassificationArray = "${appEx.exClassification}".split(",");
			var amountArray = "${appEx.amount}".split(",");
			var exHistoryArray = "${appEx.exHistory}".split(",");
			var noteArray = "${appEx.note}".split(",");
			
			console.log(exDateArray);
			console.log(exClassificationArray);
			console.log(amountArray);
			console.log(exHistoryArray);
			console.log(noteArray);
			
			//배열 선언
			var exArray = new Array();
			for(let i = 0; i < exDateArray.length; i++){
				exArray.push({exDate: exDateArray[i], exClassification: exClassificationArray[i], amount: amountArray[i], exHistory: exHistoryArray[i], note: noteArray[i]});
			}
			console.log(exArray);
			
			//table 변수 선언
			var tableTr =""
			
			for(key in exArray){	
				tableTr += '<tr>';
				tableTr += '<td><input type="date" class="form-control" name="exDateList" tabindex="8" value=' + exArray[key].exDate + '></td>';
				tableTr += '<td><div class="input-group"><div class="input-group-prepend"><select class="form-control rounded-1" id="exClassification" name="exClassificationList">';
				tableTr += '<option ${(' + exArray[key].exClassification + ' == "물품구입비") ? "selected" : "" } value="물품 구입비">물품 구입비</option>';
				tableTr += '<option ${(' + exArray[key].exClassification + ' == "잡비") ? "selected" : "" } value="잡비">잡비</option>';
				tableTr += '<option ${(' + exArray[key].exClassification + ' == "회식비") ? "selected" : "" } value="회식비">회식비</option>';	
				tableTr += '<option ${(' + exArray[key].exClassification + ' == "식비") ? "selected" : "" } value="식비">식비</option>';
				tableTr += '<option ${(' + exArray[key].exClassification + ' == "교통비") ? "selected" : "" } value="교통비">교통비</option>';
				tableTr += '<option ${(' + exArray[key].exClassification + ' == "기타") ? "selected" : "" } value="기타">기타</option>';
				tableTr += '</select></div></div></td>';
				tableTr += '<td><input type="text" class="form-control" name="amountList" value=' + exArray[key].amount + '></td>';
				tableTr += '<td><input type="text" class="form-control" name="exHistoryList" value=' + exArray[key].exHistory + '></td>';
				tableTr += '<td><input type="text" class="form-control" name="noteList" value=' + exArray[key].note + '></td>';
				tableTr += '</tr>';
			}
			
			$("#exTableTbody").append(tableTr);
		});

	</script>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>