$(document).on('change', '.todoDue', function () {
    console.log($(this).val())
    if ($(this).val() != "") {
        $(this).css("display", "block")
        $(this).next().css("display", "none")
    }
})

$(document).on('click', '.ckedInput', function () {
    if(checkStored()) {
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
        var percent = $(".ckedInput:checked").length / $(".ckedInput").length * 100
        $("#todoCompletePercent").html(Math.floor(percent) + '%')
        $("#todoBar").attr("data-width", percent + '%;')
        $("#todoBar").attr("style", 'width:' + percent + '%;')
    }
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

$(document).on('click', '.todoFor', function () {
    $(this).parent().html(' <i class="bi bi-person fa-2x todoPerson"></i>' +
        '<p class="todoFor" style="font-size: 11px; margin-top: 6px;"></p>'
    )
})

$(document).on('click', '.removeTodo', function () {
    $(this).parent().parent().remove()
})

$(document).on('click', '#addTodo', function () {
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
        '<p class="todoFor" style="font-size: 11px; margin-top: 6px;">' +
        '<input type="hidden" name="todo_for">' +
        '</p>' +
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
$('.todoInput').datepicker().on("clearDate", function (e) {
    console.log(e.currentTarget)
    var $test = e.currentTarget;
    $($test).children(".todoCalendar").css("display", "block")
    $($test).children(".todoDue").css("display", "none")

})
$(document).on('click', '.selectTodoFor', function () {
    console.log($forRemove)
    console.log($(this))
    console.log($(this).find(".inviteEmpNo").val())
    console.log($(this).children().eq(1).text())
    var content = '<a>' + $(this).children().eq(1).text() + '</a>'
    content += '<input type="hidden" name="todo_for" value="' + $(this).find(".inviteEmpNo").val() + '">'
    $todo.html(content)
    $forRemove.remove()
    $("#todoFor").modal("hide")
})
$(document).on('click', '#todoEditBtn', function () {
    if (checkStored()) {
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
                        if (obj.todo_for != undefined) {
                            content += '<p class="todoFor" style="font-size: 11px; margin-top: 6px;">'
                            content += '<a>' + obj.todo_for_name + '</a>'
                            content += '<input type="hidden" name="todo_for" value="' + obj.todo_for + '">'
                            content += '</p>'
                        } else {
                            content += '<i class="bi bi-person fa-2x todoPerson"></i>'
                            content += '<p class="todoFor" style="font-size: 11px; margin-top: 6px;">'
                            content += '<input type="hidden" name="todo_for">'
                            content += '</p>'
                        }
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
    }
})