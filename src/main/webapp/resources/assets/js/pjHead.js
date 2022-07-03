
$(document).on('click', '#viewEmpInPj', function () {
    loadViewEmpInPj()
})



$(document).on('click', '.newPj', function () {
    $("#makePj").modal("show")
})

$(document).on('click', '#setColor', function () {
    $("#colorModal").modal("show")
})

$(document).on("click", ".tagAddBtn", function () {
    $("#addTagModal").modal("show")
})

$(document).on('click', '#tagSettingBtn', function () {
    loadTag()
    $("#tagModal").modal("show")
})

function insertBookmark(pj_no) {
    $.ajax({
        url: '/project/insertBookmark.do',
        data: {
            pj_no: pj_no
        },
        success: function (data) {
            console.log(data + "성공")

        }
    });
}

function removeBookmark(pj_no) {
    $.ajax({
        url: '/project/removeBookmark.do',
        data: {
            pj_no: pj_no
        },
        success: function (data) {
            console.log(data + "성공")

        }
    });
}

$(document).on('click', '.disconnectingTagBtn', function () {
    console.log($(this).prev().find('input[name=tagInput]').val())
    $tag_no = $(this).prev().find('input[name=tagInput]').val()
    removeTagByPjNo($tag_no)
})
