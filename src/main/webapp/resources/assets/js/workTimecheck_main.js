$(function(){
	let today = new Date();

	let week = new Array('일', '월', '화', '수', '목','금', '토');
	let dayfm = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일 ("+week[today.getDay()]+")";
	$('#current_Date').text(dayfm);
	
	getClock();
	
		var a = "${w.in_time}";
		var b = "${w.emp_no}";
		var c = "${w}"
	
		console.log(a);
		console.log(b);
		console.log(c);
		
		
	
	
	
})

function getClock() {
	let today = new Date();
	const hours = String(today.getHours()).padStart(2, "0");
    const min = String(today.getMinutes()).padStart(2, "0");
    const sec = String(today.getSeconds()).padStart(2, "0");
	let curTime = hours+":"+min+":"+sec;
	$('#current_Time').text(curTime);
}

setInterval(getClock, 1000);


$('#startTime').click(function(){

    empno = $('#empno').val();
    if($('#status_Change').text().trim() == ""){

        $.ajax({
            url:"insertInTime.do", 
            data : {emp_no : empno },
            type : "post",
            success : function(result){
                console.log("result"+result);
                if(result == 2){
                    
                    let in_time = new Date();
                    var in_time_Hour = String(in_time.getHours()).padStart(2,"0");
                    var in_time_min = String(in_time.getMinutes()).padStart(2,"0");
                    var in_time_sec = String(in_time.getSeconds()).padStart(2, "0");
    
                    let in_time_text = in_time_Hour+":"+in_time_min+":"+in_time_sec;
                    console.log(in_time_text);
                    $('#startTime_area').text(in_time_text);
    
                    $('#status_Change').text("근무중");
                    
                   
                    let name = $('.user-name').children().text();
                    alert(name+'님이 출근했습니다.');
                }
            }, 
            error : function(){console.log("ajax 통신실패")}
        })
    }else{
        let name = $('.user-name').children().text(); 
        alert(name+"님은 이미 출근을 했습니다. ");

    }
    

})

$('#endTime').click(function(){
    empno = $('#empno').val();

    if($('#status_Change').text() != "" || $('#status_Change').text() != "퇴 근"){
        $.ajax({
            url :"updateOutTime.do",
            data : {emp_no : empno},
            type : "post",
            success : function(result){
                console.log("result"+result);
    
                if(result == 2){
                    let in_time = new Date();
                    var in_time_Hour = String(in_time.getHours()).padStart(2,"0");
                    var in_time_min = String(in_time.getMinutes()).padStart(2,"0");
                    var in_time_sec = String(in_time.getSeconds()).padStart(2, "0");
    
                    let in_time_text = in_time_Hour+":"+in_time_min+":"+in_time_sec;
                    console.log(in_time_text);
                    $('#endTime_area').text(in_time_text);
    
                    $('#status_Change').text("퇴 근");
    
                    let name = $('.user-name').children().text();
                    alert(name+'님이 퇴근했습니다.');
                }
    
            }, 
            error : function(){console.log("ajax 통신실패")}
    
        })

    }else{
        let name = $('.user-name').children().text();
                  
        alert(name+"님은 아직 퇴근할 수 없습니다.");
    }


})