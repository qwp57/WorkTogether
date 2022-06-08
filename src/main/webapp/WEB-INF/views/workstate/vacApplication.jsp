<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
<body>
<!--  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#vacForm" style="margin: 500px;">
  Launch demo modal
</button>-->

<div class="modal fade" id="vacForm" role="vac-application" >
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<i class='' id="modal-icon"></i>
					<h3 class="modal-title" id="modalTitle"></h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
         			<span aria-hidden="true">&times;</span>
        			</button>
				</div>
				
				<div class="modal-body">
				<div class="modal-body-title">휴가정보</div>
				<form role="form" id="vac-Form" action="/" method="post" enctype="multipart/form-data">
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
				      <input type="date" class="form-control" placeholder="시작일">
				    </div>
				    <div class="col"><i class='fa-solid fa-arrow-right-long' id="arrow"></i></div>
				    <div class="col-5">
				      <input type="date" class="form-control" placeholder="종료일">
				    </div>
				  </div>
				  <div class="form-row formrow">
				    <div class="col">
				      <textarea class="vac-textarea" placeholder="휴가 사유를 작성해주세요" rows="10"></textarea>
				    </div>
				  </div>
				  <div class="form-row formrow">
				    <div class="col">
				      <div class="custom-file">
			            <input type="file" class="custom-file-input" id="vac-file">
			            <label class="custom-file-label" for="customFile" id="file-label">증빙자료</label>
			        </div>
			       </div>
				  </div>
				   <div class="form-row formrow">
				    <div class="col-5 input-group">
				    <label id="approval-name">결재자</label>
				      <select name="approval" class="form-control" placeholder="결재자를 선택하세요">
						  <option value="volvo">Volvo</option>
						  <option value="saab">Saab</option>
						  <option value="fiat">Fiat</option>
						  <option value="audi">Audi</option>
						</select>
				    </div>
				  </div>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        			<button type="button" class="btn btn-primary">휴가 등록</button>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function(){
		$(".card").click(function(){
			$("#vacForm").modal("show")  
			
		let vacName = $(this).children().children().eq(1).text();
		$('.modal-title').text(vacName);
			
		let vacIcon = $(this).children().children().eq(0).attr("class");
		$('#modal-icon').attr("class", vacIcon);
		});
		
		$('#modal-icon').css("font-size", "300%");
		

	});  


	$("#vac-file").on('change', function(){  // 값이 변경되면
		if(window.FileReader){  // modern browser
			var filename = $(this)[0].files[0].name;
		} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}
	
			// 추출한 파일명 삽입
		$("#file-label").text(filename);
	});
</script>

</body>
</html>