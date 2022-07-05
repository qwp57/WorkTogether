<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .inviteTable {
            width: 100%;
        }
    </style>
</head>
<body>

<!-- 프로젝트 초대 모달창 -->
<div class="modal fade" id="inviteModal" data-backdrop="static"
     data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content row">
            <!-- modal header : 제목 -->
            <div class="modal-header">
                <span><h3 class="modal-title text-left">프로젝트 초대</h3></span> <span><input
                    type="image" data-dismiss="modal"
                    src="/resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <form class="form" id="invitePj" action="/project/invitePj.do" method="post">
                <input type="hidden" name="pj_no">
                <div class="modal-body" style="overflow-y: scroll; max-height: 600px;">
                    <input type="text" class="form-control" id="memberSearching"
                           placeholder="사원명으로 검색">
                    <table class="inviteTable">
                    </table>
                    <br>
                </div>
                <div class="modal-footer">
                    <div class="col-lg-12 text-center">
                        <button type="submit" id="inviteEmpBtn" class="btn btn-primary btn-lg mb-3">초대</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>