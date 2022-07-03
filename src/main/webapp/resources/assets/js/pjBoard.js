$(document).on('click', '.deleteReplyBtn', function () {
    if (checkStored()) {
        if (confirm("댓글을 삭제하시겠습니까?")) {
            //console.log($(this).parent().find(".reply_no").val())
            var reply_no = $(this).parent().find(".reply_no").val()
            var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
            //console.log(board_no)
            deleteReply(reply_no, board_no)
        }
    }
})
$(document).on('click', '.editReplyBtn', function () {
    if (checkStored()) {
        var reply_no = $(this).parent().find(".reply_no").val()
        var reply_content = $(this).parents(".reply").find(".replyContent").text()
        $(this).parents(".reply").find(".replyContent").html(
            '<input type=text style="width: 75%; display: inline-block" class="form-control replyEditContent" value="' + reply_content + '">' +
            '<button type="button" style="height: 42px;" class="replyEditSubmit btn btn-lg btn-primary");">수정</button>' +
            '<input type="hidden" value="' + reply_no + '">'
        )
        $(this).parent().remove()
    }
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
            //console.log('dd')
        }
    })
    loadReply($(".detailViewBoard_no").val())
})


$(document).on('click', '.removeEmp', function () {
    $(this).parent().parent().remove()
    //console.log($("#postForArea").html())
    if ($("#postForArea").html() == '') {
        $(".postFor").css("display", "inline-block")
        console.log('ff')
    }
    if ($("input[name=sch_attendee]").length == 0) {
        $("#addPeople").css("display", "block")
    }
})

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

$(document).on('click', '.boardEnrollBtn', function () {

    $(".boardNoti").text('게시물 작성')
    $(".boardUploadBtn").text('올리기')
})

$(document).on('click', '#filterAll', function () {
    $("#filter").val("")
    $(".section-title").text("전체")
    changePage(1)
})
$(document).on('click', '#filterPost', function () {
    $("#filter").val("post")
    $(".section-title").text("글")
    changePage(1)
})
$(document).on('click', '#filterSch', function () {
    $("#filter").val("schedule")
    $(".section-title").text("일정")
    changePage(1)
})
$(document).on('click', '#filterTodo', function () {
    $("#filter").val("todo")
    $(".section-title").text("할 일")
    changePage(1)
})
$(function (){
    $('#boardPost').on('hidden.bs.modal', function () {
        console.log('asfe')
        $(this).find('form')[0].reset();
        $(this).find('form')[1].reset();
        $(this).find('form')[2].reset();
        $('#summernote').summernote('reset');
        $("#fileAndMentionArea").html(
            '<input type="text" class="form-control" id="file-label"' +
            'style="display: none; border: 0px white;">' +
            '<input type="file" name="upload_file" id="upload-file" hidden>' +
            '<i class="bi bi-paperclip fa-2x fileUploadBtn"></i>' +
            '<i class="bi bi-person fa-2x postFor"></i>'
        )
        $("#postForArea").html('')
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
            '<p class="todoFor" style="font-size: 11px; margin-top: 6px;">' +
            '<input type="hidden" name="todo_for">' +
            '</p>' +
            '</div>' +
            '<input type="hidden" name="status" value="N">' +
            '</div>'
        )
        datepickerLoad()

    })
})


