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

$('#boardPost').on('hidden.bs.modal', function (e) {
    $(this).find('form')[0].reset();
    $(this).find('form')[1].reset();
    $(this).find('form')[2].reset();
})

