<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>프로젝트 상세보기 - 캘린더</title>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

<head>
    <meta charset="UTF-8">


    <%-- 카카오맵 api--%>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06989ef7025ad30be2fddb6e0d28320b&libraries=services"></script>

    <link
            href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
            rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">

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
    <style>
        body {
            color: black;
            font-family: 'Nanum Gothic', sans-serif;
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
            color: gray;
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

        #caSetting, .favoBtn, .navMenu, .fa-plus, .todoCalendar, .todoPerson, #todoEditBtn, .todoDue, .todoFor, .selectTodoFor, #schEditBtn, .viewAttendee,
        .switchPost, .switchSch, .switchTodo, disconnectingTagBtn, .fileUploadBtn, .postFor, .removeTodo, .boardDeleteBtn, #postEditBtn, .editReplyBtn, .deleteReplyBtn {
            cursor: pointer;
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


        .card {
            border-radius: 25px !important;
            margin-bottom: 0px;
        }

    </style>
</head>
<body>
<div class="main-content">
    <div style="height: 50px;"></div>
    <div class="container">
        <section class="section">

            <jsp:include page="projectHead.jsp"/>


            <div class="section-body">

                <div class="row mt-sm-4">

                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-body body-2">
                                <div id="calendar"></div>
                            </div>
                        </div>
                    </div>
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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // calendar element 취득
        var calendarEl = document.getElementById('calendar');
// full-calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
            googleCalendarApiKey: "AIzaSyBnwhawjRdP8NTTPx4cvuu5zr35zZB6mAI",
            eventSources: [
                {
                    googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com'
                    , backgroundColor: "gray"
                    , textColor: 'orange'
                }
            ],
            height: '800px', // calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
// 해더에 표시할 툴바
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,listWeek'
            },

            initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            selectable: true, // 달력 일자 드래그 설정가능
            nowIndicator: true, // 현재 시간 마크
            dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
            editable: false,
            locale: 'ko', // 한국어 설정

            select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
                <%--일정글--%>
                console.log(arg)
                //moment(list.sch.sch_end).format('YYYY-MM-DD (ddd)')


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
                    $("input[name=sch_start]").val(moment(arg.startStr).format('YYYY-MM-DD h:mm'))
                    //종료일 하루 빼기
                    var y = arg.endStr.substr(0, 4);
                    var m = arg.endStr.substr(5, 2);
                    var d = arg.endStr.substr(8, 2);
                    console.log(y, m, d)
                    var endDate = new Date(y, m - 1, d);
                    $("input[name=sch_end]").val(moment(endDate.setDate(endDate.getDate() - 1)).format('YYYY-MM-DD h:mm'))
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
                    calendar.unselect()
                }

            },
            eventClick: function (info) {
                console.log(info)
                console.log(info.event.groupId)

                $.ajax({
                    url: '/schedule/detailView.do',
                    data: {
                        "board_no": info.event.groupId
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
                        }else if (moment(list.sch.sch_start).format('YYYY-MM-DD (ddd)') == moment(list.sch.sch_end).format('YYYY-MM-DD (ddd)')) {
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
                                content += '<td rowspan="2"><span class="bi bi-person-circle fa-2x"></span>'
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
                        loadBoardProfile(info.event.groupId)
                        loadSchAttendee(info.event.groupId)
                        loadReply(info.event.groupId)

                        $("#boardView").modal("show")
                    }

                })

            },
// 이벤트 : *******조회하려면 VO 만들고, JSON을 ajax로 받으면 되는지?*******
            events: [
                <c:forEach items="${ schList }" var="sch" varStatus="status">
                <c:choose>
                <c:when test="status.last">
                {
                    title: '${sch.sch_title}',
                    start: '${sch.sch_start}',
                    end: '${sch.sch_end}',
                    <c:if test="${sch.sch_start == sch.sch_end}">allDay: true,</c:if>
                    groupId: ${sch.board_no}
                }
                </c:when>
                <c:otherwise>
                {
                    title: '${sch.sch_title}',
                    start: '${sch.sch_start}',
                    end: '${sch.sch_end}',
                    <c:if test="${sch.sch_start == sch.sch_end}">allDay: true,</c:if>
                    groupId: ${sch.board_no},
                },
                </c:otherwise>
                </c:choose>
                </c:forEach>

            ]
        });
// 캘린더 랜더링
        calendar.render();

    });

</script>

<script>
    $(function () {
        $(".calendar").addClass("clicked")
        $(".home").removeClass("clicked")
        $(".drive").removeClass("clicked")
        $("#editPj").find("input[name=type]").val("calendar")
        $("#boardPost").find("input[name=type]").val("calendar")
    })
    $(document).on('click', '.home', function () {

        location.href = "/project/detailPj.do?pj_no=" +
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
<%--게시글 전체--%>
<script>


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
                    var content = '<tr class="empNameTr">'
                    content += '<td rowspan="2">'
                    if (obj.change_name != undefined) {
                        content += '<img alt="image" style="height: 45px;"'
                        content += 'src="/resources/upload_files/' + obj.change_name + '"'
                        content += 'class="rounded-circle mr-1">'
                    } else {
                        content += '<img alt="image" style="height: 45px;"'
                        content += 'src="/resources/assets/img/avatar/avatar-1.png"'
                        content += 'class="rounded-circle mr-1">'
                    }
                    content += '<input type="hidden" class="inviteEmpNo" value="' + obj.emp_no + '">'
                    content += '</td>'
                    content += '<th style="width: 50%; text-align: center" class="emp_name">' + obj.name + '</th>'
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
                $("#empListModalSearch").val("")

                $("#empListModal").modal("show")
            }
        })
    }

    $(document).on('click', '.boardDeleteBtn', function () {
        if (checkStored()) {
            if (confirm("삭제하시겠습니까?")) {
                console.log('진입')
                $.ajax({
                    type: 'POST',
                    url: '/project/deleteBoard.do',
                    data: {
                        "pj_no": ${pj.pj_no},
                        "board_no": $(this).parent().find(".detailViewBoard_no").val()
                    },success: function () {
                        $("#boardView").modal("hide")
                        location.reload()
                        alert("게시물 삭제 완료")
                    }
                })
            }
        }
    })

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
                    //console.log('dd')
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
                if(data.tagByEmpNo.length > 0){
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
                }else {
                    $("#tagTable").append(
                        '<tr><td>생성한 태그가 없습니다.</td></tr>'
                    )
                }


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
                            var content = '<tr class="empNameTr">'
                            content += '<td rowspan="2">  <img style="height: 45px" alt="image"'
                            if (obj.change_name != undefined) {
                                content += '<img alt="image" style="height: 45px;"'
                                content += 'src="/resources/upload_files/' + obj.change_name + '"'
                                content += 'class="rounded-circle mr-1">'
                            } else {
                                content += '<img alt="image" style="height: 45px;"'
                                content += 'src="/resources/assets/img/avatar/avatar-1.png"'
                                content += 'class="rounded-circle mr-1">'
                            }
                            content += '</td>'
                            content += '<th style="width: 50%" class="emp_name">' + obj.name + '</th>'
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
        alert("태그 설정이 완료되었습니다.")
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
                        var content = '<tr class="empNameTr">'
                        content += '<td rowspan="2">'
                        if (obj.change_name != undefined) {
                            content += '<img alt="image" style="height: 45px;"'
                            content += 'src="/resources/upload_files/' + obj.change_name + '"'
                            content += 'class="rounded-circle mr-1">'
                        } else {
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
                $("#mentionForModalSearch").val("")
                $("#PostAddEmpBtn").css("display", "none")
                $("#SchAddEmpBtn").css("display", "inline-block")
                $("#mentionForModal").css("z-index", "111112")
                $("#mentionForModal").modal("show")
            }
        })
    })

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