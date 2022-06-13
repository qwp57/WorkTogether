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
                                                class="dropdown-item" href="#"  id="setPj">프로젝트 설정</a>
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
<jsp:include page="colorTagModal.jsp" />
<jsp:include page="pjForm.jsp" />
</body>
<script>

    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            locale: 'ko',	//한국어 설정
            //헤더에 표시할 툴바
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            allDayText: '시간',
            axisFormat: 'HH:mm',
            timeFormat: 'HH:mm',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            buttonText: {
                today: '오늘',
                month: '월간',
                week: '주간',
                day: '일간'
            },
            fixedWeekCount: false,
            selectable: true,
            selectHelper: true,
            editable: true,     // 드래그 수정 가능 여부
            droppable: true,    // drop 가능하게
        });
        calendar.render();
    });

</script>
<script>
    $(function () {
    	$(document).on('click', '.newPj', function(){
			$("#makePj").modal("show")
		})
		
    	$(document).on('click', '#setColor', function(){
			$("#colorModal").modal("show")
		})
		
		$(document).on('click', '#setTag', function(){
			$("#tagModal").modal("show")
		})
		
		$(document).on('click', '#tagEdit', function(){
			$("#tagEditModal").modal("show")
		})
		
		$(document).on('click', '.tagAddBtn', function(){
			console.log('테스트')
			$("#tagTable").append(
					'<tr>'+
					'<td><i class="fa fa-tag fa-lg"></i>'+
					'</td>'+
					'<th style="width: 50%">테스트</th>'+
					'<td style="width: 20%; text-align: right;">'+
						'<div class="custom-control custom-checkbox">'+
							'<input type="checkbox" class="custom-control-input" id="tag6">'+
								' <label class="custom-control-label" for="tag6"></label>'+
						'</div>'+
					'</td>'+
					'<td style="width: 15%; text-align: right;">'+
						'<div class="btn-group dropright">'+
							'<i class="fa fa-ellipsis-v fa-lg" data-toggle="dropdown"'+
							   'aria-haspopup="true" aria-expanded="false" style="width: 30px;"></i>'+
							'<div class="dropdown-menu dropright">'+
								'<a class="dropdown-item" href="#" id="tagEdit">수정</a>'+
								'<div class="dropdown-divider"></div>'+
								'<a class="dropdown-item" href="#">삭제</a>'+
							'</div>'+
						'</div>'+
					'</td>'+
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
            location.href = "/detailPj.do"
        })
        $(document).on('click', '.drive', function () {
            location.href = "/drivePj.do"
        })

        $(document).on('click', '#inviteBtn', function () {
            $("#inviteModal").modal("show")
        })

    })

</script>
</html>