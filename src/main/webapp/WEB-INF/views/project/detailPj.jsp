<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

<head>
    <meta charset="UTF-8">
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <link
            href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
            rel="stylesheet">

    <link
            href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
            rel="stylesheet">
    <script
            src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
            integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
            integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
          integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        color: black;
    }

    .datepicker {
        width: 275px;
    }

    #newPj {
        width: 180px;
        height: 70px;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: 700;
        font-size: x-large;
        border-radius: 20px;
        font-family: 'Nanum Gothic', sans-serif;
    }

    .favoYellow {
        color: #f3da35;
    }

    .favoWhite {
        color: lightgray;
    }

    .colors {
        -text: white;
        margin: 20px;
        padding: 20px;
        width: 70px;
        height: 70px;
        border-radius: 10px;
        box-shadow: 0 0 2rem -1rem rgba(0, 0, 0, .05);
        transition: all 0.2s;
        color: #ffffff;
        -text: white;
        grid-row: 1/2;
        gird-column: 1/3;
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

    .detailTop {
        display: grid;
        grid-template-columns: 110px 50px 30px 1.5fr 120px;
        grid-template-rows: 50px 50px 60px;
    }

    .fa-star {
        grid-row: 1/2;
        grid-column: 2/3;
    }

#postTodo{
    height: 70%;
}
  
    .card-body {
        padding-bottom: 0px !important;
    }

    #pjDetail {
        gird-row: 2/3;
        grid-column: 2/5;
        font-family: 'Nanum Gothic', sans-serif;
        margin-top: 17px;
    }

    #pjTitle {
        grid-column: 4/5;
        grid-row: 1/2;
    }

    .btn-secondary {
        width: 120px;
        border-radius: 25px;
        grid-row: 1/3;
        grid-column: 5/6;
        height: 50px;
        line-height: 40px;
    }

    .btn-secondary, .fa-star, #pjMenu, #pjTitle {
        margin-top: 25px;
    }

    #navMenus {
        grid-row: 3/4;
        grid-column: 1/6;
    }

    .navMenu {
        padding-top: 28px;
        width: 80px;
        position: relative;
        display: inline-block;
        text-decoration: none;
        color: black;
        text-align: center;
        padding-bottom: 10px;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: bold;
        width: 80px;
    }

    .navMenu:after {
        text-align: center;
        content: "";
        position: absolute;
        bottom: -2px;
        left: 25%;
        width: 50%;
        height: 8px;
        border-radius: 50px;
        transform: scaleX(0);
        background-color: rgb(0, 0, 0);
        transition: transform .3s;
    }

    .calendar:after, .drive:after {
        text-align: center;
        content: "";
        position: absolute;
        bottom: -2px;
        left: 15%;
        width: 70%;
        height: 8px;
        border-radius: 50px;
        transform: scaleX(0);
        background-color: rgb(0, 0, 0);
        transition: transform .2s;
    }

    .clicked:after {
        transform: scaleX(1);
    }

    .navMenu:hover:after {
        transform: scaleX(1);
    }

    .body-1 {
        height: 250px;
    }

    .body-2 {
        height: 240px;
    }

    .body-3 {
        height: 100px;
        padding-top: 0px !important;
    }

    .body-4 {
        padding: 0px !important;
    }

    .card {
        border-radius: 25px !important;
        margin-bottom: 0px;
    }


    .chart {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        grid-template-rows: 100px 100px;
    }

    .taskChart {
        grid-row: 1/3;
        grid-column: 1/2;
        width: 50%;
        margin-left: 30px;
    }

    .chartDeatil {
        text-align: center;
        margin-top: 13%;
    }

    .boardTable {
        width: 100%;
        text-align: center;
        font-size: large;
    }

    .boardTable tr {
        border-bottom: 1px solid black;
        border-bottom-color: black;
        height: 80px;
    }

    .boardTable tr:hover {
        background-color: lightgray;
        transform: scale(1);
        cursor: pointer;
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

    .boardTable tr:last-child {
        border-bottom: none;
    }


    .badge {
        width: 70px;
        color: white;
    }

    #caSetting:hover, .fa-star:hover, .fa-ellipsis-v:hover, .navMenu:hover, .fa-plus:hover, .todoCalendar, .todoPerson, .switchPost, .switchSch, .switchTodo {
        cursor: pointer;
    }

    .bi-circle-fill {
        height: 50px;
    }




    .boardEnrollBtn tr td:hover {
        cursor: pointer;
        color: #6777ef;
    }

    .underline {
        text-decoration: line-through;
    }
</style>
</head>
<body>
<div class="main-content text-center">
    <div style="height: 50px;"></div>

    <div class="container text-left">

        <section class="section">
            <div class="section-body">

                <div class="row mt-sm-4">

                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-body body-1">
                                <div>
                                    <button class="btn btn-primary" id="newPj">+ 새 프로젝트</button>
                                </div>
                                <div class="detailTop">
                                    <div class="colors color-1"></div>
                                    <i class='icon fa fa-star fa-2x favoYellow'></i>
                                    <div class="btn-group dropright" id="pjMenu">
                                        <i class='fa fa-ellipsis-v fa-2x' data-toggle="dropdown"
                                           aria-haspopup="true" aria-expanded="false"
                                           style="width: 30px;"></i>
                                        <div class="dropdown-menu dropright">
                                            <a class="dropdown-item" href="#">색상 설정</a> <a
                                                class="dropdown-item" href="#">태그 설정</a> <a
                                                class="dropdown-item" href="#">참여자 조회</a> <a
                                                class="dropdown-item" href="#">프로젝트 설정</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">프젝트 나가기</a>
                                        </div>
                                    </div>
                                    <p id="pjDetail"></p>
                                    <h5 id="pjTitle">프로젝트 제목</h5>
                                    <a href="#" id="inviteBtn"
                                       class="btn btn-icon icon-left btn-secondary"><i
                                            class="far fa-user"></i> +초대하기</a>
                                    <div id="navMenus">
                                        <a class="navMenu home clicked">홈</a> <a
                                            class="navMenu calendar">캘린더</a> <a class="navMenu drive">드라이브</a>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="section-body">
                <div class="row mt-sm-4">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card h-100">
                            <div class="card-body  body-2">
                                <h5 class="text-left d-inline">업무 리포트</h5>
                                <h5 class="d-inline" style="color: gray">12</h5>
                                <div class="chart">
                                    <div class="taskChart">
                                        <canvas id="taskChart"></canvas>
                                    </div>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: #3591f3'></span>&nbsp;&nbsp;
                                        요청 4 <span style='color: #3591f3'>&nbsp;&nbsp; 40%</span>
                                    </h5>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: #35f364'></span>&nbsp;&nbsp;
                                        진행 4 <span style='color: #35f364'> &nbsp;&nbsp;40%</span>
                                    </h5>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: #f3a435'></span>&nbsp;&nbsp;
                                        업무 4 <span style='color: #f3a435'> &nbsp;&nbsp;40%</span>
                                    </h5>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: gray'></span>&nbsp;&nbsp;
                                        할 일 4 <span style='color: gray'> &nbsp;&nbsp;40%</span>
                                    </h5>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-body">
                <div class="row mt-sm-4">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card h-100">
                            <div class="card-body body-3">
                                <table class="boardEnrollBtn"
                                       style="width: 100%; height: 100%; text-align: center;">
                                    <tr>
                                        <td id="postBtn"><b><span
                                                class='bi bi-file-text fa-2x'> &nbsp;&nbsp;글</span></b></td>
                                        <td id="taskBtn"><b><span
                                                class='bi bi-list-task fa-2x'>  업무</span></b></td>
                                        <td id="schBtn"><b><span
                                                class='bi bi-calendar fa-2x'> &nbsp;&nbsp;일정</span></b></td>
                                        <td id="todoBtn"><b><span
                                                class='bi bi-check2-square fa-2x'> &nbsp;&nbsp;할 일</span></b></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="height: 50px;">
                <h1 class="section-title"
                    style="text-align: left; width: 50%; display: inline-block;">전체</h1>
                <div style="text-align: right; width: 49%; display: inline-block;">

                    <div class="btn-group dropright mt-4">
                        <img id="caSetting"
                             src="https://img.icons8.com/external-yogi-aprelliyanto-basic-outline-yogi-aprelliyanto/64/undefined/external-equalizer-multimedia-yogi-aprelliyanto-basic-outline-yogi-aprelliyanto.png"
                             style="width: 30px; margin-bottom: 36px;" data-toggle="dropdown"
                             aria-haspopup="true" aria-expanded="false"/>
                        <h4>&nbsp;&nbsp;필터</h4>
                        <div class="dropdown-menu dropright">
                            <a class="dropdown-item" href="#">전체</a>     
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">글</a> 
                            <a class="dropdown-item" href="#">업무</a> 
                            <a class="dropdown-item" href="#">일정</a>
                            <a class="dropdown-item" href="#">할 일</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="section-body">
                <div class="row mt-sm-4">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-body body-4">
                                <table class="boardTable">
                                    <c:forEach var="index" begin="1" end="2">
                                        <tr>
                                            <td style="width: 7%; text-align: right; color: #f3a435 ;"><span
                                                    class='bi bi-file-text'></span></td>
                                            <td style="width: 8%; text-align: left;">글</td>
                                            <th style="width: 40%;">제목</th>
                                            <td style="width: 12%;">작성자</td>
                                            <td style="width: 22%;">2022-06-02 01:15</td>
                                            <td>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td style="width: 7%; text-align: right; color: #35f364"><span
                                                class="bi bi-calendar"></span></td>
                                        <td style="width: 8%; text-align: left;">일정</td>
                                        <th style="width: 40%;">제목</th>
                                        <td style="width: 12%;">작성자</td>
                                        <td style="width: 22%;">2022-06-02 01:15</td>
                                        <td><b>6/10</b><br><a style="font-size: smaller">오전 10:45</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 7%; text-align: right; color: #3591f3 "><span
                                                class="bi bi-check2-square"></span></td>
                                        <td style="width: 7%; text-align: left;">할 일</td>
                                        <th style="width: 40%;">제목</th>
                                        <td style="width: 12%;">작성자</td>
                                        <td style="width: 22%;">2022-06-02 01:15</td>
                                        <td><span class="badge"
                                                  style="background-color: #3591f3 ; height: 100%; font-size: 18px; color: white;">20%</span>
                                        </td>

                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<jsp:include page="invitePjModal.jsp"></jsp:include>

<!-- 글 멘션, 일정 참석자 추가 모달창 -->
<div class="modal fade" id="mentionForModal" data-backdrop="static"
     data-keyboard="false" style="z-index: 3000;">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content row">
            <!-- modal header : 제목 -->
            <div class="modal-header">
                <span><h3 class="modal-title text-left">참석자 추가</h3></span> <span><input
                    type="image" data-dismiss="modal"
                    src="resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <form class="form" id="">
                <div class="modal-body">
                    <input type="text" class="form-control" id="memberSearching"
                           placeholder="사원명으로 검색">
                    <table class="inviteTable">
                        <c:forEach var="index" begin="1" end="5">
                            <tr>
                                <td rowspan="2"><span class='bi bi-person-circle fa-2x'></span>

                                </td>
                                <th style="width: 50%">테스트</th>
                                <td rowspan="2" style="width: 20%; text-align: right;">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input"
                                               id="schInvite${index }"> <label
                                            class="custom-control-label" for="schInvite${index }"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>부장</td>
                            </tr>

                        </c:forEach>
                    </table>
                    <br>
                </div>
                <div class="modal-footer">
                    <div class="col-lg-12 text-center">
                        <button type="submit" class="btn btn-primary btn-lg mb-3">초대</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- 할 일 담당자 선택 모달창 -->
<div class="modal fade" id="todoFor" data-backdrop="static"
     data-keyboard="false" style="z-index: 3000;">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content row">
            <!-- modal header : 제목 -->
            <div class="modal-header">
                <span><h3 class="modal-title text-left">담당자 선택</h3></span> <span><input
                    type="image" data-dismiss="modal"
                    src="resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <form class="form" id="">
                <div class="modal-body">
                    <form>


                    <input type="text" class="form-control" id="memberSearching"
                           placeholder="사원명으로 검색">
                    <table class="inviteTable">
                        <c:forEach var="index" begin="1" end="5">
                            <tr>
                                <td style="width: 20%" rowspan="2"><span class='bi bi-person-circle fa-2x'></span>

                                </td>
                                <th style="width: 40%">테스트</th>
                                <td rowspan="2" style="width: 20%; text-align: right;">
                                    <div class="col-lg-12 text-center">
                                        <button type="button" class="btn btn-primary btn-md sm-3 selectTodoFor">선택</button>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>부장</td>
                            </tr>

                        </c:forEach>
                    </table>
                    <br>
                    </form>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- 글 작성 모달창 -->
<div class="modal fade" id="boardPost" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content row">
            <!-- modal header : 제목 -->
            <div class="modal-header">
					<span><h3 class="modal-title text-left" style="color: gray;">게시물
							작성</h3></span> <span><input type="image" data-dismiss="modal" id="close"
                                                        src="resources/assets/img/close.png/"
                                                        style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->

            <div id="postForm" style="display: block;">
                <form class="form">
                    <div class="modal-body">
                        <table class="boardEnrollBtn"
                               style="width: 100%; height: 100%; text-align: center;">
                            <tr>
                                <td class="switchPost"><b><span class='bi bi-file-text fa-lg'>
												&nbsp;&nbsp;글</span></b></td>
                                <td><b><span class='bi bi-list-task fa-lg'>
												 업무</span></b></td>
                                <td class="switchSch"><b><span class='bi bi-calendar fa-lg'>
												&nbsp;&nbsp;일정</span></b></td>
                                <td class="switchTodo"><b><span class='bi bi-check2-square fa-lg'>
												&nbsp;&nbsp;할 일</span></b></td>
                            </tr>
                        </table>
                        <br> <br>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-2">제목</label>
                            <div class="col-sm-12 col-md-7 col-lg-9">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-12 col-md-3 col-lg-2">내용</label>
                            <div class="col-sm-12 col-md-7 col-lg-9">
                                <div class="" id="summernote"></div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-4 text-left">
                                <span class="bi bi-paperclip fa-2x"></span> <i
                                    class="bi bi-person fa-2x postFor"></i>
                            </div>
                            <div class="col-lg-5 text-right">
                                <button type="submit" class="btn btn-primary btn-lg mr-4">올리기</button>
                            </div>
                            <div class="col-lg-1"></div>
                        </div>
                    </div>
            </div>


            <!-- 일정 작성 모달창 -->
            <div id="postSch" style="display: block;">
                <form class="form">
                    <div class="modal-body">
                        <table class="boardEnrollBtn"
                               style="width: 100%; height: 100%; text-align: center;">
                            <tr>
                                <td class="switchPost"><b><span class='bi bi-file-text fa-lg'>
												&nbsp;&nbsp;글</span></b></td>
                                <td><b><span class='bi bi-list-task fa-lg'>
												 업무</span></b></td>
                                <td class="switchSch"><b><span class='bi bi-calendar fa-lg'>
												&nbsp;&nbsp;일정</span></b></td>
                                <td class="switchTodo"><b><span class='bi bi-check2-square fa-lg'>
												&nbsp;&nbsp;할 일</span></b></td>
                            </tr>
                        </table>
                        <br> <br>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3">제목</label>
                            <div class="col-sm-12 col-md-7">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row mb-4">

                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-calendar fa-2x"></i></label>
                            <div class="col-sm-12 col-md-7">
                                <!-- <input type="text" id="datepicker" class="form-control"> -->
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="input-sm form-control" name="start"/>
                                    <span class="input-group-addon">&nbsp;&nbsp;부터&nbsp;&nbsp;
                                    </span>
                                    <input type="text" class="input-sm form-control" name="end"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-person fa-2x"></i></label>
                            <div class="col-sm-12 col-md-7">
                                <input type="text" id="addPeople" class="form-control" placeholder="참석자 추가">
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-geo-alt-fill fa-2x"></i> </label>
                            <div class="col-sm-12 col-md-7">
                                <input type="text" class="form-control bg-white border-0 small" placeholder="장소를 입력하세요">
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-card-text fa-2x"></i> </label>
                            <div class="col-sm-12 col-md-7">
                                <textarea type="text" class="form-control bg-white border-0 small"
                                          placeholder="내용을 입력하세요"></textarea>
                            </div>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <div class="col-lg-4 text-right">
                            <button type="submit" class="btn btn-primary btn-lg">올리기</button>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </form>
            </div>


            <!-- 할 일 작성 모달창 -->
            <div id="postTodo" style="display: block;">
                <form class="form">
                    <div class="modal-body">
                        <table class="boardEnrollBtn"
                               style="width: 100%; height: 100%; text-align: center;">
                            <tr>
                                <td class="switchPost"><b><span class='bi bi-file-text fa-lg'>
												&nbsp;&nbsp;글</span></b></td>
                                <td><b><span class='bi bi-list-task fa-lg'>
												 업무</span></b></td>
                                <td class="switchSch"><b><span class='bi bi-calendar fa-lg'>
												&nbsp;&nbsp;일정</span></b></td>
                                <td class="switchTodo"><b><span class='bi bi-check2-square fa-lg'>
												&nbsp;&nbsp;할 일</span></b></td>
                            </tr>
                        </table>
                        <br> <br>
                        <div class="form-group row">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-1">제목</label>
                            <div class="col-sm-12 col-md-7 col-lg-11">
                                <input type="text" class="form-control">
                            </div>
                            <div class="col-lg-3"></div>
                        </div>

                        <div class="todos">
                            <div class="form-group row">
                                <div class="col-lg-1 pr-0 text-right">

                                </div>
                                <div class="text-md-right col-10 col-md-7 col-lg-9">
                                    <input type="text" class="form-control"
                                           placeholder="할 일 추가 / 최대 50자">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-1">
                                    <div class="input-group todoInput date" style="width: 100px;">
                                        <input type="text" style="display: none; width:25px;"
                                               class="form-control bg-white border-0 small todoDue">
                                        <span class="bi bi-calendar fa-2x mr-3 todoCalendar input-group-addon"></span>

                                    </div>

                                </div>
                                <div class="col-lg-1">
                                    <i class="bi bi-person fa-2x todoPerson"></i>
                                    <p class="todoFor" style="font-size: 11px; margin-top: 6px;"></p>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-12 text-center">
                            <i class='fa fa-plus fa-2x'></i>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <div class="col-lg-4 text-right">
                            <button type="submit" class="btn btn-primary btn-lg">올리기</button>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </form>
            </div>
            </form>
        </div>

    </div>
</div>


<!-- 게시물 조회 모달창 -->
<!-- data-backdrop="static" 속성은 모달창 주위의 배경을 클릭해도 창이 닫히지 않도록 한다. -->
<!-- data-keybaord="false" 속성은 esc키를 눌러도 창이 닫히지 않게 한다. -->
<div class="modal fade" id="boardView" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content row">
            <!-- modal header : 제목 -->
            <div class="modal-header">
                <div class="row col-12">
                    <div class="col-lg-1">
                        <div class="colors color-1 ml-2"
                             style="margin: 0px; width:20px; height:20px;">
                        </div>
                    </div>
                    <div class="col-lg-11" style="margin-top: 10px;">
                        <div><h5>프로젝트 제목</h5></div>
                    </div>
                </div>
                <span><input
                        type="image" data-dismiss="modal"
                        src="resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <div id="postView" style="display: block;">
                <form class="form" id="">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row ml-5 mr-5">
                                <div class="col-lg-10">
                                    <span class='bi bi-person-circle fa-lg'> 홍길동</span>
                                    <span style="color: gray"> 2022-06-10 09:15</span>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <a>수정 </a>
                                    <a> 삭제</a>
                                </div>

                                <br><br>

                                <div class="col-12">
                                    <h3>글 제목</h3>
                                    <hr>
                                </div>

                                <div class="col-lg-12 ml-3 mr-3">
                                    <p>글 내용</p>
                                    <p>글 내용</p>
                                    <p>글 내용</p>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <a>댓글 2 </a>
                                    <a> 조회 3</a>
                                    <hr>
                                </div>
                                <c:forEach begin="1" end="3">
                                    <div class="col-lg-10">
                                        <span class='bi bi-person-circle fa-lg'> 홍길동</span>
                                        <span style="color: gray"> 2022-06-10 09:15</span>
                                    </div>
                                    <div class="col-lg-2 text-right">
                                        <a>수정 </a>
                                        <a> 삭제</a>
                                        <br> <br>
                                    </div>
                                    <div class="col-lg-10">
                                        <a class="ml-4">댓글 내용</a>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-12">
                                        <hr>
                                    </div>

                                </c:forEach>

                                <label
                                        class="col-form-label col-lg-1 pt-0">
                                    <span class='bi bi-person-circle fa-2x'></span>
                                </label>
                                <div class="col-lg-9 text-center">
                                    <input type="text" class="form-control">
                                </div>
                                <div class="col-lg-2 text-right">
                                    <button type="submit" class="btn btn-primary btn-lg">등록</button>
                                </div>
                            </div>


                        </div>
                    </div>
                </form>
            </div>


            <div id="schView" style="display: block;">
                <form class="form" id="">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row ml-5 mr-5">
                                <div class="col-lg-10">
                                    <span class='bi bi-person-circle fa-lg'> 홍길동</span>
                                    <span style="color: gray"> 2022-06-10 09:15</span>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <a>수정 </a>
                                    <a> 삭제</a>
                                </div>

                                <br><br>

                                <div class="col-12">
                                    <h3>일정 제목</h3>
                                    <br>
                                    <span class='bi bi-calendar fa-lg ml-3'> &nbsp;&nbsp;2022-06-01(일) 15:30 ~ 2022-06-02(월) 12:30</span>
                                    <hr>
                                </div>

                                <div class="col-lg-12 ml-3 mr-3">
                                    <i class="bi bi-person fa-lg"></i> &nbsp;&nbsp; <b style="color: #5cb85c">참석 1</b>
                                    &nbsp;&nbsp;<b style="color: #ac2925"> 불참 3</b>
                                    &nbsp;&nbsp; <a style="border-bottom: 1px black solid" class="viewAttendee"> 참석자 조회</a>
                                    <br><br><br>
                                </div>
                                <div class="col-lg-12 ml-3 mr-3">
                                    <i class="bi bi-geo-alt-fill fa-lg"></i>
                                    &nbsp;&nbsp;<span>장소명</span>
                                    <br><br><br>
                                </div>
                                <div class="col-lg-12 ml-3 mr-3">
                                    <i class="bi bi-card-text fa-lg"></i>
                                    &nbsp;&nbsp;<span> 내용</span>
                                    <br>
                                    <hr>
                                </div>
                                <div class="col-lg-12 text-center">
                                    <button type="button" class="btn btn-success btn-lg mr-3">참석</button>
                                    <button type="button" class="btn btn-danger btn-lg ml-3">불참</button>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <a>댓글 2 </a>
                                    <a> 조회 3</a>
                                    <hr>
                                </div>
                                <c:forEach begin="1" end="3">
                                    <div class="col-lg-10">
                                        <span class='bi bi-person-circle fa-lg'> 홍길동</span>
                                        <span style="color: gray"> 2022-06-10 09:15</span>
                                    </div>
                                    <div class="col-lg-2 text-right">
                                        <a>수정 </a>
                                        <a> 삭제</a>
                                        <br> <br>
                                    </div>
                                    <div class="col-lg-10">
                                        <a class="ml-4">댓글 내용</a>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-12">
                                        <hr>
                                    </div>

                                </c:forEach>

                                <label
                                        class="col-form-label col-lg-1 pt-0">
                                    <span class='bi bi-person-circle fa-2x'></span>
                                </label>
                                <div class="col-lg-9 text-center">
                                    <input type="text" class="form-control">
                                </div>
                                <div class="col-lg-2 text-right">
                                    <button type="submit" class="btn btn-primary btn-lg">등록</button>
                                </div>
                            </div>


                        </div>
                    </div>
                </form>
            </div>


            <div id="todoView" style="display: block;">
                <form class="form" id="">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row ml-5 mr-5">
                                <div class="col-lg-10">
                                    <span class='bi bi-person-circle fa-lg'> 홍길동</span>
                                    <span style="color: gray"> 2022-06-10 09:15</span>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <a>수정 </a>
                                    <a> 삭제</a>
                                </div>

                                <br><br>

                                <div class="col-12">
                                    <h3>할 일 제목</h3>
                                    <hr>
                                </div>

                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-lg-6"><h5 style="display: inline-block">1 &nbsp; </h5><h5
                                                style="display: inline-block; color: gray"> / 2</h5></div>
                                        <div class="col-lg-6 text-right"><h5 style="color: #5cb85c">50%</h5></div>
                                    </div>
                                    <div class="progress mb-3" data-height="25">
                                        <div class="progress-bar bg-success" role="progressbar" data-width="25%"
                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <br><br>
                                    <c:forEach var="index" begin="1" end="5">
                                        <div class="row">
                                            <div class="col-1">
                                                <input type="checkbox" class="ckedInput"
                                                       style="margin-left: 10px; width: 20px; height: 20px;">
                                            </div>
                                            <div class="col-9 text-center">
                                                <b class="ckedTodo">할 일 1</b>
                                            </div>
                                            <div class="col-2">
                                                <span>담당자 1</span>
                                            </div>
                                        </div>
                                        <hr>
                                    </c:forEach>
                                    <br><br>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <a>댓글 2 </a>
                                    <a> 조회 3</a>
                                    <hr>
                                </div>
                                <c:forEach begin="1" end="3">
                                    <div class="col-lg-10">
                                        <span class='bi bi-person-circle fa-lg'> 홍길동</span>
                                        <span style="color: gray"> 2022-06-10 09:15</span>
                                    </div>
                                    <div class="col-lg-2 text-right">
                                        <a>수정 </a>
                                        <a> 삭제</a>
                                        <br> <br>
                                    </div>
                                    <div class="col-lg-10">
                                        <a class="ml-4">댓글 내용</a>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-12">
                                        <hr>
                                    </div>

                                </c:forEach>

                                <label
                                        class="col-form-label col-lg-1 pt-0">
                                    <span class='bi bi-person-circle fa-2x'></span>
                                </label>
                                <div class="col-lg-9 text-center">
                                    <input type="text" class="form-control">
                                </div>
                                <div class="col-lg-2 text-right">
                                    <button type="submit" class="btn btn-primary btn-lg">등록</button>
                                </div>
                            </div>


                        </div>
                    </div>
                </form>
            </div>


        </div>
    </div>
</div>


<script>
    $(function () {


        $(document).on('click', '.fa-star', function (){
            if ($(this).hasClass("favoWhite")) {
                $(this).removeClass("favoWhite")
                $(this).addClass("favoYellow")
                console.log("즐겨찾기 추가할것")
            } else if ($(this).hasClass("favoYellow")) {
                $(this).removeClass("favoYellow")
                $(this).addClass("favoWhite")
                console.log("즐겨찾기 제거할것")
            }
            e.stopPropagation()
        })


        $(document).on('click', '#inviteBtn', function (){
            $("#inviteModal").modal("show")

        })

        $(document).on('click', '.postFor', function (){
            $("#mentionForModal").modal("show")

        })

        $('#boardPost').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset();
            $(this).find('form')[1].reset();
            $(this).find('form')[2].reset();
        })

        $(document).on('click', '#postBtn', function (){
            $("#postForm").css("display", "block")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "none")
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "#6777ef")
            $("#boardPost").modal("show")
        })

        $(document).on('click', '#schBtn', function (){
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "block")
            $("#postTodo").css("display", "none")
            $(".switchSch").css("color", "#6777ef")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "black")
            $("#boardPost").modal("show")
        })


        $(document).on('click', '#todoBtn', function (){
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "block")
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "#6777ef")
            $(".switchPost").css("color", "black")
            $("#boardPost").modal("show")
        })

        $(document).on('click', '.ckedInput', function (){
            if ($(this).is(":checked")) {
                $(this).parent().next().children(".ckedTodo").addClass("underline")
            } else {
                $(this).parent().next().children(".ckedTodo").removeClass("underline")
            }
        })

        $(document).on('click', '.switchPost', function (){
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "#6777ef")
            $("#postForm").css("display", "block")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "none")

        })

        $(document).on('click', '.switchSch', function (){
            $(".switchSch").css("color", "#6777ef")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "black")
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "block")
            $("#postTodo").css("display", "none")
        })

        $(document).on('click', '.switchTodo', function (){
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "#6777ef")
            $(".switchPost").css("color", "black")
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "block")

        })

        $(document).on('click', '.boardTable tbody tr', function (){
            $("#boardView").modal("show")

        })




        $(".fa-plus").click(function () {
            $(".todos").append(

                '<div class="form-group row">'+
                '<div class="col-lg-1 pr-0 text-right">'+
                '<i class="bi bi-x fa-2x" style="color: red; padding-right: 0px;"></i>'+
                '</div>'+
                '<div class="text-md-right col-10 col-md-7 col-lg-9">'+
                '<input type="text" class="form-control"'+
                'placeholder="할 일 추가 / 최대 50자">'+
                '</div>'+
                '<div class="col-sm-12 col-md-3 col-lg-1">'+
                '<div class="input-group todoInput date" style="width: 100px;">'+
                '<input type="text" style="display: none; width:25px;"'+
                'class="form-control bg-white border-0 small todoDue">'+
                '<span class="bi bi-calendar fa-2x mr-3 todoCalendar input-group-addon"></span>'+
                '</div>'+
                '</div>'+
                '<div class="col-lg-1">'+
                '<i class="bi bi-person fa-2x todoPerson"></i>'+
                '<p class="todoFor" style="font-size: 11px; margin-top: 6px;"></p>'+
                '</div>'+
                '</div>'
            )
            $('.todoInput').datepicker({
                format: "mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                autoclose: true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                clearBtn: true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
                daysOfWeekHighlighted: [0], //강조 되어야 하는 요일 설정
                disableTouchKeyboard: false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
                templates: {
                    leftArrow: '&laquo;',
                    rightArrow: '&raquo;'
                }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
                showWeekDays: true,// 위에 요일 보여주는 옵션 기본값 : true
                todayHighlight: true,	//오늘 날짜에 하이라이팅 기능 기본값 :false
                weekStart: 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
                language: "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

            })


            $(document).on('change', '.todoDue', function (){
                console.log($(this).val())
                if ($(this).val() != "") {
                    $(this).css("display", "block")
                    $(this).next().css("display", "none")
                }
            })

            $('.todoInput').datepicker().on("clearDate", function (e) {
                console.log(e.currentTarget)
                var $test = e.currentTarget;
                $($test).children(".todoCalendar").css("display", "block")
                $($test).children(".todoDue").css("display", "none")

            })

        })


        $('#datepicker').datepicker({
            format: "mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
            autoclose: true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
            clearBtn: true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
            daysOfWeekHighlighted: [0], //강조 되어야 하는 요일 설정
            disableTouchKeyboard: false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
            templates: {
                leftArrow: '&laquo;',
                rightArrow: '&raquo;'
            }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
            showWeekDays: true,// 위에 요일 보여주는 옵션 기본값 : true
            todayHighlight: true,	//오늘 날짜에 하이라이팅 기능 기본값 :false
            weekStart: 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
            language: "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

        })
        $('.todoInput').datepicker({
            format: "mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
            autoclose: true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
            clearBtn: true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
            daysOfWeekHighlighted: [0], //강조 되어야 하는 요일 설정
            disableTouchKeyboard: false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
            templates: {
                leftArrow: '&laquo;',
                rightArrow: '&raquo;'
            }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
            showWeekDays: true,// 위에 요일 보여주는 옵션 기본값 : true
            todayHighlight: true,	//오늘 날짜에 하이라이팅 기능 기본값 :false
            weekStart: 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
            language: "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

        })




        $(document).on('change', '.todoDue', function (){
            console.log($(this).val())
            if ($(this).val() != "") {
                $(this).css("display", "block")
                $(this).next().css("display", "none")
                }
        })


        $('.todoInput').datepicker().on("clearDate", function (e) {
            console.log(e.currentTarget)
            var $test = e.currentTarget;
            $($test).children(".todoCalendar").css("display", "block")
            $($test).children(".todoDue").css("display", "none")

        })

        $("#close").click(function (){
            console.log("진입확인")
            $(".todos").html(

                '<div class="form-group row">'+
                '<div class="col-lg-1 pr-0 text-right">'+
                '</div>'+
                '<div class="text-md-right col-10 col-md-7 col-lg-9">'+
                '<input type="text" class="form-control"'+
                'placeholder="할 일 추가 / 최대 50자">'+
                '</div>'+
                '<div class="col-sm-12 col-md-3 col-lg-1">'+
                '<div class="input-group todoInput date" style="width: 100px;">'+
                '<input type="text" style="display: none; width:25px;"'+
                'class="form-control bg-white border-0 small todoDue">'+
                '<span class="bi bi-calendar fa-2x mr-3 todoCalendar input-group-addon"></span>'+
                '</div>'+
                '</div>'+
                '<div class="col-lg-1">'+
                '<i class="bi bi-person fa-2x todoPerson"></i>'+
                '<p class="todoFor" style="font-size: 11px; margin-top: 6px;"></p>'+
                '</div>'+
                '</div>'
        )
            $('.todoInput').datepicker({
                format: "mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                autoclose: true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                clearBtn: true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
                daysOfWeekHighlighted: [0], //강조 되어야 하는 요일 설정
                disableTouchKeyboard: false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
                templates: {
                    leftArrow: '&laquo;',
                    rightArrow: '&raquo;'
                }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
                showWeekDays: true,// 위에 요일 보여주는 옵션 기본값 : true
                todayHighlight: true,	//오늘 날짜에 하이라이팅 기능 기본값 :false
                weekStart: 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
                language: "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.


        })
            $(".todoDue").change(function () {
                console.log($(this).val())
                if ($(this).val() != "") {
                    $(this).css("display", "block")
                    $(this).next().css("display", "none")

                }
            })
            $('.todoInput').datepicker().on("clearDate", function (e) {
                console.log(e.currentTarget)
                var $test = e.currentTarget;
                $($test).children(".todoCalendar").css("display", "block")
                $($test).children(".todoDue").css("display", "none")

            })
        })

		
        $(document).on('click', '#addPeople', function (){
            $("#mentionForModal").modal("show")
        })
        
         $(document).on('click', '.viewAttendee', function (){
            $("#mentionForModal").modal("show")
        })
        
        $(document).on('click', '.calendar', function (){
            location.href="/detailCalendar.do"
        })
        $(document).on('click', '.drive', function (){
            location.href="/drivePj.do"
        })

        $(document).on('click', '.todoPerson', function (){
            var $forRemove = $(this)
            var $todo = $(this).next()
            $("#todoFor").modal("show")
            $(".selectTodoFor").click(function () {
                console.log($todo)
                console.log($(this))
                $todo.html('테스트')
                $forRemove.remove()
            })
        })

        $(document).on('click', '.todoFor', function (){
            $(this).parent().html(' <i class="bi bi-person fa-2x todoPerson"></i>' +
            		 '<p class="todoFor" style="font-size: 11px; margin-top: 6px;"></p>'
            )
        })

        $(document).on('click', '.bi-x', function (){
            $(this).parent().parent().remove()
        })


    })
</script>
<script type="text/javascript">
    var sum = Number("{{sum}}");

    // Pie Chart Example
    var ctx = document.getElementById("taskChart");
    var myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["요청", "진행", "완료", "보류"],
            datasets: [{
                data: [sum, 50, 20],
                backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
                hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
                hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
        },

        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
            },
            legend: {
                display: false
            },
            cutoutPercentage: 70,
        },
    });
    Chart.pluginService
        .register({
            beforeDraw: function (chart) {
                var width = chart.chart.width, height = chart.chart.height, ctx = chart.chart.ctx;
                ctx.restore();
                var fontSize = (height / 114).toFixed(2);
                ctx.font = fontSize + "2em sans-serif";
                ctx.textBaseline = "middle";
                var text = "12", textX = Math.round((width - ctx
                    .measureText(text).width) / 2), textY = height / 2;
                ctx.fillText(text, textX, textY);
                ctx.save();
            }
        });
</script>
<script>
    $(function () {
        $('#summernote').summernote({
            placeholder: '내용을 입력해주세요',
            tabsize: 2,
            height: 300,
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline']],
                ['color', ['color']],
                ['ul', 'ol', 'paragraph'],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
            ]
        });
    })
</script>
</body>
</body>
</html>