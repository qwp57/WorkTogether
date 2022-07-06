<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .pjColors {
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


        /* RESPONSIVE */
        @media ( max-width: 1600px) {
            .projects {
                justify-content: center;
            }
        }

        /* .project__link::after {
                position: absolute;
                top: 25px;
                left: 0;
                content: "";
                width: 0%;
                height: 3px;
                background-color: rgba(255, 255, 255, 0.6);
                transition: all 0.5s;
            }
            .project__link:hover::after {
                width: 100%;
            }*/

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

        .project .project__title {
            justify-content: center;
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


        td {
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


        #tagTable tr:hover, .tagAddBtn:hover {
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

        #editBarClose, .select-clear, .project, .listViewTable tr, .fa-cog,
        .fa-th-list, .fa-th-large, .fa-ellipsis-v, .tagAddBtn {
            cursor: pointer
        }

        .modal-content {
            z-index: 1001;
        }

        #cardBody {
            width: 70%;
        }
    </style>
</head>
<body>
<div class="main-content">
    <div style="height: 50px;"></div>
    <div style="height: 50px;"></div>
    <div class="container">
        <div class="row">

            <div class="col-lg-12">
                <div class="card" id="cardBody" style="margin-left: 150px;">
                    <div class="card-body">
                        <h3 class="text-left">프로젝트 태그</h3>
                        <hr>
                        <h3 id="tagNullInfo" style="display: none; text-align: center">생성된 태그가 없습니다.</h3>
                        <table id="tagTable" style="width: 100%">
                        </table>
                        <div class="text-center" style="width: 100%">
                            <i class="fa fa-plus fa-2x tagAddBtn"></i>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="colorTagModal.jsp"/>
<jsp:include page="pjFormModal.jsp"/>
<script>
    $(function () {
        loadTag()


        $(document).on("click", ".tagAddBtn", function () {
            $("#addTagModal").modal("show")
        })

        $("#addTagBtn").click(function () {
            if ($("#addTagInput").val() == "") {
                alert("태그를 입력해주세요.")
                return false
            }
            addTag()
            //console.log($("#addTagInput").val())
        })



        function loadTag() {
            $.ajax({
                url: '/project/loadTag.do',
                success: function (list) {
                    list = $.parseJSON(list)
                    console.log(list)
                    console.log(list.length)
                    $("#tagTable").html('')
                    if (list.length == 0) {
                        $("#tagNullInfo").css("display", "block")
                        $("#tagTable").css("display", "none")
                    } else {
                        $("#tagNullInfo").css("display", "none")
                        $("#tagTable").css("display", "table")
                        $.each(list, function (i, obj) {
                            $("#tagTable").append(
                                '<tr style="width: 100%">' +
                                '<td class="moveTrigger" style="width: 15%;"><i class="fa fa-tag fa-lg"><input type="text" value="' + obj.tag_no + '" style="display: none;" class="tag_no"></i>' +
                                '</td>' +
                                '<th class="tagName moveTrigger" style="width: 50%">' + obj.tag_name + '</th>' +
                                '<td style="width: 15%; text-align: center;">' +
                                '<div class="btn-group sidemenu dropright">' +
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

                    }
                }

            });
        }

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

        $(document).on('click', ".moveTrigger", function loadTagView() {

            $tag_no = $(this).parent().find(".tag_no").val()
            $tag_name = $(this).parent().find(".tagName").text()
            console.log('확인')
            console.log($tag_no)
            location.href = "/project/tagViewSelect.do?tag_no=" + $tag_no + "&tag_name=" + $tag_name;
        })
    })
</script>
</html>