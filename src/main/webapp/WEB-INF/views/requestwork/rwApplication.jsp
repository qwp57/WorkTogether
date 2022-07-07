<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무 요청서</title>
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
         	
		<form role="form" action="/insertRequestWork.do" method="post" enctype="multipart/form-data">
         	<div class="modal-body">
         			<table class="table table-bordered">
         				<tbody class="tbody">
         					<tr>
         						<th class="th">제목</th>
         						<td class="td"><input type="text" name="title" class="form-control" tabindex="1" required ></td>
         						<th class="th">프로젝트</th>
         						<td class="td">
         							<select class="form-control" name="pj_no" tabindex="2">
         							<c:if test="${empty prjList}"><option value="">참여중 프로젝트가 없습니다</option></c:if>
         							<c:if test="${!empty prjList}">
         								<option value="0">프로젝트 없음</option>
	         							<c:forEach items="${prjList}" var="p">
	         								<option value="${p.pj_no}">${p.pj_title}</option>
	         							</c:forEach>
	         						</c:if>
								  	</select>
								  	
         						</td>
         					</tr>
         					<tr>
         						<th class="th">소속부서</th>
         						<td class="td">
         						<select class="form-control" id="dept" tabindex="3">
								    <c:forEach items="${deptList }" var="d">
								    	<option value="${d.DEPT_CODE}">${d.DEPT_NAME}</option>
								    </c:forEach>
							  	</select>
         						</td>
         						<th class="th">담당자</th>
         						<td class="td">
         						<select class="form-control" id="res_memberId" name="res_member" tabindex="4">
								   
							  	</select>
         						</td>
       						</tr>
       						<tr>
         						<th class="th">기한 유무</th>
         						<td class="td">
								  <input  type="radio" id="termRadio1" class="termRadio" value="Y" name="termYN">
								  <label  for="termRadio1" class="termlabel termRadio">기한 있음</label>
								  <input  type="radio" id="termRadio2" class="termRadio" value="N" name="termYN" checked>
								  <label  for="termRadio2" class="termlabel termRadio">기한 없음</label>
         						</td>
         						<th class="th">기한</th>
         						<td class="td"><input type="date" id="termId" class="form-control" name="" disabled></td>
       						</tr>
       						<tr>
         						<th class="th">중요도</th>
         						<td class="td">
         						  <input  type="radio" name="important" id="inlineRadio1" value="1" required>
								  <label  for="inlineRadio1" class="termlabel">상</label>
								  <input  type="radio" name="important" id="inlineRadio2" value="2" required>
								  <label  for="inlineRadio2" class="termlabel">중</label>
								  <input  type="radio" name="important" id="inlineRadio3" value="3" required>
								  <label  for="inlineRadio3" class="termlabel">하</label>
         						</td>
         						<th class="th">첨부파일</th>
         						<td class="td">
         							<div class="input-group">
									  <input type="text" class="form-control" id="file-label" placeholder="파일 첨부" aria-label="Recipient's username" aria-describedby="basic-addon2">
									  <div class="input-group-append">
									    <button class="btn btn-outline-secondary" id="rw_file" type="button">파일 첨부</button>
									  </div>
									</div>
									<input type="file" name="upload_file" id="upload-file" hidden>
         						</td>
       						</tr>
       						<tr>
         						<th class="th">내용</th>
         						<td colspan="3">
         						<textarea class="rw-textarea" name="content" placeholder="요청할 업무 내용을 작성해 주세요" rows="10" required></textarea>
         						</td>
         					</tr>
         				</tbody>
         			</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btns" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary btns">확인</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	
</script>
<script src="/resources/assets/js/rwAppli.js?ver=3"></script>
</body>
</html>