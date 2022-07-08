<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 글 작성 모달창 -->
<div class="modal fade" id="boardPost" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content row">
            <!-- modal header : 제목 -->
            <div class="modal-header">
					<span><h3 class="modal-title text-left boardNoti" style="color: gray;">게시물
							작성</h3></span> <span><input type="image" data-dismiss="modal" id="close"
                                                        src="/resources/assets/img/close.png/"
                                                        style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->

            <div id="postForm" style="display: block;">
                <form class="form boardUploadForm" id="enrollPost" action="/post/insertPost.do" method="post"
                      enctype="multipart/form-data">
                    <div class="modal-body">
                        <table class="boardEnrollBtn" style="width: 100%; height: 100%; text-align: center;">
                            <tr>
                                <td class="switchPost"><b><span class='bi bi-file-text fa-lg'>
												&nbsp;&nbsp;글</span></b></td>
                                <td class="switchSch"><b><span class='bi bi-calendar fa-lg'>
												&nbsp;&nbsp;일정</span></b></td>
                                <td class="switchTodo"><b><span class='bi bi-check2-square fa-lg'>
												&nbsp;&nbsp;할 일</span></b></td>
                            </tr>
                        </table>
                        <br> <br>
                        <div class="form-group row mb-4">
                            <input type="hidden" name="type">
                            <input type="hidden" name="pj_no" value="${pj.pj_no}">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-2">제목</label>
                            <div class="col-sm-12 col-md-7 col-lg-9">
                                <input type="text" name="post_title" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-12 col-md-3 col-lg-2">내용</label>
                            <div class="col-sm-12 col-md-7 col-lg-9">
                                <textarea name="post_content" id="summernote"></textarea>
                            </div>
                        </div>

                        <div class="modal-footer row">
                            <div class="col-lg-10 center">
                                <div id="postForArea" style="margin-left: 60px;"></div>
                            </div>
                            <div class="col-lg-1"></div>
                            <div class="col-lg-5 text-left" id="fileAndMentionArea">
                                <input type="text" class="form-control" id="file-label"
                                       style="display: none; border: 0px white;">
                                <input type="file" name="upload_file" id="upload-file" hidden>
                                <input type="hidden" name="isImage">
                                <i class="bi bi-paperclip fa-2x fileUploadBtn"></i>
                                <i class="bi bi-person fa-2x postFor"></i>
                            </div>
                            <div class="col-lg-4 text-right">
                                <button type="submit" class="btn btn-primary btn-lg mr-4 boardUploadBtn">올리기</button>
                            </div>
                            <div class="col-lg-1"></div>
                        </div>
                    </div>
                </form>
            </div>


            <!-- 일정 작성 모달창 -->
            <div id="postSch" style="display: block;">
                <form class="form boardUploadForm" id="enrollSch" action="/schedule/insertSch.do" method="post">
                    <div class="modal-body">
                        <table class="boardEnrollBtn"
                               style="width: 100%; height: 100%; text-align: center;">
                            <tr>
                                <td class="switchPost"><b><span class='bi bi-file-text fa-lg'>
												&nbsp;&nbsp;글</span></b></td>
                                <td class="switchSch"><b><span class='bi bi-calendar fa-lg'>
												&nbsp;&nbsp;일정</span></b></td>
                                <td class="switchTodo"><b><span class='bi bi-check2-square fa-lg'>
												&nbsp;&nbsp;할 일</span></b></td>
                            </tr>
                        </table>
                        <br> <br>
                        <div class="form-group row mb-4">
                            <input type="hidden" name="type">
                            <input type="hidden" name="pj_no" value="${pj.pj_no}">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3">제목</label>
                            <div class="col-sm-12 col-md-7">
                                <input type="text" class="form-control" name="sch_title">
                            </div>
                        </div>
                        <div class="form-group row mb-4">

                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-calendar fa-2x"></i></label>
                            <div class="col-sm-12 col-md-7">
                                <!-- <input type="text" id="datepicker" class="form-control"> -->

                                <div class="form-group" style="width: 48%; display: inline-block;">
                                    <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input"
                                               data-target="#datetimepicker7" name="sch_start"/>
                                        <div class="input-group-append" data-target="#datetimepicker7"
                                             data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <span>~</span>
                                <div class="form-group" style="width: 48%; display: inline-block;">
                                    <div class="input-group date" id="datetimepicker8" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input"
                                               data-target="#datetimepicker8" name="sch_end"/>
                                        <div class="input-group-append" data-target="#datetimepicker8"
                                             data-toggle="datetimepicker">
                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-person fa-2x"></i></label>
                            <div class="col-sm-12 col-md-7">
                                <input type="text" id="addPeople" class="form-control" placeholder="참석자 초대" readonly style="background-color: white; border: 0px white;">
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-geo-alt-fill fa-2x"></i> </label>
                            <div class="col-sm-12 col-md-7">

                                <input type="text" class="form-control bg-white border-0 small" id="kakaoMapSearch"
                                       placeholder="장소 검색하세요">
                                <input type="text" class="form-control bg-white border-0 small" name="sch_place">
                                <div id="map" style="width:425px;height:250px;"></div>
                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-3"><i
                                    class="bi bi-card-text fa-2x"></i> </label>
                            <div class="col-sm-12 col-md-7">
                                <textarea type="text" class="form-control bg-white border-0 small"
                                          placeholder="내용을 입력하세요" name="sch_content"></textarea>
                            </div>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <div class="col-lg-4 text-right">
                            <button type="submit" class="btn btn-primary btn-lg boardUploadBtn">올리기</button>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </form>
            </div>


            <!-- 할 일 작성 모달창 -->
            <div id="postTodo" style="display: block;">
                <form class="form boardUploadForm" id="enrollTodo" action="/todo/insertTodo.do" method="post">
                    <div class="modal-body">
                        <table class="boardEnrollBtn"
                               style="width: 100%; height: 100%; text-align: center;">
                            <tr>
                                <td class="switchPost"><b><span class='bi bi-file-text fa-lg'>
												&nbsp;&nbsp;글</span></b></td>
                                <td class="switchSch"><b><span class='bi bi-calendar fa-lg'>
												&nbsp;&nbsp;일정</span></b></td>
                                <td class="switchTodo"><b><span class='bi bi-check2-square fa-lg'>
												&nbsp;&nbsp;할 일</span></b></td>
                            </tr>
                        </table>
                        <br> <br>
                        <div class="form-group row">
                            <input type="hidden" name="pj_no" value="${pj.pj_no}">
                            <input type="hidden" name="type">
                            <label
                                    class="col-form-label text-md-right col-10 col-md-3 col-lg-1">제목</label>
                            <div class="col-sm-12 col-md-7 col-lg-11">
                                <input type="text" class="form-control" name="todo_title">
                            </div>
                            <div class="col-lg-3"></div>
                        </div>

                        <div class="todos">
                            <div class="form-group row">
                                <div class="col-lg-1 pr-0 text-right">

                                </div>
                                <div class="text-md-right col-10 col-md-7 col-lg-9">
                                    <input type="text" class="form-control" name="todo_content"
                                           placeholder="할 일 추가 / 최대 50자">
                                </div>
                                <div class="col-sm-12 col-md-3 col-lg-1">
                                    <div class="input-group todoInput date" style="width: 100px;">
                                        <input type="text" style="display: none; width:25px;"
                                               class="form-control bg-white border-0 small todoDue" name="todo_end">
                                        <span class="bi bi-calendar fa-2x mr-3 todoCalendar input-group-addon"></span>

                                    </div>

                                </div>
                                <div class="col-lg-1">
                                    <i class="bi bi-person fa-2x todoPerson"></i>
                                    <p class="todoFor" style="font-size: 11px; margin-top: 6px;">
                                        <input type="hidden" name="todo_for">
                                    </p>
                                </div>
                                <input type="hidden" name="status" value="N">
                            </div>

                        </div>
                        <div class="col-lg-12 text-center">
                            <i class='fa fa-plus fa-2x' id="addTodo"></i>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <div class="col-lg-4 text-right">
                            <button type="submit" class="btn btn-primary btn-lg boardUploadBtn">올리기</button>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </form>
            </div>
            </form>
        </div>

    </div>
</div>
<script>
   // function insertPost(){
   //     if($("#boardPost").find("input[name=post_title]").val() == ''){
   //         alert("제목을 입력하세요.")
   //     }else if($("#boardPost").find("textarea[name=post_content]").val() == ''){
   //        alert("내용을 입력하세요.")
   //     }else {
   //         $("#enrollPost").submit()
   //     }
   // }
   // function insertSch(){
   //     if($("#boardPost").find("input[name=sch_title]").val() == ''){
   //         alert("제목을 입력하세요.")
   //     }else if($("#boardPost").find("input[name=sch_start]").val() == '' || $("#boardPost").find("input[name=sch_end]").val() == ''){
   //         alert("날짜을 입력하세요.")
   //     }else {
   //         console.log($("#boardPost").find("input[name=sch_title]").val())
   //         $("#enrollSch").submit()
   //     }
   // }
</script>