<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="section-body">

  <div class="row mt-sm-4">

    <div class="col-12 col-md-12 col-lg-12">
      <div class="card">
        <div class="card-body body-1">
          <div>
            <button class="btn btn-primary newPj">+ 새 프로젝트</button>
          </div>
          <div class="detailTop">
            <div class="colors ${pjMember.pj_color}"></div>
            <i class='icon fa fa-star fa-2x favoBtn <c:choose><c:when test="${checkBookmark > 0}">favoYellow</c:when><c:otherwise>favoWhite</c:otherwise></c:choose>'></i>
            <div class="btn-group dropright" id="pjMenu">
              <i class='fa fa-ellipsis-v fa-2x' data-toggle="dropdown"
                 aria-haspopup="true" aria-expanded="false"
                 style="width: 30px;"></i>
              <div class="dropdown-menu dropright">
                <a class="dropdown-item" href="#" id="setColor">색상 설정</a>
                <a class="dropdown-item" href="#" id="tagSettingBtn">태그 설정</a>
                <a class="dropdown-item" href="#" id="viewEmpInPj">참여자 조회</a>
                <c:if test="${pjMember.admin == 'Y'}">
                  <a class="dropdown-item" href="#" id="setPj">프로젝트 설정</a>
                </c:if>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" id="quitProject">프로젝트 나가기</a>
              </div>
            </div>
            <p id="pjDetail">${pj.pj_content}</p>
            <h5 id="pjTitle">${pj.pj_title}</h5>
            <a href="#" id="inviteBtn"
               class="btn btn-icon icon-left btn-secondary"><i
                    class="far fa-user"></i> +초대하기</a>
            <div id="navMenus">
              <a class="navMenu home">홈</a> <a
                    class="navMenu calendar">캘린더</a> <a class="navMenu drive">드라이브</a>
            </div>
          </div>

        </div>

      </div>
    </div>
  </div>
</div>