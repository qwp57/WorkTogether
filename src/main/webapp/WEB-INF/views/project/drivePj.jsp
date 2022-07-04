<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
          rel="stylesheet">
</head>

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

    .body-2 {
        height: 650px;
    }

    #caSetting:hover, .fa-star:hover, .fa-ellipsis-v:hover, .navMenu:hover, .fa-plus:hover, .todoCalendar, .todoPerson, .switchPost, .switchSch, .switchTodo {
        cursor: pointer;
    }

    .card {
        margin-bottom: 0px;
        border-radius: 25px !important;
    }


    input:focus {
        outline: none;
    }

    .contents {
        height: 81%;
    }

    .file:hover {
        background-color: #f5f5f5;
    }


    .arrow,
    .tarrow {
        font-size: 18px;
        font-weight: bolder;
    }

    .fileCheckBox {
        display: none;
    }

    .fileCheckBox + label {
        display: inline-block;
        width: 20px;
        height: 48px;
        background: url('/resources/assets/img/checkbox_unchecked.png') no-repeat 0 50%;
        background-size: 20px 20px;
    }

    .fileCheckBox:checked + label {
        background: url('/resources/assets/img/checked_checked.png') no-repeat center / contain;
    }

    .sortNow {
        text-decoration: underline;
        font-weight: 700;
        color: #111;
    }

    .sortDate, .sortName {
        display: inline-block;
        cursor: pointer;
    }

    .checkAllArea {
        display: flex;
        flex-direction: row;
        padding: 0 9px 0 20px;
        height: 49px;
        line-height: 49px;
        font-weight: bold;
        color: #888;
        text-align: center;
        border-bottom: 1px solid #e2e2e2;
        position: relative;
    }


    .fileListArea {
        padding: 20px 0px 0 20px;
        display: flex;
        flex-wrap: wrap;
        height: 100%;
        overflow-y: scroll;
        align-content: flex-start;
    }

    .file {
        display: inline-block;
        margin-bottom: 44px;
        padding: 0;
        width: 162px;
        height: 162px;
        border: 1px solid #e2e2e2;
        border-radius: 25px;
        box-sizing: border-box;
        position: relative;
        margin-right: 20px;
        position: relative;
    }

    .fileDetail {
        cursor: pointer;
        position: relative;
    }

    .fileDetail img {
        display: inline-block;
        margin-bottom: 44px;
        padding: 0;
        width: 163px;
        height: 163px;
        box-sizing: border-box;
        position: relative;
        bottom: 2px;
        right: 2px;
    }

    .fileNoLabel {
        position: absolute;
        top: -3px;
        left: 10px;
    }

    .fileName {
        padding: 0px;
        height: 21px;
        line-height: 21px;
        font-size: 14px;
        color: #000000;
        width: 98%;
        text-align: center;
        position: absolute;
        top: 170px;
        border: none;
    }


</style>

<body>

<div class="main-content">
    <div style="height: 50px;"></div>


    <div class="container">
        <section class="section">

            <jsp:include page="projectHead.jsp"/>


            <div class="section-body">

                <div class="row mt-sm-4">

                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-body body-2">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="sortDate" style=" margin-right: 15px;"> 최근 업로드순<span class="tarrow">↓</span>
                                        </div>
                                        <div class="sortName" style="display: inline-block;">파일명 순<span
                                                class="tarrow">↓</span></div>
                                    </div>
                                    <div class="col-lg-6 text-right">
                                        <i class="bi bi-download fa-lg"
                                           style="margin-right: 25px; color: lightgray; cursor: default;"
                                           id="downloadBtn"> 다운로드</i>
                                        <i class="bi bi-trash3 fa-lg" style="color: lightgray; cursor: default;"
                                           id="deleteBtn">삭제</i>
                                    </div>
                                </div>

                                <div class="contents" style="width: 100%;">
                                    <div class="checkAllArea">
                                        <div class="checkFile">
                                            <input type="checkbox" id="checkAll" class="fileCheckBox">
                                            <label for="checkAll" class="checkAll" style="cursor:pointer;"></label>
                                        </div>
                                    </div>
                                    <div class="fileList" style="display:block; width: 100%;">
                                        <div id="fileInfo" style="text-align: center">
                                            <h3 style="margin-top: 240px;">프로젝트에 등록된 파일이 없습니다.</h3>
                                        </div>
                                        <c:if test="${not empty fList}">
                                        <div class="fileListArea">
                                            <c:forEach items="${fList}" var="file" varStatus="e">
                                            <div class="file">
                                                <c:if test="${file.img_path == 'Y'}">
                                                <div class="fileDetail">
                                                    <img src="/resources/upload_files/${file.change_name}" alt="file">
                                                    </c:if>
                                                    <c:if test="${file.img_path == 'N'}">
                                                    <div class="fileDetail"
                                                         style="margin-left: 50px; margin-top: 40px;">
                                                        <i class="bi bi-file-earmark-fill fa-4x"></i>
                                                        </c:if>
                                                    </div>
                                                    <div class="checkFile">
                                                        <input type="hidden" class="fileChangeName"
                                                               value="${file.change_name}">
                                                        <input type="checkbox" id="file_no${e.count}"
                                                               class="file_no  fileCheckBox" name="file_no"
                                                               value="${file.file_no}">
                                                        <label for="file_no${e.count}" class="file_no fileNoLabel"
                                                               style="cursor:pointer;"></label>
                                                    </div>
                                                    <input type="text" maxlength="50" class="fileName" readonly
                                                           style="cursor:pointer" value="${file.origin_name}">
                                                </div>
                                                </c:forEach>
                                            </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="invitePjModal.jsp"/>
<jsp:include page="colorTagModal.jsp"/>
<jsp:include page="pjFormModal.jsp"/>

</body>
<script src="/resources/assets/js/pjHead.js"></script>

<%--파일관련--%>
<script>

    var input = $('.checkAllArea').find("input[type=checkbox]");
    var allLength = input.length;

    $(document).on("click", "#checkAll", function () {
        if ($("#checkAll").is(":checked")) {
            $(".file_no").prop("checked", true);
            $(".file").css("background-color", "#b2b2c7")
            $("#downloadBtn").css("color", "black").css("cursor", "pointer")
            $("#deleteBtn").css("color", "black").css("cursor", "pointer")
        } else {
            $(".file_no").prop("checked", false);
            $(".file").removeAttr("style");
            $("#downloadBtn").css("color", "lightgray").css("cursor", "default")
            $("#deleteBtn").css("color", "lightgray").css("cursor", "default")
        }
    });

    $(document).on("click", ".file", function (e) {
        e.stopPropagation()
        let check = $(this).find(".file_no");

        if (check.is(":checked")) {
            check.prop("checked", false)
            $(this).removeAttr("style")
        } else {
            check.prop("checked", true);
            $(this).css("background-color", "#b2b2c7")
        }

        var checkedinput = $("input:checked").length
        if (allLength != checkedinput) {
            $("#file_list_all").prop("checked", false)
        }
        if (checkedinput != 0) {
            $("#downloadBtn").css("color", "black").css("cursor", "pointer")
            $("#deleteBtn").css("color", "black").css("cursor", "pointer")
        } else {
            $("#downloadBtn").css("color", "lightgray").css("cursor", "default")
            $("#deleteBtn").css("color", "lightgray").css("cursor", "default")
        }
    })

    // 다중파일 다운로드
    $(document).on("click", "#downloadBtn", function () {

        var checkedinput = $("input:checked").length
        if (checkedinput != 0) {
            if (confirm("선택한 파일을 다운받으시겠습니까?")) {
                var check = $("input[name=file_no]:checked");

                $(check).each(function () {
                    var fileName = $(this).prev().val();
                    var path = '/resources/upload_files/'
                    console.log(fileName)
                    download(fileName, path)
                })
                $("input[name=file_no]").prop("checked", false)
                $(".file").css("background-color", "white")
            }
        } else {
            alert("파일을 선택해주세요.")
        }
    })

    function download(fileName, path) {
        // console.log(fileName)
        // console.log(path)
        // console.log(path + fileName)
        var element = document.createElement('a')
        element.setAttribute('href', path + fileName)
        element.setAttribute('download', fileName)
        document.body.appendChild(element)
        element.click()
        document.body.removeChild(element)
    }

    // 파일 삭제
    $(document).on("click", "#deleteBtn", function (e) {
        var checkedinput = $("input:checked").length
        if (checkedinput != 0) {
            if (confirm("선택한 파일을 삭제하시겠습니까?")) {
                // 파일번호를 배열에 저장
                var check = $("input[name=file_no]:checked")
                var arr = []
                $(check).each(function (index) {
                    arr.push($(this).val())
                })
                console.log(arr)
                if (arr.length > 0) {
                    $.ajax({
                        url: "/project/deleteFile.do",
                        type: "post",
                        data: {
                            "file_no": arr
                        },
                        success: function (data) {
                            check.parents(".file").remove()
                            checkFileList()
                            alert("삭제되었습니다.")
                        }
                    })
                }
            }
        } else {
            alert("파일을 선택해주세요.")
        }
    })

    function checkFileList() {
        if ($(".file").length == 0) {
            $(".checkAll").css("display", "none")
            $("#downloadBtn").css("color", "lightgray").css("cursor", "default")
            $("#deleteBtn").css("color", "lightgray").css("cursor", "default")
            $("#fileInfo").css("display", "block")

        } else {
            $(".checkAll").css("display", "block")
            $("#fileInfo").css("display", "none")
        }
    }
</script>

<%--정렬--%>
<script>

    $(".sortDate").click(function () {
        let arrow = $(this).children().html()
        let pno = $('#thispno').val()
        if (arrow === "↓") {
            $.ajax({
                url: "/project/fileSort.do",
                data: {
                    "pj_no": ${pj.pj_no},
                    "sort": "dateAsc"
                },
                type: "POST",
                success: function (list) {
                    list = $.parseJSON(list)
                    console.log(list)
                    $(".tarrow").html("↓")
                    $(".sortDate").children().html("↑")
                    $(".sortDate").addClass("sortNow")
                    $(".sortName").removeClass("sortNow")
                    loadFileList(list)
                }
            })
        } else {
            $.ajax({
                url: "/project/fileSort.do",
                data: {
                    "pj_no": ${pj.pj_no},
                    "sort": "dateDesc"
                },
                type: "POST",
                success: function (list) {
                    list = $.parseJSON(list)
                    console.log(list)
                    $(".tarrow").html("↓")
                    $(".sortDate").children().html("↓")
                    $(".sortDate").addClass("sortNow")
                    $(".sortName").removeClass("sortNow")
                    loadFileList(list)
                }
            })
        }
    })

    $(".sortName").click(function () {
        let arrow = $(this).children().html()
        console.log(arrow)
        if (arrow === "↓") {
            $.ajax({
                url: "/project/fileSort.do",
                data: {
                    "pj_no": ${pj.pj_no},
                    "sort": "nameAsc"
                },
                type: "POST",
                success: function (list) {
                    list = $.parseJSON(list)
                    console.log(list)
                    $(".tarrow").html("↓")
                    $(".sortName").children().html("↑")
                    $(".sortName").addClass("sortNow")
                    $(".sortDate").removeClass("sortNow")
                    loadFileList(list)
                }
            })
        } else {
            $.ajax({
                url: "/project/fileSort.do",
                data: {
                    "pj_no": ${pj.pj_no},
                    "sort": "nameDesc"
                },
                type: "POST",
                success: function (list) {
                    list = $.parseJSON(list)
                    console.log(list)
                    $(".tarrow").html("↓")
                    $(".sortName").children().html("↓")
                    $(".sortName").addClass("sortNow")
                    $(".sortDate").removeClass("sortNow")
                    loadFileList(list)
                }
            })
        }
    })

    function loadFileList(list) {
        var content = ""
        $.each(list, function (i, obj) {
            content += '<div class="file">'
            if (obj.img_path == "Y") {
                content += '<div class="fileDetail">'
                content += '<img src="/resources/upload_files/' + obj.change_name + '" alt="file">'
            } else {
                content += '<div class="fileDetail" style="margin-left: 50px; margin-top: 40px;">'
                content += '<i class="bi bi-file-earmark-fill fa-4x"></i>'
            }
            content += ' </div>'
            content += '<div class="checkFile">'
            content += '<input type="hidden" class="fileChangeName" value="' + obj.change_name + '">'
            content += ' <input type="checkbox" id="file_no' + i + '" class="file_no fileCheckBox" name="file_no" value="' + obj.file_no + '">'
            content += ' <label for="file_no' + i + '" class="file_no fileNoLabel" style="cursor:pointer;"></label>'
            content += ' </div>'
            content += '<input type="text" maxlength="50" class="fileName" readonly style="cursor:pointer" value="' + obj.origin_name + '">'
            content += '  </div>'
        })
        $("#checkAll").prop("checked", false)
        $(".file_no").prop("checked", false)
        $(".file").removeAttr("style")
        $("#downloadBtn").css("color", "lightgray").css("cursor", "default")
        $("#deleteBtn").css("color", "lightgray").css("cursor", "default")
        $('.fileListArea').html(content)
        checkFileList()
    }
</script>
<script>
    $(function () {
        $(".calendar").removeClass("clicked")
        $(".home").removeClass("clicked")
        $(".drive").addClass("clicked")
        $("#editPj").find("input[name=type]").val("drive")
        checkFileList()
        $(".sortDate").addClass("sortNow")
    })
    $(document).on('click', '.home', function () {
        location.href = "/project/detailPj.do?pj_no=" +
        ${pj.pj_no}

    })
    $(document).on('click', '.calendar', function () {
        location.href = "/project/detailCalendar.do?pj_no=" +
        ${pj.pj_no}
    })

</script>
<script>
    function checkStored() {
        if (${pj.status == 'N'}) {
            alert("보관된 프로젝트는 작성/수정 관련 기능이 제한됩니다.")
            return false
        } else {
            return true
        }
    }


</script>


<%-- 프로젝트 헤드 --%>
<script>
    $(document).on('click', '#quitProject', function () {
        if (confirm("프로젝트를 나가시겠습니까?")) {
            location.href = "/project/quitProject.do?pj_no=" +
            ${pj.pj_no}
        }
    })

    $(document).on('click', '#deletePjBtn', function () {
        if (confirm("프로젝트를 삭제하시겠습니까?")) {
            location.href = "/project/deleteProject.do?pj_no=" +
            ${pj.pj_no}
        }
    })

    $(document).on('click', '#keepPjBtn', function () {
        if (confirm("프로젝트를 보관하시겠습니까?")) {
            location.href = "/project/keepProject.do?pj_no=" +
            ${pj.pj_no}
        }
    })

    $(document).on('click', '#restorePjBtn', function () {
        if (confirm("프로젝트를 복구하시겠습니까?")) {
            location.href = "/project/restoreProject.do?pj_no=" +
            ${pj.pj_no}
        }
    })


    $(document).on('click', '#setPj', function () {
        $("#editPj").find("input[name=pj_title]").val("${pj.pj_title}")
        $("#editPj").find("input[name=pj_content]").val("${pj.pj_content}")
        $("#editPj").find("input[name=pj_content]").text("${pj.pj_content}")
        console.log("${pj.board_power}")
        console.log("${pj.reply_power}")
        console.log("${pj.file_power}")
        if ("${pj.board_power}" == 'Y') {
            $("#editPj").find("select[name=board_power]").find(".all").removeAttr("selected")
            $("#editPj").find("select[name=board_power]").find(".admin").attr("selected", true)
        } else {
            $("#editPj").find("select[name=board_power]").find(".admin").removeAttr("selected")
            $("#editPj").find("select[name=board_power]").find(".all").attr("selected", true)
        }
        if ("${pj.reply_power}" == 'Y') {
            $("#editPj").find("select[name=reply_power]").find(".all").removeAttr("selected")
            $("#editPj").find("select[name=reply_power]").find(".admin").attr("selected", true)
        } else {
            $("#editPj").find("select[name=reply_power]").find(".admin").removeAttr("selected")
            $("#editPj").find("select[name=reply_power]").find(".all").attr("selected", true)
        }
        if ("${pj.file_power}" == 'Y') {
            $("#editPj").find("select[name=file_power]").find(".all").removeAttr("selected")
            $("#editPj").find("select[name=file_power]").find(".admin").attr("selected", true)
        } else {
            $("#editPj").find("select[name=file_power]").find(".admin").removeAttr("selected")
            $("#editPj").find("select[name=file_power]").find(".all").attr("selected", true)
        }
        $("#editPj").find("#pj_no").val("${pj.pj_no}")

        $("#editPjModal").modal("show")
    })


    function loadViewEmpInPj() {
        $.ajax({
            url: '/project/selectEmpListByPj.do',
            data: {
                "pj_no": ${pj.pj_no},
                "keyword": 'all'
            },
            success: function (list) {
                console.log(list)
                $(".inviteTable").html('')
                $.each(list, function (i, obj) {
                    var content = '<tr>'
                    content += '<td rowspan="2"><span class="bi bi-person-circle fa-2x"></span>'
                    content += '<input type="hidden" class="inviteEmpNo" value="' + obj.emp_no + '">'
                    content += '</td>'
                    content += '<th style="width: 50%; text-align: center">' + obj.name + '</th>'
                    content += '<td rowspan="2" style="width: 30%; text-align: right;">'
                    if ('${pjMember.admin}' == 'Y' && obj.admin == 'N') {
                        content += '<button type="button" class="btn btn-sm btn-dark deportBtn">내보내기</button>'
                        content += '<button type="button" class="btn btn-sm btn-primary setAdminBtn">관리자 지정</button>'
                    }
                    if (obj.admin == 'Y') {
                        content += '<b>관리자</b>'
                    }
                    content += '</td>'
                    content += '</tr>'
                    content += '<tr>'
                    if (obj.job_name != undefined) {
                        content += '<td style="text-align: center;">' + obj.job_name + '</td>'
                    } else {
                        content += '<td style="text-align: center;">직급이 없습니다.</td>'
                    }
                    content += '</tr>'

                    $(".inviteTable").append(content)
                })


                $("#empListModal").modal("show")
            }
        })
    }

    $(document).on('click', '.deportBtn', function () {
        console.log($(this).parent().parent().find(".inviteEmpNo").val())
        console.log("${pj.pj_no}")
        if (confirm("내보내시겠습니까?")) {
            $.ajax({
                url: '/project/deportEmp.do',
                data: {
                    "pj_no": ${pj.pj_no},
                    "emp_no": $(this).parent().parent().find(".inviteEmpNo").val()
                },
                async: false,
                success: function (list) {
                    console.log('확인')
                }
            })
            loadViewEmpInPj()
        }
    })

    $(document).on('click', '.setAdminBtn', function () {
        console.log($(this).parent().parent().find(".inviteEmpNo").val())
        console.log("${pj.pj_no}")
        if (confirm("해당 사원을 관리자로 지정하시겠습니까?")) {
            $.ajax({
                url: '/project/setAdmin.do',
                data: {
                    "pj_no": ${pj.pj_no},
                    "emp_no": $(this).parent().parent().find(".inviteEmpNo").val()
                },
                async: false,
                success: function (data) {
                    //console.log('dd')
                }
            })
            loadViewEmpInPj()
        }

    })


    function loadTag() {
        $.ajax({
            url: '/project/loadTag.do',
            data: {
                pj_no: ${pj.pj_no}
            },
            success: function (data) {
                data = $.parseJSON(data)
                // console.log(data)
                // console.log(data.tagByEmpNo)
                // console.log(data.tagByPjNo)
                $("#tagTable").html('')
                $.each(data.tagByEmpNo, function (i, obj) {
                    $("#tagTable").append(
                        '<tr>' +
                        '<td><i class="fa fa-tag fa-lg"></i>' +
                        '</td>' +
                        '<th class="tagName" style="width: 50%">' + obj.tag_name + '</th>' +
                        '<td style="width: 20%; text-align: right;">' +
                        '<div class="custom-control custom-checkbox">' +
                        '<input type="checkbox" name="tagInput" class="custom-control-input tagInput" value="' + obj.tag_no + '" id="tag' + obj.tag_no + '"> ' +
                        '<label class="custom-control-label" for="tag' + obj.tag_no + '"></label>' +
                        '</div>' +
                        '</td>' +
                        '<td style="width: 15%; text-align: right;">' +
                        '<div class="btn-group dropright">' +
                        '<i class="fa fa-ellipsis-v fa-lg" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 30px;"></i>' +
                        '<div class="dropdown-menu dropright">' +
                        '<a class="dropdown-item editTag" href="#">수정</a>' +
                        '<div class="dropdown-divider"></div>' +
                        '<a class="dropdown-item deleteTag" href="#">삭제</a>' +
                        '</div>' +
                        '</div>' +
                        '</td>' +
                        '</tr>'
                    )
                })
                $.each(data.tagByPjNo, function (i, obj) {
                    $('#tag' + obj.tag_no).next('label').css("display", "none")
                    $('#tag' + obj.tag_no).parent().css("display", "none")
                    $('#tag' + obj.tag_no).parents("td").append(
                        '<i class="bi bi-dash-square mr-2 disconnectingTagBtn"></i>'
                    )
                })

            }

        });
    }

    function removeTagByPjNo(tag_no) {
        $.ajax({
            url: '/project/removeTagByPjNo.do',
            data: {
                "tag_no": tag_no,
                "pj_no": ${pj.pj_no}
            },
            async: false,
            success: function (data) {
                console.log(data)
            }
        })
        loadTag()
    }

    $(document).on("click", ".favoBtn", function (e) {
        var pj_no = ${pj.pj_no}
            console.log("pj_no : " + pj_no)

        if ($(this).hasClass("favoWhite")) {
            $(this).removeClass("favoWhite")
            $(this).addClass("favoYellow")
            console.log("즐겨찾기 추가할것")

            insertBookmark(pj_no)

        } else if ($(this).hasClass("favoYellow")) {
            $(this).removeClass("favoYellow")
            $(this).addClass("favoWhite")
            console.log("즐겨찾기 제거할것")

            removeBookmark(pj_no);
        }
    })


    $(document).on('click', '#inviteBtn', function () {
        if (checkStored()) {
            $.ajax({
                url: '/project/selectEmpListByPj.do',
                data: {
                    "pj_no": ${pj.pj_no}
                },
                success: function (list) {
                    //list = $.parseJSON(list)
                    console.log(list)
                    $(".inviteTable").html('')
                    $("#invitePj").find("input[name=pj_no]").val(${pj.pj_no})
                    if (list.length > 0) {
                        $.each(list, function (i, obj) {
                            var content = '<tr>'
                            content += '<td rowspan="2"><span class="bi bi-person-circle fa-2x"></span>'
                            content += '</td>'
                            content += '<th style="width: 50%">' + obj.name + '</th>'
                            content += '<td rowspan="2" style="width: 20%; text-align: right;">'
                            content += '<div class="custom-control custom-checkbox">'
                            content += '<input type="checkbox" name="inviteEmpNo" class="inviteEmpNo" value="' + obj.emp_no + '">'
                            content += '</div>'
                            content += '</td>'
                            content += '</tr>'
                            content += '<tr>'
                            if (obj.job_name != undefined) {
                                content += '<td>' + obj.job_name + '</td>'
                            } else {
                                content += '<td>직급 없음</td>'
                            }
                            content += '</tr>'
                            $(".inviteTable").append(content)
                            $("#inviteEmpBtn").css("display", "inline-block")
                        })
                    } else {
                        var content = '<tr><td>초대할 수 있는 사원이 없습니다.</td></tr>'
                        $(".inviteTable").append(content)
                        $("#inviteEmpBtn").css("display", "none")
                    }

                    $("#inviteModal").modal("show")
                }
            })
        }

    })

    function setColor(selectedProjects, selectedColor) {
        $.ajax({
            url: '/project/setProjectColor.do',
            data: {
                "selectedProjects": selectedProjects,
                "selectedColor": selectedColor,
                "pj_no": ${pj.pj_no}
            },
            success: function (data) {
                console.log(data)
                $(".colors").attr("class", "colors " + data)

            }
        })
    }

    function saveTag() {
        if ($("input:checkbox[name='tagInput']:checked").length <= 0) {
            alert("태그를 선택해주세요.")
            return false;
        }
        var selectedProjects = []
        selectedProjects.push(${pj.pj_no});
        var selectedTags = []
        $("input:checkbox[name='tagInput']:checked").each(function () {
            selectedTags.push($(this).val());
        })

        $("#tagModal").modal("hide")
        setTag(selectedProjects, selectedTags)
    }

    function saveColor() {
        if ($("input:radio[name='customRadio']:checked").length <= 0) {
            alert("색상을 선택해주세요.")
            return false;
        }
        var selectedProjects = []
        selectedProjects.push(${pj.pj_no})
        var selectedColor = $("input:radio[name='customRadio']:checked").val()
        console.log(selectedProjects)
        console.log(selectedColor)
        $("#colorModal").modal("hide")
        setColor(selectedProjects, selectedColor)
        $("input:radio[name='customRadio']").prop("checked", false)
    }

</script>

</html>