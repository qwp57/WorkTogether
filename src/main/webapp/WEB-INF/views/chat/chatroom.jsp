<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css"
	integrity="sha384-eoTu3+HydHRBIjnCVwsFyCpUDZHZSFKEJD0mc3ZqSBSb6YhZzRHeiomAUWCstIWo"
	crossorigin="anonymous">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	position: relative;
	color: #333333;
	font-size: 14px;
	line-height: 1.15;
	z-index: -1;
}

.chat-room-wrap {
	z-index: -1;
}

.chat-room-top {
	width: 470px;
	height: 65px;
	background-color: #6777ef;
	margin: 0 auto;
}

.chat-room-name-wrap {
	line-height: 60px;
	color: #fff;
	font-weight: bold;
	text-align: center;
}

#chat-name-title {
	text-align: center;
}

.chat-top-right {
	float: right;
	margin-right: 20px;
	vertical-align: middle;
}

#Capa_1_margin {
	margin-left: 15px;
}

.chat-room-content {
	width: 470px;
	height: 495px;
	margin:0 auto;
	overflow:scroll;
	border-bottom: 1px solid #e7e7e7;
}
/*스크롤바 변경*/
::-webkit-scrollbar { width: 5px; height: 0px; }
/* 스크롤바의 width */
::-webkit-scrollbar-track { background-color: #f0f0f0; }
/* 스크롤바의 전체 배경색 */
::-webkit-scrollbar-thumb { 
    background: linear-gradient(to bottom, #5A3673, #432D73); 
}
/* 스크롤바 색 */
::-webkit-scrollbar-button { display: none; }
.chat-room-bottom {
	text-align: center;
}

.chat-input {
	width: 325px;
	height: 60px;
	border: none;
	margin: 15px;
}

.chat-submit {
	border-radius: 3px;
	background-color: #a2a2a2;
	border: 0 currentColor;
	width: 70px;
	height: 70px;
	color: #fff;
	font-size: 14px;
	cursor: pointer;
	margin: 10px;
}

/* 채팅 서치 */
#chat-room-search {
	
}

#search-exit {
	float: right;
	margin: 20px;
	width: 25px;
	height: 25px;
}

.room-search-wrap {
	display: none;
}

#message-title {
	text-align: center;
	width: 400px;
}

.search-box {
	margin: 10px 12px;
	height: 32px;
	line-height: 32px !important;
	border: 1px solid #e7e7e7;
	border-radius: 4px;
}

#chat-search-input {
	border: none;
	width: 395px;
	line-height: 25px;
	padding-left: 10px;
}

.chat-search {
	padding-top: 12px;
	margin-top: 10px;
	vertical-align: middle;
	margin-right: 5px;
}

/* 인풋 박스 클릭시 테두리 없애기 */
input:focus {
	outline: none;
}

#chat-search-rs {
	width: 100%;
	height: 500px;
	vertical-align: middle;
	text-align: center;
	color: #505050;
	margin-top: 20px;
}

/* 채팅방 모아보기 모달 */
.chat-moa {
	display: none;
	width: 220px;
	height: 665px;
	background-color: #fff;
	position: fixed;
	top: 0;
	left: 255px;
	z-index: 100;
}

.chat-dim {
	display: none;
	width: 100%;
	height: 100%;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	background-color: rgba(0, 0, 0, 0.5);
}

#chat-moa-exit {
	float: right;
	margin: 20px;
	text-decoration: none;
	color:#505050;
}

.chat-moa-sub {
	
}

.chat-moa-title {
	padding: 15px;
	font-weight: bold;
	margin-top: 55px;
	background-color: #e7e7e7;
}
/* 채팅 참여자 */

.profileImg {
    width: 40px;
    float: left;
    margin-right: 15px;
    line-height: 40px;
	display: block;
	padding:5px;
}
.chat-mem-list{
	width : 290px;
	height : 50px;
	line-height: 40px;
	display: block;
	padding:5px;
}
.chat-mem-list .profieName{
	font-size:12px;
	color:#505050;
}
.chat-mem-list:hover {
	background-color: #f5f5fa;
}
/* 채팅 내용 */
.mycontent{
	width: 450px;
	height: 40px;
	line-height: 30px;
	padding:10px 0px 10px 10px;
	display:block;

}
.other-content{
	width: 430px;
	height: 100%;
	line-height: 40px;
	float:left;
}

.other-content-date{
	font-size:10px;
	color:#505050;
}
.mycontent-info{
	margin-left:335px;
}
.other-content-info{
	display:block;
	margin:10px;
	height: 20px;
	
}

.other-content-wrap{
	background: #e7e7e7;
    border: 1px solid #e7e7e7;
    border-top-left-radius: 5px;
	display: inline-block;
    max-width: 100%;
    padding: 7px 12px;
    border-radius: 5px;
    color: #111;
    line-height: 1.5;
    font-size: 14px;
    position: relative;
    margin-left:10px;
}

.mycontent-wrap{
	clear:both;
	background: black;
    border: 1px solid #5A3673;
    border-top-left-radius: 5px;
	display: block;
    max-width: 100%;
    float:right;
    padding: 7px 12px;
    border-radius: 5px;
    color: #fff;
    line-height: 1.5;
    font-size: 14px;
    position: relative;
    margin-top:3px;
}
</style>
</head>

<body>
	<div id="chat-room-wrap">
		<div class="chat-room-top">
			<p class="chat-room-name-wrap">
				<span id="chat-name-title">${chatname }</span> <span
					class="chat-top-right"> 
				<a href="#" id="chat-room-search">
					<span class='bi bi-search fa-lg' style="color: white;"></span>
				</a> <!--메뉴버튼--> 
				<a href="#" id="chat-room-menu"> 
					<span class='bi bi-list fa-lg' style="color: white;"></span>
				</a>
				</span>

			</p>
		</div>
		
		<div class="chat-room-content" id="chat-content-wrap">
			<div class="well" id="chatdata">
				<div class="well">
					<div class="otehr-content">
						<div class="other-content-info">
								<strong> 사원명</strong><br>
						</div>
						<p class="other-content-wrap"> 메세지 내용</p> 
						<span class="other-content-date">2022-06-12 10:53</span>
					</div>
					<div class="mycontent">
						<div class="mycontent-info">
						</div>
						<p class="mycontent-wrap"> 내가보낸 채팅</p> 
					</div>
				</div>

			</div>
			
		</div>
		<div class="chat-room-bottom">
			<input type="text" class="chat-input" id="message"
				placeholder="메세지를 입력하세요" name="message"> <input type="submit"
				class="chat-submit" id="sendBtn" value="전송">
		</div>
	</div>


</body>

<script>
	$(document).ready(function() {
		$("#chat-room-search").click(function() {
			$(".room-search-wrap").show();
			$("#chat-room-wrap").hide();
		});
		$("#search-exit").click(function() {
			$(".room-search-wrap").hide();
			$("#chat-room-wrap").show();
		});
		$("#search-exit").click(function() {
			$(".room-search-wrap").hide();
			$("#chat-room-wrap").show();
		});

		$("#chat-room-menu").click(function() {
			$(".chat-dim").show();
			$(".chat-moa").show();
		});

		$("#chat-moa-exit").click(function() {
			$(".chat-dim").hide();
			$(".chat-moa").hide();
		});
		$("#message").on('input',function(){
				$("#sendBtn").css("background-color","#111111");
		});
		
		 var isScrollUp = false;
		 var divChat = document.getElementById('chat-content-wrap');
		 if (!isScrollUp) {
		      $('.chat-room-content').animate({
		        scrollTop: divChat.scrollHeight - divChat.clientHeight
		      }, 100);
		    }
	});
</script>
</html>