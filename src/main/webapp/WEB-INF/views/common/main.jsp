<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
            height: 500px;
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
                                <div class="owl-carousel owl-theme" id="users-carousel">
                                <div id="time_Main">
                                    <div id="time_Title">근무 체크</div>

                                    <div id="current_Date"></div>

                                    <div id="current_Status">
                                        <div class="time_status" id="current_Time"></div>
                                        <div class="time_status" id="status_Change">근무중</div>
                                    </div>

                                    <div id="Click_io_img">
                                        <div class="Io_Click">
                                            <input type="image" class="ioImg" id="startTime"
                                                   src="${ pageContext.servletContext.contextPath }/resources/img/buttonArrow.png"
                                                   alt="sdf">
                                            <div>출근하기</div>
                                            <div id="startTime_area">00:00:00</div>
                                        </div>
                                        <div class="Io_Click">
                                            <input type="image" class="ioImg" id="endTime"
                                                   src="${ pageContext.servletContext.contextPath }/resources/img/upArrow.png">
                                            <div>퇴근하기</div>
                                            <div id="endTime_area">00:00:00</div>
                                        </div>
                                    </div>

                                    <div id="status_button">
                                        <div id="status_button_1">
                                            <button class="click_status" id="click_status_1">근무</button>
                                            <button class="click_status" id="click_status_2">회의</button>
                                        </div>
                                        <div id="status_button_2">
                                            <button class="click_status" id="click_status_3">외출</button>
                                            <button class="click_status" id="click_status_4">외근</button>
                                            <%//Date now = new Date();%>
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

                <div class="row mt-sm-4 body3">
                    <div class="col-12 col-md-10 col-lg-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div id="time_Main">
                                    <div id="time_Title">근무 체크</div>

                                    <div id="current_Date"></div>

                                    <div id="current_Status">
                                        <div class="time_status" id="current_Time"></div>
                                        <div class="time_status" id="status_Change">근무중</div>
                                    </div>

                                    <div id="Click_io_img">
                                        <div class="Io_Click">
                                            <input type="image" class="ioImg" id="startTime"
                                                   src="${ pageContext.servletContext.contextPath }/resources/img/buttonArrow.png"
                                                   alt="sdf">
                                            <div>출근하기</div>
                                            <div id="startTime_area">00:00:00</div>
                                        </div>
                                        <div class="Io_Click">
                                            <input type="image" class="ioImg" id="endTime"
                                                   src="${ pageContext.servletContext.contextPath }/resources/img/upArrow.png">
                                            <div>퇴근하기</div>
                                            <div id="endTime_area">00:00:00</div>
                                        </div>
                                    </div>

                                    <div id="status_button">
                                        <div id="status_button_1">
                                            <button class="click_status" id="click_status_1">근무</button>
                                            <button class="click_status" id="click_status_2">회의</button>
                                        </div>
                                        <div id="status_button_2">
                                            <button class="click_status" id="click_status_3">외출</button>
                                            <button class="click_status" id="click_status_4">외근</button>
                                            <%//Date now = new Date();%>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
</div>

</body>
</html>