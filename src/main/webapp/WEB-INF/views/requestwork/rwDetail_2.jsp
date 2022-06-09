<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.rD-2-textarea{
  width: 60%;
  border: 1px solid lightgray;
  border-radius: 3px;
  overflow: auto;
  resize: none;
}
.sorttmenu-rD2{

width : 200px;
height: 48px;
margin: 0;

}
</style>
<body>
  <div class="modal fade" role="rw-Application" id="rwDetail_2">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content" id="rwModalcss">
			<div class="modal-header">
				<h4 class="modal-title">업무요청서</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
         			<span aria-hidden="true">&times;</span>
         		</button>
         	</div>
         	
         	<div class="modal-body">
       			<table class="table table-bordered">
       				<tbody class="tbody">
       					<tr>
       						<th class="th">제목</th>
       						<td class="td">2021년 상반기 정산 내역 요청합니다. </td>
       						<th class="th">프로젝트</th>
       						<td class="td">프로젝트 명 1</td>
       					</tr>
       					<tr>
       						<th class="th">기한</th>
       						<td class="td" >2022-06-07</td>
       						<th class="th"></th>
       						<td class="td" ></td>
       						
    					</tr>
     					<tr>
       						<th class="th">중요도</th>
       						<td class="td"><button class="btn btn-danger rwD_1btns">중요</button></td>
       						<th class="th">첨부파일</th>
       						<td class="td">첨부파일 없음</td>
     					</tr>
     					<tr>
       						<th class="th">내용</th>
       						<td colspan="3" style="text-align: left;">2021년 상반기 정산 내역 부탁드립니다.<br>빨리 주세요</td>
       					</tr>
       				</tbody>
       			</table>
       			<div class="responsheader">응답</div>
       			<table class="table table-bordered">
       				<tbody class="tbody">
       					<tr>
       						<th class="th">상태 메시지</th>
       						<td class="td">
	       						<div class="input-group">
	       							<textarea class="rD-2-textarea" placeholder="상태메시지를 작성해주세요" ></textarea>
	       							<select class="sorttmenu sorttmenu-rD2" id="">
									    <option>진행 중</option>
									    <option>요청됨</option>
									    <option>완료됨</option>
								  	</select>
								  	 <button class="btn btn-outline-secondary" type="button">작성 완료</button>
	       						</div>
       						</td>
       					</tr>
       					<tr>
       						<th class="th">요청파일</th>
       						<td class="td" id="leftalign">
							<div class="input-group">
								 <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
								 <div class="input-group-append">
								   <button class="btn btn-outline-secondary" type="button">파일 첨부</button>
								 </div>
							</div>
							</td>
     					</tr>
       				</tbody>
       			</table>
         	</div>
         	<div class="modal-footer">
				<button type="button" class="btn btn-secondary btns" data-dismiss="modal">거절</button>
				<button type="button" class="btn btn-primary btns" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		$(".rs").children().click(function(){
			$('#rwDetail_2').modal("show");
		})
		
	})
	
</script>
</body>
</html>