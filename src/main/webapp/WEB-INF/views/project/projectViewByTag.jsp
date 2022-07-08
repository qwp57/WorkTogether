<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
          rel="stylesheet">
<%--    <script src="https://kit.fontawesome.com/f2449ad7e5.js" crossorigin="anonymous"></script>--%>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
        Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji",
        "Segoe UI Symbol";
    }

    /* projects */
    .projects {
        display: flex;
        flex-wrap: wrap;
        justify-content: start;
    }

    .project {
        background-color: gray;
        --text: white;
        margin: 20px;
        padding: 20px;
        padding-top: 0px;
        width: 323px;
        height: 200px;
        min-height: 150px;
        display: grid;
        grid-template-rows: 20px 50px 1fr 50px;
        border-radius: 25px;
        box-shadow: 0 0 2rem -1rem rgba(0, 0, 0, .05);
        transition: all 0.2s;
        color: #ffffff;
        -text: white;
    }


    /*  색상 관련 */

    .colors {
        -text: white;
        margin: 20px;
        padding: 20px;
        margin-left: 40px;
        width: 70px;
        height: 70px;
        border-radius: 10px;
        box-shadow: 0 0 2rem -1rem rgba(0, 0, 0, .05);
        transition: all 0.2s;
        color: #ffffff;
        -text: white;
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


    .project:hover {
        box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.4);
        transform: scale(1.03);
    }

    .project__check, .project__icon, .project__count {
        position: relative;
        text-decoration: none;
        color: rgba(255, 255, 255, 0.9);
    }

    .project__check {
        grid-row: 2/4;
        grid-column: 4/5;
        justify-self: end;
    }

    .project__icon {
        grid-row: 2/3;
    }

    .project__title {
        grid-row: 3/4;
        grid-column: 1 / 5;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: 700;
        color: #ffffff;
    }

    .project__count {
        grid-row: 4/5;
    }

    .project__date {
        grid-row: 4/5;
        grid-column: 4/4;
        justify-self: end;
    }

    /* RESPONSIVE */
    @media ( max-width: 1600px) {
        .projects {
            justify-content: center;
        }
    }


    .newPj {
        width: 180px;
        height: 70px;
        color: black;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: 700;
        font-size: x-large;
        border-radius: 20px;
        font-family: 'Nanum Gothic', sans-serif;
    }

    .topmenu {
        display: inline-block;
        width: 49%;
        height: 100%;
    }

    .menuIcon {
        float: right;
        margin-left: 5%;
    }

    .menuIcon .fa:hover {
        color: black;
    }


    .custom-radio {
        position: relative;
        left: 30px;
        bottom: 20px;
    }

    #totalProjectEditBar {
        z-index: 1000;
        width: 100%;
        position: fixed;
        text-align: center;
        width: 100%;
        height: 100px;
    }

    #totalEditButton li {
        display: inline-block;
        padding-left: 50px;
        padding-right: 50px;
        margin-left: 50px;
        margin-right: 50px;
    }

    #totalEditSelect {
        display: block;
        position: relative;
        left: 50%;
        top: 130%;
        width: 300px;
        height: 50px;
        line-height: 40px;
        border: 3px solid #6777ef;
        border-radius: 25px;
        font-family: 'Nanum Gothic', sans-serif;
        color: #6777ef;
    }

    .select-clear {
        color: red;
    }

    #tagTable {
        text-align: center;
        width: 100%;
        height: 100px;
        font-size: large;
    }

    .listViewTable {
        text-align: center;
        font-size: large;
        border-collapse: separate;
        border-spacing: 0px;
    }

    .listViewTable tr:hover, #tagTable tr:hover {
        background-color: white;
        transform: scale(1.01);
    }


    .listViewTable tr td {
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


    #tagTable tr:hover, .fa-plus:hover {
        color: #6777ef;
    }

    #colorTable {
        text-align: center;
        margin-left: 2%;
        width: 100%;
    }

    .custom-radio {
        margin-right: 27px;
    }

    .favoYellow {
        color: #f3da35;
    }

    .favoWhite {
        color: lightgray;
    }

    #editBarClose, .select-clear, .project, .listViewTable tr, .pjSettingBtn,
    .listViewBtn, .largeViewBtn, .fa-ellipsis-v, .fa-plus {
        cursor: pointer
    }

    .modal-content {
        z-index: 1001;
    }
</style>
<body>
<div id="totalProjectEditBar" style="display: none;">
    <nav id="test" class="navbar bg-primary"
         style="display: block; height: 100px; text-align: center;">
        <br> <i class='fa fa-paint-brush fa-lg' style='color: white;'></i>
        <a class="navbar-brand" href="#" id="colorSettingBtn">색상 설정</a> <i
            class='fa fa-tags fa-lg' style='color: white;'></i> <a
            class="navbar-brand" href="#" id="tagSettingBtn">프로젝트 태그 설정</a> <a
            id="editBarClose"><i class='fa fa-window-close fa-2x' id="closeTagSettingBtn"
                                 style='color: white;'></i></a>
        <div style="height: 80px;"></div>

    </nav>
    <div id="totalEditSelect" align="center">
        <span class="select-count">0개 프로젝트가 선택되었습니다.</span> <em
            class="select-clear">선택취소</em>
    </div>
</div>


<div class="main-content largeView">
    <div style="height: 50px;"></div>


    <div class="container">
        <button class="btn btn-secondary newPj">+ 새 프로젝트</button>
        <br> <br> <br>
        <div style="width: 100%;">

            <div class="topmenu showTag">
                <h2>내 프로젝트</h2>
            </div>

            <div class="topmenu" style="text-align: right;">
                <div class="menuIcon">
                    <i class='fa fa-cog fa-2x pjSettingBtn'></i>
                </div>
                <div class="menuIcon">
                    <i class='fa fa-th-list fa-2x listViewBtn'></i>
                </div>
                <div class="menuIcon">
                    <i class='fa fa-th-large fa-2x largeViewBtn' style="color: black;"></i>
                </div>
            </div>
        </div>
        <div style="height: 30px;"></div>
        <h3 class="favorite" style="display: none;">즐겨찾기</h3>
        <div class="projects" id="favoLargeProjects">
        </div>
        <div style="width: 100%; height: 30px;"></div>
        <h3 class="myProjects" style="display:none;">참여중</h3>
        <div class="projects" id="myLargeProjects">
        </div>

    </div>
</div>

<div class="main-content listView" style="display: none;">
    <div style="height: 50px;"></div>

    <div class="container">
        <button class="btn btn-secondary newPj">+ 새 프로젝트</button>

        <br> <br> <br>
        <div style="width: 100%;">

            <div class="topmenu showTag">
                <h2>내 프로젝트</h2>
            </div>
            <div class="topmenu" style="text-align: right;">
                <div class="menuIcon">
                    <i class='fa fa-cog fa-2x pjSettingBtn'></i>
                </div>
                <div class="menuIcon">
                    <i class='fa fa-th-list fa-2x listViewBtn'></i>
                </div>
                <div class="menuIcon">
                    <i class='fa fa-th-large fa-2x largeViewBtn'></i>
                </div>
            </div>
        </div>
        <div style="height: 30px;"></div>
        <h3 class="favorite" style="display: none;">즐겨찾기</h3>
        <div class="lists">
            <table id="favoListProjects" class="listViewTable">
            </table>
            <div style="width: 100%; height: 30px;"></div>
            <h3 class="myProjects" style="display:none;">참여중</h3>
            <table id="myListProjects" class="listViewTable">
            </table>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>
<jsp:include page="colorTagModal.jsp"/>
<jsp:include page="pjFormModal.jsp"/>
<script>
    $(function () {

        //참여중인 프로젝트 로드
        loadProjects()


        $(document).on("click", "#tagSettingBtn", function () {
            if ($("input:checkbox[name='checkedPj']:checked").length <= 0) {
                alert("프로젝트를 체크해주세요")
                return false;
            }
            loadTag()
            $("#tagModal").modal("show")
        })


        $(document).on("click", "#colorSettingBtn", function () {
            if ($("input:checkbox[name='checkedPj']:checked").length <= 0) {
                alert("프로젝트를 체크해주세요")
                return false;
            }
            $("#colorModal").modal("show")
        })


        $(document).on("click", ".favoBtn", function (e) {
            if ($(this).hasClass("favoWhite")) {
                $(this).removeClass("favoWhite")
                $(this).addClass("favoYellow")
                console.log("즐겨찾기 추가할것")
                console.log($(".tag_no").val())

                if ($(this).hasClass("listView")) {
                    var $pj_no = $(this).parent("td").prev().children(".colors").find("input[name='pj_no']").val()
                } else {
                    var $pj_no = $(this).parent(".project__icon").prev().val()
                }

                //console.log("pj_no : " + $pj_no)
                insertBookmark($pj_no)

            } else if ($(this).hasClass("favoYellow")) {
                $(this).removeClass("favoYellow")
                $(this).addClass("favoWhite")
                console.log("즐겨찾기 제거할것")
                if ($(this).hasClass("listView")) {
                    var $pj_no = $(this).parent("td").prev().children(".colors").find("input[name='pj_no']").val()
                } else {
                    var $pj_no = $(this).parent(".project__icon").prev().val()
                }

                //console.log("pj_no : " + $pj_no)
                removeBookmark($pj_no);
            }
            e.stopPropagation()
        })

        function loadTag() {
            $.ajax({
                url: '/project/loadTag.do',
                success: function (list) {
                    $.parseJSON(list);
                    //console.log(list)
                    $("#tagTable").html('')
                    if($.parseJSON(list).length > 0){
                        $.each($.parseJSON(list), function (i, obj) {
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
                    }else {
                        $("#tagTable").append(
                            '<tr><td>생성한 태그가 없습니다.</td></tr>'
                        )
                    }

                }

            });
        }

        function insertBookmark(pj_no) {
            $.ajax({
                url: '/project/insertBookmark.do',
                data: {
                    pj_no: pj_no
                },
                success: function (data) {
                    console.log(data + "성공")
                    loadProjects()
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

                    loadProjects()

                }
            });
        }

        $(document).on("click", ".pjSettingBtn", function () {
            $("#totalProjectEditBar").css("display", "block")
            $(".pjCheck").css("display", "block")
        })

        $(document).on("click", "#closeTagSettingBtn", function () {
            $(".pjCheck").css("display", "none")
        })

        $(document).on("click", ".listViewBtn", function () {
            $(".largeView").css("display", "none")
            $(".listView").css("display", "block")
            $(".listViewBtn").css("color", "black")
            $(".largeViewBtn").css("color", "")
        })

        $(document).on("click", ".largeViewBtn", function () {
            $(".listView").css("display", "none")
            $(".largeView").css("display", "block")
            $(".largeViewBtn").css("color", "black")
            $(".listViewBtn").css("color", "")
        })

        $(document).on("click", "#editBarClose", function () {
            closeMenu()
        })

        $(document).on("click", ".select-clear", function () {
            $(".pjCheckAll").prop("checked", false)
            $(".select-count").text("0개 프로젝트가 선택되었습니다.")
        })

        $(document).on("change", ".pjCheckAll", function () {

            //console.log("체크변경")
            //console.log($(this).val())
            if ($(this).hasClass('largeViewCheck')) {
                $(".listViewTable").find('#listCkedPj' + $(this).val()).prop("checked", $(this).prop("checked"))
            } else if ($(this).hasClass('listViewCheck')) {
                $(".projects").find("#largeCkedPj" + $(this).val()).prop("checked", $(this).prop("checked"))
            }
            var checkedCnt = $('.pjCheckAll:checked').length / 2;
            //console.log(checkedCnt)
            $(".select-count").text(checkedCnt + "개 프로젝트가 선택되었습니다.")
        })

        $(document).on("click", ".pjCheck", function (e) {
            e.stopPropagation()
        })


        $(document).on("click", ".tagAddBtn", function () {
            $("#addTagModal").modal("show")
        })

        $(document).on("click", ".newPj", function () {
            $("#makePj").modal("show")
        })

        $(document).on("click", ".project", function () {
            //console.log($(this).children('input[name=pj_no]').val())
            var $pj_no = $(this).children('input[name=pj_no]').val()
            location.href = "/project/detailPj.do?pj_no=" + $pj_no;
        })
        $(document).on("click", ".listViewTable tr", function () {
            //console.log($(this).find("input[name='pj_no']").val())
            var $pj_no = $(this).find("input[name='pj_no']").val()
            location.href = "/project/detailPj.do?pj_no=" + $pj_no;
        })


        $("#addTagBtn").click(function () {
            if ($("#addTagInput").val() == "") {
                alert("태그를 입력해주세요.")
                return false
            }
            addTag()
            //console.log($("#addTagInput").val())
            $("#addTagInput").val("")
        })


        function addTag() {
            $.ajax({
                url: '/project/addTag.do',
                data: {
                    "tag_name": $("#addTagInput").val()
                },
                async: false,
                success: function (data) {
                    console.log(data)
                }
            })
            loadTag()
        }

    })


    function loadProjects() {
        $.ajax({
            url: '/project/tagView.do',
            data: {
                "tag_no": ${projectTag.tag_no},
                "tag_name": "${projectTag.tag_name}"
            },
            success: function (list) {
                $(".showTag").html('<h2>프로젝트 태그 - [' + list[2].tag_name + ']' +
                    '<input type="text" style="display: none;" value="' + list[2].tag_no + '" class="tag_no">'+
                    '<input type="text" style="display: none;" value="' + list[2].tag_name + '" class="tag_name">'
                )
                console.log(list)

                //myAllProjectsByTag
                //console.log(list[0].length)
                //console.log(list[1].length)
                $favoLargeProjects = $("#favoLargeProjects")
                $myLargeProjects = $('#myLargeProjects')
                $favoListProjects = $("#favoListProjects")
                $myListProjects = $("#myListProjects")
                if (list[1].length > 0) {
                    $favoLargeProjects.html('');
                    $favoListProjects.html('');
                    $(".favorite").css("display", "block")
                    $.each(list[1], function (i, obj) {

                        $favoLargeProjects.append(
                            '<div class="project">' +
                            '<input name="pj_no" class="pj_no' + obj.pj_no + '" type="hidden" value="' + obj.pj_no + '">' +
                            '<div class="project__icon">' +
                            '<i class="fa fa-star fa-2x favoYellow largeView favoBtn"></i>' +
                            '</div>' +
                            '<div class="project__check pjCheck" style="display: none;">' +
                            '<div class="custom-control custom-checkbox">' +
                            '<input type="checkbox" class="custom-control-input pjCheckAll largeViewCheck" value="' + obj.pj_no + '" name="checkedPj" id="largeCkedPj' + obj.pj_no + '">' +
                            '<label class="custom-control-label"  for="largeCkedPj' + obj.pj_no + '">' +
                            '</label>' +
                            '</div>' +
                            '</div>' +
                            '<h3 class="project__title">' + obj.pj_title + '</h3>' +
                            '<p class="project__count">' +
                            '<i class="fa fa-user" style="color: white;">&nbsp;' + obj.count + '</i>' +
                            '</p>' +
                            '<p class="project__date">' +
                            '<i class="fa fa-flag" style="color: white;">&nbsp;' + obj.create_date + '</i>' +
                            '</p>' +
                            '</div>'
                        )
                        $favoListProjects.append(
                            '<tr style="width: 100%;">' +
                            '<td>' +
                            '<div class="custom-control custom-checkbox pjCheck" style="display: none;">' +
                            '<input type="checkbox" class="custom-control-input pjCheckAll listViewCheck" value="' + obj.pj_no + '" id="listCkedPj' + obj.pj_no + '">' +
                            '<label class="custom-control-label"  for="listCkedPj' + obj.pj_no + '"></label>' +
                            '</div>' +
                            '</td>' +
                            '<td>' +
                            '<div class="colors">' +
                            '<input name="pj_no" class="pj_no' + obj.pj_no + '" type="hidden" value="' + obj.pj_no + '">' +
                            '</div>' +
                            '</td>' +
                            '<td style="width: 10%;">' +
                            '<i class="icon fa fa-star fa-2x favoYellow listView favoBtn"></i></td>' +
                            '<th style="width: 40%; text-align: left;">' + obj.pj_title + '</th>' +
                            '<td style="width: 20%">' +
                            '<i class="fa fa-user">&nbsp;' + obj.count + '</i>' +
                            '</td>' +
                            '<td style="width: 30%;">' +
                            '<i class="fa fa-flag"></i>&nbsp;' + obj.create_date +
                            '</td>' +
                            '</tr>'
                        )
                    })
                    $favoLargeProjects.append('<div style="width: 100%; height: 30px;"></div>')
                } else {
                    $favoLargeProjects.html('');
                    $favoListProjects.html('')
                    $(".favorite").css("display", "none")
                }

                if (list[0].length > 0) {
                    $myLargeProjects.html('');
                    $myListProjects.html('')
                    $(".myProjects").css("display", "block")


                    $.each(list[0], function (i, obj) {
                        $myLargeProjects.append(
                            '<div class="project">' +
                            '<input  name="pj_no" class="pj_no' + obj.pj_no + '" type="hidden" value="' + obj.pj_no + '">' +
                            '<div class="project__icon">' +
                            '<i class="fa fa-star fa-2x favoWhite largeView favoBtn"></i>' +
                            '</div>' +
                            '<div class="project__check pjCheck" style="display: none;">' +
                            '<div class="custom-control custom-checkbox">' +
                            '<input type="checkbox" class="custom-control-input pjCheckAll largeViewCheck" value="' + obj.pj_no + '" name="checkedPj" id="largeCkedPj' + obj.pj_no + '">' +
                            '<label class="custom-control-label" for="largeCkedPj' + obj.pj_no + '"></label>' +
                            '</div>' +
                            '</div>' +
                            '<h3 class="project__title">' + obj.pj_title + '</h3>' +
                            '<p class="project__count">' +
                            '<i class="fa fa-user" style="color: white;">&nbsp;' + obj.count + '</i>' +
                            '</p>' +
                            '<p class="project__date">' +
                            '<i class="fa fa-flag" style="color: white;">&nbsp;' + obj.create_date + '</i>' +
                            '</p>' +
                            '</div>'
                        )
                        $myListProjects.append(
                            '<tr style="width: 100%;">' +
                            '<td>' +
                            '<div class="custom-control custom-checkbox pjCheck" style="display: none;">' +
                            '<input type="checkbox" class="custom-control-input pjCheckAll listViewCheck" value="' + obj.pj_no + '" id="listCkedPj' + obj.pj_no + '">' +
                            '<label class="custom-control-label"  for="listCkedPj' + obj.pj_no + '"></label>' +
                            '</div>' +
                            '</td>' +
                            '<td>' +
                            '<div class="colors">' +
                            '<input name="pj_no" class="pj_no' + obj.pj_no + '" type="hidden" value="' + obj.pj_no + '">' +
                            '</div>' +
                            '</td>' +
                            '<td style="width: 10%;">' +
                            '<i class="icon fa fa-star fa-2x favoWhite listView favoBtn"></i></td>' +
                            '<th style="width: 40%; text-align: left;">' + obj.pj_title + '</th>' +
                            '<td style="width: 20%">' +
                            '<i class="fa fa-user">&nbsp;' + obj.count + '</i>' +
                            '</td>' +
                            '<td style="width: 30%;">' +
                            '<i class="fa fa-flag"></i>&nbsp;' + obj.create_date +
                            '</td>' +
                            '</tr>'
                        )


                    })

                } else if (list[0].length <= 0 && list[1].length <= 0) {
                    $myLargeProjects.html('');
                    $myListProjects.html('')
                    $(".myProjects").css("display", "none")
                    $myLargeProjects.append(
                        '<div style="width: 100%; height: 30px;"></div>' +
                        '<h4 style="margin-left: 10%;">참여중인 프로젝트가 없습니다.</h4>'
                    )

                } else if (list[0].length == 0) {
                    $myLargeProjects.html('');
                    $myListProjects.html('')
                    $(".myProjects").css("display", "none")
                }
                loadPjColor()
            }

        });
    }

    function loadPjColor() {
        //console.log($("#pj_no2").parent(".project"))
        //$("#pj_no2").parent(".project").addClass("blue")

        $.ajax({
            url: '/project/selectProjectColor.do',
            success: function (list) {
                //console.log(list)
                $.each(list, function (i, obj) {
                    $(".pj_no" + obj.pj_no).parent(".project").addClass(obj.pj_color)
                    $(".pj_no" + obj.pj_no).parent(".colors").addClass(obj.pj_color)
                })
            }
        })
    }


</script>
<script>
    function closeMenu() {
        $(".pjCheckAll").prop("checked", false)
        $(".select-count").text("0개 프로젝트가 선택되었습니다.")
        $("#totalProjectEditBar").css("display", "none")
        $(".pjCheck").css("display", "none")
    }

    function saveColor() {
        if ($("input:radio[name='customRadio']:checked").length <= 0) {
            alert("색상을 선택해주세요.")
            return false;
        }
        var selectedProjects = []
        $("input:checkbox[name='checkedPj']:checked").each(function () {
            selectedProjects.push($(this).val());
        })

        //console.log(selectedProjects)
        var selectedColor = $("input:radio[name='customRadio']:checked").val()
        //console.log(selectedColor)
        $("#colorModal").modal("hide")
        setColor(selectedProjects, selectedColor)
        $("input:radio[name='customRadio']").prop("checked", false)
        closeMenu()
        loadProjects()
    }

    function saveTag() {
        if ($("input:checkbox[name='tagInput']:checked").length <= 0) {
            alert("태그를 선택해주세요.")
            return false;
        }
        var selectedProjects = []
        $("input:checkbox[name='checkedPj']:checked").each(function () {
            selectedProjects.push($(this).val());
        })
        var selectedTags = []
        $("input:checkbox[name='tagInput']:checked").each(function () {
            selectedTags.push($(this).val());
        })

        $("#tagModal").modal("hide")
        setTag(selectedProjects, selectedTags)
        closeMenu()
        alert("태그 설정이 완료되었습니다.")
    }

    function setColor(selectedProjects, selectedColor) {
        $.ajax({
            url: '/project/setProjectColor.do',
            data: {
                "selectedProjects": selectedProjects,
                "selectedColor": selectedColor
            },
            success: function (data) {
                console.log(data)

            }
        })
    }

</script>

</body>
</html>