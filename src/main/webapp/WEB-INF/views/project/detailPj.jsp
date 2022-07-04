<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

<head>
    <meta charset="UTF-8">

    <%-- 카카오맵 api--%>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06989ef7025ad30be2fddb6e0d28320b&libraries=services"></script>

    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <link
            href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
            rel="stylesheet">
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

    .bi-circle-fill {
        margin-right: 20px;
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

    .sorttmenu {
        float: right;
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    #caSetting, .favoBtn, .navMenu, .fa-plus, .todoCalendar, .todoPerson, #todoEditBtn, .todoDue, .todoFor, .selectTodoFor, #schEditBtn, .viewAttendee,
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


</style>
</head>
<body>
<div class="main-content text-center">
    <div style="height: 50px;"></div>

    <div class="container text-left">

        <section class="section">

            <jsp:include page="projectHead.jsp"/>


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
                                        <span class='bi bi-circle-fill' style='color: #4e73df'></span>&nbsp;&nbsp;
                                        <span id="beforeRw"></span>
                                        &nbsp;
                                        <span id="beforeRwPercent" style='color: #4e73df'></span>
                                    </h5>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: #1cc88a'></span>&nbsp;&nbsp;
                                        <span id="whileRw"></span>
                                        &nbsp;
                                        <span id="whileRwPercent" style='color: #1cc88a'></span>
                                    </h5>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: #f3a435'></span>&nbsp;&nbsp;
                                        <span id="completeRw"></span>
                                        &nbsp;
                                        <span id="completeRwPercent" style='color: #f3a435'></span>
                                    </h5>
                                    <h5 class="chartDeatil">
                                        <span class='bi bi-circle-fill' style='color: gray'></span>&nbsp;&nbsp;
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
                            <input type="hidden" id="filter">
                            <a class="dropdown-item" id="filterAll">전체</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" id="filterPost">글</a>
                            <a class="dropdown-item" id="filterSch">일정</a>
                            <a class="dropdown-item" id="filterTodo">할 일</a>
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
                <div class="row mt-sm-4 center">
                    <div id="pagination" class="col-lg-12">
                    </div>
                    <div class="col-lg-3"></div>
                    <div class="input-group col-lg-6 mb-6">
                        <select class="sorttmenu" id="selectsearch" name="searchTarget">
                            <option value="name">작성자</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" class="form-control" id="searchedKeyword"
                               placeholder="검색어를 입력해주세요">
                        <div class="input-group-append">
                            <button class="btn btn-light" type="button" onclick="changePage(1);">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
        </section>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="invitePjModal.jsp"/>
<jsp:include page="colorTagModal.jsp"/>
<jsp:include page="pjFormModal.jsp"/>
<jsp:include page="boardEnrollModal.jsp"/>

</body>

<script src="/resources/assets/js/pjHead.js"></script>
<script src="/resources/assets/js/pjHome.js"></script>

<script>
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
                // console.log(list)
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

    $(function () {
        $(".calendar").removeClass("clicked")
        $(".home").addClass("clicked")
        $(".drive").removeClass("clicked")
        $("#boardPost").find("input[name=type]").val("home")
        $("#editPj").find("input[name=type]").val("calendar")
        loadRw()
        datepickerLoad()
        changePage(1)
    })
</script>
<%--게시글 전체--%>
<script>

    function sendajax(searchTarget, searchKeyword, type, currentPage) {
        //console.log("sendajax");

        $.ajax({
            url: "/project/pagingAndSerachPj.do",
            type: "post",
            data: {
                searchTarget: searchTarget,
                searchKeyword: searchKeyword,
                board_type: type,
                pj_no: ${pj.pj_no},
                currentPage: currentPage
            },
            success: function (result) {
                //console.log("데이터 가져옴");
                // console.log(result)
                result = JSON.parse(result);
                //console.log(data);
                setList(result.list)
                setpi(result.pi);
            }
        })
        //console.log("sendajax 끝남");
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
                        $("#postTitle").html(list.post.post_title)
                        $("#postContent").html(list.post.post_content)
                        $("#postWriter").html(list.post.name)
                        $("#postUploadDate").html(list.post.create_date)
                        $(".detailViewBoard_no").val(list.post.board_no)
                        if (list.projectFile != null) {
                            if (checkImageType(list.projectFile.origin_name)) {
                                var content = '<img style="max-width: 630px;" src="/resources/upload_files/' + list.projectFile.change_name + '" alt="file" class="imgthumb">'
                            } else {
                                var content = "<a href='/resources/upload_files/" + list.projectFile.change_name + "'download " +
                                    "type='text/example')>" + list.projectFile.origin_name + "</a>"
                            }
                            content += "<input type='hidden' name='file_no' value='" + list.projectFile.file_no + "'>"
                            content += "<input type='hidden' name='change_name' value='" + list.projectFile.change_name + "'>"
                            content += "<input type='hidden' name='origin_name' value='" + list.projectFile.origin_name + "'>"
                            content += "<input type='hidden' name='path' value='" + list.projectFile.path + "'>"
                            $("#postFileArea").html(content);
                            $("#postFileArea").css("display", "block")
                        }
                        $("#postForListArea").html('')
                        if (list.postForEmpList != null) {
                            $.each(list.postForEmpList, function (i, obj) {
                                var content = '<b style="color: #3C3B3D"> @' + obj.name + '</b>'
                                content += '<input type="hidden" value="' + obj.emp_no + '">'
                                $("#postForListArea").append(content)
                                $("#postForListArea").css("display", "block")
                            })
                        }
                        //console.log(list.count)
                        $(".viewCount").text("조회 " + list.post.count)
                        if ("${sessionScope.loginEmp.emp_no}" == list.post.emp_no) {
                            // console.log('확인')
                            $("#postEditBtn").parent().css("display", "block")
                        } else {
                            $("#postEditBtn").parent().css("display", "none")
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
                        $("#schTitle").html(list.sch.sch_title)
                        $("#schContent").html(list.sch.sch_content)
                        $("#schWriter").html(list.sch.name)
                        $("#schUploadDate").html(list.sch.create_date)
                        $(".detailViewBoard_no").val(list.sch.board_no)
                        if (moment(list.sch.sch_start).format('YYYY-MM-DD LT') == moment(list.sch.sch_end).format('YYYY-MM-DD LT')) {
                            $("#schDate").html(
                                moment(list.sch.sch_start).format('YYYY-MM-DD (ddd)')
                            )
                        } else if (moment(list.sch.sch_start).format('YYYY-MM-DD (ddd)') == moment(list.sch.sch_end).format('YYYY-MM-DD (ddd)')) {
                            $("#schDate").html(
                                moment(list.sch.sch_start).format('YYYY-MM-DD ')
                                + moment(list.sch.sch_start).format('LT') + ' ~ '
                                + moment(list.sch.sch_end).format('LT (ddd)')
                            )
                        } else {
                            $("#schDate").html(
                                moment(list.sch.sch_start).format('YYYY-MM-DD LT (ddd)') + " ~ " + moment(list.sch.sch_end).format('YYYY-MM-DD LT (ddd)')
                            )
                        }

                        $("#schPlace").html(list.sch.sch_place)
                        //console.log(list.count)
                        $(".viewCount").text("조회 " + list.sch.count)
                        if ("${sessionScope.loginEmp.emp_no}" == list.sch.emp_no) {
                            // console.log('확인')
                            $("#schEditBtn").parent().css("display", "block")
                        } else {
                            $("#schEditBtn").parent().css("display", "none")
                        }
                        $.each(list.schAttendeeList, function (i, obj) {
                            if (obj.emp_no != ${pjMember.emp_no}) {
                                var content = '<tr>'
                                content += '<td rowspan="2">'
                                if (obj.change_name != undefined) {
                                    content += '<img alt="image" style="height: 45px;"'
                                    content += 'src="/resources/upload_files/'+ obj.change_name +'"'
                                    content += 'class="rounded-circle mr-1">'
                                }else {
                                    content += '<img alt="image" style="height: 45px;"'
                                    content += 'src="/resources/assets/img/avatar/avatar-1.png"'
                                    content += 'class="rounded-circle mr-1">'
                                }
                                content += '</td>'
                                content += '<th style="width: 50%" class="emp_name">' + obj.name + '</th>'
                                content += '<td rowspan="2" style="width: 20%; text-align: right;">'
                                content += '<div class="custom-control custom-checkbox">'
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
                                $("#viewSchAttendee").find(".inviteTable").append(content)
                            }
                        })
                        loadSchAttendee(list.sch.board_no)
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
                        if ("${sessionScope.loginEmp.emp_no}" == list[0].emp_no) {
                            // console.log('확인')
                            $("#todoEditBtn").parent().css("display", "block")
                        } else {
                            $("#todoEditBtn").parent().css("display", "none")
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
                                    content += '<div class="todoForName" style="color: #8c98f3;width: 50%; display: inline-block">' + moment(obj.todo_end).format('MM-DD') + '</div>'
                                } else {
                                    content += '<div style="width: 50%; display: inline-block"></div>'
                                }
                                if (obj.todo_for != undefined) {
                                    content += '<div style="width: 50%; display: inline-block">' + obj.todo_for_name + '</div>'
                                } else {
                                    content += '<div style="width: 50%; display: inline-block"></div>'
                                }
                                content += '</div>'
                                content += '</div>'
                                $("#todos").append(content)
                            }
                        )
                        $("#todoCompleteCount").html(completeCount + "&nbsp;")
                        $("#todoCompletePercent").html(Math.floor(completeCount / list.length * 100) + "%")
                        $("#todoBar").attr("data-width", $("#todoCompletePercent").text())
                        $("#todoBar").attr("style", 'width:' + $("#todoCompletePercent").text() + ';')
                    }
                })
            }
        loadBoardProfile($board_no)
            loadReply($board_no)
            $("#boardView").modal("show")

        }
    )

    //
    // $("#close").click(function () {
    //     //console.log("진입확인")
    //     $("#fileAndMentionArea").html(
    //         '<input type="text" class="form-control" id="file-label"' +
    //         'style="display: none; border: 0px white;">' +
    //         '<input type="file" name="upload_file" id="upload-file" hidden>' +
    //         '<i class="bi bi-paperclip fa-2x fileUploadBtn"></i>' +
    //         '<i class="bi bi-person fa-2x postFor"></i>'
    //     )
    //     $("#postForArea").html('')
    //     $('#summernote').summernote('reset');
    //     $(".todos").html(
    //         '<div class="form-group row">' +
    //         '<div class="col-lg-1 pr-0 text-right">' +
    //         '</div>' +
    //         '<div class="text-md-right col-10 col-md-7 col-lg-9">' +
    //         '<input type="text" class="form-control"' +
    //         'placeholder="할 일 추가 / 최대 50자" name="todo_content">' +
    //         '</div>' +
    //         '<div class="col-sm-12 col-md-3 col-lg-1">' +
    //         '<div class="input-group todoInput date" style="width: 100px;">' +
    //         '<input type="text" style="display: none; width:25px;"' +
    //         'class="form-control bg-white border-0 small todoDue">' +
    //         '<span class="bi bi-calendar fa-2x mr-3 todoCalendar input-group-addon"></span>' +
    //         '</div>' +
    //         '</div>' +
    //         '<div class="col-lg-1">' +
    //         '<i class="bi bi-person fa-2x todoPerson"></i>' +
    //         '<p class="todoFor" style="font-size: 11px; margin-top: 6px;">' +
    //         '<input type="hidden" name="todo_for">' +
    //         '</p>' +
    //         '</div>' +
    //         '<input type="hidden" name="status" value="N">' +
    //         '</div>'
    //     )
    //     datepickerLoad()
    //     loadBoards()
    // })
</script>

<%-- 프로젝트 헤드 --%>
<script>
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

    $(document).on('click', '#restorePjBtn', function () {
        if (confirm("프로젝트를 복구하시겠습니까?")) {
            location.href = "/project/restoreProject.do?pj_no=" +
            ${pj.pj_no}
        }
    })


    $(document).on('click', '#setPj', function () {
        $("#editPj").find("input[name=pj_title]").val("${pj.pj_title}")
        $("#editPj").find("input[name=pj_content]").val("${pj.pj_content}")
        $("#editPj").find("input[name=pj_content]").text("${pj.pj_content}")
        <%--console.log("${pj.board_power}")--%>
        <%--console.log("${pj.reply_power}")--%>
        <%--console.log("${pj.file_power}")--%>
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


    function loadViewEmpInPj() {
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
                    content += '<td rowspan="2">'
                    if (obj.change_name != undefined) {
                        content += '<img alt="image" style="height: 45px;"'
                        content += 'src="/resources/upload_files/'+ obj.change_name +'"'
                        content += 'class="rounded-circle mr-1">'
                    }else {
                        content += '<img alt="image" style="height: 45px;"'
                        content += 'src="/resources/assets/img/avatar/avatar-1.png"'
                        content += 'class="rounded-circle mr-1">'
                    }
                    content += '<input type="hidden" class="inviteEmpNo" value="' + obj.emp_no + '">'
                    content += '</td>'
                    content += '<th style="width: 50%; text-align: center">' + obj.name + '</th>'
                    content += '<td rowspan="2" style="width: 30%; text-align: right;">'
                    if ('${pjMember.admin}' == 'Y' && obj.admin == 'N') {
                        content += '<button type="button" class="btn btn-sm btn-dark deportBtn">내보내기</button>'
                        content += '<button type="button" class="btn btn-sm btn-primary setAdminBtn">관리자 지정</button>'
                    }
                    if (obj.admin == 'Y') {
                        content += '<b>관리자</b>'
                    }
                    content += '</td>'
                    content += '</tr>'
                    content += '<tr>'
                    if (obj.job_name != undefined) {
                        content += '<td style="text-align: center;">' + obj.job_name + '</td>'
                    } else {
                        content += '<td style="text-align: center;">직급이 없습니다.</td>'
                    }
                    content += '</tr>'

                    $(".inviteTable").append(content)
                })


                $("#empListModal").modal("show")
            }
        })
    }

    $(document).on('click', '.deportBtn', function () {
        console.log($(this).parent().parent().find(".inviteEmpNo").val())
        console.log("${pj.pj_no}")
        if (confirm("내보내시겠습니까?")) {
            $.ajax({
                url: '/project/deportEmp.do',
                data: {
                    "pj_no": ${pj.pj_no},
                    "emp_no": $(this).parent().parent().find(".inviteEmpNo").val()
                },
                async: false,
                success: function (list) {
                    console.log('확인')
                }
            })
            loadViewEmpInPj()
        }
    })

    $(document).on('click', '.setAdminBtn', function () {
        console.log($(this).parent().parent().find(".inviteEmpNo").val())
        console.log("${pj.pj_no}")
        if (confirm("해당 사원을 관리자로 지정하시겠습니까?")) {
            $.ajax({
                url: '/project/setAdmin.do',
                data: {
                    "pj_no": ${pj.pj_no},
                    "emp_no": $(this).parent().parent().find(".inviteEmpNo").val()
                },
                async: false,
                success: function (data) {
                    console.log('dd')
                }
            })
            loadViewEmpInPj()
        }

    })


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

    function removeTagByPjNo(tag_no) {
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
        if (checkStored()) {
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
                            content += '<td rowspan="2">  <img style="height: 45px" alt="image"'
                            if (obj.change_name != undefined) {
                                content += '<img alt="image" style="height: 45px;"'
                                content += 'src="/resources/upload_files/'+ obj.change_name +'"'
                                content += 'class="rounded-circle mr-1">'
                            }else {
                                content += '<img alt="image" style="height: 45px;"'
                                content += 'src="/resources/assets/img/avatar/avatar-1.png"'
                                content += 'class="rounded-circle mr-1">'
                            }
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
                            $("#inviteEmpBtn").css("display", "inline-block")
                        })
                    } else {
                        var content = '<tr><td>초대할 수 있는 사원이 없습니다.</td></tr>'
                        $(".inviteTable").append(content)
                        $("#inviteEmpBtn").css("display", "none")
                    }

                    $("#inviteModal").modal("show")
                }
            })
        }

    })

    function setColor(selectedProjects, selectedColor) {
        $.ajax({
            url: '/project/setProjectColor.do',
            data: {
                "selectedProjects": selectedProjects,
                "selectedColor": selectedColor,
                "pj_no": ${pj.pj_no}
            },
            success: function (data) {
                console.log(data)
                $(".colors").attr("class", "colors " + data)

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

</script>


<%--일반글--%>
<script>
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
                    if (obj.emp_no != ${pjMember.emp_no}) {
                        var content = '<tr>'
                        content += '<td rowspan="2">'
                        if (obj.change_name != undefined) {
                            content += '<img alt="image" style="height: 45px;"'
                            content += 'src="/resources/upload_files/'+ obj.change_name +'"'
                            content += 'class="rounded-circle mr-1">'
                        }else {
                            content += '<img alt="image" style="height: 45px;"'
                            content += 'src="/resources/assets/img/avatar/avatar-1.png"'
                            content += 'class="rounded-circle mr-1">'
                        }
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
                    }
                })
                $("#PostAddEmpBtn").css("display", "inline-block")
                $("#SchAddEmpBtn").css("display", "none")
                $("#mentionForModal").css("z-index", "123333")
                $("#mentionForModal").modal("show")
            }
        })
    })


    $(document).on('click', '#postBtn', function () {
        if (${pj.board_power == 'Y'} &&
        ${pjMember.admin == 'N'})
        {
            alert("관리자만 작성할 수 있습니다.")
            return false
        }
        if (checkStored()) {
            $("#postForm").css("display", "block")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "none")
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "#6777ef")
            $(".boardUploadForm").attr("id", "enrollPost");
            $(".boardUploadForm").attr("action", "/post/insertPost.do");
            $("#boardPost").modal("show")
        }
    })

    $(document).on('click', '#addPeople', function () {
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
                    if (obj.emp_no != ${pjMember.emp_no}) {
                        var content = '<tr>'
                        content += '<td rowspan="2">'
                        if (obj.change_name != undefined) {
                            content += '<img alt="image" style="height: 45px;"'
                            content += 'src="/resources/upload_files/'+ obj.change_name +'"'
                            content += 'class="rounded-circle mr-1">'
                        }else {
                            content += '<img alt="image" style="height: 45px;"'
                            content += 'src="/resources/assets/img/avatar/avatar-1.png"'
                            content += 'class="rounded-circle mr-1">'
                        }
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
                    }
                })
                $("#PostAddEmpBtn").css("display", "none")
                $("#SchAddEmpBtn").css("display", "inline-block")
                $("#mentionForModal").css("z-index", "111112")
                $("#mentionForModal").modal("show")
            }
        })
    })

</script>
<%--일정글--%>
<script>
    $(document).on('click', '#schBtn', function () {
        if (${pj.board_power == 'Y'} &&
        ${pjMember.admin == 'N'})
        {
            alert("관리자만 작성할 수 있습니다.")
            return false
        }
        if (checkStored()) {
            $("textarea[name=sch_content]").val('')
            $("textarea[name=sch_content]").text('')
            $("input[name=sch_attendee]").parent().parent().remove()
            $("#addPeople").css("display", "block")
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "block")
            $("#postTodo").css("display", "none")
            $(".switchSch").css("color", "#6777ef")
            $(".switchTodo").css("color", "black")
            $(".switchPost").css("color", "black")
            $(".boardUploadForm").attr("id", "enrollSch");
            $(".boardUploadForm").attr("action", "/schedule/insertSch.do");
            $("#boardPost").modal("show")
        }

    })
</script>

<%--할일글--%>
<script>
    $(document).on('click', '#todoBtn', function () {
        if (${pj.board_power == 'Y'} &&
        ${pjMember.admin == 'N'})
        {
            alert("관리자만 작성할 수 있습니다.")
            return false
        }
        if (checkStored()) {
            $("#postForm").css("display", "none")
            $("#postSch").css("display", "none")
            $("#postTodo").css("display", "block")
            $(".switchSch").css("color", "black")
            $(".switchTodo").css("color", "#6777ef")
            $(".switchPost").css("color", "black")
            $(".boardUploadForm").attr("id", "enrollTodo");
            $(".boardUploadForm").attr("action", "/todo/insertTodo.do");
            $("#boardPost").modal("show")
        }

    })

    var $forRemove
    var $todo
    $(document).on('click', '.todoPerson', function () {
        $forRemove = $(this)
        $todo = $(this).next()
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
                    var content = '<tr class="selectTodoFor">'
                    content += '<td rowspan="2">'
                    if (obj.change_name != undefined) {
                        content += '<img alt="image" style="height: 45px;"'
                        content += 'src="/resources/upload_files/'+ obj.change_name +'"'
                        content += 'class="rounded-circle mr-1">'
                    }else {
                        content += '<img alt="image" style="height: 45px;"'
                        content += 'src="/resources/assets/img/avatar/avatar-1.png"'
                        content += 'class="rounded-circle mr-1">'
                    }
                    content += '<input type="hidden" class="inviteEmpNo" value="' + obj.emp_no + '">'
                    content += '</td>'
                    content += '<th style="width: 50%; text-align: center">' + obj.name + '</th>'
                    content += '<td rowspan="2" style="width: 20%; text-align: right;">'
                    content += '</td>'
                    content += '</tr>'
                    content += '<tr>'
                    if (obj.job_name != undefined) {
                        content += '<td style="text-align: center;">' + obj.job_name + '</td>'
                    } else {
                        content += '<td style="text-align: center;">직급이 없습니다.</td>'
                    }
                    content += '</tr>'

                    $("#todoFor").find(".inviteTable").append(content)
                })
                $("#todoFor").find(".inviteTable").append('<tr><td></td>초대할 수 있는 사원이 없습니다.</tr>')

                $("#todoFor").css("z-index", "112222")
                $("#todoFor").modal("show")
            }
        })
    })

    $(document).on('click', '.ckedInput', function () {
        loadBoards()
    })
</script>


<script>
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


</script>
<script>
    var sum = loadRw()
    //console.log(sum)
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


<%--카카오맵--%>
<script>
    $(function (){
        var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.498971671111775, 127.03287470164285), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨
            };
        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);

        $("#kakaoMapSearch").keyup(function(){
            // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다

            // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places();
            // 키워드로 장소를 검색합니다
            var keyword = $("#kakaoMapSearch").val();
            //console.log(keyword)
            ps.keywordSearch(keyword, placesSearchCB);
            // 키워드 검색 완료 시 호출되는 콜백함수 입니다

        });
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new kakao.maps.LatLngBounds();
                for (var i = 0; i < data.length; i++) {
                    displayMarker(data[i]);
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }
                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }
        }

        // 지도에 마커를 표시하는 함수입니다
        function displayMarker(place) {
            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(place.y, place.x)
            });
            // 마커에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function () {
                // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                infowindow.open(map, marker);
                $("input[name=sch_place]").val(place.place_name);
            });
        }
    })

</script>
</html>