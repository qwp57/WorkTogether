$(document).on('click', '.fileUploadBtn', function () {
    $('#upload-file').click()
})

$(document).on('click', '#file-label', function () {
    //console.log('변경')
    $('#upload-file').val("")
    $("#file-label").css("display", "none")
    $(".fileUploadBtn").css("display", "inline-block")
})

$(document).on('change', '#upload-file', function () {
    if (window.FileReader) {  // modern browser
        var filename = $(this)[0].files[0].name;

    } else {  // old IE
        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
    }

    // 추출한 파일명 삽입
    $("#file-label").val(filename);
    $("#file-label").css("display", "block")
    $(".fileUploadBtn").css("display", "none")
});

$(document).on('click', '#postEditBtn', function () {
    if (checkStored()) {
        var file_no = $(this).parents(".boardBody").find("input[name=file_no]").val()
        var change_name = $(this).parents(".boardBody").find("input[name=change_name]").val()
        var origin_name = $(this).parents(".boardBody").find("input[name=origin_name]").val()
        var path = $(this).parents(".boardBody").find("input[name=path]").val()
        var test = path + origin_name

        console.log(test)
        $("#postForm").css("display", "block")
        $("#postSch").css("display", "none")
        $("#postTodo").css("display", "none")
        $(".switchSch").css("color", "black")
        $(".switchTodo").css("color", "black")
        $(".switchPost").css("color", "#6777ef")
        $('#summernote').summernote('insertText', $(this).parents(".boardBody").find("#postContent").text())
        $(".boardNoti").text('게시물 수정')
        $(".boardUploadBtn").text('수정')
        $("#boardPost").find("input[name=post_title]").val($(this).parents(".boardBody").find("#postTitle").text())
        var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
        $(".boardUploadForm").append(
            '<input type="hidden" name="board_no" value="' + board_no + '">'
        )
        if ($("#postFileArea").html() != '') {
            $(".fileUploadBtn").css("display", "none")
            $(".fileUploadBtn").parent().append(
                '<input type="text" readonly style="border: 0px;" id="postEditFormDeleteFile" value="' + origin_name + '">' +
                '<input type="hidden" value="' + file_no + '">' +
                '<input type="hidden" value="' + change_name + '">' +
                '<input type="hidden" value="' + path + '">'
            )
        }
        console.log($("#postForListArea").html())
        if ($("#postForListArea").html() != '') {
            $(".postFor").css("display", "none")
            $("#postForListArea").find("b").each(function (e) {
                //console.log($(this).text())
                $("#postForArea").append('<span class="empName">' + $(this).text() + '<span><input type="hidden" name="post_for" ' +
                    'value="' + $(this).next().val() + '">' +
                    '<i class="bi bi-x fa-2x removeEmp" style="color: red; padding-right: 0px;"></i></span></span>')

                // $(".postFor").parent().append(content)
            })

        }
        $(".boardUploadForm").attr("id", "editPost");
        $(".boardUploadForm").attr("action", "/post/editPost.do");
        $("#boardPost").modal("show")
        $("#boardPost").css("z-index", "111111")
    }
})

$(document).on('click', '#postEditFormDeleteFile', function () {
    $(this).parent().append(
        '<input type="hidden" name="change_name" value="' + $(this).val() + '">' +
        '<input type="hidden" name="file_no" value="' + $(this).next().val() + '">' +
        '<input type="hidden" name="origin_name" value="' + $(this).next().next().val() + '">' +
        '<input type="hidden" name="path" value="' + $(this).next().next().next().val() + '">'
    )
    $(this).remove()
    $(".fileUploadBtn").css("display", "inline-block")
})

