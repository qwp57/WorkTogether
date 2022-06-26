$('#selectsort_2').change(function(){
    let sortVal = $('#selectsort_2 option:selected').val();
    console.log(sortVal);
    

    changeRQList(sortVal, 1);

});
$('#selectsort_1').change(function(){
    let sortVal = $('#selectsort_1 option:selected').val();
    console.log(sortVal);
    

    changeRSList(sortVal, 1);

});

function beforafterRSPage(num){
    let crnP = Number($('#crnpageRS').text());
    console.log(crnP);
    crnP += Number(num);
    console.log(crnP);

    changeRQPage(crnP);
}

function changeRSPage(num){
    let sortVal = $('#selectsort_1 option:selected').val();

    changeRQList(sortVal,num);
}


function beforafterRQPage(num){
    let crnP = Number($('#crnpageRQ').text());
    console.log(crnP);
    crnP += Number(num);
    console.log(crnP);

    changeRQPage(crnP);
}

function changeRQPage(num){
    let sortVal = $('#selectsort_2 option:selected').val();

    changeRQList(sortVal,num);
}



function changeRQList(sortVal, currentPage){

    $.ajax({
        url : "selectRQList.do",
        data : {sortVal : sortVal,
                currentPage, currentPage},
        type : "get",
        success : function(result){
            let obj = JSON.parse(result);
            console.log(obj);
            console.log(obj.pi);
            console.log(obj.list);

            setList(obj.list, "rq");
            setpi(obj.pi, "rq");

        },
        error: function(err){
            console.log("ajax 연결 실패");
            console.log(err);
        }

    })

}


function changeRSList(sortVal, currentPage){

    $.ajax({
        url : "selectRSList.do",
        data : {sortVal : sortVal,
                currentPage, currentPage},
        type : "get",
        success : function(result){
            let obj = JSON.parse(result);
            console.log(obj);
            console.log(obj.pi);
            console.log(obj.list);

            setList(obj.list, "rs");
            setpi(obj.pi, "rs");

        },
        error: function(err){
            console.log("ajax 연결 실패");
            console.log(err);
        }

    })

}

    
function setList(list, tag){

let text;
if(tag == 'rq'){
    $('.rq').html("");
}else if(tag =='rs'){
    $('.rs').html("");
}

$.each(list, function(index, item){

   text ="<tr><td>"+item.rw_no+"</td>";
if(tag == 'rq'){
    text+="<td>"+item.res_member+"</td>";
}else if(tag == 'rs'){
    text+="<td>"+item.req_member+"</td>";
}

   
   
   if(item.important == '1'){
       text+="<td><button class='btn btn-sm btn-danger' style='width: 100px;'>중요</button></td>";
   }else if(item.important == '2'){
       text += "<td><button class='btn btn-sm btn-primary' style='width: 100px;'>보통</button></td>";
   }else if(item.important == '3'){
    text += "<td><button class='btn btn-sm btn-secondary' style='width: 100px;'>낮음</button></td>";
   }

   text += "<td>"+item.title+"</td>";

   switch(item.status){
    case 'RQ':
        text +="<td><div class='s-css' style='background-color: lightgray;'>진행전</div></td>";
        break;
    case 'P':
        text +="<td><div class='s-css' style='background-color: rgb(39, 82, 223); color: white;'>진행중</div></td>";
        break;
    case 'S':
        text +="<td><div class='s-css' style='background-color: rgb(94, 155, 94); color: white;'>보류중</div></td>"
        break;
    case 'CC':
        text +="<td><div class='s-css' style='background-color: rgb(187, 42, 42); color: white;'>취소됨</div></td>";
        break;
    case 'RF':
        text +="<td><div class='s-css' style='background-color: rgb(219, 124, 15); color: white;'>거절됨</div></td>";
        break;
   }

   console.log(item.term);
   if(!item.term){
    text +="<td>기한 없음</td>"
   }else{
    text +="<td>"+item.term+"</td>"
   }

   if(tag =='rq'){
       text += "<td><button class='btn btn-secondary' onclick='deleteRW("+item.rw_no+")'>삭제버튼</button></td></tr>";
       $('.rq').append(text);
   }else if(tag =='rs'){
    $('.rs').append(text);
   }

});



}

function setpi(pi, tag){
    let text;
    if(tag == 'rq'){
        $('.rqPi').html("");
    }else if(tag =='rs'){
        $('.rsPi').html("");
    }

    if(pi.currentPage != '1' && tag == 'rq'){
        text = "<li class='page-item' ><a class='page-link' onclick='beforafterRQPage(-1)'>Previous</a></li>";
    }else if(pi.currentPage != '1' && tag == 'rs'){
        text = "<li class='page-item' ><a class='page-link' onclick='beforafterRSPage(-1)'>Previous</a></li>";
    }else{
        text = "<li class='page-item disabled'><a class='page-link' >Previous</a></li>";
    }

    for(let i = Number(pi.startPage); i<=Number(pi.endPage); i++){
        if(i != Number(pi.currentPage) && tag == 'rq'){
            text +="<li class='page-item' ><a class='page-link' onclick='changeRQPage("+i+")'>"+i+"</a></li>";
        }else if(i != Number(pi.currentPage) && tag == 'rs'){
            text +="<li class='page-item' ><a class='page-link' onclick='changeRSPage("+i+")'>"+i+"</a></li>";
        }else if(i == Number(pi.currentPage) && tag == 'rq'){ 
            
            text += "<li class='page-item disabled'><a class='page-link' id='crnpageRQ'>"+i+"</a></li>";
        }else if(i == Number(pi.currentPage) && tag == 'rs'){
            text += "<li class='page-item disabled'><a class='page-link' id='crnpageRS'>"+i+"</a></li>";
        }
    }

    if(pi.currentPage != pi.maxPage && tag =='rq'){
        text += "<li class='page-item'><a class='page-link' onclick='beforafterRQPage(1)'>Next</a></li>";
    }else if(pi.currentPage != pi.maxPage && tag =='rs'){
        text += "<li class='page-item'><a class='page-link' onclick='beforafterRSPage(1)'>Next</a></li>";
    }else{
        text += "<li class='page-item disabled'><a class='page-link' >Next</a></li>";
    }

    if(tag =='rq'){
        $('.rqPi').html(text);
    }else if(tag =='rs'){
        $('.rsPi').html(text);
    }


}

function deleteRW(num){
    event.stopPropagation();
 if(confirm("삭제하시겠습니까?")){

     location.href = "/deleteRW.do?rw_no="+num;
 }

}


$('#all-rw').click(function(){
    location.href = "/allRequest.do"
})
$('#completed-rw').click(function(){
    location.href = "/completedRequest.do"
})