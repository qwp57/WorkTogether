<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

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
  <link rel="stylesheet" href="resources/assets/css/style.css">
  <link rel="stylesheet" href="resources/assets/css/components.css">

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
          <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown" class="nav-link nav-link-lg message-toggle beep"><i class="far fa-envelope"></i></a>
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
											src="resources/assets/img/avatar/avatar-1.png"
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
          <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg beep"><i class="far fa-bell"></i></a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right">
              <div class="dropdown-header">Notifications
                <div class="float-right">
                  <a href="#">Mark All As Read</a>
                </div>
              </div>
              <div class="dropdown-list-content dropdown-list-icons">
                <a href="#" class="dropdown-item dropdown-item-unread">
                  <div class="dropdown-item-icon bg-primary text-white">
                    <i class="fas fa-code"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    Template update is available now!
                    <div class="time text-primary">2 Min Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-icon bg-info text-white">
                    <i class="far fa-user"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    <b>You</b> and <b>Dedik Sugiharto</b> are now friends
                    <div class="time">10 Hours Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-icon bg-success text-white">
                    <i class="fas fa-check"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    <b>Kusnaedi</b> has moved task <b>Fix bug header</b> to <b>Done</b>
                    <div class="time">12 Hours Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-icon bg-danger text-white">
                    <i class="fas fa-exclamation-triangle"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    Low disk space. Let's clean it!
                    <div class="time">17 Hours Ago</div>
                  </div>
                </a>
                <a href="#" class="dropdown-item">
                  <div class="dropdown-item-icon bg-info text-white">
                    <i class="fas fa-bell"></i>
                  </div>
                  <div class="dropdown-item-desc">
                    Welcome to Stisla template!
                    <div class="time">Yesterday</div>
                  </div>
                </a>
              </div>
              <div class="dropdown-footer text-center">
                <a href="#">View All <i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
          </li>
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
            <img alt="image" src="resources/assets/img/avatar/avatar-1.png" class="rounded-circle mr-1">
            <div class="d-sm-none d-lg-inline-block">Hi, ${sessionScope.loginEmp.name}</div></a>
            <div class="dropdown-menu dropdown-menu-right">
              <div class="dropdown-title">Logged in 5 min ago</div>
              <a href="#" class="dropdown-item has-icon" id="profile">
                <i class="far fa-user"></i> 내 정보
              </a>
              <!-- 관리자 설정은 관리자에게만 보인다. -->
              <h5 class="dropdown-header">
	            <i class="fas fa-cog"></i> 관리자 설정
	          </h5>
	          <a class="dropdown-item has-icon ml-3" href="adminApproval.do">
              	<i class="bi bi-check-square-fill"></i>가입 승인
              </a>
	       	  <a class="dropdown-item has-icon ml-3" href="departmentManagement.do">
              	<i class="bi bi-diagram-3-fill"></i>부서 관리
              </a>
	           <a class="dropdown-item has-icon ml-3" href="employeeManagement.do">
              	<i class="bi bi-people-fill"></i>인사 관리
              </a>

              <div class="dropdown-divider"></div>
              <a href="/loout.do" class="dropdown-item has-icon text-danger">
                <i class="fas fa-sign-out-alt"></i> 로그아웃
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <script>
      /*  function logout() {
          $('#endTime_area').text();

        }*/

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
      				<span><input type="image" data-dismiss="modal" src="resources/assets/img/close.png/" style="width:20px"></span>
      			</div>
      			<!-- modal body : 내용 -->
      			<form class="form" id="myProfileUpdate">
	      			<div class="modal-body">
	      				<table class="table-bordered" id="profileTable">
	      					<tr>
	      						<th style="width: 15%">&nbsp;프로필 사진</th>
	      						<td colspan="3" style="height: 40%">
	      							<img style="height: 100px" alt="image"
	                                                 src="resources/assets/img/avatar/avatar-1.png"
	                                                 id="profileImg" class="img-fluid m-3 rounded-circle">
	                               	<span class="filebox">
	                               		<label for="ex_file">+</label>
	                               		<input type="file" id="ex_file">
	                               		<label for="ex_file">-</label>
	                               		<input type="file" id="ex_file">
	                               	</span>
	                            </td>
	      					</tr>
	      					<tr>
	      						<th>&nbsp;이름</th>
	      						<td><input class="form-control" type="text" value="홍길동" name="empName"></td>
	      						<th style="width: 15%">&nbsp;아이디</th>
	      						<td><input class="form-control" type="text" value="hong" readonly></td>
	      					</tr>
	      					<tr>
	      						<th>&nbsp;부서</th>
	      						<td><input class="form-control" type="text" value="인사팀" name="empDept"></td>
	      						<th>&nbsp;직위</th>
	      						<td><input class="form-control" type="text" value="대리" name="empJob"></td>
	      					</tr>
	      					<tr>
	      						<th>&nbsp;생일</th>
	      						<td>
		      						<div class="input-group date" id="datetimepicker1" data-target-input="nearest">
					                    <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1"  name="empBirth"/>
					                    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
					                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
					                    </div>
					                </div>
	      						</td>
	      						<th>&nbsp;핸드폰 번호</th>
	      						<td><input class="form-control" type="tel" value="010-1111-2222" name="empTel"></td>
	      					</tr>
	      					<tr>
	      						<th>&nbsp;이메일</th>
	      						<td><input class="form-control" type="email" value="HONG@WT.COM" name="empEmail"></td>
	      						<th>&nbsp;입사일</th>
	      						<td>
	      							<div class="input-group date" id="datetimepicker2" data-target-input="nearest">
					                    <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2"  name="empJoinDate"/>
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
	      					<button type="submit" class="btn btn-primary btn-lg mb-3">저장</button>
	      				</div>
	      			</div>
 				</form>
      		</div>
      	</div>
      </div>

      <script>
      	$(function(){
      		$("#profile").click(function(){
      			$("#myProfile").modal("show")
      		});

      		$('#datetimepicker1').datetimepicker({
                format: 'L'
            });

      		$('#datetimepicker2').datetimepicker({
                format: 'L',
                useCurrent: false
            });

      	});
      </script>

  <!-- General JS Scripts -->
  <!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="resources/assets/js/stisla.js"></script>

	<!-- JS Libraies
  <script src="resources/node_modules/jquery-sparkline/jquery.sparkline.min.js"></script>
  <script src="resources/node_modules/chart.js/dist/Chart.min.js"></script>
  <script src="resources/node_modules/owl.carousel/dist/owl.carousel.min.js"></script>
  <script src="resources/node_modules/summernote/dist/summernote-bs4.js"></script>
  <script src="resources/node_modules/chocolat/dist/js/jquery.chocolat.min.js"></script>-->

  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script>

  <!-- Page Specific JS File -->
  <script src="resources/assets/js/page/index.js"></script>

</body>
</html>