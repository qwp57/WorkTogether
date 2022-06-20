
// 이번달 new Date 객체 말고 startday Date 객체 
let thisMonth;//이번달


$(function(){
    let sdayVal = $('#startdayId').val();
    thisMonth = new Date(sdayVal.substring(0,4)+"-"+sdayVal.substring(4,6)+"-"+sdayVal.substring(6));//이번달


    //var today = new Date();
    let week = getWeekOfMonth(thisMonth);//몇 주차인지 반환
    $('.workTotalTime > td').eq(0).text(week);
    //오늘날짜 + 해당 달의 첫번째 요일(3) / 7
    
   weekSelectList(thisMonth);//달의 주차별 select + 배치 

   //이거 startday value로 바꿔도 될듯
    let thisWeek = thisMonth.getFullYear()+"년 "+(thisMonth.getMonth()+1)+"월 "+(thisMonth.getDate()-thisMonth.getDay())+"일";//이번주 일요일

    for(let i = 0; i<5; i++){//option for문

        let wt =  $('#selectweek').children('option').eq(i).text();//option Text

        if(wt.includes(thisWeek)){//option Text가 이번주 일요일을 포함하고 있으면 
            $('#selectweek').children('option').eq(i).attr("selected", true);//선택
            selectWeekChanged();
            
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


$('#beforeWeek').click(function() {
  thisMonth.setMonth(thisMonth.getMonth()-(1));
 // console.log(thisMonth);

  weekSelectList(thisMonth);

  $('#selectweek').children('option').eq(0).attr("selected", true);
  $('#selectweek').change();
  
})

$('#afterWeek').click(function() {
    thisMonth.setMonth(thisMonth.getMonth()+(1));
    console.log(thisMonth);
  
    weekSelectList(thisMonth);
  
    $('#selectweek').children('option').eq(0).attr("selected", true);
    $('#selectweek').change();
})

$('#selectweek').on('change', function(){
    let start=$('#selectweek').children('option:selected').text();
    console.log(start);

    let year = start.substring(0,4);
    let month = start.substring(6, start.indexOf('월'));
    let date = start.substring(9, start.indexOf('일'));

    $('#startdayId').val(year+month.padStart(2,'0')+date.padStart(2, '0'));
    console.log($('#startdayId').val());
    $('#currantPageId').val("");

    
    $('#teamForm').submit();


})

function beforeAfterPage(num){

    let crt = Number($('#currantPageId').val()) + num;
    $('#currantPageId').val(crt)
    $('#teamForm').submit();
}


function changePage(num){
    $('#currantPageId').val(num);

    $('#teamForm').submit();
}


function selectWeekChanged(){//표 배치

    let start=$('#selectweek').children('option:selected').text();

    let year = Number(start.substring(0,4));
    let month = Number(start.substring(6, start.indexOf('월')));
    let date = Number(start.substring(9, start.indexOf('일')));

    let startDate = new Date(year+"-"+month+"-"+date);
    let week = ['일', '월', '화', '수', '목', '금', '토'];

    for(let i = 1; i<=7; i++){
        thText = (startDate.getMonth()+1)+"."+startDate.getDate()+"("+week[startDate.getDay()]+")"

        $('#thead th:eq('+(i+1)+')').text(thText);
        startDate.setDate(startDate.getDate()+1);

    }

    
}




