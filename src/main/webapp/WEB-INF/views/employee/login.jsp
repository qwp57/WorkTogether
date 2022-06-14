<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Login &mdash; Stisla</title>

  <!-- General CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="../node_modules/bootstrap-social/bootstrap-social.css">

  <!-- Template CSS -->
  <link rel="stylesheet" href="resources/assets/css/style.css">
  <link rel="stylesheet" href="resources/assets/css/components.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<script type="text/javascript">
$(function(){
	let msg = "${msg}";
	if(msg != ""){
		alert(msg);
		
	}
})
</script>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="login-brand">
              <img src="resources/assets/img/logo.png" alt="logo" width="200" >
            </div>

            <div class="card">
              <div class="card-header"><h4>Login</h4></div>

              <div class="card-body">
                <form method="POST" action="/login.do" class="needs-validation" novalidate="">
                  <div class="form-group">
                    <label for="id">ID</label>
                    <input id="id" type="text" class="form-control" name="id" tabindex="1" required autofocus placeholder="ID를 입력해주세요">
                    <div class="invalid-feedback">
                      ID를 입력하세요
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="d-block">
                    	<label for="password" class="control-label">Password</label>
                    </div>
                    
                    <input id="password" type="password" class="form-control" name="password" tabindex="2" required placeholder="password를 입력해주세요">
                    <div class="invalid-feedback">
                      비밀번호를 입력해주세요
                    </div>
                 </div>

                  <div class="form-group">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" id="remember" name="remember" class="custom-control-input" tabindex="3">
                      <label class="custom-control-label" for="remember">ID 저장</label>
                    </div>
                  </div>

                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      Login
                    </button>
                  </div>
                </form>
               </div>
                  
                <div class="text-center mt-4 mb-3">
                  <div class="text-job text-muted">비밀번호 찾기</div>
                </div>

              </div>
            </div>
           
          </div>
            <div class="mt-5 text-muted text-center">

              계정이 없으신가요? <a href="/enrollForm.do">회원가입</a>

            </div>
        </div>
      
    </section>
  </div>
  <jsp:include page="../common/footer.jsp"></jsp:include>

  <!-- General JS Scripts -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="resources/assets/js/stisla.js"></script>

  <!-- JS Libraies -->

  <!-- Template JS File -->
  <script src="resources/assets/js/scripts.js"></script>
  <script src="resources/assets/js/custom.js"></script> 
  <script src="resources/assets/js/login.js"></script>
 <!--  <script>
//쿠키저장(setCookies), 쿠키 삭제(deleteCookies), 쿠키 가져오는건(getCookies) 각각 함수를 만들어 사용한다.. 
  $(document).ready(function(){

      //userId로 저장된 쿠기값 
  	var cookieId = getCookie("userId"); 
  	var cookiePwd = getCookie("userPwd"); 
  	
      //그 쿠키값을 name이 userId인 요소의 값으로 넣어준다.
      $("#id").val(cookieId); 
  	
  	//쿠키에 저장된 아이디가 있으면(이전에 아이디 저장을 한 상태)
  	if($("#id").val().trim() != ""){ 
  		$("#password").val(cookiePwd); //비밀번호도 쿠키에 저장된 비밀번호 꺼내서 입력
  	    $("#remember").attr("checked", true); //아이디 저장하기 체크 
  	}
  	
  	
   	//아이디 저장하기 체크에 변화가 발생하면
  	$("#remember").change(function(){ 
  		//체크상태일때
  	    if($("#remember").is(":checked")){ 
  	        var userInputId = $("#id").val(); 
  	        setCookie("userId", userInputId, 7); //7일 동안 쿠키 보관
  			var userInputPwd = $("#password").val(); 
  	        setCookie("userPwd", userInputPwd, 7);


  	    }else{ //아이디 저장하기를 체크 해제한다면
  	        deleteCookie("userId"); //쿠키 삭제
  			deleteCookie("userPwd"); //쿠키 삭제
  	    }
  	});
  	 
  	//아이디 저장하기를 체크한 이후 아이디를 작성하는 경우, 키가 눌릴 때마다 아이디를 쿠키에 새로 저장한다. 
  	$("#id").keyup(function(){ //아이디 입력칸에 아이디를 입력할 때(keyup메소드로 키보드입력 감지)
  	    if($("#remember").is(":checked")){ 
  	        var userInputId = $("#id").val(); 
  	        setCookie("userId", userInputId, 7); 
  	    }
  	});

  	$('#password').keyup(function(){//비밀번호도 똑같이 
  		if($('#remember').is(":checked")){
  			var userInputPwd = $('#password').val();
  			setCookie("userPwd", userInputPwd, 7)
  		}
  	})

  });

  //쿠키 저장하는 함수   저장할 이름, 저장할 값, 만료일
  function setCookie(cookieName, value, exdays){
  	
  	//현재 날짜와 시간으로 객체를 생성해주는 Date
  	var exdate = new Date();
  	exdate.setDate(exdate.getDate() + exdays);// 오늘 날짜에 보관할 날짜 더함 
  	
  	//escape(value) : 자바스크립트에서 인코딩을 담당하는 함수 모두 유니코드 형식으로 변환한ㄷ. 	//문자열로 날짜를 변환하는 메소드
  	var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
  					//저장할 값 + 보관일이 NULL이면 빈값, 아니면 ;expires=로 저장할 날짜 저장
  	document.cookie = cookieName + "=" + cookieValue;
  	console.log(document.cookie.toString());
  }

  //쿠키 삭제하는 함수
  function deleteCookie(cookieName){
  	var expireDate = new Date();
  	
  	//만료일을 어제날짜로 설정
  	expireDate.setDate(expireDate.getDate() - 1);
  	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();//쿠키값을 빈값으로도 설정
  }

  //쿠키를 가져오는 함수
  function getCookie(cookieName) {
  	
  	cookieName = cookieName + '=';
  					//브라우저에 저장된 쿠키를 보여줌  name=value 쌍으로 구성되있고 각각 ;로 구분됨
  	var cookieData = document.cookie;// 쿠키를 다 가져와서 cookiesData에 담아줌
  	console.log(cookieData)
  	var start = cookieData.indexOf(cookieName);//가져올 쿠키 이름의 인덱스번호를 가져오고 
  	var cookieValue = '';
  	if(start != -1){// 쿠키가 존재해서 인덱스번호가 -1이 아닐경우 
  	    start += cookieName.length; //시작인덱스 + 쿠키 이릅 길이 
  	    var end = cookieData.indexOf(';', start);//쿠키이름이 끝나는 시점에서부터 ;의 인덱스 번호를 찾는다. 
  	    if(end == -1)end = cookieData.length; //만약 ;가 없어서 -1이 반환됐다면 가져온 cookieData의 길이를 end로 설정
  	    cookieValue = cookieData.substring(start, end);//시작인덱스와 끝 인덱스까지 문자를 잘라서 키가 아니라 값만 가져옴
  	}
  	
  	return unescape(cookieValue);//이스케이핑된 문자열을 다시 돌려줌. 
  }
  </script>-->

  <!-- Page Specific JS File -->
</body>
</html>
