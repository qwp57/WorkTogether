$(function(){
	let today = new Date();

	let week = new Array('일', '월', '화', '수', '목','금', '토');
	let dayfm = today.getFullYear()+"년 "+(today.getMonth()+1)+"월 "+today.getDate()+"일 ("+week[today.getDay()]+")";
	$('#current_Date').text(dayfm);
	
	getClock();


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
    let name = $('.user-name').children().text();
    empno = $('#empno').val();
    if($('#status_Change').text().trim() == "근무시작 전"){

        $.ajax({
            url:"/insertInTime.do", 
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
                    alert(name+'님이 출근했습니다.');
                }
            }, 
            error : function(){console.log("ajax 통신실패")}
        })
    }else if($('#status_Change').text().trim() == "퇴 근"){
        alert(name+"님은 이미 퇴근했습니다.");
    }else{
        let name = $('.user-name').children().text(); 
        alert(name+"님은 이미 출근을 했습니다. ");

    }
    

})

$('#endTime').click(function(){
    var empno = $('#empno').val();
    var statusText = $('#status_Change').text().trim();
    let name = $('.user-name').children().text();

    if(statusText == '근무시작 전'){
        alert(name+"님은 아직 출근 전입니다.");
    }else if(statusText == '퇴 근'){
        alert(name+"님은 이미 퇴근했습니다.");
    }else{
        $.ajax({
            url :"/updateOutTime.do",
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
                    alert(name+'님이 퇴근했습니다.');
                }
    
            }, 
            error : function(){console.log("ajax 통신실패")}
    
        })

    }


})

$('.sbtn').click(function(event){
    var empno = $('#empno').val();
    var statusbtn = $(this).text().trim();
    var status;
    switch(statusbtn){
        case '근 무':
            status = "W";
            break;
        case '외 근':
            status = "OW";
            break;
        case '회 의': 
            status = 'MT';
            break;
        case '외 출':
            status = 'OT';
            break;
    }

    console.log(status);
   var curStatus =  $('#status_Change').text().trim()
    if(curStatus == '근무시작 전'){
        alert("아직 출근 전입니다.");
    }else if(curStatus == '퇴 근'){
        alert("이미 퇴근했습니다.");
    }else{

        $.ajax({
            url :"/updateWorkStatus.do",
            data :{emp_no : empno,
                    status : status},
            type :"post",
            success :function(result){
                if(result == "success"){
                    let name = $('.user-name').children().text();
                    var text = "";
                    switch(statusbtn){
                        case '근 무':
                            text = "근무중";
                            break;
                        case '외 근':
                            text = "외근중";
                            break;
                        case '회 의': 
                             text = '회의중';
                            break;
                        case '외 출':
                            text = '외출중';
                            break;
                    }
                    alert(name+'님의 상태가 '+text+"으로 변경되었습니다");
                    $('#status_Change').text(text);
                    console.log("변경할 상태 : "+text);
                    console.log("현재 상태 "+$('#status_Change').text());
                }else{
                    alert(result);
                }
            },
            error :function(){
                console.log("ajax 통신실패")
            }
        })
        
    }




})