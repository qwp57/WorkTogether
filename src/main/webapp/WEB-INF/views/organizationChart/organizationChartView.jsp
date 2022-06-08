<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.orgListToggle>div>a>span{
		font-size: medium;
		color: black;
		font-weight: bold;
	}
	
	#allWT{
		margin: 1.5em;
	}
	
	#allManagement, #allProduction, #allSales>a{
		color: black;
		margin-left: 2em;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<jsp:include page="../common/sidebar.jsp"/>
	
	<div class="main-content">	
		<div style="height: 50px"></div>
		<!-- 임직원 검색이 있는 header -->
		<form class="row">			
			<div class="input-group col-lg-3 mb-3">					
				<input type="text" class="form-control" id="memberSearching" placeholder="임직원 검색">
				<div class="input-group-append">
					<button class="btn btn-light" type="submit"><i class="bi bi-search"></i></button> <!-- 부트스트랩 공식 아이콘 사용 -->
				</div>
			</div>
		</form>
		
		<hr>
		
		<!-- 부서 선택 -->
		<div class="row">
			<div class="col-lg-3" id="orgList">
				<div class="orgListToggle">
					<div class="orgListAll">
						<a href="#" data-toggle="collapse" data-target="#allWT">
							<i class="bi bi-plus" id="plusIcon1" style="display:none"></i>
							<i class="bi bi-dash" id="minusIcon1"></i>
						</a>
						<a href="#"><span>워크 투게더</span></a>
					</div>
					
					<div id="allWT" class="collapse show">
						<a href="#" data-toggle="collapse" data-target="#allManagement">
							<i class="bi bi-plus" id="plusIcon2" style="display:none"></i>
							<i class="bi bi-dash" id="minusIcon2"></i>
						</a>
						<a href="#" id="deptName"><span>관리부</span></a>
						
						<div id="allManagement">
							<a href="#">인사팀</a><br>
							<a href="#">재무회계팀</a>
						</div>
					</div>
					
					
					<div id="allWT" class="collapse show">
						<a href="#" data-toggle="collapse" data-target="#allProduction">
							<i class="bi bi-plus" id="plusIcon3" style="display:none"></i>
							<i class="bi bi-dash" id="minusIcon3"></i>
						</a>
						<a href="#" id="deptName"><span>생산부</span></a>
						
						<div id="allProduction">
							<a href="#">생산팀</a><br>
							<a href="#">품질관리팀</a>
						</div>
					</div>
					
					<div id="allWT" class="collapse show">
						<a href="#" data-toggle="collapse" data-target="#allSales">
							<i class="bi bi-plus" id="plusIcon4" style="display:none"></i>
							<i class="bi bi-dash" id="minusIcon4"></i>
						</a>
						<a href="#"><span>영업부</span></a>
						
						<div id="allSales">
							<a href="#">영업팀</a><br>
							<a href="#">고객지원팀</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-9">
				
			</div>
		</div>		
	</div>
	
	<script>
		$(function(){
			$("#minusIcon1").click(function(){
				$(this).css("display","none");
				$("#plusIcon1").removeAttr("style");	
				
			});
			
			$("#plusIcon1").click(function(){
				$(this).css("display","none");
				$("#minusIcon1").removeAttr("style");				
			});
			
			$("#minusIcon2").click(function(){
				$(this).css("display","none");
				$("#plusIcon2").removeAttr("style");	
				
			});
			
			$("#plusIcon2").click(function(){
				$(this).css("display","none");
				$("#minusIcon2").removeAttr("style");				
			});
			
			$("#minusIcon3").click(function(){
				$(this).css("display","none");
				$("#plusIcon3").removeAttr("style");	
				
			});
			
			$("#plusIcon3").click(function(){
				$(this).css("display","none");
				$("#minusIcon3").removeAttr("style");				
			});
			
			$("#minusIcon4").click(function(){
				$(this).css("display","none");
				$("#plusIcon4").removeAttr("style");	
				
			});
			
			$("#plusIcon4").click(function(){
				$(this).css("display","none");
				$("#minusIcon4").removeAttr("style");				
			});
			
		});
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>