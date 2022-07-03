<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 .main-content {
     height: 1500px;
     margin-bottom: 100px;
 }
 .body1 body3{
     height: 300px;
 }
 .body2{
     height: 100%;
 }
 .ioImg{/*근무체크 화살표 버튼*/
 	width: 100%;
    cursor: pointer;
 }
 .ioImg:active{
    background-color: lightgray;
 }
 #status_Change{/*근무체크 상태*/
 	background-color: lightgray;
 	border-radius: 5px;
 	color: white;
 }
 #current_Time{/*근무체크 실시간 시계*/
 	font-size: 30px;
 	color: black;
 	font-weight: bold;
 }

.time_status{/*근무체크 시간+근무중 상태 패딩*/
	padding: 7px;
}
#Click_io_img{/*출퇴근부분 */
height: 200px;
padding-top: 20px;
padding-bottom: 0;
display: flex;
justify-content: space-around;
}
.Io_Click{/*출근하기 퇴근하기*/
width:100px;
display: inline-block;
font-size: 16px;
}
#v-line{/*출근 퇴근 사이 수직선*/
	border-left: 1px solid gray;
}

.status_button{/*근무상태버튼 통합div*/
width: 90%;
display: flex;
justify-content: space-around;
margin-top: 20px;

}

#click_status_1, #click_status_2, #click_status_3, #click_status_4{/*근무상태 버튼 css*/
padding: 10px;
padding-left: 30px;
padding-right: 30px;
font-size: 18px;
font-weight: bold;
font-family: 'Nanum Gothic', sans-serif;
border-radius: 5px;
background-color: #7C8EFC;
color: white;
border: 0px;
outline: none;
box-shadow: 5px 5px 10px -3px gray;

}
#click_status_1:active, #click_status_2:active, #click_status_3:active, #click_status_4:active{
box-shadow: 0 0 0 0;
}

.time_text{
    font-size: 20px;
    font-weight: bold;
    font-family:'Nanum Gothic', sans-serif;
    color: black;
}

.listViewTable {
	text-align: center;
	font-size: large;
	border-collapse: separate; 
    border-spacing: 0px; 
}

.listViewTable tr:hover, #tagTable tr:hover {
	background-color: lightgray;
	transform: scale(1);
}


td {
    padding: 10px;
}
td:first-child {
    border-left-style: none;
    border-top-left-radius: 25px; 
    border-bottom-left-radius: 25px;
}
td:last-child {
    border-right-style: none;
    border-bottom-right-radius: 25px; 
    border-top-right-radius: 25px; 
}


.colors {
	-text: white;
	margin: 20px;
	padding: 20px;
	margin-left: 40px;
	width: 50px;
	height: 50px;
	border-radius: 10px;
	box-shadow: 0 0 2rem -1rem rgba(0, 0, 0, .05);
	transition: all 0.2s;
	color: #ffffff;
	-text: white;
}

.color-1 {
	background: #3C3B3D;
}

.color-2 {
	background: #EC87C0;
}

.color-3 {
	background: #5D9CEC;
}

.color-4 {
	background: #8a40f2;
}


.color-5 {
	background: #82B553;
}

.color-6 {
	background: #f05650;
}

.color-7 {
	background: #917B56;
}

.color-8 {
	background: gray;
}


</style>
</head>
<body>

<div align="center">
    <div class="main-content">
        <div class="container">
        <section class="section">
            <div style="height: 50px"></div>
            <div class="section-body">
                <h2 class="section-title" style="text-align: left;">내 정보</h2>
                <div class="row mt-sm-4 body-1">
                    <div class="col-12 col-md-10 col-lg-5">
                        <div class="card h-100">
                            <div class="card-body ">
                                <div class="owl-carousel owl-theme" id="users-carousel">
                                    <div>
                                        <div class="user-item">
                                            <c:choose>
                                                <c:when test="${empty loginEmp.change_name}">
                                                    <img style="height: 100px" alt="image" src="resources/assets/img/avatar/avatar-1.png"
                                                    id="profileImg" class="img-fluid">
                                                </c:when>
                                                <c:otherwise>
                                                    <img style="height: 100px" alt="image" src="resources/upload_files/${loginEmp.change_name }"
                                                    id="profileImg" class="img-fluid">
                                                </c:otherwise>
                                            </c:choose>
                                            
                                            <div class="user-details" style="margin-top:40px;">
                                                <div class="user-name"><h3>${sessionScope.loginEmp.name}</h3></div>
                                                <div class="text-job text-muted mt-3"><h5 style="color:black">${sessionScope.loginEmp.dept_name}소속 ${sessionScope.loginEmp.job_name}</h5></div>
                                                <input type="text" id="empno" value="${sessionScope.loginEmp.emp_no}" hidden>
                                                <div class="user-cta">
                                                    <button class="btn btn-primary follow-btn"
                                                            data-follow-action="alert('user1 followed');"
                                                            data-unfollow-action="alert('user1 unfollowed');">Follow
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                        <div class="col-12 col-md-10 col-lg-7">
                        <div class="card h-100">
                            <div class="card-body text-center h-100">
                                <h2>이번 달 근무왕 부서</h2>
                                <hr>
                                <br>
                                <h3>영업부 2팀</h3><br>
                                <h4>영업부 1팀</h4><br>
                                <h4>영업부 1팀</h4><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section-body">

                <div class="row mt-sm-4  body2">
                    <div class="col-12 col-md-10 col-lg-5">
                        <div class="card h-100">
                            <div class="card-body">
                                <div id="time_Main">
                                	<div id="time-header" align="left">
	                                    <h4 id="time_Title">근무 체크</h4>
	
	                                    <h5 id="current_Date"></h5>
	
	                                    <div id="current_Status">
	                                        <span class="time_status" id="current_Time"></span>
	                                        <span class="time_status" id="status_Change">
	                                        	<c:choose>
	                                        		<c:when test="${w.status eq 'W'}">근무중</c:when>
	                                        		<c:when test="${w.status eq 'OW'}">외근중</c:when>
	                                        		<c:when test="${w.status eq 'MT'}">회의중</c:when>
	                                        		<c:when test="${w.status eq 'OT'}">외출중</c:when>
	                                        		<c:when test="${w.status eq 'LW'}">퇴 근</c:when>
	                                        		<c:otherwise>근무시작 전</c:otherwise>
	                                        	</c:choose>
	                                        </span>
	                                    </div>
                                    </div>

                                    <div id="Click_io_img" >
                                        <div class="Io_Click">
                                            <img class="ioImg" id="startTime"
                                                   src="resources/assets/img/arrow-up.png"
                                                   alt="">
                                            <div class="time_text">출 근</div>
                                            <div class="time_text" id="startTime_area">${w.in_time}</div>
                                        </div>
                                        <div id="v-line"></div>
                                        <div class="Io_Click">
                                            <img class="ioImg" id="endTime"
                                                   src="resources/assets/img/arrow-down.png">
                                            <div class="time_text">퇴 근</div>
                                            <div class="time_text" id="endTime_area">${w.out_time}</div>
                                        </div>
                                    </div>

                                    <div id="status_buttons">
                                        <div class="status_button">
                                            <button class="sbtn" id="click_status_1">근 무</button>
                                            <button class="sbtn" id="click_status_2">회 의</button>
                                        </div>
                                        <div class="status_button">
                                            <button class="sbtn" id="click_status_3">외 출</button>
                                            <button class="sbtn" id="click_status_4">외 근</button>
                                        </div>
                                    </div>

                                </div>
                               
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-10 col-lg-7">
                        <div class="card h-100">
                        
                            <div class="card-body text-center h-100">
                                <h4 class="text-left">즐겨찾기</h4>
                                <hr>
								<table class="listViewTable">
									<c:forEach var="index" begin="1" end="5">
										<tr style="width: 100%">
											<td style="width: 3%;"></td>
											<td><div class="colors color-${index }"></div></td>
											<td style="width: 10%;"><i
												class='icon fa fa-star fa-lg favoYellow'></i></td>
											<th style="width: 40%;">테스트</th>
											<td style="width: 20%;"><i
													class='fa fa-user'></i>&nbsp;7</td>
											<td style="width: 30%;"><i
													class='	fa fa-flag'></i>&nbsp;2022-06-02</td>
										</tr>
										</c:forEach>
									</table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 결재 대기 문서 -->
            <div class="section-body">
                <div class="row mt-sm-4 body3">
                    <div class="col-12 col-md-10 col-lg-12">
                        <div class="card h-100">
                            <div class="card-body">

                                <h4 class="text-left">결재 대기 문서</h4>
                                <hr>
								<table class="table" id="approvalDocumentTable">
									<thead>
										<tr>
											<th style="width:13%">기안일</th>
											<th style="width:13%">완료일</th>
											<th style="width:12%">결재양식</th>
											<th style="width:8%">긴급</th>
											<th style="width:15%">제목</th>
											<th style="width:9%">기안자</th>
											<th style="width:8%">첨부</th>
											<th style="width:10%">문서번호</th>
											<th style="width:12%">결재상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ appList }" var="al">
											<tr>
												<td class="d-none">${ al.approvalNo }</td>
												<td class="d-none">${ al.docNo }</td>
												<td>${ al.createDate }</td>
												<c:choose>
													<c:when test="${ al.approvalDate eq null }">
														<td>-</td>
													</c:when>
													<c:otherwise>
														<td>${ al.approvalDate }</td>
													</c:otherwise>
												</c:choose>
												<td>${ al.docName }</td>
												<c:choose>
													<c:when test="${ al.emergency eq 'N' }">
														<td>-</td>
													</c:when>
													<c:otherwise>
														<td style="color: red">긴급</td>
													</c:otherwise>
												</c:choose>
												<td>${ al.title }</td>
												<td>${ al.name }</td>
												<c:choose>
													<c:when test="${ al.fileNo eq 0 }">
														<td>-</td>
													</c:when>
													<c:otherwise>
														<td><i class="bi bi-paperclip"></i>1</td>
													</c:otherwise>
												</c:choose>
												<td>${ al.approvalNo }</td>
												<c:choose>
													<c:when test="${ al.progress eq 'W' }">
														<td><span class="p-2" style="color: white; background-color: skyblue; border-radius: 5px;">대기</span></td>
													</c:when>
													<c:when test="${ al.progress eq 'P' }">
														<td><span class="p-2" style="color: white; background-color: green; border-radius: 5px;">진행중</span></td>
													</c:when>
													<c:when test="${ al.progress eq 'C' }">
														<td><span class="p-2" style="color: white; background-color: darkgray; border-radius: 5px;">완료</span></td>
													</c:when>
													<c:when test="${ al.progress eq 'R' }">
														<td><span class="p-2" style="color: white; background-color: Firebrick; border-radius: 5px;">반려</span></td>
													</c:when>
												</c:choose>
											</tr>						
										</c:forEach>										
									</tbody>
								</table>                           
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script src="resources/assets/js/workTimecheck_main.js?ver=1"></script>
</body>
</html>