<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무 상세 내역서</title>
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

.responsheader{
font-family: 'Nanum Gothic', sans-serif;
font-size: 18px;
margin-top: 15px;
margin-bottom: 5px;
font-weight: bold;
}
.rwD_1btns{
width: 70%;
}

</style>
<body>
  <div class="modal fade" role="rw-Application" id="rwDetail_3">
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
       						<td class="td"></td>
       						<th class="th">프로젝트</th>
       						<td class="td"></td>
       					</tr>
       					<tr>
       						<th class="th">소속부서</th>
       						<td class="td"></td>
       						<th class="th">담당자</th>
       						<td class="td"></td>
     						</tr>
     						<tr>
       						<th class="th">상태</th>
       						<td class="td"></td>
       						<th class="th">기한</th>
       						<td class="td"></td>
     						</tr>
     						<tr>
       						<th class="th">중요도</th>
       						<td class="td"></td>
       						<th class="th">첨부파일</th>
       						<td class="td"></td>
     						</tr>
     						<tr>
       						<th class="th">내용</th>
       						<td class="td" colspan="3" style="text-align: left;"></td>
       					</tr>
       				</tbody>
       			</table>
       			<div class="responsheader">응답</div>
       			<table class="table table-bordered">
       				<tbody class="tbody">
       					<tr>
       						<th class="th">상태 메시지</th>
       						<td class="td" style="text-align: left;"></td>
       					</tr>
       					<tr>
       						<th class="th">요청파일</th>
       						<td class="td" style="text-align: left;"></td>
     					</tr>
       				</tbody>
       			</table>
         	</div>
			
         	<div class="modal-footer" id="modalFooter2">
				<button type='button' class='btn btn-secondary btns' data-dismiss='modal'>닫기</button>
			</div>
			
		</div>
	</div>
</div>

</body>
</html>