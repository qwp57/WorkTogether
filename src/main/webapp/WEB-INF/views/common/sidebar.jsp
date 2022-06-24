<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="main-sidebar">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
          	<img src="/resources/assets/img/logo.png" alt="logo" style="width: 150px; display: block; margin: auto;">
            <a href="index.html">WT</a>
          </div>
          <div class="sidebar-brand sidebar-brand-sm">
            <a href="index.html">WT</a>
          </div>
          <ul class="sidebar-menu">
              
              <li class="nav-item">
                <a href="/main" class="nav-link"><i class="fas fa-fire"></i><span>HOME</span></a>
                
              </li>
              
              <li class="nav-item">
                <a href="/organizationChart.do" class="nav-link"><i class="fas fa-columns"></i><span>조직도</span></a>
              </li>
              
              <li class="nav-item dropdown">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-th"></i> <span>근태관리</span></a>
                <ul class="dropdown-menu">
                  <li><a class="nav-link" href="/vacationMgtMain.do">휴가관리</a></li>
                  <li><a class="nav-link" href="/workStateMain.do">근무기록</a></li>
                  <li><a class="nav-link" href="/workStatistics.do">통계</a></li>
                </ul>
              </li>
             
              <li class="nav-item dropdown">
                <a href="#" class="nav-link has-dropdown" id="approval"><i class="fas fa-th-large"></i><span>전자결재</span></a>
                <ul class="dropdown-menu">
                  <li><a class="nav-link" href="/approvalMain.do">전자결재 홈</a></li>
                  <li>
                  	<a class="nav-link" data-toggle="collapse" data-target="#drftWritingForm" href="#">
                  		<span style="width: 300px" id="draftWriting">기안서작성</span>
                  		<i class="bi bi-caret-down-fill" id="down"></i>
                  		<i class="bi bi-caret-up-fill" id="up" style="display:none"></i>
                  	</a>
                  	<div id="drftWritingForm" class="collapse ml-3">
                  		<a href="/letterOfApprovalEnrollForm.do">일반 품의서</a>
                  		<a href="/expenditureEnrollForm.do">지출 결의서</a>
                  		<a href="/theMinutesOfAMeetingEnrollForm.do">회의록</a>
                  	</div>
                  </li>
                  <li><a class="nav-link" href="/approvalDocument.do">결재문서함</a></li>
                  <li><a class="nav-link" href="/draftDocument.do">기안문서함</a></li>
                </ul>
              </li>
               <hr>
               <li class="menu-header">프로젝트</li>
              <li class="nav-item dropdown">
                <a href="/project" class="nav-link has-dropdown"><i class="far fa-file-alt"></i> <span>프로젝트조회</span></a>
                <ul class="dropdown-menu">
                  <li><a class="nav-link" href="/project">전체 프로젝트</a></li>
                  <li><a class="nav-link" href="/project/storedPj.do">보관 프로젝트</a></li>
                  <li><a class="nav-link" href="/project/selectTag.do">태그별 조회</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="/project/mentionedBoard.do" class="nav-link "><i class="bi bi-at fa-lg"></i> <span>나를 멘션</span></a>
                
              </li>
              <li class="nav-item">
                <a href="/project/myBoard.do" class="nav-link "><i class="bi bi-file-earmark-person-fill"></i>
 <span>내가 쓴 게시글</span></a>
              </li>
       
              <li class="nav-item ">
                <a href="/project/allCalendar.do" class="nav-link "><i class="bi bi-calendar"></i>
<span>프로젝트 캘린더</span></a>
                
              </li>
              <hr>
              <li class="nav-item ">
                <a href="/requestWorkMain.do" class="nav-link "><i class="fas fa-exclamation"></i> <span>업무요청</span></a>
              </li>
            </ul>

            
        </aside>
      </div>
     <script>
     	$(function(){
     		$("#draftWriting").click(function(){
     			$("#down").css("display","none");
     			$("#up").removeAttr("style");
     		});
     		
     		$("#draftWriting").click(function(){
     			$("#up").css("display","none");
     			$("#down").removeAttr("style");
     		});
     	});
     </script>
</body>
</html>