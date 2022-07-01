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
    <link
            href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
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


    a {
        text-decoration: none;
        color: #333333;
    }


    input:focus {
        outline: none;
    }


    /*위 메뉴*/
    .title {
        width: 100%;
        height: 33px;
        margin: 7px 0;
        background-color: rgb(242, 242, 242);
        position: relative;
        padding: 10px 0;
    }

    .title_btn {
        display: inline-block;
        background: #fff;
        border-radius: 3px;
        box-sizing: border-box;
        position: relative;
    }

    .title_btn img {
        width: 24px;
        left: 6px;
        top: 2.5px;
        position: absolute;
    }


    .title_btn span {
        padding: 0 8px 0 34px;
        /* background: url(../img/chat-04.png) no-repeat -40% center; */
    }


    .class {
        position: relative;
        top: 10px;
    }

    .class img {
        width: 32px;
    }


    .project_all a {
        position: relative;
        height: 38px;
        line-height: 38px;
    }

    .project_all > a::after {
        display: block;
        content: "";
        position: absolute;
        bottom: 0;
        left: 19px;
        width: 200px;
        height: 1px;
        background: #e2e2e2;
    }

    /* .project_all a em{
        position: relative;
        width: 14px;
        height: 14px;
        margin-top: 13px;
        border-radius: 2px;
        background: #5f5ab9;
    } */
    .project_list a {
        padding-left: 9px;
    }

    .project_all a {
        padding: 0 20px 0 20px;
    }

    .project_list_sub {
        position: relative;
        padding: 0 20px 0 20px;
        height: 28px;
        line-height: 28px;
        cursor: pointer;
    }

    .file_list_wrapper {
        height: 100%;
        overflow-y: scroll;
    }

    .contents {
        height: 81%;
    }

    .project_all:hover,
    .project_list_sub:hover,
    .piclist_tr:hover {
        background-color: #f5f5f5;
    }

    /*오른쪽 메뉴*/
    .file_list,
    .piclist {
        padding: 0;
        height: 100%;
        background: #fff;
    }

    .file_list_index {
        /* width: 988.31px; */
        display: flex;
        padding: 0 9px 0 20px;
        height: 49px;
        line-height: 49px;
        font-weight: bold;
        color: #888;
        text-align: center;
        border-bottom: 1px solid #e2e2e2;
        position: relative;
    }

    .filetable {
        cursor: pointer;
    }

    .arrow,
    .tarrow {
        font-size: 11px;
        font-weight: bolder;
    }

    input[type="checkbox"] {
        display: none;
    }

    input[type="checkbox"] + label {
        display: inline-block;
        width: 20px;
        height: 48px;
        background-size: 20px 20px;
    }

    input[type="checkbox"]:checked + label {
        background: url('${pageContext.request.contextPath}/resources/img/checked-2-02.png') no-repeat center / contain;
    }

    .file_list_tr:hover {
        background-color: rgb(242, 242, 242);
    }

    .file_list_fname {
        width: 644.31px;
    }

    .file_tr_fname {
        padding-left: 54px;
        width: 577px;
    }

    .file_list_fsize,
    .file_tr_fsize {
        width: 87px;
    }

    .file_list_uname,
    .file_tr_uname {
        width: 93px;
    }

    .file_list_fdate,
    .file_tr_fdate {
        width: 163px;
    }

    .file_list_tr {
        position: relative;
        padding: 0 9px 0 20px;
        height: 49px;
        line-height: 49px;
        display: flex;
        cursor: pointer;
        border-bottom: 1px solid #e2e2e2;
        color: #333;
    }

    .center {
        text-align: center;
    }

    .listfname {
        /* background-color:gray; */
        padding-left: 6%;
        position: relative;
        overflow: hidden;
        /* background-repeat: no-repeat;
        background-size: 27px 27px;
        background-position: 20px 50%; */
    }

    .ficon {
        position: absolute;
        left: 20px;
        top: 10px;
        width: 27px;
        height: 27px;
    }

    .notfile {
        margin: 34vh 0;
        padding-top: 10px;
        height: 100%;
        text-align: center;
    }

    .notfile h2 {
        margin-top: 20px;
        font-size: 20px;
        font-weight: bold;
        color: #777;
    }

    /*썸네일*/

    .piclist_index {
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


    .piclist_wrapper {
        padding: 20px 0px 0 20px;
        display: flex;
        flex-wrap: wrap;
        height: 100%;
        overflow-y: scroll;
        align-content: flex-start;
    }

    .piclist_tr {
        display: inline-block;
        margin-bottom: 44px;
        padding: 0;
        width: 162.1px;
        height: 162.1px;
        border: 1px solid #e2e2e2;
        border-radius: 25px;
        box-sizing: border-box;
        position: relative;
        margin-right: 20px;
        position: relative;
    }

    .picinfo {
        cursor: pointer;
    }

    .picinfo img {
        display: inline-block;
        margin-bottom: 44px;
        padding: 0;
        width: 162.1px;
        height: 162.1px;
        box-sizing: border-box;
        position: relative;
        margin-right: 20px;
        position: relative;
    }

    .picchk {
        position: absolute;
        top: -3px;
        left: 10px;
    }

    .pictext {
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

    .class {
        cursor: pointer;
        position: relative;
        top: 10px;
    }

    .class img {
        width: 32px;
        z-index: -1;
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
                                    <div class="picfdate filetable"
                                         style="text-decoration: underline; display: inline-block; font-weight:700; color:#111; margin-right: 25px;">최근
                                        업로드순<span class="tarrow">↓</span></div>
                                    <div class="picfname filetable" style="display: inline-block;">파일명 순<span class="tarrow">↓</span></div>
                                    </div>
                                    <div class="col-lg-6 text-right">
                                        <a class="title_down title_btn" style="cursor:default">
                                            <i class="bi bi-download fa-lg" style="margin-right: 25px;"> 다운로드</i>
                                        </a>
                                        <a class="title_del title_btn" style="cursor:default">
                                            <i class="bi bi-trash3 fa-lg">삭제</i>
                                        </a>
                                    </div>
                                </div>

                                <div class="contents" style="width: 100%;">

                                    <div class="piclist" style="display:block; width: 100%;">
                                        <div class="piclist_index">
                                            <div class="file_chk">
                                                <input type="checkbox" id="thumb_list_all">
                                                <label for="thumb_list_all" class="thumb_list_all"
                                                       style="cursor:pointer;"></label>
                                            </div>

                                        </div>


                                        <div class="piclist_wrapper">
                                            <div class="piclist_tr">
                                                <div class="picinfo text-center mt-5">
                                                    <i class="bi bi-file-earmark-fill fa-4x"></i>

                                                    <input type="hidden" class="imgfname">
                                                </div>
                                                <div class="file_chk">
                                                    <input type="checkbox" id="thumb_chk" class="thumb_chk"
                                                           name="fname">
                                                    <label for="thumb_chk" class="thumb_chk picchk"
                                                           style="cursor:pointer;"></label>
                                                </div>
                                                <input type="text" maxlength="50" class="pictext" readonly
                                                       style="cursor:pointer">
                                            </div>

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
<jsp:include page="invitePjModal.jsp"></jsp:include>
<jsp:include page="colorTagModal.jsp"/>
<jsp:include page="pjFormModal.jsp"/>

</body>
<script>
    $(function () {
        $(".calendar").removeClass("clicked")
        $(".home").removeClass("clicked")
        $(".drive").addClass("clicked")
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
    function checkStored(){
        if(${pj.status == 'N'}){
            alert("보관된 프로젝트는 작성/수정 관련 기능이 제한됩니다.")
            return false
        }else {
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
                    console.log('dd')
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
        if(checkStored()){
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
</script>
</html>