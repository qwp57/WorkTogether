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
  <div class="modal fade" role="rw-Application" id="rwDetail_1">
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
							<th class="th">보내는 이</th>
       						<td class="td" ></td>
       						<th class="th">기한</th>
       						<td class="td" ></td>
       						
       						
    					</tr>
     					<tr>
       						<th class="th">중요도</th>
       						<td class="td"><button class="btn btn-danger rwD_1btns">중요</button></td>
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
					<form id="updateStatus" action="updateRW.do" method="post" enctype="multipart/form-data" >
       				<tbody class="tbody">
       					<tr>
       						<th class="th">상태 메시지</th>
       						<td class="td">
       							<div class="input-group rsupdate">
       								<input type="text" name="status_message" class="form-control" placeholder="상태메시지를 작성해주세요">
       								<div class="input-group-append">
       								<select class=" form-control sorttmenu sorttmenu-rD2" name="status" id="stSelect" >
										<option value="RQ">진행전</option>
									    <option value="P">진행중</option>	
									    <option value="S">보류됨</option>
									    <option value="CC">취소됨</option>
									    <option value="RF">거절됨</option>
								  	</select>
       								</div>
       								<div class="input-group-append">
       								 <button class="btn btn-outline-secondary" type="submit" onclick="return updateRWState()">작성 완료</button>
       								</div>
       							</div>
								<input type="hidden" name="rw_no" class="rs_rwno" value="">
       						</td>
       					</tr>
       					<tr>
       						<th class="th">요청파일</th>
       						<td class="td" id="leftalign">
							<div class="input-group rsupdate">
								 <input type="text" id='resFile' class="form-control" placeholder="첨부파일 없음" >
								 <div class="input-group-append">
								   <button class="btn btn-outline-secondary" type="button" id="res_file">파일 첨부</button>
								 </div>
								 <input type="file" name="upload_file" id="uploadfile" hidden>
								 <input type="text" name="res_file" hidden>
							</div>
							</td>
     					</tr>
       				</tbody>
					</form>
       			</table>
         	</div>
			 <form id="reject" method="get" action="/cancleRW.do">
			<input type="hidden" name="rw_no" class="rs_rwno" value="">
			<input type="hidden" name="status" value="RF">
         	<div class="modal-footer" id="modalFooter1">
				<button type="submit" class="btn btn-secondary btns" onclick="return reject();">거절</button>
				<button type="button" class="btn btn-primary btns" data-dismiss="modal">확인</button>
			</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>