


function setTag(selectedProjects, selectedTags) {
    $.ajax({
        url: '/project/setProjectTag.do',
        data: {
            "selectedProjects": selectedProjects,
            "selectedTags": selectedTags
        },
        success: function (data) {
            //console.log(data)

        }
    })
}
$(document).on("click", ".editTag", function () {
    $tag_name = $(this).parents("tr").find(".tagName").text()
    $tag_no = $(this).parents("tr").find(".tagInput").val()
    console.log($tag_name)
    console.log($tag_no)
    $("#tagEditInput").val($tag_name)
    $("#tagEditModal").modal("show")
    $("#editTagBtn").click(function () {
        if ($("#tagEditInput").val() == "") {
            alert("태그를 입력해주세요.")
            return false
        }
        editTag($tag_no)

    })
})
function editTag(tag_no) {
    //console.log($("#tagEditInput").val())
    $.ajax({
        url: '/project/editTag.do',
        data: {
            "tag_name": $("#tagEditInput").val(),
            "tag_no": tag_no
        },
        async: false,
        success: function (data) {
            //console.log(data)
        }
    })
    loadTag()
}
$(document).on("click", ".deleteTag", function () {
    if (confirm("삭제하시겠습니까?")) {
        $tag_no = $(this).parents("tr").find(".tagInput").val()
        console.log($tag_no)
        removeTag($tag_no)
    }
})
function removeTag(tag_no) {
    $.ajax({
        url: '/project/removeTag.do',
        data: {
            "tag_no": tag_no
        },
        async: false,
        success: function (data) {
            console.log(data)
        }
    })
    loadTag()
}