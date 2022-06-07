<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h1{
display: inline-block;
margin-right: 20px;
color: black;
}
#selectweek{
display: inline-block;
width: auto;
}
</style>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>
<div class="main-content">
<div style="height: 100px"></div>
	<h1>내 휴가</h1>
	<h1 style="color: gray">구성원 휴가</h1>
	
	<select class="form-control" id="selectweek">
	    <option>2022년</option>
	    <option>Ketchup</option>
	    <option>Relish</option>
  	</select>
  	<hr>
  	<h3>휴가 개요</h3>
	<h3 style="color: gray">구성원 휴가</h3>
  	<hr>
  	<div class="section-body">
  		<div class="row mt-sm body-1">
  			<div class="col-12 col-md-10 col-lg-3">
  				<div class="card h-100">
  					<div class="card-body">
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-10 col-lg-3">
  				<div class="card h-100">
  					<div class="card-body">
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-10 col-lg-3">
  				<div class="card h-100">
  					<div class="card-body">
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-10 col-lg-3">
  				<div class="card h-100">
  					<div class="card-body">
  					</div>
  				</div>
  			</div>
  		</div>
  		<div class="row mt-sm body-1">
  			<div class="col-12 col-md-10 col-lg-3">
  				<div class="card h-100">
  					<div class="card-body">
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-10 col-lg-3">
  				<div class="card h-100">
  					<div class="card-body">
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-10 col-lg-3">
  				<div class="card h-100">
  					<div class="card-body">
  					</div>
  				</div>
  			</div>
  			<div class="col-12 col-md-10 col-lg-3">
  				<div class="card h-100">
  					<div class="card-body">
  					</div>
  				</div>
  			</div>
  		</div>
  	</div>
</div>
</body>
</html>