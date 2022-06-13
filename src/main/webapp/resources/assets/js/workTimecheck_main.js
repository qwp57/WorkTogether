$('#startTime').click(function(){

    empno = $('#empno').val();
    console.log(empno);
    console.log('씨발');

    $.ajax({
        url:"insertInTime.do", 
        data : {emp_no : empno },
        type : "post",
        success : function(result){
            console.log(result);
            if(result == 'success'){
            	console.log('왜 시간이 안 나오지');
                let in_time = new Date();
                var in_time_Hour = String(in_time.getHours()).padStart(2,"0");
                var in_time_min = String(in_time.getMinutes()).padStart(2,"0");
                var in_time_sec = String(in_time.getSeconds()).padStart(2, "0");

                let in_time_text = in_time_Hour+":"+in_time_min+":"+in_time_sec;
                console.log(in_time_text);
     
                $('#startTime_area').text(in_time_text);
                console.log($('#startTime_area').text(in_time_text));

                let name = $('.user-name').children().text();
                alert(name+'님이 출근했습니다.');
                console.log(name+'님이 출근했습니다.');
            }
        }, 
        error : function(){console.log("ajax 통신실패")}
    })
    

});