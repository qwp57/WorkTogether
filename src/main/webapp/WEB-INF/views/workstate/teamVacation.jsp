<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/9b80e7c08f.js" crossorigin="anonymous"></script>
</head>
<style>
h2{
display: inline-block;
margin-right: 20px;
color: black;
}
#selectyear{
display: inline-block;
width: auto;
}
.wrap{

margin-top: 100px;
}
.section-body{
margin-bottom: 30px;
margin-top: 30px;
}
.vac-menu-title{
font-family: 'Nanum Gothic', sans-serif;
font-size: 26px;
font-weight: 700;
color: black;
margin-top: 10px;
}
#profileImg{
	width: 90px;
	margin: 5px;
}
.pagination{
	justify-content: center;
}
.nonvisible{
	display: none;
}

#searchwrap{
margin: 20px;
}
#search{
width: 60%;
margin: auto;
}
.searchForm{
height: 50px;
border-radius: 10px;
border: 1px solid lightgray;

}

.searchForm:focus{
outline: none;
border: 1px solid blue;

}
#selectsearch{
width: 20%;
text-align: center;
font-family: 'Nanum Gothic', sans-serif;
}
#searchArea{
width : 60%;
font-family: 'Nanum Gothic', sans-serif;
}
#searchbtn{
height: 50px;
border-radius: 10px;
border: 1px solid lightgray;

width: 15%;
font-size: 17px;
font-family: 'Nanum Gothic', sans-serif;
}
.main-content{
	width: 1300px;

}



</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content" >
<div class="wrap">
	<a href="/vacationMgtMain.do"><h2 style="color: gray">내 휴가</h2></a>
	<a href="/teamVacation.do"><h2>구성원 휴가</h2></a>
	
	<select class="form-control" id="selectyear">
		<c:forEach items="${years}" var="y">
			<option value="${y}">${y}년</option>
		</c:forEach>
  	</select>
  	
  	<div class="vac-menu-title" style="color: gray">휴가 개요</div>
  	<hr>
  	<div class="section-body">
        <h2 class="section-title" style="text-align: left;"> </h2>
        <div class="row mt-sm-4 body-1">
            <div class="col-12 col-md-10 col-lg-12">
                <div class="card h-100">
                    <div class="card-body text-center">
                   		<table class="table table-bordered " >
                            <thead class="thead-dark">
                            	<tr id="thead">
                            		<th>이름</th>
                            		<th>기간</th>
                            		<th>총 사용 기간</th>
                            		<th>종류</th>
                            		<th>사유내용</th>
                            		<th>증명자료</th>
                            		<th>상태</th>
                            		
                            	</tr>
                            </thead>
                            <tbody>
                            <c:forEach items="#{teamVacList}" var="t">
                            <tr>
                            	<td><span>${t.emp_no} ${t.job}님</span></td>
                            	<td><fmt:formatDate value="${t.start_date}" pattern="yyyy.MM.dd(E)"/> ~ <fmt:formatDate value="${t.end_date}" pattern="yyyy.MM.dd(E)"/></td>
                            	<td>총 ${t.totaldays}일</td>
                            	<td>${t.vcategory_no}</td>
                            	<td>${t.content}</td>
                            	<td><a href="/resources/upload_files/${t.fileChangeName}" download type="text/example">${t.fileOriginName}</a></td>
                            	<td class="dropdown">
									
									<c:choose>
										<c:when test="${t.status eq 'W'}"><button class="btn btn-secondary btn-lg dropdown-toggle" id="dropdownMenuButton1" data-toggle="dropdown">승인 대기</button></c:when>
										<c:when test="${t.status eq 'A'}"><button class="btn btn-primary btn-lg dropdown-toggle" id="dropdownMenuButton1" data-toggle="dropdown">승인 완료</button></c:when>
										<c:otherwise><button class="btn btn-danger btn-lg dropdown-toggle" id="dropdownMenuButton1" data-toggle="dropdown">승인 거부</button></c:otherwise>
									</c:choose>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
										<li><a class="dropdown-item" onclick="changeStatus('A', ${t.vac_no}, this);">✅ 승인 완료</a></li>
										<li><a class="dropdown-item" onclick="changeStatus('W', ${t.vac_no}, this);">⛔ 승인 대기</a></li>
										<li><a class="dropdown-item" onclick="changeStatus('RJ', ${t.vac_no}, this);">❌ 승인 거부</a></li>
									</div>
									
                            	</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    <ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<li class="page-item" onclick="beforeAfterPage(-1)"><a class="page-link" href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
							<c:when test="${ pi.currentPage ne p }">
									<li class="page-item" onclick="changePage('${ p }')"><a class="page-link" href="#">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						
						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<li class="page-item" onclick="beforeAfterPage(-1)"><a class="page-link" href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<form action="teamVacation.do" method="get" id="teamForm">
						<input class="nonvisible" type="text" value="${year}" name="year" id="startyearId">
						<input class="nonvisible" type="text" value="${pi.currentPage}" name="currentPage" id="currantPageId">
						<input class="nonvisible" type="text" value="${sd.searchKeyword}" name="searchKeyword" id="searchText" value = "${sd.searchKeyword}" >
					<div id="searchwrap">	
					<div id="search">
				        <select class="searchForm" id="selectsearch" name="searchTarget">
					    	<option value="author">작성자</option>
					    	<option value="content">내용</option>
				  		</select>
						<input type="text" class="searchForm" id="searchArea" placeholder="검색 키워드를 입력하세요!" value = "${sd.searchKeyword}">
						<button class="btn btn-primary" type="button" id="searchbtn" onclick="searchSubmit();">검색</button>
					</div>
					</div>
					</form>
                </div>
            </div>
        </div>
        
    </div>
  	
  	
</div>
</div>
<br><br>
<jsp:include page="../common/footer.jsp"/>
<script src="/resources/assets/js/teamVacation.js?ver=1"></script>
<script type="text/javascript">
$(function() {
	let selectedyear = "${year}";
	$('#selectyear option[value = '+selectedyear+']').prop("selected", true);

	let searchTarget = "${sd.searchTarget}";
	$('#selectsearch option[value = '+searchTarget+']').prop("selected", true);
	
})

</script>
</body>
</html>