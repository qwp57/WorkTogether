
let thisMonth = new Date();//이번달


$(function(){
    //var today = new Date();
    let week = getWeekOfMonth(thisMonth);//몇 주차인지 반환
    $('.workTotalTime > td').eq(0).text(week);
    //오늘날짜 + 해당 달의 첫번째 요일(3) / 7
    
   weekSelectList(thisMonth);//달의 주차별 select + 배치 

    let thisWeek = thisMonth.getFullYear()+"년 "+(thisMonth.getMonth()+1)+"월 "+(thisMonth.getDate()-thisMonth.getDay())+"일";//이번주 일요일

    for(let i = 0; i<5; i++){//option for문

        let wt =  $('#selectweek').children('option').eq(i).text();//option Text

        if(wt.includes(thisWeek)){//option Text가 이번주 일요일을 포함하고 있으면 
            $('#selectweek').children('option').eq(i).attr("selected", true);//선택
            $('#selectweek').change();//선택하면 그 주에 해당하는 날짜를 timelinetable에 행 배치 
            
        }

    }


})



function getWeekOfMonth(date){//주차를 구하는 함수
    
    let selectedDayOfMonth = date.getDate();
    let first = new Date(date.getFullYear()+'/'+(date.getMonth()+1)+'/01');
    let monthFirstDateDay = first.getDay();
    return Math.ceil((selectedDayOfMonth + monthFirstDateDay)/7);
    
};

function weekSelectList(date){//달의 주차별 option을 구하는 메소드 
    let weekArray = new Array();//option text를 저장할 array
    let weekvalue = new Array();//option value를 저장할 array

    let first = new Date(date.getFullYear()+'/'+(date.getMonth()+1)+'/01');//1일
    let last = new Date(date.getFullYear(), (date.getMonth()+1), 0);//30일
    let lastWeek = getWeekOfMonth(last);//마지막주차

    first.setDate(first.getDate()-first.getDay());//첫째주 일요일
    //console.log("firstSunday : "+first.getDate());
   last.setDate(last.getDate()+(6-last.getDay()));//마지막주 토요일
    //console.log("lastSaturday : "+last.getDate());
   // console.log("마지막 주차 : "+lastWeek);

    let optionValue;
    let optionText;
    for(let i = 0; i<lastWeek; i++){

        optionValue= first.getFullYear()+""+String(first.getMonth()+1).padStart(2,'0')+""+String(first.getDate()).padStart(2, '0');
        optionText = first.getFullYear()+"년 "+(first.getMonth()+1)+"월 "+first.getDate()+"일 ~ ";
        first.setDate(first.getDate()+(6-first.getDay()));
        optionText += first.getFullYear()+"년 "+(first.getMonth()+1)+"월 "+first.getDate()+"일";
        weekArray[i] = optionText;
        weekvalue[i] = optionValue;
        first.setDate(first.getDate()+1);//다음주 일요일

    }

    setWeekList(weekArray, weekvalue);
}

function setWeekList(weekArray, weekvalue){//option 리스트를 배치 
    $('#selectweek').empty();

    for(let i = 0; i<weekArray.length; i++){
        // console.log("weekArray["+i+"] : "+weekArray[i]);
        // console.log("weekvalue["+i+"] : "+weekvalue[i]);


        let option = "<option value="+weekvalue[i]+">"+weekArray[i]+"</option>";
        
        $('#selectweek').append(option);
    }

}


$('#selectweek').on("change", function(){//주차를 선택하면 타임라인 테이블을 배치 
  //  console.log($(this).children('option:selected').text());
    let midx = $(this).children('option:selected').text().indexOf('월');
    let didx = $(this).children('option:selected').text().indexOf('일');
    let year = Number($(this).children('option:selected').text().substring(0,4));//년도만 잘라내고 
    let month = Number($(this).children('option:selected').text().substring(6,midx));//월만 잘라내고 
    let date = Number($(this).children('option:selected').text().substring(9, didx));//일만 잘라낸다.

    let tempDate = new Date(year+"-"+month+"-"+date);

    var idx = $("#selectweek option").index( $("#selectweek option:selected") );
    
    $('.workTotalTime td:nth-child(1)').text(idx+1);





    $('#timelineTableData').empty();

   for(let i = 0; i< 7; i++){
    timelineTable = "<tr><td class='DT'>"+(tempDate.getMonth()+1)+"."+tempDate.getDate()+"<td></td><td></td><td></td><td></td><td></td>"+
                    "<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>"+
                    "</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td class='DT'></td></tr>" ;
    tempDate.setDate(tempDate.getDate()+1);
    $('#timelineTableData').append(timelineTable);

    
}
let selectstart = year+String(month).padStart(2,'0')+String(date).padStart(2,'0');
workController(selectstart);

})

$('#beforeWeek').click(function() {
  thisMonth.setMonth(thisMonth.getMonth()-(1));
 // console.log(thisMonth);

  let week = getWeekOfMonth(thisMonth);
  $('.workTotalTime > td').eq(0).text(week);

  weekSelectList(thisMonth);
  let thisWeek = thisMonth.getFullYear()+"년 "+(thisMonth.getMonth()+1)+"월 "+(thisMonth.getDate()-thisMonth.getDay())+"일";

  $('#selectweek').children('option').eq(0).attr("selected", true);
  $('#selectweek').change();
  
})
$('#afterWeek').click(function() {
    thisMonth.setMonth(thisMonth.getMonth()+(1));
    console.log(thisMonth);

    let week = getWeekOfMonth(thisMonth);
    $('.workTotalTime > td').eq(0).text(week);
  
    weekSelectList(thisMonth);
    let thisWeek = thisMonth.getFullYear()+"년 "+(thisMonth.getMonth()+1)+"월 "+(thisMonth.getDate()-thisMonth.getDay())+"일";
  
    $('#selectweek').children('option').eq(0).attr("selected", true);
    $('#selectweek').change();

})


function workController(){
    let startday = $('#selectweek').children('option:selected').val();


    $.ajax({
        type: 'POST',
        url: '/workState/workStateSelectWeek.do',
        data: {"startday":startday},
       
        success: function(Date){
            let obj = JSON.parse(Date);

            let timesum = [];
            let workday = new Array();
            let startTime = new Array();
            let holiday = new Array();

            for(let i = 0; i<obj.workTime.length; i++){
                timesum[i]= obj.workTime[i].TIMESUM;
                let wd = obj.workTime[i].WORKDAY;
                let wdidx = wd.indexOf("/");
                workday[i] = wd.substring(0,wdidx);
                startTime[i] = Number(wd.substring(wdidx+1));
            }

            for(let i = 0; i<obj.weekHoliday.length; i++){
                let hday = obj.weekHoliday[i];
                holiday[i] =  String(hday.substring(4,6)).replace(/(^0+)/, "")+"."+String(hday.substring(6)).replace(/(^0+)/, "");
            }

            console.log("workday : "+workday);
            console.log("startTime : "+startTime);
            console.log("timesum : "+timesum);
            console.log("holiday : "+holiday);
            console.log("obj.resultMap : "+obj.resultMap);

            totalWork(obj.resultMap);
            timecolor(workday, startTime, timesum, holiday);
      
        },
        error: function(sectionDate)
        {
            console.log("data : " + sectionDate);
        }

    })

}


function timecolor(workday, startTime, timesum, holiday){

	for(let j = 0; j<workday.length; j++){
		let a = holiday[j]; 
		for(let i = 1; i<=7; i++){
		let day = $('#timelineTableData tr:nth-child('+i+') td:nth-child(1)').text();

            if(day == workday[j]){

                let hoN=holidayorNot(day, holiday);

                if(hoN){
                    console.log("휴일이다 : "+startTime[j])
                    green(i, startTime[j], timesum[j]);
                    
                }else{
                    console.log("평일이다")
                    red(i, startTime[j], timesum[j]);
                    
                }

            }
			
		}
	}
	
}

function holidayorNot(day, holiday){
    let hoN=false;

    for(let i = 0; i<holiday.length; i++){
        if(holiday[i] == day){
            hoN = true;
        }

    }

    return hoN;

}


function green(i, startTime, timesum) {
	
	for(let k = 1; k<=timesum; k++){
       
		 $('#timelineTableData tr:nth-child('+i+') td:nth-child('+(startTime+k)+')').addClass("workTimeinHoliday");
		 $('#timelineTableData tr:nth-child('+i+') td:last').text(timesum);
		}
	
	
}

function red(i, startTime, timesum) {
	for(let k = 1; k<=timesum; k++){
		 $('#timelineTableData tr:nth-child('+i+') td:nth-child('+(startTime+k)+')').addClass("workTime");
		 $('#timelineTableData tr:nth-child('+i+') td:last').text(timesum);
		}
	
	
}

function totalWork(resultMap){

    
        $('.workTotalTime td:nth-child(2)').text('0');
        $('.workTotalTime td:nth-child(3)').text('0');
        $('.workTotalTime td:nth-child(4)').text('0');
        $('.workTotalTime td:nth-child(6)').text('0');


        $('.workTotalTime td:nth-child(2)').text(resultMap.TOTALTIME);
    
        if(resultMap.LEFTTIME >= 0){
            $('.workTotalTime td:nth-child(3)').text(resultMap.LEFTTIME);
        }else{
            $('.workTotalTime td:nth-child(3)').text('0');
        }
    
        if(resultMap.OVERTIME >= 0){
            $('.workTotalTime td:nth-child(4)').text(resultMap.OVERTIME);
        }else{
            $('.workTotalTime td:nth-child(4)').text('0');
        }
    
        $('.workTotalTime td:nth-child(6)').text(resultMap.HOLIDAY);
        
  

}