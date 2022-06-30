<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#modalTitle{
font-family: 'Nanum Gothic', sans-serif;
font-size: 20px;
margin-left: 5px;
}
.modal-header{
	border-bottom: 1px solid lightgray;
	}
.modal-body-title{
font-family: 'Nanum Gothic', sans-serif;
font-size: 15px;
font-weight:bold;
margin-bottom: 5px;
}
#arrow{
font-size:20px;
padding-top: 10px;
padding-left: 20px;
}
.formrow{
margin-bottom: 10px;
}
#approval-name{
font-size:15px;
padding-top: 10px;
margin-right: 10px;
}
#vac-file{
width: 100%;
}
.vac-textarea{
 width: 100%;
  line-height: 1.6;
  border: 1px solid lightgray;
  border-radius: 3px;
  overflow: auto;
  resize: none;
}
.vac-textarea:focus {
	outline: none;
	border: 1px solid #489CFF;
}
.form-control{
	background-color: white !important;
}
#detailFooter{
	justify-content: center;
}
</style>
<body>


<div class="modal fade" id="vacDetail" role="vac-Detail" >
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<i class='' id="detailIcon" style="font-size: 300%;"></i>
					<h3 class="modal-title" id="detaillTitle"></h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
         			<span aria-hidden="true">&times;</span>
        			</button>
				</div>
				
				<div class="modal-body">
				<div class="modal-body-title">휴가정보</div>
				<form role="form" id="vac_Detail" method="post" enctype="multipart/form-data">
					<input type="hidden" name="vac_no" readonly>
					<input type="hidden" name="file_no" readonly>
				  <div class="form-row">
				    <div class="col-5">
				      시작일
				    </div>
				    <div class="col"></div>
				    <div class="col-5">
				      종료일
				    </div>
				  </div>
				  <div class="form-row formrow">
				    <div class="col-5">
				      <input type="date" id="vacstartdate" name="start_date" class="form-control" placeholder="시작일" readonly>
				    </div>
				    <div class="col"><i class='fa-solid fa-arrow-right-long' id="arrow"></i></div>
				    <div class="col-5">
				      <input type="date" id="vacenddate" name="end_date" class="form-control" placeholder="종료일" readonly>
				    </div>
				  </div>
				  <div class="form-row formrow">
				    <div class="col">
				      <textarea name="content" id="vacContent" class="vac-textarea" placeholder="휴가 사유를 작성해주세요" rows="10" readonly></textarea>
				    </div>
				  </div>
				  <div class="form-row formrow">
				    <div class="col">
				      <div class="custom-file" id="filearea">
						<div class="modal-body-title">첨부파일</div>
						<a id="downloadFile" href="" download type='text/example'><input type="text" name="oldFile" id="fileOriginName" class="form-control" readonly></input></a>
						
			        </div>
			       </div>
				  </div>
				   <div class="form-row formrow">
				    <div class="col-5 input-group">
						<label id="approval-name">결재자</label>
						<select id="approvalDetail" name="approval_no" class="form-control" placeholder="결재자를 선택하세요" disabled>
							<c:forEach items="${SupvEmp}" var="emp">
								<option value="${emp.emp_no}">${emp.name} ${emp.job_code}</option>
							</c:forEach>
						</select>
					  </div>
				   
				  </div>
				</div>
				<div class="modal-footer" id="detailFooter">
					
				</div>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">

$(document).on('click', '.vac-menu-content tr', function(){

	let vacNo = $(this).children('input').val();
	console.log(vacNo);

	$.ajax({
		url :"vacationDetail.do",
		data : {vac_no : vacNo},
		type :"post",
		success : function(result){
			let data = JSON.parse(result);
			
			console.log(data.vac); 

			setList(data);
		}
	})

	$("#vacDetail").modal("show")  
		
/*	let vacName = $(this).children().children().eq(1).text();
	$('.modal-title').text(vacName);
		
	let vacIcon = $(this).children().children().eq(0).attr("class");
	$('#modal-icon').attr("class", vacIcon);

	$('input[name = vcategory_no]').val($(this).find('.nonVisible').text());

	*/	
});

function setList(data){
	let obj = data.vac;
	$('#vac_Detail input[name = vac_no]').val(obj.vac_no);
	$('#vac_Detail input[name = file_no]').val(obj.file_no);
	switch(obj.vac_name){
		case '연차': $('#detailIcon').addClass('fa fa-user icon'); break; 
		case '조의': $('#detailIcon').addClass('fa fa-envelope icon'); break; 
		case '가족돌봄': $('#detailIcon').addClass('fas fa-user-friends icon'); break; 
		case '병가': $('#detailIcon').addClass('fa fa-bed icon'); break; 
		case '결혼': $('#detailIcon').addClass('fa fa-heart icon'); break; 
		case '기타': $('#detailIcon').addClass('fa-solid fa-circle-exclamation icon'); break; 
		case '리플레쉬': $('#detailIcon').addClass('fa fa-plane icon'); break; 
		case '바캉스': $('#detailIcon').addClass('fa-solid fa-sun icon'); break; 
	}

	$('#detaillTitle').text(obj.vac_name);

	document.getElementById('vacstartdate').valueAsDate = new Date(obj.startdate);
	document.getElementById('vacenddate').valueAsDate = new Date(obj.enddate);
	$('#vacContent').val(obj.content);

	if(obj.original_name != null){

		$('#fileOriginName').val(obj.original_name);
		$('#downloadFile').attr('href', "/resources/upload_files/"+obj.change_name);
		
	}else{
		
		$('#fileOriginName').val("첨부된 파일이 없습니다.");
	}

	$("#approvalDetail option[value = '"+obj.approval_no+"']").prop("selected", true);


	
	$('#detailFooter').empty();
	if(obj.response_date == null){
		$('#detailFooter').append("<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>");
		$('#detailFooter').append("<button type='button' class='btn btn-primary' onclick='updateDetailForm("+obj.vac_no+");'>수정</button>");
	}else{
		$('#detailFooter').append("<button type='button' class='btn btn-secondary' data-dismiss='modal'>닫기</button>");

	}


}
		
function updateDetailForm(num){

	$('#vac_Detail input').attr('readonly', false);
	$('#vac_Detail textarea').attr('readonly', false);
	$('#vac_Detail select').attr('disabled', false);

	let exfile = $('#fileOriginName').val();
	console.log(exfile);
	$('#filearea').empty();
	let text = "<input type='file' name='newFile' class='custom-file-input' id='newFile'>";
	text += "<label class='custom-file-label' for='customFile' id='filelabel'>"+exfile+"</label>"
	$('#filearea').append(text);
	$('#detailFooter').empty();
	$('#detailFooter').append("<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>");
	$('#detailFooter').append("<button type='button' class='btn btn-primary' onclick='updateDetail("+num+");'>수정 완료</button>");


}

$(document).on('change', '#newFile', function(){
	if(window.FileReader){  // modern browser
			var filename = $(this)[0].files[0].name;
		} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}
	
		
			// 추출한 파일명 삽입
		$("#filelabel").text(filename);
		
})


function updateDetail(num){

	let form = $('#vac_Detail')[0];
    let formData = new FormData(form);
	
      	
			$.ajax({
				url:"modifiedVacation.do",
				type : "post",
				cache : false,
				contentType : false,
				processData : false, 
				 enctype: 'multipart/form-data', 
				data : formData,
				success : function(result) {
					console.log(result);
					location.reload();
				}
			})   
}
</script>

</body>
</html>