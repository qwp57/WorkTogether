<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>부서 관리</title>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<head>
<meta charset="UTF-8">
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
		height: 800px;
		border-bottom: 1px solid lightgray;
	}
	
	.deptName{
		width: 20em;
	}
	
	.deptUpperName{
		width: 20em;
	}
	
	.deptAddName{
		width: 400px;
	}

	#addBtn{
		width: 130px;
	}
	
	label{
		width:60%%;
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
					<h4 class="mt-2" id="allDeptCount">전체(${deptCount})</h4> <!-- 전체 하위 부서 수 -->					
					<div class="my-3 mx-4" id="orgList">
					<h5><i class="bi bi-dash" id="minusIcon"></i>워크 투게더</h5>
						<c:forEach items="${ upperList }" var="ul">					
							<div class="my-3 deptTree">
								<c:if test="${ ul.deptLevel == 1 }">
									<h6 class="dept"><i class="bi bi-dash" id="minusIcon"></i>${ ul.deptName }</h6>
								</c:if>
								<c:if test="${ ul.deptLevel == 2 }">																		
									<div class="mx-4 deptUpper">${ ul.deptName }</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
				
				<!-- 부서 추가 -->
				<div class="col-lg-8">
					<div class="row">
						<h4 class="col-lg-9 mt-2 ml-3">부서 편집</h4>					
						<button type="button" class="col-lg-2 btn btn-outline-secondary float-right" id="addModalBtn" data-toggle="modal" data-target="#deptAddModal">
							<span><i class="bi bi-plus"></i></span>
							<span>부서 추가</span>
						</button> <!-- 추가하기를 누르면 아래 form이 하나 더 생김 -->
					</div>
					<div class="ml-4">
						<form>						
							<div id="deptEdit"> 	
								<c:forEach items="${ upperList }" var="ul">																
									<div class="form-check" style="margin-bottom: -20px; margin-top: 10px;">
										<label class="form-check-label">
											<c:if test="${ ul.deptLevel == 1 }">																	
										 	    <input type="checkbox" class="form-check-input" value="${ ul.deptCode }" name="deptCheck"> <!-- id를 deptCode로 주고, onclick 함수에 deptCode를 함께 넘긴다. -->			 							   
										    	<input type="text" class="deptName" name="deptName" value="${ ul.deptName }"> <!-- 체크된 박스의 형제 라인 input 찾아서 배열에 넣기 -->
										    	<input class="d-none" value="${ ul.deptCode }" name="deptCode"/>
											</c:if>										
										</label>
									</div>									
									<div class="form-check  ml-3 deptUpper">
										<label class="form-check-label"  style="margin-bottom: 5px">
											<c:if test="${ ul.deptLevel == 2 }">
										    	<input type="checkbox" class="form-check-input" value="${ ul.deptCode }" name="deptCheck">										    	
										  	  	<input type="text" class="deptUpperName" name="deptName" value="${ ul.deptName }"/>
										  	  	<input class="d-none" value="${ ul.deptCode }" name="subDeptCode"/>
										    </c:if>
										</label>
									</div>	
								</c:forEach>								
							</div>
							
							<div class="row mt-4">
								<div class="col-lg-9"><h6 id="deptCheckCount">0개 선택</h6></div> <!-- 체크박스 선택한 개수에 따라 나오는  -->						
								<div class="col-lg-3">
									<button type="button" class="btn btn-outline-danger float-right" id="deleteBtn" onclick="del_checked()">
										<span><i class="bi bi-trash-fill"></i></span>
										<span>삭제</span>
									</button>
								</div>
							</div>							 
							<div class="mt-5">
								<button type="submit" class="btn btn-primary form-control" id="saveBtn" onclick="update_checked()">저장</button>
							</div>							
						</form>
					</div>
				</div>						
			</div>	
		</div>
	</div>
	
	<!-- 부서 추가 모달창 -->
	<div class="modal" id="deptAddModal" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<span><h4 class="modal-title text-left" style="color:black">부서 추가</h4></span>
      				<span><input type="image" data-dismiss="modal" src="resources/assets/img/close.png/" style="width:20px"></span>    				
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label class=" mr-4"><strong>상위 부서</strong></label>						
							<select class="form-control" id="upperDeptName">
								<option value="1">없음</option> 
							    <c:forEach items="${ upperList }" var="ul">	
							 	   <c:if test="${ ul.deptLevel == 1 }">
							 	  	 <option value="${ ul.deptCode }">${ ul.deptName }</option>
							 	   </c:if>
							    </c:forEach>
							</select>														 						
						</div>
						<div class="form-group">
							<label class=" mr-4"><strong>부서명</strong></label>						
							<input type="text" class="form-control" name="addDeptName" id="addDeptName">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary float-right" id="addBtn">등록</button>
				</div>
			</div>
		</div> 	
	</div>
	
	<script>
		
		$(function(){
			$("input:checkbox[name=deptCheck]").on("change",function(){
				//체크박스 선택 개수
				var deptCheckedCount = $("input:checkbox[name=deptCheck]:checked").length;
				$("#deptCheckCount").text(deptCheckedCount+"개 선택");
			})

			//부서 추가
			$("#addBtn").click(function(){
				if($("#addDeptName").val().trim().length != 0){
					$.ajax({
						type: "post",
						url: "addDeptList.do",
						data: { upperDeptName: $('#upperDeptName option:selected').val(),
								addDeptName: $('input[name=addDeptName]').val()
						},
						success: function(status){
							if(status > 0){
								alert("부서 추가 완료");
								window.location.reload();
							}else {
								alert("부서 추가 실패");
							}
						},
						error: function(){
							console.log("통신 실패");
						}
					});
				}else {
					alert("추가할 부서 명을 작성해주세요.")
				}
			});
		});	
		
		//체크 박스 선택 후 삭제 버튼 클릭 시 이벤트
		function del_checked(){
			var checkBoxArr = new Array(); //배열 선언
			$("input:checkbox[name=deptCheck]:checked").each(function(){ //반복문을 돌려서 체크 된 것을 뽑음
				checkBoxArr.push($(this).val()); //체크 된 것을 뽑아서 배열에 push한다. -> push : 배열의 마지막에 새로운 요소를 추가한 후, 변경된 배열의 길이를 반환		 
				console.log(checkBoxArr);
			});		
			
			if(checkBoxArr == 0){ //checkBoxArr 길이가 0이라면 -> 선택하지 않은 것
				alert("삭제할 부서를 선택하세요.");
			}else {
				$.ajax({
					type: "post",
					url: "deleteDeptList.do",
					data: {
						checkBoxArr: checkBoxArr
					},
					success: function(status){
						if(status > 0){
							alert("부서 삭제 완료");	
							window.location.reload();
						}else {
							alert("부서 삭제 실패");
						}
					},
					error: function(){
						console.log("통신 실패");
					}
				});
			}
		}
		
		
		//체크 박스 선택 후 저장 버튼 클릭 시 이벤트
		function update_checked(){
			var checkBoxArr2 = new Array(); //배열		
			var updateList = new Array();
			
			$("input:checkbox[name='deptCheck']:checked").each(function(){ //반복문을 돌려서 체크 된 것을 뽑음
				checkBoxArr2.push($(this).val()); //체크 된 것을 뽑아서 배열에 push한다. -> push : 배열의 마지막에 새로운 요소를 추가한 후, 변경된 배열의 길이를 반환		 
				console.log(checkBoxArr2);
			});
			
			$("input:checkbox[name='deptCheck']:checked").each(function(){
				updateList.push($(this).next().val());
				console.log(updateList);
			});
		
			
			if(checkBoxArr2 == 0){
				alert("수정할 부서를 선택하세요.");
			}else if(checkBoxArr2.length != updateList.length){
				alert("체크 박스와 수정할 부서가 일치해야 합니다.");
			}else {
				$.ajax({
					type: "post",
					url: "updateDept.do",
					data: {
						checkBoxArr: checkBoxArr2,
						updateList: updateList
					},
					success: function(status){
						if(status > 0){
							alert("부서 수정 완료");
						}else {
							alert("부서 수정 실패");
						}
					},
					error: function(){
						console.log("통신 실패");
					}
				});
			}
		}
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>