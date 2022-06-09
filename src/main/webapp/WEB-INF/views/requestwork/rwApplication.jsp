<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{
font-family: 'Nanum Gothic', sans-serif;

}
.th{
background-color: #EAEAEA;
text-align: center;
}
.td{
min-width: 300px;
}
.termlabel{
margin-right: 15px;
font-size: 15px;
font-weight: bold;
}
.rw-textarea{
 width: 100%;
  line-height: 1.6;
  border: 1px solid lightgray;
  border-radius: 3px;
  overflow: auto;
  resize: none;
}
.rw-textarea:focus {
	outline: none;
	border: 1px solid #489CFF;
}
 .btns{
 width: 20%;
 }
.modal-footer{
display: flex;
justify-content: center;}

</style>
<body>
  <div class="modal fade" role="rw-Application" id="rwApplicationModal">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content" id="rwModalcss">
			<div class="modal-header">
				<h4 class="modal-title">업무요청서</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
         			<span aria-hidden="true">&times;</span>
         		</button>
         	</div>
         	
         	<div class="modal-body">
         		  <form role="form" action="" method="post" enctype="multipart/form-data">
         			<table class="table table-bordered">
         				<tbody class="tbody">
         					<tr>
         						<th class="th">제목</th>
         						<td class="td"><input type="text" name="title" class="form-control" tabindex="1" required ></td>
         						<th class="th">프로젝트</th>
         						<td class="td">
         							<select class="form-control" id="" name="projectName" tabindex="2">
									    <option>프로젝트 이름</option>
									    <option>Ketchup</option>
									    <option>Relish</option>
								  	</select>
         						</td>
         					</tr>
         					<tr>
         						<th class="th">소속부서</th>
         						<td class="td">
         						<select class="form-control" id="" name="department" tabindex="3">
								    <option>프로젝트 이름</option>
								    <option>Ketchup</option>
								    <option>Relish</option>
							  	</select>
         						</td>
         						<th class="th">담당자</th>
         						<td class="td">
         						<select class="form-control" id="" name="res-name" tabindex="4">
								    <option>프로젝트 이름</option>
								    <option>Ketchup</option>
								    <option>Relish</option>
							  	</select>
         						</td>
       						</tr>
       						<tr>
         						<th class="th">기한 유무</th>
         						<td class="td">
								  <input  type="radio" name="termYN" id="inlineRadio1" value="">
								  <label  for="inlineRadio1" class="termlabel">기한 있음</label>
								  <input  type="radio" name="termYN" id="inlineRadio2" value="">
								  <label  for="inlineRadio2" class="termlabel">기한 없음</label>
         						</td>
         						<th class="th">기한</th>
         						<td class="td"><input type="date" class="form-control"></td>
       						</tr>
       						<tr>
         						<th class="th">중요도</th>
         						<td class="td">
         						  <input  type="radio" name="important" id="inlineRadio1" value="">
								  <label  for="inlineRadio1" class="termlabel">상</label>
								  <input  type="radio" name="important" id="inlineRadio2" value="">
								  <label  for="inlineRadio2" class="termlabel">중</label>
								  <input  type="radio" name="important" id="inlineRadio2" value="">
								  <label  for="inlineRadio2" class="termlabel">하</label>
         						</td>
         						<th class="th">첨부파일</th>
         						<td class="td">
         							<div class="input-group">
									  <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
									  <div class="input-group-append">
									    <button class="btn btn-outline-secondary" type="button">파일 첨부</button>
									  </div>
									</div>
									<input type="file" name="" id="rq-file" hidden>
         						</td>
       						</tr>
       						<tr>
         						<th class="th">내용</th>
         						<td colspan="3">
         						<textarea class="rw-textarea" placeholder="요청할 업무 내용을 작성해 주세요" rows="10"></textarea>
         						</td>
         					</tr>
         				</tbody>
         			</table>
         		</form>
         	</div>
         	<div class="modal-footer">
				<button type="button" class="btn btn-secondary btns" data-dismiss="modal">취소</button>
	      		<button type="button" class="btn btn-primary btns">확인</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		$("#rw-application").click(function(){
			$('#rwApplicationModal').modal("show");
		})
		
	})
	
	$("#rw-file").on('change', function(){  // 값이 변경되면
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