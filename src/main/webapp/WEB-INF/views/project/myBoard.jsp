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

    <%-- 카카오맵 api--%>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06989ef7025ad30be2fddb6e0d28320b&libraries=services"></script>

    <link
            href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
            rel="stylesheet">
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
    <style>
        body {
            color: black;
        }

        datepicker > datepicker-days {
            width: 275px;
        }

        .colors {
            -text: white;
            margin-left: 20px;
            padding: 20px;
            width: 25px;
            height: 25px;
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



        #postTodo {
            height: 70%;
        }


        .body-1 {
            padding-top: 0px !important;
        }


        .card {
            border-radius: 25px !important;
            margin-bottom: 0px;
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
            <div class="section-body">
                <div class="row mt-sm-4">
                    <div class="col-12 col-md-12 col-lg-12">
                        <h2>내가 쓴 게시물</h2>
                        <div class="input-group col-lg-6 mb-6">
                            <select class="sorttmenu" id="selectsearch" name="searchTarget">
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
                        <h1 class="section-title"
                            style="text-align: left; width: 50%; display: inline-block;">전체</h1>
                        <div
                                style="text-align: right; width: 49%; display: inline-block;">

                            <div class="btn-group dropright mt-4">
                                <img id="caSetting"
                                     src="https://img.icons8.com/external-yogi-aprelliyanto-basic-outline-yogi-aprelliyanto/64/undefined/external-equalizer-multimedia-yogi-aprelliyanto-basic-outline-yogi-aprelliyanto.png"
                                     style="width: 30px; margin-bottom: 36px;"
                                     data-toggle="dropdown" aria-haspopup="true"
                                     aria-expanded="false"/>
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
                        <hr>
                        <div class="card">
                            <div class="card-body body-1 p-0">
                                <table class="boardTable">
                                    <%--										<c:forEach var="index" begin="1" end="2">--%>
                                    <%--											<tr>--%>
                                    <%--												<td style="width: 7%"><div class="colors color-3"></div></td>--%>
                                    <%--												<td style="width: 7%; text-align: right; color: #f3a435;"><span--%>
                                    <%--													class='bi bi-file-text'></span></td>--%>
                                    <%--												<td style="width: 7%; text-align: left;">글</td>--%>
                                    <%--												<th style="width: 35%;">제목</th>--%>
                                    <%--												<td style="width: 12%;">작성자</td>--%>
                                    <%--												<td style="width: 20%;">2022-06-02 01:15</td>--%>
                                    <%--												<td style="width: 12%;">d</td>--%>

                                    <%--											</tr>--%>
                                    <%--										</c:forEach>--%>
                                    <%--										<tr>--%>
                                    <%--											<td style="width: 7%"><div class="colors color-1"></div></td>--%>
                                    <%--											<td style="width: 7%; text-align: right; color: #35f364"><span--%>
                                    <%--												class="bi bi-calendar"></span></td>--%>
                                    <%--											<td style="width: 7%; text-align: left;">일정</td>--%>
                                    <%--											<th style="width: 35%;">제목</th>--%>
                                    <%--											<td style="width: 12%;">작성자</td>--%>
                                    <%--											<td style="width: 20%;">2022-06-02 01:15</td>--%>
                                    <%--											<td style="width: 12%;"><b>6/10</b><br> <a--%>
                                    <%--												style="font-size: smaller">오전 10:45</a></td>--%>
                                    <%--										</tr>--%>
                                    <%--										<tr>--%>
                                    <%--											<td style="width: 7%"><div class="colors color-5"></div></td>--%>
                                    <%--											<td style="width: 7%; text-align: right; color: #3591f3"><span--%>
                                    <%--												class="bi bi-check2-square"></span></td>--%>
                                    <%--											<td style="width: 7%; text-align: left;">할 일</td>--%>
                                    <%--											<th style="width: 35%;">제목</th>--%>
                                    <%--											<td style="width: 12%;">작성자</td>--%>
                                    <%--											<td style="width: 20%;">2022-06-02 01:15</td>--%>
                                    <%--											<td style="width: 12%;"><span class="badge"--%>
                                    <%--												style="background-color: #3591f3; height: 100%; font-size: 18px; color: white;">20%</span>--%>
                                    <%--											</td>--%>

                                    <%--										</tr>--%>
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
                </div>
            </div>

        </section>
    </div>
</div>
</body>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="boardEnrollModal.jsp"/>
<script src="/resources/assets/js/pjHome.js"></script>
<script>
    $(function () {
        changePage(1)
        $("#boardPost").find("input[name=type]").val('myBoard')
    })


    function sendajax(searchTarget, searchKeyword, type, currentPage) {
        console.log(type);

        $.ajax({
            url: "/project/pagingAndSerachPj.do",
            type: "post",
            data: {
                searchTarget: searchTarget,
                searchKeyword: searchKeyword,
                board_type: type,
                pj_no: 0,
                currentPage: currentPage
            },
            success: function (result) {
                console.log("데이터 가져옴");
                // console.log(result)
                let data = JSON.parse(result);
                console.log(data);
                setList(data.list, 'myBoard')
                setpi(data.pi);
                loadPjColor()
            }
        })

        console.log("sendajax 끝남");

    }

    function loadPjColor() {
        $.ajax({
            url: '/project/selectProjectColor.do',
            success: function (list) {
                console.log(list)
                $.each(list, function (i, obj) {
                    $(".pj_no" + obj.pj_no).parent().parent().find(".colors").addClass(obj.pj_color)
                    $("#boardView").find(".pj_no" + obj.pj_no).addClass(obj.pj_color)

                })
            }
        })
    }


    $(document).on('click', '.boardTable tr', function () {
            console.log($(this).find(".board_no").val())
            $board_no = $(this).find(".board_no").val()
            console.log($(this).find(".board_type").val())
            pj_no = $(this).find("input[name=pj_no]").val()
            var list = loadPj($(this).find("input[name=pj_no]").val())
            console.log(list)
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
                        }else if (moment(list.sch.sch_start).format('YYYY-MM-DD (ddd)') == moment(list.sch.sch_end).format('YYYY-MM-DD (ddd)')) {
                            $("#schDate").html(
                                moment(list.sch.sch_start).format('YYYY-MM-DD ')
                                + moment(list.sch.sch_start).format('LT') + ' ~ '
                                + moment(list.sch.sch_end).format('LT (ddd)')
                            )
                        }  else {
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
            loadReply($board_no)
            $("#boardView").modal("show")

        }
    )
</script>

<%--게시글 전체--%>
<script>
    function checkStored() {
        if (${pj.status == 'N'}) {
            alert("보관된 프로젝트는 작성/수정/삭제 관련 기능이 제한됩니다.")
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
                obj2.setAttribute('value', 0); //객체값
                form.appendChild(obj2);
                obj3 = document.createElement('input'); // 값이 들어있는 녀석의 형식
                obj3.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
                obj3.setAttribute('name', 'type'); // 객체이름
                obj3.setAttribute('value', 'myBoard'); //객체값
                form.appendChild(obj3);
                form.setAttribute('method', 'post'); //get,post 가능
                form.setAttribute('action', "/project/deleteBoard.do"); //보내는 url
                document.body.appendChild(form);
                form.submit();
            }
        }

    })


</script>

<%--할일글--%>
<script>
    $(document).on('click', '.ckedInput', function () {
        loadBoards()
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