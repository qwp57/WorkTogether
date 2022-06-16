let weekArray = new Array();//option text를 저장할 array
let weekvalue = new Array();//option value를 저장할 array
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
    let first = new Date(date.getFullYear()+'/'+(date.getMonth()+1)+'/01');
    let last = new Date(date.getFullYear(), (date.getMonth()+1), 0);
    let lastWeek = getWeekOfMonth(last);//마지막주차

   
    let optionValue= first.getFullYear()+"."+(first.getMonth()+1)+"."+first.getDate();
    let optionText = first.getFullYear()+"년 "+(first.getMonth()+1)+"월 "+first.getDate()+"일 ~ "
                    +first.getFullYear()+"년 "+(first.getMonth()+1)+"월 " + (first.getDate()+(6-first.getDay()))+"일";

    first.setDate(first.getDate()+(6-first.getDay()));


    for(let i = 0; i<lastWeek; i++){
        
        weekArray[i] = optionText;
        weekvalue[i] = optionValue;

        first.setDate(first.getDate()+1);//다음주 일요일 날짜
        optionValue = first.getFullYear()+"."+(first.getMonth()+1)+"."+first.getDate();
        optionText = first.getFullYear()+"년 "+(first.getMonth()+1)+"월 "+first.getDate()+"일 ~ "
                    +first.getFullYear()+"년 "+(first.getMonth()+1)+"월 ";
        first.setDate(first.getDate()+6);//토요일 날짜 

        if(i == lastWeek-2){//만약 마지막 주차면//이미 위에서 array에 data가 들어갔기 때문에 lastweek-2 의 data는 들어가지 않는다. 
            optionText += last.getDate()+"일";
        }else{
            optionText += first.getDate()+"일";
        }
    }

    setWeekList(weekArray, weekvalue);
}

function setWeekList(weekArray, weekvalue){//option 리스트를 배치 
    $('#selectweek').empty();

    for(let i = 0; i<weekArray.length; i++){
        console.log("weekArray["+i+"] : "+weekArray[i]);

        let option = "<option value="+weekvalue[i]+">"+weekArray[i]+"</option>";
        
        $('#selectweek').append(option);
    }

}


$('#selectweek').on("change", function(){//주차를 선택하면 타임라인 테이블을 배치 
    console.log($(this).children('option:selected').text());
    let midx = $(this).children('option:selected').text().indexOf('월');
    let didx = $(this).children('option:selected').text().indexOf('일');
    let month = Number($(this).children('option:selected').text().substring(6,midx));//월만 잘라내고 
    let date = Number($(this).children('option:selected').text().substring(9, didx));//일만 잘라낸다. 

    $('#timelineTableData').empty();

   for(let i = 0; i< 7; i++){
    timelineTable = "<tr><td class='DT'>"+month+"."+(date+i)+"<td></td><td></td><td></td><td></td><td></td>"+
                    "<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>"+
                    "</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td class='DT'></td></tr>" ;

    $('#timelineTableData').append(timelineTable);

    workController();

   }

})

$('#beforeWeek').click(function() {
  thisMonth.setMonth(thisMonth.getMonth()-(1));
  console.log(thisMonth);

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
    let startday = $(this).children('option:selected').text()

    $.ajax({
        type: 'POST',
        url: 'workState.do',
        data: {"startday":startday},
        dataType: 'JSON',
        contentType : "application/json; charset=UTF-8",
        success: function(sectionDate)
        {
            console.log(sectionDate);
        },
        error: function(sectionDate)
        {
            console.log("data : " + sectionDate);
        }

    })

}