<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 게시물 조회 모달창 -->
<!-- data-backdrop="static" 속성은 모달창 주위의 배경을 클릭해도 창이 닫히지 않도록 한다. -->
<!-- data-keybaord="false" 속성은 esc키를 눌러도 창이 닫히지 않게 한다. -->
<div class="modal fade" id="boardView" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content row">
            <!-- modal header : 제목 -->
            <div class="modal-header">
                <div class="row col-12">
                    <div class="col-lg-1">
                        <div class="colors ${pjMember.pj_color} ml-2"
                             style="margin: 0px; width:20px; height:20px;">
                        </div>
                    </div>
                    <div class="col-lg-11" style="margin-top: 10px;">
                        <div><h5>${pj.pj_title}</h5></div>
                    </div>
                </div>
                <span><input
                        type="image" data-dismiss="modal"
                        src="/resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <div id="postView" style="display: block;">
                <form class="form">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row ml-5 mr-5 boardBody">
                                <div class="col-lg-10">
                                    <span class='bi bi-person-circle fa-lg' id="postWriter"></span>
                                    <span style="color: gray" id="postUploadDate"></span>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <input class="detailViewBoard_no" type="text" hidden>
                                    <a id="postEditBtn">수정&nbsp;</a>
                                    <a class="boardDeleteBtn">&nbsp;삭제</a>
                                </div>

                                <br><br>

                                <div class="col-12">
                                    <h3 id="postTitle"></h3>
                                    <hr>
                                </div>

                                <div class="col-lg-12 ml-3 mr-3" id="postContent">
                                </div>
                                <div class="col-lg-12 text-right">
                                    <a class="replyCount"></a>
                                    <a class="viewCount"></a>
                                    <hr>
                                </div>
                                <div class="col-lg-12" id="postForListArea"
                                     style="display: none; margin-bottom: 10px;"></div>
                                <div class="col-lg-12" id="postFileArea"
                                     style="display: none; margin-bottom: 10px;"></div>
                                <div class="replyArea col-lg-12">

                                </div>
                                <div class="col-lg-12 replyHrArea" style="display: none;">
                                    <hr>
                                </div>


                                <label
                                        class="col-form-label col-lg-1 pt-0">
                                    <span class='bi bi-person-circle fa-2x'></span>
                                </label>
                                <div class="col-lg-9 text-center">
                                    <input type="text" class="form-control replyContentEnroll">
                                </div>
                                <div class="col-lg-2 text-right">
                                    <button type="button" class="btn btn-primary btn-lg addReplyBtn">등록</button>
                                </div>
                            </div>


                        </div>
                    </div>
                </form>
            </div>


            <div id="schView" style="display: block;">
                <form class="form">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row ml-5 mr-5 boardBody">
                                <div class="col-lg-10">
                                    <span class='bi bi-person-circle fa-lg' id="schWriter"></span>
                                    <span style="color: gray" id="schUploadDate"></span>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <input class="detailViewBoard_no" type="text" hidden>
                                    <a id="schEditBtn">수정&nbsp;</a>
                                    <a class="boardDeleteBtn">&nbsp;삭제</a>
                                </div>

                                <br><br>

                                <div class="col-12">
                                    <h3 id="schTitle"></h3>
                                    <br>
                                    <span class='bi bi-calendar fa-lg ml-3' id="schDate"></span>
                                    <hr>
                                </div>

                                <div class="col-lg-12 ml-3 mr-3">
                                    <i class="bi bi-person fa-lg"></i> &nbsp;&nbsp; <b style="color: #5cb85c"
                                                                                       id="schYCount"></b>
                                    &nbsp;&nbsp;<b style="color: #ac2925" id="schNCount"></b>
                                    &nbsp;&nbsp; <a style="border-bottom: 1px black solid" class="viewAttendee"> 참석자
                                    조회</a>
                                    <br><br><br>
                                </div>
                                <div class="col-lg-12 ml-3 mr-3">
                                    <i class="bi bi-geo-alt-fill fa-lg"></i>
                                    &nbsp;&nbsp;<span id="schPlace"></span>
                                    <br><br><br>
                                </div>
                                <div class="col-lg-12 ml-3 mr-3">
                                    <i class="bi bi-card-text fa-lg"></i>
                                    &nbsp;&nbsp;<span id="schContent"></span>
                                    <br>
                                    <hr>
                                </div>
                                <div class="col-lg-12 text-center">
                                    <button type="button" class="btn btn-success btn-lg mr-3" id="schJoin">참석</button>
                                    <button type="button" class="btn btn-danger btn-lg ml-3" id="schNotJoin">불참</button>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <a class="replyCount"></a>
                                    <a class="viewCount"></a>
                                    <hr>
                                </div>
                                <div class="replyArea col-lg-12">

                                </div>
                                <div class="col-lg-12 replyHrArea" style="display: none;">
                                    <hr>
                                </div>
                                <label
                                        class="col-form-label col-lg-1 pt-0">
                                    <span class='bi bi-person-circle fa-2x'></span>
                                </label>
                                <div class="col-lg-9 text-center">
                                    <input type="text" class="form-control replyContentEnroll">
                                </div>
                                <div class="col-lg-2 text-right">
                                    <button type="button" class="btn btn-primary btn-lg addReplyBtn">등록</button>
                                </div>
                            </div>


                        </div>
                    </div>
                </form>
            </div>


            <div id="todoView" style="display: block;">
                <form class="form" id="">
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row ml-5 mr-5 boardBody">
                                <div class="col-lg-10">
                                    <span class='bi bi-person-circle fa-lg' id="todoWriter"></span>
                                    <span style="color: gray" id="todoUploadDate"></span>
                                </div>
                                <div class="col-lg-2 text-right">
                                    <input class="detailViewBoard_no" type="text" hidden>
                                    <a id="todoEditBtn">수정&nbsp;</a>
                                    <a class="boardDeleteBtn">&nbsp;삭제</a>
                                </div>

                                <br><br>

                                <div class="col-12">
                                    <h3 id="todoTitle"></h3>
                                    <hr>
                                </div>

                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-lg-6"><h5 style="display: inline-block" id="todoCompleteCount">1
                                            &nbsp; </h5><h5
                                                style="display: inline-block; color: gray" id="todoTotalCount"></h5>
                                        </div>
                                        <div class="col-lg-6 text-right"><h5 style="color: #5cb85c"
                                                                             id="todoCompletePercent"></h5></div>
                                    </div>
                                    <div class="progress mb-3" data-height="25">
                                        <div class="progress-bar bg-success" role="progressbar" id="todoBar"
                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <br><br>
                                    <div id="todos">

                                    </div>
                                    <hr>
                                    <br><br>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <a class="replyCount"></a>
                                    <a class="viewCount"></a>
                                    <hr>
                                </div>
                                <div class="replyArea col-lg-12">

                                </div>
                                <div class="col-lg-12 replyHrArea" style="display: none;">
                                    <hr>
                                </div>

                                <label
                                        class="col-form-label col-lg-1 pt-0">
                                    <span class='bi bi-person-circle fa-2x'></span>
                                </label>
                                <div class="col-lg-9 text-center">
                                    <input type="text" class="form-control replyContentEnroll">
                                </div>
                                <div class="col-lg-2 text-right">
                                    <button type="button" class="btn btn-primary btn-lg addReplyBtn">등록</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
