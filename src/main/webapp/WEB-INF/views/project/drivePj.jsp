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
    <link href="resources/css/reset.css" rel="stylesheet" type="text/css">
    <script src="https://kit.fontawesome.com/f2449ad7e5.js" crossorigin="anonymous"></script>
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
        background: url('${pageContext.request.contextPath}/resources/img/checked-2-01.png') no-repeat 0 50%;
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

    .picfdate {
        padding-left: 14px;
        padding-right: 14px;
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
                <div class="section-body">

                    <div class="row mt-sm-4">

                        <div class="col-12 col-md-12 col-lg-12">
                            <div class="card">
                                <div class="card-body body-1">
                                    <div>
                                        <button class="btn btn-primary newPj">+ 새 프로젝트</button>
                                    </div>
                                    <div class="detailTop">
                                        <div class="colors color-1"></div>
                                        <i class='icon fa fa-star fa-2x favoYellow'></i>
                                        <div class="btn-group dropright" id="pjMenu">
                                            <i class='fa fa-ellipsis-v fa-2x' data-toggle="dropdown"
                                               aria-haspopup="true" aria-expanded="false"
                                               style="width: 30px;"></i>
                                            <div class="dropdown-menu dropright">
                                            <a class="dropdown-item" href="#" id="setColor">색상 설정</a> <a
                                                class="dropdown-item" href="#" id="setTag">태그 설정</a> <a
                                                class="dropdown-item" href="#">참여자 조회</a> <a
                                                class="dropdown-item" href="#"  id="setPj">프로젝트 설정</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">프젝트 나가기</a>
                                        </div>
                                        </div>
                                        <p id="pjDetail"></p>
                                        <h5 id="pjTitle">프로젝트 제목</h5>
                                        <a href="#" id="inviteBtn"
                                           class="btn btn-icon icon-left btn-secondary"><i
                                                class="far fa-user"></i> +초대하기</a>
                                        <div id="navMenus">
                                            <a class="navMenu home">홈</a> <a
                                                class="navMenu calendar">캘린더</a> <a class="navMenu drive clicked">드라이브</a>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="section-body">

                    <div class="row mt-sm-4">

                        <div class="col-12 col-md-12 col-lg-12">
                            <div class="card">
                                <div class="card-body body-2">
                                    <div class="row">

                                        <div class="col-lg-12 text-right">
                                            <a class="title_down title_btn" style="cursor:default">
                                                <i class="bi bi-download fa-lg"> 다운로드</i>
                                            </a>
                                            <a class="title_del title_btn" style="cursor:default">
                                                <i class="bi bi-trash3 fa-lg">삭제</i>

                                            </a>
                                        </div>
                                        <br> <br> <br>
                                    </div>

                                    <div class="contents" style="width: 100%;">

                                        <div class="piclist" style="display:block; width: 100%;">
                                            <div class="piclist_index">
                                                <div class="file_chk">
                                                    <input type="checkbox" id="thumb_list_all">
                                                    <label for="thumb_list_all" class="thumb_list_all"
                                                           style="cursor:pointer;"></label>
                                                </div>
                                                <div class="picfdate filetable"
                                                     style="text-decoration: underline; font-weight:700; color:#111;">최근
                                                    업로드순<span class="tarrow">↓</span></div>
                                                <div class="picfname filetable">파일명 순<span class="tarrow">↓</span></div>
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
<jsp:include page="invitePjModal.jsp"></jsp:include>
<jsp:include page="colorTagModal.jsp" />
<jsp:include page="pjForm.jsp" />

</body>
<script>
    $(function () {
    	$(document).on('click', '.newPj', function(){
			$("#makePj").modal("show")
		})
		
    	$(document).on('click', '#setColor', function(){
			$("#colorModal").modal("show")
		})
		
		$(document).on('click', '#setTag', function(){
			$("#tagModal").modal("show")
		})
		
		$(document).on('click', '#tagEdit', function(){
			$("#tagEditModal").modal("show")
		})
		
		$(document).on('click', '.tagAddBtn', function(){
			console.log('테스트')
			$("#tagTable").append(
					'<tr>'+
					'<td><i class="fa fa-tag fa-lg"></i>'+
					'</td>'+
					'<th style="width: 50%">테스트</th>'+
					'<td style="width: 20%; text-align: right;">'+
						'<div class="custom-control custom-checkbox">'+
							'<input type="checkbox" class="custom-control-input" id="tag6">'+
								' <label class="custom-control-label" for="tag6"></label>'+
						'</div>'+
					'</td>'+
					'<td style="width: 15%; text-align: right;">'+
						'<div class="btn-group dropright">'+
							'<i class="fa fa-ellipsis-v fa-lg" data-toggle="dropdown"'+
							   'aria-haspopup="true" aria-expanded="false" style="width: 30px;"></i>'+
							'<div class="dropdown-menu dropright">'+
								'<a class="dropdown-item" href="#" id="tagEdit">수정</a>'+
								'<div class="dropdown-divider"></div>'+
								'<a class="dropdown-item" href="#">삭제</a>'+
							'</div>'+
						'</div>'+
					'</td>'+
				'</tr>'
					)
		})
		
        $(document).on('click', '.fa-star', function () {
            if ($(this).hasClass("favoWhite")) {
                $(this).removeClass("favoWhite")
                $(this).addClass("favoYellow")
                console.log("즐겨찾기 추가할것")
            } else if ($(this).hasClass("favoYellow")) {
                $(this).removeClass("favoYellow")
                $(this).addClass("favoWhite")
                console.log("즐겨찾기 제거할것")
            }
            e.stopPropagation()
        })
		
        $(document).on('click', '#inviteBtn', function () {
            $("#inviteModal").modal("show")
        })
        
        $(document).on('click', '.home', function () {
            location.href = "/project/detailPj.do"
        })
        $(document).on('click', '.drive', function () {
            location.href = "/project/drivePj.do"
        })

        $(document).on('click', '#inviteBtn', function () {
            $("#inviteModal").modal("show")
        })
        $(document).on('click', '.calendar', function () {
            location.href = "/project/detailCalendar.do"
        })
    })


</script>
</html>