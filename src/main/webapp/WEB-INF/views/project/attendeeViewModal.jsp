<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 글 멘션, 일정 참석자 추가 모달창 -->
<div class="modal fade" id="mentionForModal" data-backdrop="static"
     data-keyboard="false" style="z-index: 13000;">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content row">
      <!-- modal header : 제목 -->
      <div class="modal-header">
        <span><h3 class="modal-title text-left">사원 추가</h3></span> <span><input
              type="image" data-dismiss="modal"
              src="/resources/assets/img/close.png/" style="width: 20px;"></span>
      </div>
      <!-- modal body : 내용 -->
      <form class="form">
        <div class="modal-body" style="overflow-y: scroll; max-height: 600px;">
          <input type="text" class="form-control memberSearching" id="mentionForModalSearch" placeholder="사원명으로 검색">
          <table class="inviteTable">
          </table>
          <br>
        </div>
        <div class="modal-footer">
          <div class="col-lg-12 text-center">
            <button type="button" id="PostAddEmpBtn" class="btn btn-primary btn-lg mb-3">추가</button>
            <button type="button" id="SchAddEmpBtn" class="btn btn-primary btn-lg mb-3">추가</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>


<!-- 글 멘션, 일정 참석자 추가 모달창 -->
<div class="modal fade" id="viewSchAttendee" data-backdrop="static"
     data-keyboard="false" style="z-index: 13000;">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content row">
      <!-- modal header : 제목 -->
      <div class="modal-header">
        <span><h3 class="modal-title text-left">일정 참석자</h3></span> <span><input
              type="image" data-dismiss="modal"
              src="/resources/assets/img/close.png/" style="width: 20px;"></span>
      </div>
      <!-- modal body : 내용 -->
      <form class="form">
        <div class="modal-body" style="overflow-y: scroll; max-height: 600px;">
          <input type="text" class="form-control memberSearching" id="viewSchAttendeeSearch" placeholder="사원명으로 검색">
          <table class="inviteTable">
          </table>
          <br>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- 할 일 담당자 선택 모달창 -->
<div class="modal fade" id="todoFor" data-backdrop="static"
     data-keyboard="false" style="z-index: 13000;">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content row">
      <!-- modal header : 제목 -->
      <div class="modal-header">
        <span><h3 class="modal-title text-left">담당자 선택</h3></span> <span><input
              type="image" data-dismiss="modal"
              src="/resources/assets/img/close.png/" style="width: 20px;"></span>
      </div>
      <!-- modal body : 내용 -->
      <form class="form">
        <div class="modal-body" style="overflow-y: scroll; max-height: 600px;">
          <form>
            <input type="text" class="form-control memberSearching" id="todoForSearch"
                   placeholder="사원명으로 검색">
            <table class="inviteTable">
            </table>
            <br>
          </form>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- 참여자 조회 모달창 -->
<div class="modal fade" id="empListModal" data-backdrop="static"
     data-keyboard="false" style="z-index: 3000;">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content row">
      <!-- modal header : 제목 -->
      <div class="modal-header">
        <span><h3 class="modal-title text-left">참여자 조회</h3></span> <span><input
              type="image" data-dismiss="modal"
              src="/resources/assets/img/close.png/" style="width: 20px;"></span>
      </div>
      <!-- modal body : 내용 -->
      <form class="form">
        <div class="modal-body" style="overflow-y: scroll; max-height: 600px;">
          <form>
            <input type="text" class="form-control memberSearching" id="empListModalSearch" placeholder="사원명으로 검색">
            <div class="inviteTable">
            </div>
            <br>
          </form>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
  $("#empListModalSearch").keyup(function(){
    var keyword = $("#empListModalSearch").val();
    console.log(keyword)
    $("#empListModal").find(".inviteTable").find(".empNameTr").each(function (){
      if(!$(this).find(".emp_name").text().includes(keyword)){
        $(this).css("display", "none")
        $(this).next().css("display", "none")
      }else {
        //console.log($(this).next().html())
        $(this).removeAttr("style")
        $(this).next().removeAttr("style")
       // console.log($(this).text())
      }
    })
  });

  $("#todoForSearch").keyup(function(){
    var keyword = $("#todoForSearch").val();
    console.log(keyword)
    $("#todoFor").find(".inviteTable").find(".empNameTr").each(function (){
      if(!$(this).find(".emp_name").text().includes(keyword)){
        $(this).css("display", "none")
        $(this).next().css("display", "none")
      }else {
        console.log($(this).next().html())
        $(this).removeAttr("style")
        $(this).next().removeAttr("style")
        // console.log($(this).text())
      }
    })
  });

  $("#mentionForModalSearch").keyup(function(){
    var keyword = $("#mentionForModalSearch").val();
    console.log(keyword)
    $("#mentionForModal").find(".inviteTable").find(".empNameTr").each(function (){
      if(!$(this).find(".emp_name").text().includes(keyword)){
        $(this).css("display", "none")
        $(this).next().css("display", "none")
      }else {
        console.log($(this).next().html())
        $(this).removeAttr("style")
        $(this).next().removeAttr("style")
        // console.log($(this).text())
      }
    })
  });

  $("#viewSchAttendeeSearch").keyup(function(){
    var keyword = $("#viewSchAttendeeSearch").val();
    console.log(keyword)
    $("#viewSchAttendee").find(".inviteTable").find(".empNameTr").each(function (){
      if(!$(this).find(".emp_name").text().includes(keyword)){
        $(this).css("display", "none")
        $(this).next().css("display", "none")
      }else {
        console.log($(this).next().html())
        $(this).removeAttr("style")
        $(this).next().removeAttr("style")
        // console.log($(this).text())
      }
    })
  });
</script>