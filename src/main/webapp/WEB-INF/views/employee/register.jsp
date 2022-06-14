<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta
   content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
   name="viewport">
<title>Register &mdash; Stisla</title>

<!-- General CSS Files -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
  <link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
   integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
   crossorigin="anonymous">

<!-- CSS Libraries
<link rel="stylesheet"
   href="../node_modules/bootstrap-social/bootstrap-social.css"> -->

<!-- Template CSS -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/components.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<script type="text/javascript">
$(function(){
   let errorMsg = "${errorMsg}";
   if(errorMsg != ""){
      alert(errorMsg);
      
   }
})
</script>
   <div id="app">
      <section class="section">
         <div class="container mt-5">
            <div class="row">
            <div class="col-lg-1">
            </div>
               <div
                  class="col-lg-10">
                  <div class="login-brand">
                     <img src="resources/assets/img/logo.png" alt="logo" width="200">
                  </div>

                  <div class="card">
                     <div class="card-header">
                        <h4>Register</h4>
                     </div>
                     <hr>
                     <div class="card-body">

                        <form method="POST" action="/enrollEmp.do" class="needs-validation"
                           id="enrollForm" novalidate="">
                           <div class="form-group">
                              <label for="name">이름</label> <input id="name" type="text"
                                 class="form-control" name="name" tabindex="1" required
                                 autofocus placeholder="이름을 입력해주세요">
                              <div class="invalid-feedback">이름을 입력하세요</div>
                           </div>
                           <div class="form-group">
                              <label for="userId">아이디</label>
                              <!--<div id="checkResult" style="display:none; font-size:0.8em"></div>-->
                              <input id="userId" type="text" class="form-control" name="id"
                                 tabindex="2" required autofocus placeholder="id를 입력해주세요">
                              <div class="invalid-feedback">아이디는 영어 대/소문자와 숫자만 가능합니다</div>
                           </div>
                           <div class="form-group">
                              <div class="d-block">
                                 <label for="password" class="control-label">비밀번호</label>
                              </div>

                              <input id="password" type="password" class="form-control"
                                 name="password" tabindex="3" required
                                 placeholder="비밀번호를 입력해주세요">
                              <div class="invalid-feedback">비밀번호를 입력해주세요</div>
                           </div>
                           <div class="form-group">
                              <label for="password2" class="d-block">비밀번호 확인</label> <input
                                 id="password2" type="password" class="form-control"
                                 name="password-confirm" placeholder="비밀번호를  입력해주세요"
                                 tabindex="4" required>
                              <div class="invalid-feedback">비밀번호를 다시 확인해주세요</div>
                           </div>

                           <div class="form-group">
                              <label for="email">이메일</label> <input id="email" type="email"
                                 class="form-control" name="email" placeholder="이메일을 입력해주세요"
                                 tabindex="5">
                              <div class="invalid-feedback">이메일을 입력해주세요</div>
                           </div>
                           <div class="form-group">
                              <label for="phone">핸드폰 번호</label> <input id="phone"
                                 type="text" class="form-control" name="phone"
                                 placeholder="핸드폰 번호를 입력해주세요" tabindex="6">
                              <div class="invalid-feedback">핸드폰 번호를 입력해주세요</div>
                           </div>
                           <div class="form-group">
                              <label for="birth">생년월일</label> <input id="birth"
                                 type="date" class="form-control" name="birth"
                                 tabindex="7">
                              <div class="invalid-feedback">생년월일을 입력해주세요</div>
                           </div>
                              <div class="form-group">
                              <label for="join_date">입사일</label> <input id="join_date"
                                 type="date" class="form-control" name="join_date"
                                 tabindex="8">
                              <div class="invalid-feedback">입사일을 입력해주세요</div>
                           </div>
                           <div class="form-group">
                              <button type="button" id="enrollBtn" class="btn btn-primary btn-lg btn-block"
                                 tabindex="9" onclick="validation();" disabled>가입 신청</button>
                           </div>

                        </form>

                     </div>
                  </div>

               </div>
               <div class="col-lg-1">
            </div>
            </div>
         </div>
      </section>
   </div>

   <!-- General JS Scripts -->
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"
      integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
      crossorigin="anonymous"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
   <script src="resources/assets/js/stisla.js"></script>

   <!-- JS Libraies -->

   <!-- Template JS File-->
   <!--  <script src="resources/assets/js/scripts.js"></script>--><!-- 부트스트랩 툴에서 유효성 검사하는 거 -->
   <script src="resources/assets/js/custom.js"></script> 

   <!-- Page Specific JS File -->
   
     <script src="resources/assets/js/register.js"></script>
 <!--  <script type="text/javascript">

	$('#userId').keyup(function(){
	
		if(!(/^[a-zA-Z0-9]*$/.test($("#userId").val()))){

				$('#userId').next('.invalid-feedback').text('아이디는 영어 대/소문자와 숫자만 가능합니다');
				$('#userId').next('.invalid-feedback').css({"display": "block", "color":"red"});
				$('#userId').css({'border': '1px solid red'});
				
		console.log($('#userId').val().length);
		}else if ($('#userId').val().length < 6 || $('#userId').val().length > 20 ) {
			console.log($('#userId').val().length)
			$('#userId').next('.invalid-feedback').text('아이디는 6자 이상 20자 이하만 가능합니다');
			$('#userId').next('.invalid-feedback').css({"display": "block", "color":"red"});
			$('#userId').css({'border': '1px solid red'});
			
				
				
		}else{
				$('#userId').next('.invalid-feedback').css("display", "none");
				$('#userId').css({'border': '1px solid #e4e6fc'});
					
			$.ajax({
				url:"idCheck.do",
				data : { userId : $('#userId').val()},
				type : "post",
				success : function(result){
					console.log(result)
					
					if(result == '0'){
						idCheckValidate(2);
						
					}else{
						idCheckValidate(1);
						$('#userId').css({'border': '1px solid red'});
						$('#userId').focus();
					}
					
					
				},
				error : function(){console.log("ajax 통신실패")}
			})
			}
	
	
	
	})


function idCheckValidate(num){ 
		
	if(num == 1){ // 중복된 아이디가 존재할 경우 
		$('#userId').next('.invalid-feedback').text("중복된 아이디가 존재합니다. 사용이 불가능합니다.");
		$('#userId').next('.invalid-feedback').css({"display": "block", "color":"red"});
		$("#enrollBtn").attr("disabled", true);
		
	}else if(num == 2){ // 중복된 아이디가 존재하지 않을 경우 ->사용 가능
		$('#userId').next('.invalid-feedback').text("사용 가능한 아이디입니다.");
		$('#userId').next('.invalid-feedback').css({"display": "block", "color":"green"});
		$("#enrollBtn").removeAttr("disabled");
		
	}
	
}





function validation() {//부트스트랩툴에 포함된 유효성 검사에는 그 머냐 빈칸인지 아닌지만 검사해줘서 주석처리하고 새로 만듬

	var confirm = true;

			if($('#name').val().trim()==""){
				$('#name').next('.invalid-feedback').css("display", "block");
				$('#name').css({'border': '1px solid red'});
				confirm = false;
				
			}else{
				$('#name').next('.invalid-feedback').css("display", "none");
				$('#name').css({'border': '1px solid #e4e6fc'});
				
			}//이름이 빈값인지 아닌지
			
		
					
			if($('#password').val().trim()==""){
				$('#password').next('.invalid-feedback').css("display", "block");
				$('#password').css({'border': '1px solid red'});
				confirm = false;
				
			}else{
				$('#password').next('.invalid-feedback').css("display", "none");
				$('#password').css({'border': '1px solid #e4e6fc'});
				
			}//비밀번호가 빈값인지 아닌지 		
			
			if($('#password2').val().trim()=="" ||$('#password').val() != $('#password2').val()){
				$('#password2').next('.invalid-feedback').css("display", "block");
				$('#password2').css({'border': '1px solid red'});
				confirm = false;
				
			}else{
				$('#password2').next('.invalid-feedback').css("display", "none");
				$('#password2').css({'border': '1px solid #e4e6fc'});
				
			}//비밀번호 확인이 빈값이거나 비밀번호랑 같지 않은지 확인
			
			if($('#email').val().trim()==""){
				$('#email').next('.invalid-feedback').css("display", "block");
				$('#email').css({'border': '1px solid red'});
				confirm = false;
				
			}else{
				$('#email').next('.invalid-feedback').css("display", "none");
				$('#email').css({'border': '1px solid #e4e6fc'});
				
			}
			
			if($('#phone').val().trim()==""){
				$('#phone').next('.invalid-feedback').css("display", "block");
				$('#phone').css({'border': '1px solid red'});
				confirm = false;
				
			}else{
				$('#phone').next('.invalid-feedback').css("display", "none");
				$('#phone').css({'border': '1px solid #e4e6fc'});
				
			}
			
			if($('#birth').val()==null){
				$('#birth').next('.invalid-feedback').css("display", "block");
				$('#birth').css({'border': '1px solid red'});
				confirm = false;
				
			}else{
				$('#birth').next('.invalid-feedback').css("display", "none");
				$('#birth').css({'border': '1px solid #e4e6fc'});
				
			}
			
			if($('#join_date').val()==null){
				$('#join_date').next('.invalid-feedback').css("display", "block");
				$('#join_date').css({'border': '1px solid red'});
				confirm = false;
				
			}else{
				$('#join_date').next('.invalid-feedback').css("display", "none");
				$('#join_date').css({'border': '1px solid #e4e6fc'});
				
			}
			
			
			if(confirm){
				$('#enrollForm').submit();
			}
			
		}
		
		
	
   </script>-->
   
</body>

</html>