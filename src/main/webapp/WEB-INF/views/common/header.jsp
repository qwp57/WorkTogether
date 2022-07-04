<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Ecommerce Dashboard &mdash; Stisla</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css" integrity="sha384-eoTu3+HydHRBIjnCVwsFyCpUDZHZSFKEJD0mc3ZqSBSb6YhZzRHeiomAUWCstIWo" crossorigin="anonymous">

  <!-- Template CSS -->
  <link rel="stylesheet" href="/resources/assets/css/style.css">
  <link rel="stylesheet" href="/resources/assets/css/components.css">

  <!-- 캘린더 cdn -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

	
  <style>
  .dropdown-list .dropdown-list-content:not(.is-end ):after {
	content: normal
}
/* 모달 */
.chat-wrap {
	width: 380px;
	height: 550px;
	display: none;
	position: absolute;
	top: 60px;
	text-align: left;
	border: 1px solid #e7e7e7;
	background: #fff;
	z-index: 1050;
	border: 1px solid #e7e7e7;
	box-shadow: 0 0 6px 2px #e7e7e7;
	border-radius: 7px;
}
  	#profileTable{
  		width:100%;
  		height:90%;
  	}

  	.filebox label {
	  display: inline-block;
	  padding: .5em .75em;
	  color: #999;
	  font-size: inherit;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: #fdfdfd;
	  cursor: pointer;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	}

	.filebox input[type="file"] {  /* 파일 필드 숨기기 */
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip:rect(0,0,0,0);
	  border: 0;
	}


	.nav-counter {
 position:absolute;
 top: 3px;
 right: 5px;
 min-width: 8px;
 height: 20px;
 line-height: 20px;
 margin-top: -11px;
 padding: 0 6px;
 font-weight: normal;
 font-size: small;
 color: white;
 text-align: center;
 text-shadow: 0 1px rgba(0, 0, 0, 0.2);
 background: #e23442;
 border: 1px solid #911f28;
 border-radius: 11px;
 
}


  </style>
</head>
<body>

<script type="text/javascript">

$(function(){
	let msg = "${msg}";
	if(msg != ""){
		alert(msg);

	}
})

</script>
	<div  class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <form class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
          </ul>
        </form>
        <ul class="navbar-nav navbar-right">
          <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown" class="nav-link nav-link-lg message-toggle beep"><i class="far fa-envelope" ></i></a>
          	<div class="dropdown-menu dropdown-list dropdown-menu-right chat-tab-wrap"  style="display: none;">
					<div class="dropdown-header">
						<a id="chatNav">채팅</a>
						<div class="float-right">
							<a class='bi bi-chat-fill fa-2x' href="/chatinvite.do"
								id="chat-add"
								onClick="window.open(this.href, '', 'width=470, height=680'); return false;">

							</a>

						</div>
					</div>
					<!-- 채팅 -->
					<div class="chat-tab-wrap">
						<div class="dropdown-list-content dropdown-list-message">
							<c:forEach begin="1" end="12">
								<a href="/chatRoom.do" class="dropdown-item dropdown-item-unread" onClick="window.open(this.href, '', 'width=470, height=680'); return false;">
									<div class="dropdown-item-avatar">
										<img alt="image"
											src="/resources/assets/img/avatar/avatar-1.png"
											class="rounded-circle">
										<div class="is-online"></div>
									</div>
									<div class="dropdown-item-desc">
										<b>채팅방 이름</b>
										<p>채팅 내용</p>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>

				</div>

          </li>
          <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg"  style="width:50px; position:relative;"><i class="far fa-bell"></i>
			<c:choose>
				<c:when test="${unreadNotice > 0}"><span class="nav-counter" id="noticecnt">${unreadNotice}</span></c:when>
				<c:otherwise><span class="nav-counter" id="noticecnt" style="display: none;">${unreadNotice}</span></c:otherwise>
			</c:choose>
			</a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right">
              <div class="dropdown-header">알림 메시지
                <div class="float-right">
                  <a onclick="deleteAllNotice()">전체 알림 삭제</a>
                </div>
              </div>
              <div class="dropdown-list-content dropdown-list-icons" id="noticeArea">
              <c:forEach items="${noticeList}" var="n">
               <a href="${n.url}" onclick="return deleteNotice(${n.notice_no});" id="${n.notice_no}" class="dropdown-item dropdown-item-unread">
               	<div class="dropdown-item-desc">
               		<div class="font-weight-bold">
					<c:choose>
						<c:when test="${n.type eq 'RW'}">업무요청</c:when>
						<c:otherwise>알림메시지</c:otherwise>
					</c:choose>
					</div>
					 ${n.content}
                    <div class="text-secondary"> ${n.contentDetail}</div>
                    <div class="time text-primary">${n.create_date}</div>
               	</div>
               </a>
              
              </c:forEach>
               
              </div>
              
            </div>
          </li>
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
			<c:choose>
				<c:when test="${empty sessionScope.loginEmp.change_name}"><img alt="image" src="/resources/assets/img/avatar/avatar-1.png" class="rounded-circle mr-1"></c:when>
				<c:otherwise><img alt="image" src="/resources/upload_files/${loginEmp.change_name }" class="rounded-circle mr-1"></c:otherwise>
			</c:choose>
           
            <div class="d-sm-none d-lg-inline-block">Hi, ${sessionScope.loginEmp.name}</div></a>
            <div class="dropdown-menu dropdown-menu-right">
              <a href="#" class="dropdown-item has-icon" id="profile">
                <i class="far fa-user"></i> 내 정보
              </a>
              <!-- 관리자 설정은 관리자에게만 보인다. -->
              <h5 class="dropdown-header">
	            <i class="fas fa-cog"></i> 관리자 설정
	          </h5>
	          <a class="dropdown-item has-icon ml-3" href="adminApprovalList.do">
              	<i class="bi bi-check-square-fill"></i>가입 승인
              </a>
	       	  <a class="dropdown-item has-icon ml-3" href="departmentManagement.do">
              	<i class="bi bi-diagram-3-fill"></i>부서 관리
              </a>
	           <a class="dropdown-item has-icon ml-3" href="employeeManagement.do">
              	<i class="bi bi-people-fill"></i>인사 관리
              </a>

              <div class="dropdown-divider"></div>
              <a href="/logout.do" class="dropdown-item has-icon text-danger">
                <i class="fas fa-sign-out-alt"></i> 로그아웃
              </a>
            </div>
          </li>
        </ul>
      </nav>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">

var socket = null;

connect();

function connect() {
	var ws = new WebSocket('ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/echo-ws.do/websocket');
	socket = ws;
	
	ws.onopen = function() {
   		console.log('Info: connection opened.');
	};
	
	ws.onmessage = function (event) {
		console.log('Info : connection onmessage');
		console.log(event);
		let msg = event.data;
		let msgArr = msg.split(",");
		console.log(msg);

		noticeSet(msgArr);
		
		
	};
	
	ws.onclose = function (event) {
		console.log('Info : connection closed')
	};
	
	ws.onerror = function (err) {
		console.log('Error : ', err);
	};


	
}

function noticeSet(msgArr){
	
	$.ajax({
		url : "plusNoticeList.do",
		data : {notice_no : msgArr[0]}, 
		method : "get",
		success : function (result) {
			console.log(result);
			
		}
	})
	

	text = "<a href='"+msgArr[4]+"' onclick='return deleteNotice("+msgArr[0]+");' class='dropdown-item dropdown-item-unread'>";
	text +="<div class='dropdown-item-desc'><div class='font-weight-bold'>";
	if(msgArr[1] == 'RW'){

		text +="업무요청</div>" 
	}

	text += msgArr[2];
	text += "<div class='text-secondary'>"+msgArr[3]+"</div>";
	text +="<div class='time text-primary'>"+msgArr[5]+"</div>";
	text += "</div> </a>";

	$('#noticeArea').append(text);

	$('#noticecnt').text(Number($('#noticecnt').text())+1);
	$('#noticecnt').css('display', 'inline');


}


function deleteNotice(nno){
	
	console.log(nno);
	

	$.ajax({
		url : "deleteNotice.do",
		data : { notice_no : nno},
		type: "post",
		success : function(result){
			if(result == '1'){
				
				return true;
				//event.preventDefault();
			}else{
				
				
				return false;
			}
		},
		error : function(err){
			console.log(err);
		}

	})


};

function deleteAllNotice(){

	$.ajax({
		url : "deleteAllNotice.do",
		success : function(result){
			if(result == 'success'){
				$('#noticeArea').empty();
				$('#noticecnt').css('display', 'none'); 
				alert("모든 알림을 삭제했습니다.");
			}
		}
	})


}


</script>
	
	


	


      <!-- 개인정보 모달창 -->
      <!-- data-backdrop="static" 속성은 모달창 주위의 배경을 클릭해도 창이 닫히지 않도록 한다. -->
      <!-- data-keybaord="false" 속성은 esc키를 눌러도 창이 닫히지 않게 한다. -->
      <div class="modal" id="myProfile" data-backdrop="static" data-keyboard="false">
      	<div class="modal-dialog modal-xl modal-dialog-centered">
      		<div class="modal-content row">
      			<!-- modal header : 제목 -->
      			<div class="modal-header">
      				<span><h3 class="modal-title text-left">나의 기본 정보</h3></span>
      				<span><input type="image" data-dismiss="modal" src="/resources/assets/img/close.png/" style="width:20px"></span>
      			</div>
      			<!-- modal body : 내용 -->
      			<form class="form" id="myProfileUpdate" action="myProfileUpdate.do" enctype="multipart/form-data">
	      			<div class="modal-body">
	      				<table class="table-bordered" id="profileTable">
	      					<tr>
	      						<th style="width: 15%">&nbsp;프로필 사진</th>
	      						<td colspan="3" style="height: 40%">
	      						<c:choose>
                                  <c:when test="${empty loginEmp.change_name}">
	      							<img style="height: 100px" alt="image"
	                                                 src="/resources/assets/img/avatar/avatar-1.png"
	                                                 id="profileImg_header" class="img-fluid m-3 rounded-circle">
	                              </c:when>
                                  <c:otherwise>
                                  <img style="height: 100px" alt="image"
	                                   src="/resources/upload_files/${loginEmp.change_name }"
	                                   id="profileImg_header" class="img-fluid m-3 rounded-circle">
                                  </c:otherwise>
                               </c:choose>
                                            
	                               	<span class="filebox">
	                               		<label for="newFile">+</label>
	                               		<input type="file" id="newFile" name="new_file" >
	                               		<label for="ex_file" id="deletefile">-</label>
	                               		<input type="hidden" id="exfile" name="ex_file">
	                               	</span>
	                            </td>
	      					</tr>
	      					<tr>
	      						<th>&nbsp;이름</th>
	      						<td><input class="form-control" type="text" value="${loginEmp.name}" name="name" ></td>
	      						<th style="width: 15%">&nbsp;아이디</th>
	      						<td>${loginEmp.id }<input type="hidden" name="emp_no" value="${loginEmp.emp_no }"></td>
	      					</tr>
	      					<tr>
	      						<th>&nbsp;부서</th>
	      						<td><select class="form-control" name="dept_code" id="dept" >
	      									<option value="">부서 없음</option>
	      								<c:forEach items="${dList}" var="d">
											<option value="${d.DEPT_CODE}">${d.DEPT_NAME}</option>      						
	      								</c:forEach>
	      							</select>
	      						</td>
	      						<th>&nbsp;직위</th>
	      						<td><select class="form-control" name="job_code" id="job" >
	      								<option value="">직급 없음</option>
	      							<c:forEach items="${jList}" var="j">
	      								<option value="${j.JOB_CODE}">${j.JOB_NAME}</option>
	      							</c:forEach>
	      							</select>
	      						</td>
	      					</tr>
	      					<tr>
	      						<th>&nbsp;생일</th>
	      						<td>
		      						<div class="input-group date" id="datetimepicker1" data-target-input="nearest">
					                    <input type="text" id="empbirth" class="form-control datetimepicker-input" data-target="#datetimepicker1"  name="birth" />
					                    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
					                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
					                    </div>
					                </div>
	      						</td>
	      						<th>&nbsp;핸드폰 번호</th>
	      						<td><input class="form-control" type="tel" value="${loginEmp.phone }" name="phone" ></td>
	      					</tr>
	      					<tr>
	      						<th>&nbsp;이메일</th>
	      						<td><input class="form-control" type="email" value="${loginEmp.email }" name="email" ></td>
	      						<th>&nbsp;입사일</th>
	      						<td>
	      							<div class="input-group date" id="datetimepicker2" data-target-input="nearest">
					                    <input type="text" id="empjoinDate" class="form-control datetimepicker-input" data-target="#datetimepicker2"  name="join_date" />
					                    <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
					                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
					                    </div>
					                </div>
	      						</td>
	      					</tr>
	      				</table>
	      			</div>

	      			<div class="modal-footer">
	      				
	      				<div class="col-lg-12 text-center">
	      					<button type="button" class="btn btn-lg btn-primary btn-lg mb-3" id="myProfilebtn">저장</button>
	      				</div>
	      			</div>
 				</form>
      		</div>
      	</div>
      </div>

      <script>
      let file_no = "${loginEmp.file_no}";
      console.log(file_no);
      	$(function(){
      		$("#profile").click(function(){
      			$("#myProfile").modal("show")
      		});

      		$('#datetimepicker1').datetimepicker({
                format: 'YY-MM-DD'
            });

      		$('#datetimepicker2').datetimepicker({
                format: 'YY-MM-DD',
                useCurrent: false
            });
      		
      		let birthday = '${loginEmp.birth}';
      		let joinDate = '${loginEmp.join_date}';
      	
      		document.getElementById('empbirth').value = birthday.substring(0, 11);
      		document.getElementById('empjoinDate').value = joinDate.substring(0, 11);
      		
      		let job_code ='${loginEmp.job_code}';
      		let dept_code ='${loginEmp.dept_code}';
      		
      		$('#dept option[value = '+dept_code+']').prop('selected', true);
      		$('#job option[value = '+job_code+']').prop('selected', true);
      		
      
      		

      	});
      	
      	$('#newFile').on('change', function() {
			let file = $('#newFile').prop('files')[0];
			let url = window.URL.createObjectURL(file);
			console.log(url);
			$('#profileImg_header').attr('src', url);
			
			$('#exfile').val(file_no);
			console.log($('#exfile').val());
		})
		
		$('#deletefile').click(function() {
			$('#profileImg_header').attr('src',"/resources/assets/img/avatar/avatar-1.png");
			$('#exfile').val(file_no);
			console.log($('#exfile').val());
		})
      	
      	
      	$('#myProfilebtn').click(function(){
      		
      		if($('#dept option:selected').val() == ""){
      			alert("부서를 선택해주세요");
      		}else if($('#job option:selected').val() == ""){
      			alert("직급을 선택해주세요");
      		}else{
      			
      	/*	let formData = $('#myProfileUpdate').serialize();*/
      	let form = $('#myProfileUpdate')[0];
      	let formData = new FormData(form);
      	
      		alert(formData);
			$.ajax({
				url:"myProfileUpdate.do",
				type : "post",
				cache : false,
				contentType : false,
				processData : false, 
				 enctype: 'multipart/form-data', 
				data : formData,
				success : function() {
					location.reload();
				}
			})      		
      			
      		}
      		
      		
      	})
      </script>

  <!-- General JS Scripts -->
  <!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="/resources/assets/js/stisla.js"></script>

	<!-- JS Libraies
  <script src="resources/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
  <script src="resources/node_modules/chart.js/dist/Chart.min.js"></script>
  <script src="resources/node_modules/owl.carousel/dist/owl.carousel.min.js"></script>
  <script src="resources/node_modules/summernote/dist/summernote-bs4.js"></script>
  <script src="resources/node_modules/chocolat/dist/js/jquery.chocolat.min.js"></script>-->

  <!-- Template JS File -->
  <script src="/resources/assets/js/scripts.js"></script>
  <script src="/resources/assets/js/custom.js"></script>


</body>
</html>