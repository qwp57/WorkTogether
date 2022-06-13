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