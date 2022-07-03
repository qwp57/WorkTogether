$(document).on('click', '#schEditBtn', function () {
    if (checkStored()) {


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
                // if (data.sch_attendee != undefined) {
                //     $("#addPeople").val(data.sch_attendee)
                // }
            }
        })
        $(".boardUploadForm").append(
            '<input type="hidden" name="board_no" value="' + board_no + '">'
        )
        $(".boardUploadForm").attr("id", "editSch");
        $(".boardUploadForm").attr("action", "/schedule/editSch.do");
        $("#boardPost").modal("show")
        $("#boardPost").css("z-index", "111111")
    }
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

$(document).on('click', '#SchAddEmpBtn', function () {
    if ($(this).parents("#mentionForModal").find(".inviteEmpNo:checked").length == 0) {
        alert("한명 이상 선택해주세요.")
        return false
    }
    console.log($(this).parents("#mentionForModal").find(".emp_name"))
    console.log($(this).parents("#mentionForModal").find(".inviteEmpNo"))
    $(this).parents("#mentionForModal").find(".inviteEmpNo:checked").each(function (e) {
        var content = $(this).parents("tr").find(".emp_name").text()
        $("#addPeople").parent().append('<span class="empName">' + content + '<span><input type="hidden" name="sch_attendee" ' +
            'value="' + $(this).val() + '">' +
            '<i class="bi bi-x fa-2x removeEmp" style="color: red; padding-right: 0px;"></i></span></span>')
    })
    if ($("input[name=sch_attendee]").length > 0) {
        $("#addPeople").css("display", "none")
    }
    $("#mentionForModal").modal("hide")
})

$(document).on('click', '#schJoin', function () {
    var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
    schJoin('Y', board_no)
})

$(document).on('click', '#schNotJoin ', function () {
    var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
    schJoin('N', board_no)
})

function loadSchAttendee(board_no) {
    $.ajax({
        url: '/schedule/loadSchAttendee.do',
        data: {
            "board_no": board_no
        },
        async: false,
        success: function (data) {
            console.log(data)
            $("#schYCount").text('참석 ' + data.yCount)
            $("#schNCount").text('불참' + data.nCount)
        }
    })
}

function schJoin(status, board_no) {
    $.ajax({
        url: '/schedule/schJoin.do',
        data: {
            "board_no": board_no,
            "status": status
        },
        async: false,
        success: function (data) {
            console.log('dd')
        }
    })
    loadSchAttendee(board_no)
}

$(document).on('click', '.viewAttendee', function () {
    $.ajax({
        url: '/schedule/selectSchAttendee.do',
        data: {
            "board_no": $(this).parents(".boardBody").find(".detailViewBoard_no").val(),
        },
        success: function (list) {
            console.log(list)
            $("#viewSchAttendee").find(".inviteTable").html('')
            console.log(list.length)
            if (list.length > 0) {
                $.each(list, function (i, obj) {
                    var content = '<tr>'
                    content += '<td rowspan="2"><span class="bi bi-person-circle fa-2x"></span>'
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

                    $("#viewSchAttendee").find(".inviteTable").append(content)
                })
            } else {
                $("#viewSchAttendee").find(".inviteTable").append('<tr><td>참석한 사원이 없습니다.</td></tr>')
            }

            $("#viewSchAttendee").modal("show")
        }
    })

})

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
