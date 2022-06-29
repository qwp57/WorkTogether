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
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-ko.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
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
                            <div class="card-body body-1">
                                <div>
                                    <button class="btn btn-primary newPj">+ 새 프로젝트</button>
                                </div>
                                <div class="detailTop">
                                    <div class="colors color-1"></div>
                                    <i class='icon fa fa-star fa-2x favoYellow'></i>
                                    <div class="btn-group dropright" id="pjMenu">
                                        <i class='fa fa-ellipsis-v fa-2x' data-toggle="dropdown"
                                           aria-haspopup="true" aria-expanded="false"
                                           style="width: 30px;"></i>
                                        <div class="dropdown-menu dropright">
                                            <a class="dropdown-item" href="#" id="setColor">색상 설정</a> <a
                                                class="dropdown-item" href="#" id="setTag">태그 설정</a> <a
                                                class="dropdown-item" href="#">참여자 조회</a> <a
                                                class="dropdown-item" href="#" id="setPj">프로젝트 설정</a>
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
                                        <a class="navMenu home">홈</a> <a
                                            class="navMenu calendar clicked">캘린더</a> <a class="navMenu drive">드라이브</a>
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


<jsp:include page="invitePjModal.jsp"></jsp:include>
<jsp:include page="colorTagModal.jsp"/>
<jsp:include page="pjForm.jsp"/>
</body>
<script>


    document.addEventListener('DOMContentLoaded', function () {
        // calendar element 취득
        var calendarEl = $('#calendar')[0];
// full-calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
            height: '800px', // calendar 높이 설정
            expandRows: true, // 화면에 맞게 높이 재설정
            slotMinTime: '08:00', // Day 캘린더에서 시작 시간
            slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
// 해더에 표시할 툴바
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
            },
            initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            editable: true, // 수정 가능?
            selectable: true, // 달력 일자 드래그 설정가능
            nowIndicator: true, // 현재 시간 마크
            dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
            locale: 'ko', // 한국어 설정


            eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                console.log(obj);
                console.log(obj.event._def.title);
                console.log(obj.event)
            },
            eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                console.log(obj);
            },
            eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                console.log(obj);
            },
            eventClick: function (info){
                if(confirm("'"+ info.event.title +"' 일정을 삭제하시겠습니까?")){
                    // 확인 클릭 시
                    info.event.remove();
                }

                /*   console.log(info.event);
                   var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                   var obj = new Object();
                   obj.title = info.event._def.title;
                   obj.start = info.event._instance.range.start;
                   events.push(obj);

                   console.log(events);
                   $(function deleteData(){
                       $.ajax({
                           url: "/full-calendar/calendar-admin-update",
                           method: "DELETE",
                           dataType: "json",
                           data: JSON.stringify(events),
                           contentType: 'application/json',
                           //addEvent도 같은 방식으로 데이터를 json으로 전송해서, DB에 추가해주면 되는지?
                       })
                   }) */
            },

            select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
                var title = prompt('일정을 입력해주세요.');
                if (title) {
                    //******addEvent에 ajax로 형식에 맞춰서 값을 넣어주면 되는지?*****
                    calendar.addEvent({
                        title: title,
                        start: arg.start,
                        end: arg.end,
                        allDay: arg.allDay
                    });
                    // $.ajax
                }
                calendar.unselect()
            },
// 이벤트 : *******조회하려면 VO 만들고, JSON을 ajax로 받으면 되는지?*******
            events: [
                {
                    title: 'All Day Event',
                    start: '2021-07-01',
                },
                {
                    title: 'All Day Event2',
                    start: '2021-07-01',
                },
                {
                    title: 'Long Event',
                    start: '2021-07-07',
                    end: '2021-07-10'
                },
                {
                    groupId: 999,
                    title: 'Repeating Event',
                    start: '2021-07-09T16:00:00',
                    end: '2021-07-09T20:00:00'
                },
                {
                    groupId: 999,
                    title: 'Repeating Event',
                    start: '2021-07-09T21:00:00'
                },
                {
                    title: 'Conference',
                    start: '2021-07-11',
                    end: '2021-07-13'
                },
                {
                    title: 'Meeting',
                    start: '2021-07-12T10:30:00',
                    end: '2021-07-12T12:30:00'
                },
                {
                    title: 'Lunch',
                    start: '2021-07-12T12:00:00'
                },
                {
                    title: 'Meeting',
                    start: '2021-07-12T14:30:00'
                },
                {
                    title: 'Happy Hour',
                    start: '2021-07-12T17:30:00'
                },
                {
                    title: 'Dinner',
                    start: '2021-07-12T20:00:00'
                },
                {
                    title: 'Birthday Party',
                    start: '2021-07-13T07:00:00'
                },
                {
                    title: 'Click for Google',
                    url: 'http://google.com/', // 클릭시 해당 url로 이동
                    start: '2021-07-28'
                }
            ]
        });
// 캘린더 랜더링
        calendar.render();

    });

</script>
<script>
    $(function () {
        $(document).on('click', '.newPj', function () {
            $("#makePj").modal("show")
        })

        $(document).on('click', '#setColor', function () {
            $("#colorModal").modal("show")
        })

        $(document).on('click', '#setTag', function () {
            $("#tagModal").modal("show")
        })

        $(document).on('click', '#tagEdit', function () {
            $("#tagEditModal").modal("show")
        })

        $(document).on('click', '.tagAddBtn', function () {
            console.log('테스트')
            $("#tagTable").append(
                '<tr>' +
                '<td><i class="fa fa-tag fa-lg"></i>' +
                '</td>' +
                '<th style="width: 50%">테스트</th>' +
                '<td style="width: 20%; text-align: right;">' +
                '<div class="custom-control custom-checkbox">' +
                '<input type="checkbox" class="custom-control-input" id="tag6">' +
                ' <label class="custom-control-label" for="tag6"></label>' +
                '</div>' +
                '</td>' +
                '<td style="width: 15%; text-align: right;">' +
                '<div class="btn-group dropright">' +
                '<i class="fa fa-ellipsis-v fa-lg" data-toggle="dropdown"' +
                'aria-haspopup="true" aria-expanded="false" style="width: 30px;"></i>' +
                '<div class="dropdown-menu dropright">' +
                '<a class="dropdown-item" href="#" id="tagEdit">수정</a>' +
                '<div class="dropdown-divider"></div>' +
                '<a class="dropdown-item" href="#">삭제</a>' +
                '</div>' +
                '</div>' +
                '</td>' +
                '</tr>'
            )
        })

        $(document).on('click', '.fa-star', function () {
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

        $(document).on('click', '.home', function () {
            location.href = "/project/detailPj.do"
        })
        $(document).on('click', '.drive', function () {
            location.href = "/project/drivePj.do"
        })

        $(document).on('click', '#inviteBtn', function () {
            $("#inviteModal").modal("show")
        })

    })

</script>
</html>