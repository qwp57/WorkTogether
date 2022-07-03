<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
            rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"
            integrity="sha512-x/vqovXY/Q4b+rNjgiheBsA/vbWA3IVvsS8lkQSX1gQ4ggSJx38oI2vREZXpTzhAv6tNUaX81E7QBBzkpDQayA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/locale/ko.min.js"
            integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
          #caSetting:hover, .fa-star:hover, .fa-ellipsis-v:hover, .navMenu:hover, .fa-plus:hover, .todoCalendar, .todoPerson, .switchPost, .switchSch, .switchTodo {
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

</body>
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
                                moment(list.sch.sch_start).format('YYYY-MM-DD (ddd)') + " ~ " + moment(list.sch.sch_end).format('YYYY-MM-DD (ddd)')
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
                            if (obj.emp_no != ${emp_no}) {
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
                    groupId: ${sch.board_no}
                }
                </c:when>
                <c:otherwise>
                {
                    title: '${sch.sch_title}',
                    start: '${sch.sch_start}',
                    end: '${sch.sch_end}',
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
    $(function (){
        $("#boardPost").find("input[name=type]").val("allCalendar")
    })
    $(document).on('click', '#schJoin', function (){

    })
    function checkStored() {
        if (${pj.status == 'N'}) {
            alert("보관된 프로젝트는 작성/수정 관련 기능이 제한됩니다.")
            return false
        } else {
            return true
        }
    }



    $(document).on('click', '.addReplyBtn', function () {
        if (${pj.reply_power == 'Y'} &&
        ${pjMember.admin == 'N'})
        {
            alert("관리자만 작성할 수 있습니다.")
            return false
        }
        if (checkStored()) {
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
        }
    })


    $(document).on('click', '.boardDeleteBtn', function () {
        if (checkStored()) {
            if (confirm("삭제하시겠습니까?")) {
                var form = document.createElement('form'); // 폼객체 생성
                var obj1;
                var obj2;
                var obj3;
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
                obj3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
                obj3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
                obj3.setAttribute('name', 'type'); // 객체이름
                obj3.setAttribute('value', ''); //객체값
                form.appendChild(obj3);
                form.setAttribute('method', 'post'); //get,post 가능
                form.setAttribute('action', "/project/deleteBoard.do"); //보내는 url
                document.body.appendChild(form);
                form.submit();
            }
        }
    })

</script>
<script>
    $(function () {


    })

</script>
</html>