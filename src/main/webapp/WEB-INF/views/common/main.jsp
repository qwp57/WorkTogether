<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

 .main-content {
     height: 1500px;
     margin-bottom: 100px;
 }
 .body1 body3{
     height: 300px;
 }
 .body2{
     height: 500px;
 }
 .ioImg{/*근무체크 화살표 버튼*/
 	width: 100%;
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
padding-top: 50px;
padding-bottom: 50px;
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
width: 80%;
display: flex;
justify-content: space-around;
margin-top: 20px;

}
.sbtn{/*근무상태 버튼 css*/
padding: 10px;
padding-left: 30px;
padding-right: 30px;
font-size: 15px;
font-weight: bold;
border-radius: 5px;
background-color: lightgray;
border: 0px;
box-shadow: 5px 5px 10px -3px gray;

}






</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>


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
                                            <img style="height: 100px" alt="image"
                                                 src="resources/assets/img/avatar/avatar-1.png"
                                                 id="profileImg" class="img-fluid">
                                            <div class="user-details">
                                                <div class="user-name"><p>Hasan Basri</p></div>
                                                <div class="text-job text-muted"><p>Web Developer</p></div>
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
                                <h4>영업부 1팀</h4>
                                <h4>영업부 1팀</h4>
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
	                                        <span class="time_status" id="status_Change">근무중</span>
	                                    </div>
                                    </div>

                                    <div id="Click_io_img" >
                                        <div class="Io_Click">
                                            <img class="ioImg" id="startTime"
                                                   src="resources/assets/img/arrow-up.png"
                                                   alt="">
                                            <div>출근하기</div>
                                            <div id="startTime_area">00:00:00</div>
                                        </div>
                                        <div id="v-line"></div>
                                        <div class="Io_Click">
                                            <img class="ioImg" id="endTime"
                                                   src="resources/assets/img/arrow-down.png">
                                            <div>퇴근하기</div>
                                            <div id="endTime_area">00:00:00</div>
                                        </div>
                                    </div>

                                    <div id="status_buttons">
                                        <div class="status_button">
                                            <button class="sbtn" id="click_status_1">근무</button>
                                            <button class="sbtn" id="click_status_2">회의</button>
                                        </div>
                                        <div class="status_button">
                                            <button class="sbtn" id="click_status_3">외출</button>
                                            <button class="sbtn" id="click_status_4">외근</button>
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
                                <h4>영업부 1팀</h4>
                                <h4>영업부 1팀</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-body">

                <div class="row mt-sm-4 body3">
                    <div class="col-12 col-md-10 col-lg-12">
                        <div class="card h-100">
                            <div class="card-body">
                             
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</div>
<script type="text/javascript">

$(function(){
	let today = new Date();

	let week = new Array('일', '월', '화', '수', '목','금', '토');
	let dayfm = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일 ("+week[today.getDay()]+")";
	$('#current_Date').text(dayfm);
	
	getClock();
	
	
})

function getClock() {
	let today = new Date();
	const hours = String(today.getHours()).padStart(2, "0");
    const min = String(today.getMinutes()).padStart(2, "0");
    const sec = String(today.getSeconds()).padStart(2, "0");
	let curTime = hours+":"+min+":"+sec;
	$('#current_Time').text(curTime);
}

setInterval(getClock, 1000);


</script>
</body>
</html>