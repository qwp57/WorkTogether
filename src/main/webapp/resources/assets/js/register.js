
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
		
		
	