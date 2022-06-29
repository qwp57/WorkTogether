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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"
            integrity="sha512-x/vqovXY/Q4b+rNjgiheBsA/vbWA3IVvsS8lkQSX1gQ4ggSJx38oI2vREZXpTzhAv6tNUaX81E7QBBzkpDQayA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/locale/ko.min.js"
            integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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

    .newPj {
        color: white !important;
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

    .favoBtn {
        grid-row: 1/2;
        grid-column: 2/3;
    }

    #postTodo {
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

    .btn-secondary, .favoBtn, #pjMenu, #pjTitle {
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

    #caSetting, .favoBtn, .navMenu, .fa-plus, .todoCalendar, .todoPerson,
    .switchPost, .switchSch, .switchTodo, disconnectingTagBtn, .fileUploadBtn, .postFor, .removeTodo, .boardDeleteBtn, #postEditBtn, .editReplyBtn, .deleteReplyBtn {
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
                                    <button class="btn btn-primary newPj">+ 새 프로젝트</button>
                                </div>
                                <div class="detailTop">
                                    <div class="colors ${pjMember.pj_color}"></div>
                                    <i class='icon fa fa-star fa-2x favoBtn <c:choose><c:when test="${checkBookmark > 0}">favoYellow</c:when><c:otherwise>favoWhite</c:otherwise></c:choose>'></i>
                                    <div class="btn-group dropright" id="pjMenu">
                                        <i class='fa fa-ellipsis-v fa-2x' data-toggle="dropdown"
                                           aria-haspopup="true" aria-expanded="false"
                                           style="width: 30px;"></i>
                                        <div class="dropdown-menu dropright">
                                            <a class="dropdown-item" href="#" id="setColor">색상 설정</a>
                                            <a class="dropdown-item" href="#" id="tagSettingBtn">태그 설정</a>
                                            <a class="dropdown-item" href="#" id="viewEmpInPj">참여자 조회</a>
                                            <c:if test="${pjMember.admin == 'Y'}">
                                                <a class="dropdown-item" href="#" id="setPj">프로젝트 설정</a>
                                            </c:if>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#" id="quitProject">프로젝트 나가기</a>
                                        </div>
                                    </div>
                                    <p id="pjDetail">${pj.pj_content}</p>
                                    <h5 id="pjTitle">${pj.pj_title}</h5>
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
                                <h5 id="totalRw" class="d-inline" style="color: gray"></h5>
                                <div class="chart">
                                    <div class="taskChart">
                                        <canvas id="taskChart"></canvas>
                                    </div>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: #4e73df'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                        <span id="beforeRw"></span>
                                        &nbsp;
                                        <span id="beforeRwPercent" style='color: #4e73df'></span>
                                    </h5>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: #1cc88a'>&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;
                                        <span id="whileRw"></span>
                                        &nbsp;
                                        <span id="whileRwPercent" style='color: #1cc88a'></span>
                                    </h5>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: #f3a435'>&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;
                                        <span id="completeRw"></span>
                                        &nbsp;
                                        <span id="completeRwPercent" style='color: #f3a435'></span>
                                    </h5>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: gray'>&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;
                                        <span id="keepRw"></span>
                                        &nbsp;
                                        <span id="keepRwPercent" style='color: gray'></span>
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
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-body">
                <div class="row mt-sm-4 ">
                    <div class="col-md-12 col-lg-12" style="margin-left: 450px;">

                        <div class="buttons">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination text-center">
                                    <li class="page-item"><a class="page-link" href="#"
                                                             aria-label="Previous"> <span
                                            aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">이전</span>
                                    </a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#"
                                                             aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">다음</span>
                                    </a></li>
                                </ul>
                            </nav>
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
     data-keyboard="false" style="z-index: 13000;">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content row">
            <!-- modal header : 제목 -->
            <div class="modal-header">
                <span><h3 class="modal-title text-left">사원 추가</h3></span> <span><input
                    type="image" data-dismiss="modal"
                    src="/resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <form class="form">
                <div class="modal-body">
                    <input type="text" class="form-control searchEmpByName" placeholder="사원명으로 검색">
                    <table class="inviteTable">
                    </table>
                    <br>
                </div>
                <div class="modal-footer">
                    <div class="col-lg-12 text-center">
                        <button type="button" id="addEmpBtn" class="btn btn-primary btn-lg mb-3">추가</button>
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
                    src="/resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <form class="form">
                <div class="modal-body">
                    <form>
                        <input type="text" class="form-control" id="memberSearching"
                               placeholder="사원명으로 검색">
                        <table class="inviteTable">
                        </table>
                        <br>
                    </form>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 참여자 조회 모달창 -->
<div class="modal fade" id="empListModal" data-backdrop="static"
     data-keyboard="false" style="z-index: 3000;">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content row">
            <!-- modal header : 제목 -->
            <div class="modal-header">
                <span><h3 class="modal-title text-left">참여자 조회</h3></span> <span><input
                    type="image" data-dismiss="modal"
                    src="/resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <form class="form">
                <div class="modal-body">
                    <form>
                        <input type="text" class="form-control memberSearching" placeholder="사원명으로 검색">
                        <table class="inviteTable">
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
					<span><h3 class="modal-title text-left boardNoti" style="color: gray;">게시물
							작성</h3></span> <span><input type="image" data-dismiss="modal" id="close"
                                                        src="/resources/assets/img/close.png/"
                                                        style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->

            <div id="postForm" style="display: block;">
                <form class="form boardUploadForm" id="enrollPost" action="/post/insertPost.do" method="post"
                      enctype="multipart/form-data">
                    <div class="modal-body">
                        <table class="boardEnrollBtn" style="width: 100%; height: 100%; text-align: center;">
                            <tr>
                                <td class="switchPost"><b><span class='bi bi-file-text fa-lg'>
												&nbsp;&nbsp;글</span></b></td>
                                <td class="switchSch"><b><span class='bi bi-calendar fa-lg'>
												&nbsp;&nbsp;일정</span></b></td>
                                <td class="switchTodo"><b><span class='bi bi-check2-square fa-lg'>
												&nbsp;&nbsp;할 일</span></b></td>
                            </tr>
                        </table>
                        <br> <br>
                        <div class="form-group row mb-4">
                            <input type="hidden" name="pj_no" value="${pj.pj_no}">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-2">제목</label>
                            <div class="col-sm-12 col-md-7 col-lg-9">
                                <input type="text" name="post_title" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-12 col-md-3 col-lg-2">내용</label>
                            <div class="col-sm-12 col-md-7 col-lg-9">
                                <textarea name="post_content" id="summernote"></textarea>
                            </div>
                        </div>

                        <div class="modal-footer row">
                            <div class="col-lg-10 center">
                                <div id="todoForArea"></div>
                            </div>
                            <div class="col-lg-1"></div>
                            <div class="col-lg-5 text-left">
                                <input type="text" class="form-control" id="file-label"
                                       style="display: none; border: 0px white;">
                                <span class="bi bi-paperclip fa-2x fileUploadBtn"></span>
                                <input type="file" name="upload_file" id="upload-file" hidden>
                                <i class="bi bi-person fa-2x postFor"></i>
                            </div>
                            <div class="col-lg-4 text-right">
                                <button type="submit" class="btn btn-primary btn-lg mr-4 boardUploadBtn">올리기</button>
                            </div>
                            <div class="col-lg-1"></div>
                        </div>
                    </div>
                </form>
            </div>


            <!-- 일정 작성 모달창 -->
            <div id="postSch" style="display: block;">
                <form class="form boardUploadForm" id="enrollSch" action="/schedule/insertSch.do" method="post">
                    <div class="modal-body">
                        <table class="boardEnrollBtn"
                               style="width: 100%; height: 100%; text-align: center;">
                            <tr>
                                <td class="switchPost"><b><span class='bi bi-file-text fa-lg'>
												&nbsp;&nbsp;글</span></b></td>
                                <td class="switchSch"><b><span class='bi bi-calendar fa-lg'>
												&nbsp;&nbsp;일정</span></b></td>
                                <td class="switchTodo"><b><span class='bi bi-check2-square fa-lg'>
												&nbsp;&nbsp;할 일</span></b></td>
                            </tr>
                        </table>
                        <br> <br>
                        <div class="form-group row mb-4">
                            <input type="hidden" name="pj_no" value="${pj.pj_no}">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3">제목</label>
                            <div class="col-sm-12 col-md-7">
                                <input type="text" class="form-control" name="sch_title">
                            </div>
                        </div>
                        <div class="form-group row mb-4">

                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-calendar fa-2x"></i></label>
                            <div class="col-sm-12 col-md-7">
                                <!-- <input type="text" id="datepicker" class="form-control"> -->
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="input-sm form-control" name="sch_start"/>
                                    <span class="input-group-addon">&nbsp;&nbsp;부터&nbsp;&nbsp;
                                    </span>
                                    <input type="text" class="input-sm form-control" name="sch_end"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-person fa-2x"></i></label>
                            <div class="col-sm-12 col-md-7">
                                <input type="text" id="addPeople" class="form-control" placeholder="참석자 추가"
                                       name="sch_attendee">
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-geo-alt-fill fa-2x"></i> </label>
                            <div class="col-sm-12 col-md-7">
                                <input type="text" class="form-control bg-white border-0 small" name="sch_place"
                                       placeholder="장소를 입력하세요">
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-card-text fa-2x"></i> </label>
                            <div class="col-sm-12 col-md-7">
                                <textarea type="text" class="form-control bg-white border-0 small"
                                          placeholder="내용을 입력하세요" name="sch_content"></textarea>
                            </div>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <div class="col-lg-4 text-right">
                            <button type="submit" class="btn btn-primary btn-lg boardUploadBtn">올리기</button>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </form>
            </div>


            <!-- 할 일 작성 모달창 -->
            <div id="postTodo" style="display: block;">
                <form class="form boardUploadForm" id="enrollTodo" action="/todo/insertTodo.do" method="post">
                    <div class="modal-body">
                        <table class="boardEnrollBtn"
                               style="width: 100%; height: 100%; text-align: center;">
                            <tr>
                                <td class="switchPost"><b><span class='bi bi-file-text fa-lg'>
												&nbsp;&nbsp;글</span></b></td>
                                <td class="switchSch"><b><span class='bi bi-calendar fa-lg'>
												&nbsp;&nbsp;일정</span></b></td>
                                <td class="switchTodo"><b><span class='bi bi-check2-square fa-lg'>
												&nbsp;&nbsp;할 일</span></b></td>
                            </tr>
                        </table>
                        <br> <br>
                        <div class="form-group row">
                            <input type="hidden" name="pj_no" value="${pj.pj_no}">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-1">제목</label>
                            <div class="col-sm-12 col-md-7 col-lg-11">
                                <input type="text" class="form-control" name="todo_title">
                            </div>
                            <div class="col-lg-3"></div>
                        </div>

                        <div class="todos">
                            <div class="form-group row">
                                <div class="col-lg-1 pr-0 text-right">

                                </div>
                                <div class="text-md-right col-10 col-md-7 col-lg-9">
                                    <input type="text" class="form-control" name="todo_content"
                                           placeholder="할 일 추가 / 최대 50자">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-1">
                                    <div class="input-group todoInput date" style="width: 100px;">
                                        <input type="text" style="display: none; width:25px;"
                                               class="form-control bg-white border-0 small todoDue" name="todo_end">
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
                            <button type="submit" class="btn btn-primary btn-lg boardUploadBtn">올리기</button>
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
                        <div class="colors ${pjMember.pj_color} ml-2"
                             style="margin: 0px; width:20px; height:20px;">
                        </div>
                    </div>
                    <div class="col-lg-11" style="margin-top: 10px;">
                        <div><h5>${pj.pj_title}</h5></div>
                    </div>
                </div>
                <span><input
                        type="image" data-dismiss="modal"
                        src="/resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <div id="postView" style="display: block;">
                <form class="form">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row ml-5 mr-5 boardBody">
                                <div class="col-lg-10">
                                    <span class='bi bi-person-circle fa-lg' id="postWriter"></span>
                                    <span style="color: gray" id="postUploadDate"></span>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <input class="detailViewBoard_no" type="text" hidden>
                                    <a id="postEditBtn">수정&nbsp;</a>
                                    <a class="boardDeleteBtn">&nbsp;삭제</a>
                                </div>

                                <br><br>

                                <div class="col-12">
                                    <h3 id="postTitle"></h3>
                                    <hr>
                                </div>

                                <div class="col-lg-12 ml-3 mr-3" id="postContent">
                                </div>
                                <div class="col-lg-12 text-right">
                                    <a class="replyCount"></a>
                                    <a class="viewCount"></a>
                                    <hr>
                                </div>
                                <div class="replyArea col-lg-12">

                                </div>
                                <div class="col-lg-12 replyHrArea" style="display: none;">
                                    <hr>
                                </div>


                                <label
                                        class="col-form-label col-lg-1 pt-0">
                                    <span class='bi bi-person-circle fa-2x'></span>
                                </label>
                                <div class="col-lg-9 text-center">
                                    <input type="text" class="form-control replyContentEnroll">
                                </div>
                                <div class="col-lg-2 text-right">
                                    <button type="button" class="btn btn-primary btn-lg addReplyBtn">등록</button>
                                </div>
                            </div>


                        </div>
                    </div>
                </form>
            </div>


            <div id="schView" style="display: block;">
                <form class="form">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row ml-5 mr-5 boardBody">
                                <div class="col-lg-10">
                                    <span class='bi bi-person-circle fa-lg' id="schWriter"></span>
                                    <span style="color: gray" id="schUploadDate"></span>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <input class="detailViewBoard_no" type="text" hidden>
                                    <a id="schEditBtn">수정&nbsp;</a>
                                    <a class="boardDeleteBtn">&nbsp;삭제</a>
                                </div>

                                <br><br>

                                <div class="col-12">
                                    <h3 id="schTitle"></h3>
                                    <br>
                                    <span class='bi bi-calendar fa-lg ml-3' id="schDate"></span>
                                    <hr>
                                </div>

                                <div class="col-lg-12 ml-3 mr-3">
                                    <i class="bi bi-person fa-lg"></i> &nbsp;&nbsp; <b style="color: #5cb85c">참석 1</b>
                                    &nbsp;&nbsp;<b style="color: #ac2925"> 불참 3</b>
                                    &nbsp;&nbsp; <a style="border-bottom: 1px black solid" class="viewAttendee"> 참석자
                                    조회</a>
                                    <br><br><br>
                                </div>
                                <div class="col-lg-12 ml-3 mr-3">
                                    <i class="bi bi-geo-alt-fill fa-lg"></i>
                                    &nbsp;&nbsp;<span id="schPlace"></span>
                                    <br><br><br>
                                </div>
                                <div class="col-lg-12 ml-3 mr-3">
                                    <i class="bi bi-card-text fa-lg"></i>
                                    &nbsp;&nbsp;<span id="schContent"></span>
                                    <br>
                                    <hr>
                                </div>
                                <div class="col-lg-12 text-center">
                                    <button type="button" class="btn btn-success btn-lg mr-3">참석</button>
                                    <button type="button" class="btn btn-danger btn-lg ml-3">불참</button>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <a class="replyCount"></a>
                                    <a class="viewCount"></a>
                                    <hr>
                                </div>
                                <div class="replyArea col-lg-12">

                                </div>
                                <div class="col-lg-12 replyHrArea" style="display: none;">
                                    <hr>
                                </div>
                                <label
                                        class="col-form-label col-lg-1 pt-0">
                                    <span class='bi bi-person-circle fa-2x'></span>
                                </label>
                                <div class="col-lg-9 text-center">
                                    <input type="text" class="form-control replyContentEnroll">
                                </div>
                                <div class="col-lg-2 text-right">
                                    <button type="button" class="btn btn-primary btn-lg addReplyBtn">등록</button>
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
                            <div class="row ml-5 mr-5 boardBody">
                                <div class="col-lg-10">
                                    <span class='bi bi-person-circle fa-lg' id="todoWriter"></span>
                                    <span style="color: gray" id="todoUploadDate"></span>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <input class="detailViewBoard_no" type="text" hidden>
                                    <a id="todoEditBtn">수정&nbsp;</a>
                                    <a class="boardDeleteBtn">&nbsp;삭제</a>
                                </div>

                                <br><br>

                                <div class="col-12">
                                    <h3 id="todoTitle"></h3>
                                    <hr>
                                </div>

                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-lg-6"><h5 style="display: inline-block" id="todoCompleteCount">1
                                            &nbsp; </h5><h5
                                                style="display: inline-block; color: gray" id="todoTotalCount"></h5>
                                        </div>
                                        <div class="col-lg-6 text-right"><h5 style="color: #5cb85c"
                                                                             id="todoCompletePercent"></h5></div>
                                    </div>
                                    <div class="progress mb-3" data-height="25">
                                        <div class="progress-bar bg-success" role="progressbar" id="todoBar"
                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <br><br>
                                    <div id="todos">

                                    </div>
                                    <hr>
                                    <br><br>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <a class="replyCount"></a>
                                    <a class="viewCount"></a>
                                    <hr>
                                </div>
                                <div class="replyArea col-lg-12">

                                </div>
                                <div class="col-lg-12 replyHrArea" style="display: none;">
                                    <hr>
                                </div>

                                <label
                                        class="col-form-label col-lg-1 pt-0">
                                    <span class='bi bi-person-circle fa-2x'></span>
                                </label>
                                <div class="col-lg-9 text-center">
                                    <input type="text" class="form-control replyContentEnroll">
                                </div>
                                <div class="col-lg-2 text-right">
                                    <button type="button" class="btn btn-primary btn-lg addReplyBtn">등록</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<jsp:include page="colorTagModal.jsp"/>
<jsp:include page="pjForm.jsp"/>
<script>
    $(document).on('change', '.todoDue', function () {
        console.log($(this).val())
        if ($(this).val() != "") {
            $(this).css("display", "block")
            $(this).next().css("display", "none")
        }
    })

    $(document).on('click', '.addReplyBtn', function () {
        if (${pj.reply_power == 'Y'} &&
        ${pjMember.admin == 'N'})
        {
            alert("관리자만 작성할 수 있습니다.")
            return false
        }
        var reply_content = $(this).parents(".boardBody").find(".replyContentEnroll")
        var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no")
        console.log(reply_content)
        console.log(board_no.val())
        $.ajax({
            url: '/project/insertReply.do',
            data: {
                "reply_content": reply_content.val(),
                "board_no": board_no.val()
            },
            success: function (data) {
                //console.log(data)
                $(".replyContentEnroll").val("")
                loadReply(board_no.val())
            }
        })
    })

    $(document).on('click', '.deleteReplyBtn', function () {
        if (confirm("댓글을 삭제하시겠습니까?")) {
            //console.log($(this).parent().find(".reply_no").val())
            var reply_no = $(this).parent().find(".reply_no").val()
            var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
            //console.log(board_no)
            deleteReply(reply_no, board_no)
        }
    })
    $(document).on('click', '.editReplyBtn', function () {
        var reply_no = $(this).parent().find(".reply_no").val()
        var reply_content = $(this).parents(".reply").find(".replyContent").text()
        $(this).parents(".reply").find(".replyContent").html(
            '<input type=text style="width: 80%;" class="replyEditContent" value="' + reply_content + '">' +
            '<button type="button" class="replyEditSubmit btn btn-primary");">수정</button>' +
            '<input type="hidden" value="' + reply_no + '">'
        )
        $(this).parent().remove()


    })
    $(document).on('click', '.replyEditSubmit', function () {
        //console.log($(this).next().val())
        $.ajax({
            url: '/project/editReply.do',
            data: {
                "reply_no": $(this).next().val(),
                "reply_content": $(this).prev().val()
            },
            async: false,
            success: function (data) {
                console.log('dd')
            }
        })
        loadReply($(".detailViewBoard_no").val())
    })

    $(document).on('click', '.fileUploadBtn', function () {
        $('#upload-file').click()
    })

    $(document).on('click', '#file-label', function () {
        //console.log('변경')
        $('#upload-file').val("")
        $("#file-label").css("display", "none")
    })

    $(document).on('change', '#upload-file', function () {
        if (window.FileReader) {  // modern browser
            var filename = $(this)[0].files[0].name;

        } else {  // old IE
            var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
        }

        // 추출한 파일명 삽입
        $("#file-label").val(filename);
        $("#file-label").css("display", "block")
    });

    $(document).on('click', '#quitProject', function () {
        if (confirm("프로젝트를 나가시겠습니까?")) {
            location.href = "/project/quitProject.do?pj_no=" +
            ${pj.pj_no}
        }
    })

    $(document).on('click', '#deletePjBtn', function () {
        if (confirm("프로젝트를 삭제하시겠습니까?")) {
            location.href = "/project/deleteProject.do?pj_no=" +
            ${pj.pj_no}
        }
    })

    $(document).on('click', '#keepPjBtn', function () {
        if (confirm("프로젝트를 보관하시겠습니까?")) {
            location.href = "/project/keepProject.do?pj_no=" +
            ${pj.pj_no}
        }
    })

    $(document).on('click', '#setPj', function () {
        $("#editPj").find("input[name=pj_title]").val("${pj.pj_title}")
        $("#editPj").find("input[name=pj_content]").val("${pj.pj_content}")
        $("#editPj").find("input[name=pj_content]").text("${pj.pj_content}")
        console.log("${pj.board_power}")
        console.log("${pj.reply_power}")
        console.log("${pj.file_power}")
        if ("${pj.board_power}" == 'Y') {
            $("#editPj").find("select[name=board_power]").find(".all").removeAttr("selected")
            $("#editPj").find("select[name=board_power]").find(".admin").attr("selected", true)
        } else {
            $("#editPj").find("select[name=board_power]").find(".admin").removeAttr("selected")
            $("#editPj").find("select[name=board_power]").find(".all").attr("selected", true)
        }
        if ("${pj.reply_power}" == 'Y') {
            $("#editPj").find("select[name=reply_power]").find(".all").removeAttr("selected")
            $("#editPj").find("select[name=reply_power]").find(".admin").attr("selected", true)
        } else {
            $("#editPj").find("select[name=reply_power]").find(".admin").removeAttr("selected")
            $("#editPj").find("select[name=reply_power]").find(".all").attr("selected", true)
        }
        if ("${pj.file_power}" == 'Y') {
            $("#editPj").find("select[name=file_power]").find(".all").removeAttr("selected")
            $("#editPj").find("select[name=file_power]").find(".admin").attr("selected", true)
        } else {
            $("#editPj").find("select[name=file_power]").find(".admin").removeAttr("selected")
            $("#editPj").find("select[name=file_power]").find(".all").attr("selected", true)
        }
        $("#editPj").find("#pj_no").val("${pj.pj_no}")
        $("#editPjModal").modal("show")
    })

    $(document).on('click', '#viewEmpInPj', function () {
        $.ajax({
            url: '/project/selectEmpListByPj.do',
            data: {
                "pj_no": ${pj.pj_no},
                "keyword": 'all'
            },
            success: function (list) {
                console.log(list)
                $(".inviteTable").html('')
                $.each(list, function (i, obj) {
                    var content = '<tr>'
                    content += '<td rowspan="2"><span class="bi bi-person-circle fa-2x"></span>'
                    content += '<input type="hidden" class="inviteEmpNo" value="' + obj.emp_no + '">'
                    content +=    '</td>'
                    content +=  '<th style="width: 50%; text-align: center">' + obj.name + '</th>'
                    content +=  '<td rowspan="2" style="width: 20%; text-align: right;">'
                    content +=  '</td>'
                    content +=  '</tr>'
                    content +=  '<tr>'
                    if(obj.job_name != undefined){
                        content +=  '<td style="text-align: center;">' + obj.job_name + '</td>'
                    }else {
                        content +=  '<td style="text-align: center;">직급이 없습니다.</td>'
                    }
                    content += '</tr>'

                    $(".inviteTable").append(content)
                })
                $(".inviteTable").append('<tr><td></td>초대할 수 있는 사원이 없습니다.</tr>')


                $("#empListModal").modal("show")
            }
        })
    })

    $(document).on('click', '.boardDeleteBtn', function () {

        if (confirm("삭제하시겠습니까?")) {
            var form = document.createElement('form'); // 폼객체 생성
            var obj1;
            var obj2;
            obj1 = document.createElement('input'); // 값이 들어있는 녀석의 형식
            obj1.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
            obj1.setAttribute('name', 'board_no'); // 객체이름
            obj1.setAttribute('value', $(this).parent().find(".detailViewBoard_no").val()); //객체값
            form.appendChild(obj1);
            obj2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
            obj2.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
            obj2.setAttribute('name', 'pj_no'); // 객체이름
            obj2.setAttribute('value', ${pj.pj_no}); //객체값
            form.appendChild(obj2);

            form.setAttribute('method', 'post'); //get,post 가능
            form.setAttribute('action', "/project/deleteBoard.do"); //보내는 url
            document.body.appendChild(form);
            form.submit();

        }

    })


    $(function () {
        loadRw()
        datepickerLoad()
        loadBoards()
        $(document).on('click', '.newPj', function () {
            $("#makePj").modal("show")
        })

        $(document).on('click', '#setColor', function () {
            $("#colorModal").modal("show")
        })

        $(document).on("click", ".tagAddBtn", function () {
            $("#addTagModal").modal("show")
        })

        $(document).on('click', '#tagSettingBtn', function () {
            loadTag()
            $("#tagModal").modal("show")
        })

        $(document).on('click', '.boardEnrollBtn', function () {

            $(".boardNoti").text('게시물 작성')
            $(".boardUploadBtn").text('올리기')
        })

        $(document).on('click', '#postEditBtn', function () {
            console.log($(this).parents(".boardBody").find("#postTitle").text())
            console.log($(this).parents(".boardBody").find("#postContent").html())
            console.log($(this))
            $("#postForm").css("display", "block")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "none")
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "#6777ef")
            $('#summernote').summernote('insertText', $(this).parents(".boardBody").find("#postContent").text())
            $(".boardNoti").text('게시물 수정')
            $(".boardUploadBtn").text('수정')
            $("#boardPost").find("input[name=post_title]").val($(this).parents(".boardBody").find("#postTitle").text())
            var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
            $(".boardUploadForm").append(
                '<input type="hidden" name="board_no" value="' + board_no + '">'
            )
            $(".boardUploadForm").attr("id", "editPost");
            $(".boardUploadForm").attr("action", "/post/editPost.do");
            $("#boardPost").modal("show")
            $("#boardPost").css("z-index", "111111")
        })

        $(document).on('click', '#schEditBtn', function () {
            console.log($(this).parents(".boardBody").find("#schTitle").text())
            console.log($(this).parents(".boardBody").find("#schDate").html())
            console.log($(this))
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "block")
            $("#postTodo").css("display", "none")
            $(".switchSch").css("color", "#6777ef")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "black")

            $(".boardNoti").text('게시물 수정')
            $(".boardUploadBtn").text('수정')
            $("#boardPost").find("input[name=sch_title]").val($(this).parents(".boardBody").find("#schTitle").text())
            var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
            $.ajax({
                url: '/schedule/selectSchDate.do',
                data: {
                    "board_no": board_no
                },
                async: false,
                success: function (data) {
                    console.log(data)
                    $("input[name=sch_start]").val(data.sch_start)
                    $("input[name=sch_end]").val(data.sch_end)
                    $("input[name=sch_place]").val(data.sch_place)
                    $("textarea[name=sch_content]").val(data.sch_content)
                    $("textarea[name=sch_content]").text(data.sch_content)
                    if (data.sch_attendee != undefined) {
                        $("#addPeople").val(data.sch_attendee)
                    }
                }
            })
            $(".boardUploadForm").append(
                '<input type="hidden" name="board_no" value="' + board_no + '">'
            )
            $(".boardUploadForm").attr("id", "editSch");
            $(".boardUploadForm").attr("action", "/schedule/editSch.do");
            $("#boardPost").modal("show")
            $("#boardPost").css("z-index", "111111")
        })

        $(document).on('click', '#todoEditBtn', function () {
            console.log($(this).parents(".boardBody").find("#todoTitle").text())
            console.log($(this))
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "block")
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "#6777ef")
            $(".switchPost").css("color", "black")

            $(".boardNoti").text('게시물 수정')
            $(".boardUploadBtn").text('수정')
            console.log($(this).parents(".boardBody").find("#todoTitle").text())
            $("#boardPost").find("input[name=todo_title]").val($(this).parents(".boardBody").find("#todoTitle").text())
            var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
            $.ajax({
                url: '/todo/selectTodo.do',
                data: {
                    "board_no": board_no
                },
                async: false,
                success: function (data) {
                    console.log(data)
                    $("#boardPost").find("input[name=todo_content]").parent().parent().remove()
                    $.each(data, function (i, obj) {

                            var content = '<div class="form-group row">'
                            content += '<div class="col-lg-1 pr-0 text-right">'
                            content += '<i class="bi bi-x fa-2x removeTodo" style="color: red; padding-right: 0px;"></i>'
                            content += '</div>'
                            content += '<div class="text-md-right col-10 col-md-7 col-lg-9">'
                            content += '<input type="text" class="form-control"'
                            content += 'value ="' + obj.todo_content
                            content += '" placeholder="할 일 추가 / 최대 50자" name="todo_content">'
                            content += '</div>'
                            content += '<div class="col-sm-12 col-md-3 col-lg-1">'
                            content += '<div class="input-group todoInput date" style="width: 100px;">'
                            if (obj.todo_end != undefined) {

                                content += '<input type="text" style="display: block; width: 25px;" class="form-control bg-white border-0 small todoDue" value="' + moment(obj.todo_end).format('MM-DD') + '" name="todo_end">'

                                content += '<span class="bi bi-calendar fa-2x mr-3 todoCalendar input-group-addon" style="display: none;"></span>'
                            } else {
                                content += '<input type="text" style="display: none; width:25px;"'
                                content += 'class="form-control bg-white border-0 small todoDue" name="todo_end">'
                                content += '<span class="bi bi-calendar fa-2x mr-3 todoCalendar input-group-addon"></span>'
                            }
                            content += '</div>'
                            content += '</div>'
                            content += '<div class="col-lg-1">'
                            content += '<i class="bi bi-person fa-2x todoPerson"></i>'
                            content += '<p class="todoFor" style="font-size: 11px; margin-top: 6px;"></p>'
                            content += '</div>'
                            content += '<input type="hidden" name="status" value="' + obj.status + '">'
                            content += '</div>'

                            $("#postTodo").find(".todos").append(content)

                        }
                    )
                    datepickerLoad()
                }
            })
            $(".boardUploadForm").append(
                '<input type="hidden" name="board_no" value="' + board_no + '">'
            )
            $(".boardUploadForm").attr("id", "editTodo");
            $(".boardUploadForm").attr("action", "/todo/editTodo.do");
            $("#boardPost").modal("show")
            $("#boardPost").css("z-index", "111111")
        })


        $(document).on('click', '.disconnectingTagBtn', function () {
            console.log($(this).prev().find('input[name=tagInput]').val())
            $tag_no = $(this).prev().find('input[name=tagInput]').val()
            removeTag($tag_no)
        })

        function removeTag(tag_no) {
            $.ajax({
                url: '/project/removeTagByPjNo.do',
                data: {
                    "tag_no": tag_no,
                    "pj_no": ${pj.pj_no}
                },
                async: false,
                success: function (data) {
                    console.log(data)
                }
            })
            loadTag()
        }


        $(document).on("click", ".favoBtn", function (e) {
            var pj_no = ${pj.pj_no}
                console.log("pj_no : " + pj_no)

            if ($(this).hasClass("favoWhite")) {
                $(this).removeClass("favoWhite")
                $(this).addClass("favoYellow")
                console.log("즐겨찾기 추가할것")

                insertBookmark(pj_no)

            } else if ($(this).hasClass("favoYellow")) {
                $(this).removeClass("favoYellow")
                $(this).addClass("favoWhite")
                console.log("즐겨찾기 제거할것")

                removeBookmark(pj_no);
            }
        })


        $(document).on('click', '#inviteBtn', function () {
            $.ajax({
                url: '/project/selectEmpListByPj.do',
                data: {
                    "pj_no": ${pj.pj_no}
                },
                success: function (list) {
                    //list = $.parseJSON(list)
                    console.log(list)
                    $(".inviteTable").html('')
                    $("#invitePj").find("input[name=pj_no]").val(${pj.pj_no})
                    if (list.length > 0) {
                        $.each(list, function (i, obj) {
                            var content = '<tr>'
                            content += '<td rowspan="2"><span class="bi bi-person-circle fa-2x"></span>'
                            content += '</td>'
                            content += '<th style="width: 50%">' + obj.name + '</th>'
                            content += '<td rowspan="2" style="width: 20%; text-align: right;">'
                            content += '<div class="custom-control custom-checkbox">'
                            content += '<input type="checkbox" name="inviteEmpNo" class="inviteEmpNo" value="' + obj.emp_no + '">'
                            content += '</div>'
                            content += '</td>'
                            content += '</tr>'
                            content += '<tr>'
                            if (obj.job_name != undefined) {
                                content += '<td>' + obj.job_name + '</td>'
                            } else {
                                content += '<td>직급 없음</td>'
                            }
                            content += '</tr>'
                            $(".inviteTable").append(content)
                            $("#inviteEmpBtn").css("display", "block")
                        })
                    } else {
                        var content = '<tr><td>초대할 수 있는 사원이 없습니다.</td></tr>'
                        $(".inviteTable").append(content)
                        $("#inviteEmpBtn").css("display", "none")
                    }

                    $("#inviteModal").modal("show")
                }
            })
        })

        $(document).on('click', '.postFor', function () {
            $.ajax({
                url: '/project/selectEmpListByPj.do',
                data: {
                    "pj_no": ${pj.pj_no},
                    "keyword": 'mention'
                },
                success: function (list) {
                    console.log(list)
                    $(".inviteTable").html('')
                    $.each(list, function (i, obj) {
                        var content = '<tr>'
                        content += '<td rowspan="2"><span class="bi bi-person-circle fa-2x"></span>'
                        content += '</td>'
                        content += '<th style="width: 50%" class="emp_name">' + obj.name + '</th>'
                        content += '<td rowspan="2" style="width: 20%; text-align: right;">'
                        content += '<div class="custom-control custom-checkbox">'
                        content += '<input type="checkbox" class="inviteEmpNo" value="' + obj.emp_no + '">'
                        content += '</div>'
                        content += '</td>'
                        content += '</tr>'
                        content += '<tr>'
                        if (obj.job_name != undefined) {
                            content += '<td>' + obj.job_name + '</td>'
                        } else {
                            content += '<td>직급이 없습니다.</td>'
                        }
                        content += '</tr>'
                        $(".inviteTable").append(content)
                    })
                    $("#mentionForModal").modal("show")
                }
            })
        })

        $('#boardPost').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset();
            $(this).find('form')[1].reset();
            $(this).find('form')[2].reset();
        })

        $(document).on('click', '#postBtn', function () {
            if (${pj.board_power == 'Y'} &&
            ${pjMember.admin == 'N'})
            {
                alert("관리자만 작성할 수 있습니다.")
                return false
            }
            $("#postForm").css("display", "block")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "none")
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "#6777ef")
            $(".boardUploadForm").attr("id", "enrollPost");
            $(".boardUploadForm").attr("action", "/post/insertPost.do");
            $("#boardPost").modal("show")
        })

        $(document).on('click', '#schBtn', function () {
            if (${pj.board_power == 'Y'} &&
            ${pjMember.admin == 'N'})
            {
                alert("관리자만 작성할 수 있습니다.")
                return false
            }
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "block")
            $("#postTodo").css("display", "none")
            $(".switchSch").css("color", "#6777ef")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "black")
            $(".boardUploadForm").attr("id", "enrollSch");
            $(".boardUploadForm").attr("action", "/schedule/insertSch.do");
            $("#boardPost").modal("show")
        })


        $(document).on('click', '#todoBtn', function () {
            if (${pj.board_power == 'Y'} &&
            ${pjMember.admin == 'N'})
            {
                alert("관리자만 작성할 수 있습니다.")
                return false
            }
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "block")
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "#6777ef")
            $(".switchPost").css("color", "black")
            $(".boardUploadForm").attr("id", "enrollTodo");
            $(".boardUploadForm").attr("action", "/todo/insertTodo.do");
            $("#boardPost").modal("show")
        })

        $(document).on('click', '.ckedInput', function () {
            if ($(this).is(":checked")) {
                $.ajax({
                    url: '/todo/completeTodo.do',
                    data: {
                        "todo_no": $(this).val()
                    },
                    success: function (data) {
                        console.log(data)

                    }
                })
                $(this).parent().next().children(".ckedTodo").addClass("underline")
            } else {
                $.ajax({
                    url: '/todo/uncompleteTodo.do',
                    data: {
                        "todo_no": $(this).val()
                    },
                    success: function (data) {
                        console.log(data)

                    }
                })
                $(this).parent().next().children(".ckedTodo").removeClass("underline")
            }
        })

        $(document).on('click', '.switchPost', function () {
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "#6777ef")
            $("#postForm").css("display", "block")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "none")
            $(".boardUploadForm").attr("id", "enrollPost");
            $(".boardUploadForm").attr("action", "/post/insertPost.do");
        })

        $(document).on('click', '.switchSch', function () {
            $(".switchSch").css("color", "#6777ef")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "black")
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "block")
            $("#postTodo").css("display", "none")
            $(".boardUploadForm").attr("id", "enrollSch");
            $(".boardUploadForm").attr("action", "/schedule/insertSch.do");
        })

        $(document).on('click', '.switchTodo', function () {
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "#6777ef")
            $(".switchPost").css("color", "black")
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "block")
            $(".boardUploadForm").attr("id", "enrollTodo");
            $(".boardUploadForm").attr("action", "/todo/insertTodo.do");

        })

        $(document).on('click', '#addEmpBtn', function () {
            console.log($(this).parents("#mentionForModal").find(".emp_name"))
            console.log($(this).parents("#mentionForModal").find(".inviteEmpNo"))
            $(this).parents("#mentionForModal").find(".inviteEmpNo:checked").each(function(e){
                console.log($(this).val())
                console.log($(this).parents("tr").find(".emp_name").text())
                var content = $(this).parents("tr").find(".emp_name").text()
                $("#todoForArea").append('<span class="empName">'+ content +'<span><input type="hidden" name="post_for" ' +
                    'value="'+$(this).val()+'">' +
                    '<i class="bi bi-x fa-2x removeEmp" style="color: red; padding-right: 0px;"></i></span></span>')
            })
            $(this).parents("#mentionForModal").find(".emp_name")
            $(this).parents("#mentionForModal").find(".inviteEmpNo")
        })

        $(".fa-plus").click(function () {
            $(".todos").append(
                '<div class="form-group row">' +
                '<div class="col-lg-1 pr-0 text-right">' +
                '<i class="bi bi-x fa-2x removeTodo" style="color: red; padding-right: 0px;"></i>' +
                '</div>' +
                '<div class="text-md-right col-10 col-md-7 col-lg-9">' +
                '<input type="text" class="form-control"' +
                'placeholder="할 일 추가 / 최대 50자" name="todo_content">' +
                '</div>' +
                '<div class="col-sm-12 col-md-3 col-lg-1">' +
                '<div class="input-group todoInput date" style="width: 100px;">' +
                '<input type="text" style="display: none; width:25px;"' +
                'class="form-control bg-white border-0 small todoDue" name="todo_end">' +
                '<span class="bi bi-calendar fa-2x mr-3 todoCalendar input-group-addon"></span>' +
                '</div>' +
                '</div>' +
                '<div class="col-lg-1">' +
                '<i class="bi bi-person fa-2x todoPerson"></i>' +
                '<p class="todoFor" style="font-size: 11px; margin-top: 6px;"></p>' +
                '</div>' +
                '<input type="hidden" name="status" value="N">' +
                '</div>'
            )
            datepickerLoad()
        })

        function datepickerLoad() {

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
            $('.todoInput').datepicker().on("clearDate", function (e) {
                console.log(e.currentTarget)
                var $test = e.currentTarget;
                $($test).children(".todoCalendar").css("display", "block")
                $($test).children(".todoDue").css("display", "none")

            })
        }

        $('#datepicker').datepicker({
            format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
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


        $("#close").click(function () {
            //console.log("진입확인")
            $("#todoForArea").html('')
            $('#summernote').summernote('reset');
            $(".todos").html(
                '<div class="form-group row">' +
                '<div class="col-lg-1 pr-0 text-right">' +
                '</div>' +
                '<div class="text-md-right col-10 col-md-7 col-lg-9">' +
                '<input type="text" class="form-control"' +
                'placeholder="할 일 추가 / 최대 50자" name="todo_content">' +
                '</div>' +
                '<div class="col-sm-12 col-md-3 col-lg-1">' +
                '<div class="input-group todoInput date" style="width: 100px;">' +
                '<input type="text" style="display: none; width:25px;"' +
                'class="form-control bg-white border-0 small todoDue">' +
                '<span class="bi bi-calendar fa-2x mr-3 todoCalendar input-group-addon"></span>' +
                '</div>' +
                '</div>' +
                '<div class="col-lg-1">' +
                '<i class="bi bi-person fa-2x todoPerson"></i>' +
                '<p class="todoFor" style="font-size: 11px; margin-top: 6px;"></p>' +
                '</div>' +
                '</div>'
            )
            datepickerLoad()

        })
        $("input[type=image]").click(function () {
            loadBoards()
        })

        $('.todoInput').datepicker().on("clearDate", function (e) {
            console.log(e.currentTarget)
            var $test = e.currentTarget;
            $($test).children(".todoCalendar").css("display", "block")
            $($test).children(".todoDue").css("display", "none")

        })
    })


    $(document).on('click', '#addPeople', function () {
        $("#mentionForModal").modal("show")
    })

    $(document).on('click', '.viewAttendee', function () {
        $("#mentionForModal").modal("show")
    })

    $(document).on('click', '.calendar', function () {
        location.href = "/project/detailCalendar.do?pj_no=" +
        ${pj.pj_no}
    })
    $(document).on('click', '.drive', function () {
        if (${pj.file_power == 'Y'} &&
        ${pjMember.admin == 'N'})
        {
            alert("관리자만 조회할 수 있습니다.")
            return false
        }
        location.href = "/project/drivePj.do?pj_no=" +
        ${pj.pj_no}
    })

    $(document).on('click', '.todoPerson', function () {
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

    $(document).on('click', '.todoFor', function () {
        $(this).parent().html(' <i class="bi bi-person fa-2x todoPerson"></i>' +
            '<p class="todoFor" style="font-size: 11px; margin-top: 6px;"></p>'
        )
    })

    $(document).on('click', '.removeTodo', function () {
        $(this).parent().parent().remove()
    })

    function saveColor() {
        if ($("input:radio[name='customRadio']:checked").length <= 0) {
            alert("색상을 선택해주세요.")
            return false;
        }
        var selectedProjects = []
        selectedProjects.push(${pj.pj_no})
        var selectedColor = $("input:radio[name='customRadio']:checked").val()
        console.log(selectedProjects)
        console.log(selectedColor)
        $("#colorModal").modal("hide")
        setColor(selectedProjects, selectedColor)
        $("input:radio[name='customRadio']").prop("checked", false)
    }

    function setColor(selectedProjects, selectedColor) {
        $.ajax({
            url: '/project/setProjectColor.do',
            data: {
                "selectedProjects": selectedProjects,
                "selectedColor": selectedColor
            },
            success: function (data) {
                //console.log(data)

            }
        })
    }

    function saveTag() {
        if ($("input:checkbox[name='tagInput']:checked").length <= 0) {
            alert("태그를 선택해주세요.")
            return false;
        }
        var selectedProjects = []
        selectedProjects.push(${pj.pj_no});
        var selectedTags = []
        $("input:checkbox[name='tagInput']:checked").each(function () {
            selectedTags.push($(this).val());
        })

        $("#tagModal").modal("hide")
        setTag(selectedProjects, selectedTags)
    }

    function setTag(selectedProjects, selectedTags) {
        $.ajax({
            url: '/project/setProjectTag.do',
            data: {
                "selectedProjects": selectedProjects,
                "selectedTags": selectedTags
            },
            success: function (data) {
                //console.log(data)

            }
        })
    }

    function insertBookmark(pj_no) {
        $.ajax({
            url: '/project/insertBookmark.do',
            data: {
                pj_no: pj_no
            },
            success: function (data) {
                console.log(data + "성공")

            }
        });
    }

    function removeBookmark(pj_no) {
        $.ajax({
            url: '/project/removeBookmark.do',
            data: {
                pj_no: pj_no
            },
            success: function (data) {
                console.log(data + "성공")

            }
        });
    }

    function deleteReply(reply_no, board_no) {
        $.ajax({
            url: '/project/deleteReply.do',
            data: {
                "reply_no": reply_no
            },
            success: function (data) {
                console.log(data)
                loadReply(board_no)
            }
        })
    }

    function loadTag() {
        $.ajax({
            url: '/project/loadTag.do',
            data: {
                pj_no: ${pj.pj_no}
            },
            success: function (data) {
                data = $.parseJSON(data)
                // console.log(data)
                // console.log(data.tagByEmpNo)
                // console.log(data.tagByPjNo)
                $("#tagTable").html('')
                $.each(data.tagByEmpNo, function (i, obj) {
                    $("#tagTable").append(
                        '<tr>' +
                        '<td><i class="fa fa-tag fa-lg"></i>' +
                        '</td>' +
                        '<th class="tagName" style="width: 50%">' + obj.tag_name + '</th>' +
                        '<td style="width: 20%; text-align: right;">' +
                        '<div class="custom-control custom-checkbox">' +
                        '<input type="checkbox" name="tagInput" class="custom-control-input tagInput" value="' + obj.tag_no + '" id="tag' + obj.tag_no + '"> ' +
                        '<label class="custom-control-label" for="tag' + obj.tag_no + '"></label>' +
                        '</div>' +
                        '</td>' +
                        '<td style="width: 15%; text-align: right;">' +
                        '<div class="btn-group dropright">' +
                        '<i class="fa fa-ellipsis-v fa-lg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 30px;"></i>' +
                        '<div class="dropdown-menu dropright">' +
                        '<a class="dropdown-item editTag" href="#">수정</a>' +
                        '<div class="dropdown-divider"></div>' +
                        '<a class="dropdown-item deleteTag" href="#">삭제</a>' +
                        '</div>' +
                        '</div>' +
                        '</td>' +
                        '</tr>'
                    )
                })
                $.each(data.tagByPjNo, function (i, obj) {
                    $('#tag' + obj.tag_no).next('label').css("display", "none")
                    $('#tag' + obj.tag_no).parent().css("display", "none")
                    $('#tag' + obj.tag_no).parents("td").append(
                        '<i class="bi bi-dash-square mr-2 disconnectingTagBtn"></i>'
                    )
                })

            }

        });
    }

    function loadReply(board_no) {
        console.log(board_no)
        $.ajax({
            url: '/project/selectReply.do',
            data: {
                board_no: board_no
            },
            success: function (list) {
                list = $.parseJSON(list)
                console.log(list)
                $(".replyArea").html('')
                $(".replyCount").text("댓글 " + list.length)
                if (list.length == 0) {
                    $(".replyHrArea").css("display", "none")
                    console.log('확인')
                } else {
                    $(".replyHrArea").css("display", "block")
                    $.each(list, function (i, obj) {
                        if ("${sessionScope.loginEmp.emp_no}" == obj.writer) {
                            $(".replyArea").append(
                                '<div class="reply">' +
                                '<div class="col-lg-10" style="display: inline-block">' +
                                '<span class="bi bi-person-circle fa-lg replyWriter">' + obj.name + '</span>' +
                                '<span style="color: gray" class="replyDate">' + moment(obj.create_date).format('YYYY-MM-DD HH:mm') + '</span>' +
                                '</div>' +
                                '<div class="col-lg-2 text-right" style="display: inline-block">' +
                                '<a class="editReplyBtn">수정&nbsp </a>' +
                                '<a class="deleteReplyBtn">&nbsp 삭제</a>' +
                                '<input type="text" value="' + obj.reply_no + '" class="reply_no" hidden>' +
                                '</div>' +
                                '<br> <br>' +
                                '<div class="col-lg-10">' +
                                '<a class="ml-4 replyContent">' + obj.reply_content + '</a>' +
                                '</div>' +
                                '<br> <br>' +
                                '</div>'
                            )

                        } else {
                            $(".replyArea").append(
                                '<div class="col-lg-10" style="display: inline-block">' +
                                '<input type="text" value="' + obj.reply_no + '" class="reply_no" hidden>' +
                                '<span class="bi bi-person-circle fa-lg replyWriter">' + obj.name + '</span>' +
                                '<span style="color: gray" class="replyDate">' + moment(obj.create_date).format('YYYY-MM-DD HH:mm') + '</span>' +
                                '</div>' +
                                '<br> <br>' +
                                '<div class="col-lg-10">' +
                                '<a class="ml-4 replyContent">' + obj.reply_content + '</a>' +
                                '</div>' +
                                '<br> <br>'
                            )
                        }


                    })
                }


            }

        });
    }

    function loadBoards() {
        $.ajax({
            url: '/project/selectAllBoard.do',
            data: {
                pj_no: ${pj.pj_no}
            },
            success: function (data) {
                console.log(data)
                $(".boardTable").html('')
                $.each(data, function (i, obj) {
                    if (obj.board_type == 'post') {
                        $(".boardTable").append(
                            '<tr>' +
                            '<td style="width: 7%; text-align: right; color: #f3a435 ;">' +
                            '<span class="bi bi-file-text"></span>' +
                            '<input type="text" class="board_no" value="' + obj.board_no + '" style="display: none;">' +
                            '<input type="text" class="board_type" value="' + obj.board_type + '" style="display: none;">' +
                            '</td>' +
                            '<td style="width: 8%; text-align: left;">글</td>' +
                            '<th style="width: 40%;">' + obj.post_title + '</th>' +
                            '<td style="width: 12%;">' + obj.name + '</td>' +
                            '<td style="width: 22%;">' + obj.create_date + '</td>' +
                            '<td>' +
                            '</td>' +
                            '</tr>'
                        )
                    } else if (obj.board_type == 'schedule') {
                        $(".boardTable").append(
                            '<tr>' +
                            '<td style="width: 7%; text-align: right; color: #35f364">' +
                            '<span class="bi bi-calendar"></span>' +
                            '<input type="text" class="board_no" value="' + obj.board_no + '" style="display: none;">' +
                            '<input type="text" class="board_type" value="' + obj.board_type + '" style="display: none;">' +
                            '</td>' +
                            '<td style="width: 8%; text-align: left;">일정</td>' +
                            '<th style="width: 40%;">' + obj.sch_title + '</th>' +
                            '<td style="width: 12%;">' + obj.name + '</td>' +
                            '<td style="width: 22%;">' + obj.create_date + '</td>' +
                            '<td><b>' + moment(obj.sch_start).format('MM/DD') + '</b></td>' +
                            '</tr>'
                        )
                    } else if (obj.board_type == 'todo') {
                        $(".boardTable").append(
                            '<tr>' +
                            '<td style="width: 7%; text-align: right; color: #3591f3 ">' +
                            '<span class="bi bi-check2-square"></span>' +
                            '<input type="text" class="board_no" value="' + obj.board_no + '" style="display: none;">' +
                            '<input type="text" class="board_type" value="' + obj.board_type + '" style="display: none;">' +
                            '</td>' +
                            '<td style="width: 8%; text-align: left;">할 일</td>' +
                            '<th style="width: 40%;">' + obj.todo_title + '</th>' +
                            '<td style="width: 12%;">' + obj.name + '</td>' +
                            '<td style="width: 22%;">' + obj.create_date + '</td>' +
                            '<td><span class="badge" style="background-color: #3591f3 ; height: 100%; font-size: 18px; color: white;">' + obj.todo_percent + '%</span></td>' +
                            '</tr>'
                        )
                    }
                })


            }

        });
    }

    function loadRw() {
        var pCount = 0;
        var rqCount = 0;
        var sCount = 0;
        var cmCount = 0;
        var array = [];
        $.ajax({
            url: '/project/loadRw.do',
            data: {
                "pj_no": ${pj.pj_no}
            },
            async: false,
            success: function (list) {
                list = $.parseJSON(list)
                console.log(list)
                $.each(list, function (i, obj) {
                    if (obj.status == 'P') {
                        pCount++
                    } else if (obj.status == 'RQ') {
                        rqCount++
                    } else if (obj.status == 'S') {
                        sCount++
                    } else if (obj.status == 'CM') {
                        cmCount++
                    }
                })
                $("#totalRw").text(list.length)
                $("#beforeRw").text('진행전 ' + rqCount)
                if (rqCount > 0) {
                    $("#beforeRwPercent").text(Math.round(rqCount / list.length * 100) + '%')
                }
                $("#whileRw").text('진행중 ' + pCount)
                if (pCount > 0) {
                    $("#whileRwPercent").text(Math.round(pCount / list.length * 100) + '%')
                }
                $("#completeRw").text('완료됨 ' + cmCount)
                if (cmCount > 0) {
                    $("#completeRwPercent").text(Math.round(cmCount / list.length * 100) + '%')
                }
                $("#keepRw").text('보류됨 ' + sCount)
                if (sCount > 0) {
                    $("#keepRwPercent").text(Math.round(sCount / list.length * 100) + '%')
                }
                array.push(rqCount)
                array.push(pCount)
                array.push(cmCount)
                array.push(sCount)
                array.push(list.length)
            }
        })
        return array
    }

    $(document).on('click', '.boardTable tr', function () {
            console.log($(this).find(".board_no").val())
            $board_no = $(this).find(".board_no").val()
            console.log($(this).find(".board_type").val())
            if ($(this).find(".board_type").val() == 'post') {
                $.ajax({
                    url: '/post/detailView.do',
                    data: {
                        "board_no": $board_no
                    },
                    success: function (list) {
                        //list = $.parseJSON(list)
                        console.log(list)

                        $("#postView").css("display", "block")
                        $("#schView").css("display", "none")
                        $("#todoView").css("display", "none")
                        $("#postTitle").html(list.post_title)
                        $("#postContent").html(list.post_content)
                        $("#postWriter").html(list.name)
                        $("#postUploadDate").html(list.create_date)
                        $(".detailViewBoard_no").val(list.board_no)
                        //console.log(list.count)
                        $(".viewCount").text("조회 " + list.count)
                        if ("${sessionScope.loginEmp.name}" == list.name) {
                            // console.log('확인')
                            $(".postEdit").css("display", "block")
                        } else {
                            $(".postEdit").css("display", "none")
                        }

                    }
                })
            } else if ($(this).find(".board_type").val() == 'schedule') {
                console.log('일정')
                $.ajax({
                    url: '/schedule/detailView.do',
                    data: {
                        "board_no": $board_no
                    },
                    success: function (list) {
                        //list = $.parseJSON(list)
                        console.log(list)

                        $("#postView").css("display", "none")
                        $("#schView").css("display", "block")
                        $("#todoView").css("display", "none")
                        $("#schTitle").html(list.sch_title)
                        $("#schContent").html(list.sch_content)
                        $("#schWriter").html(list.name)
                        $("#schUploadDate").html(list.create_date)
                        $(".detailViewBoard_no").val(list.board_no)
                        if (moment(list.sch_start).format('YYYY-MM-DD (ddd)') == moment(list.sch_end).format('YYYY-MM-DD (ddd)')) {
                            $("#schDate").html(
                                moment(list.sch_start).format('YYYY-MM-DD (ddd)')
                            )
                        } else {
                            $("#schDate").html(
                                moment(list.sch_start).format('YYYY-MM-DD (ddd)') + " ~ " + moment(list.sch_end).format('YYYY-MM-DD (ddd)')
                            )
                        }

                        $("#schPlace").html(list.sch_place)
                        //console.log(list.count)
                        $(".viewCount").text("조회 " + list.count)
                        if ("${sessionScope.loginEmp.name}" == list.name) {
                            // console.log('확인')
                            $(".postEdit").css("display", "block")
                        } else {
                            $(".postEdit").css("display", "none")
                        }

                    }
                })
            } else if ($(this).find(".board_type").val() == 'todo') {
                $.ajax({
                    url: '/todo/detailView.do',
                    data: {
                        "board_no": $board_no
                    },
                    success: function (list) {
                        //list = $.parseJSON(list)
                        console.log(list)

                        $("#postView").css("display", "none")
                        $("#schView").css("display", "none")
                        $("#todoView").css("display", "block")
                        $("#todoTitle").html(list[0].todo_title)
                        $("#todoWriter").html(list[0].name)
                        $("#todoUploadDate").html(list[0].create_date)
                        $("#todoTotalCount").html('/ ' + list.length)
                        $(".detailViewBoard_no").val(list[0].board_no)
                        //console.log(list.count)
                        $(".viewCount").text("조회 " + list[0].count)
                        if ("${sessionScope.loginEmp.name}" == list[0].name) {
                            // console.log('확인')
                            $(".postEdit").css("display", "block")
                        } else {
                            $(".postEdit").css("display", "none")
                        }
                        var completeCount = 0;
                        $("#todos").html('')


                        $.each(list, function (i, obj) {
                                var content = '<div class="row">'
                                content += '<div class="col-1">'
                                content += '<input type="checkbox" class="ckedInput todo_no"'
                                if (obj.status == 'Y') {
                                    content += 'checked="true"'
                                    completeCount++
                                }
                                content += 'style="margin-left: 10px; width: 20px; height: 20px;" value="' + obj.todo_no + '">'
                                content += '</div>'
                                content += '<div class="col-8 text-center">'
                                if (obj.status == 'Y') {
                                    content += '<b class="ckedTodo underline">' + obj.todo_content + '</b>'
                                } else {
                                    content += '<b class="ckedTodo">' + obj.todo_content + '</b>'
                                }
                                content += '</div>'
                                content += '<div class="col-3">'
                                if (obj.todo_end != undefined) {
                                    content += '<span>' + moment(obj.todo_end).format('MM-DD') + '</span>'
                                }
                                if (obj.todo_for != undefined) {
                                    content += '<span>' + obj.todo_for + '</span>'
                                }
                                content += '</div>'
                                content += '</div>'
                                $("#todos").append(content)
                            }
                        )
                        $("#todoCompleteCount").html(completeCount + "&nbsp;")
                        $("#todoCompletePercent").html(Math.floor(completeCount / list.length * 100) + "%")
                        $("#todoBar").attr("data-width", $("#todoCompletePercent").text())
                        $("#todoBar").attr("style", 'width:+' + $("#todoCompletePercent").text() + ';')
                    }
                })
            }
            loadReply($board_no)
            $("#boardView").modal("show")

        }
    )
</script>
<script type="text/javascript">

    var sum = loadRw()
    console.log(sum)
    // Pie Chart Example
    var ctx = document.getElementById("taskChart");
    var myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["진행전", "진행중", "완료됨", "보류됨"],
            datasets: [{
                data: [sum[0], sum[1], sum[2], sum[3]],
                backgroundColor: ['#4e73df', '#1cc88a', '#f3a435'],
                hoverBackgroundColor: ['#2e59d9', '#17a673', '#eb8d0a'],
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
                var text = sum[4], textX = Math.round((width - ctx
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
                ['insert', ['link', 'video']],
            ]
        });
    })


</script>
</body>
</body>
</html>