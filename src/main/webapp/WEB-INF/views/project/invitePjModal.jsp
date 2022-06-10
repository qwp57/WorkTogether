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
                    src="resources/assets/img/close.png/" style="width: 20px;"></span>
            </div>
            <!-- modal body : 내용 -->
            <form class="form" id="tagSave">
                <div class="modal-body">
                    <input type="text" class="form-control" id="memberSearching"
                           placeholder="사원명으로 검색">
                    <table class="inviteTable">
                        <c:forEach var="index" begin="1" end="5">
                            <tr>
                                <td rowspan="2"><span class='bi bi-person-circle fa-2x'></span>

                                </td>
                                <th style="width: 50%">테스트</th>
                                <td rowspan="2" style="width: 20%; text-align: right;">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input"
                                               id="tag${index }"> <label
                                            class="custom-control-label" for="tag${index }"></label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>부장</td>
                            </tr>

                        </c:forEach>
                    </table>
                    <br>
                </div>
                <div class="modal-footer">
                    <div class="col-lg-12 text-center">
                        <button type="submit" class="btn btn-primary btn-lg mb-3">초대</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>