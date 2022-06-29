
$('input:radio').change(function(){
console.log('input:radio change');
let searchTarget = $('#selectsearch').val();
let searchKeyword = $('#searchedKeyword').val();

let important = $('input[name = "important"]:checked').val();
let type = $('input[name = "type"]:checked').val();
let status = $('input[name = "status"]:checked').val();

let sort = $('#selectsort').val();
let currentPage = 1;
console.log(searchTarget);
console.log(searchKeyword);
console.log(important);
console.log(type);
console.log(status);
console.log(sort);


sendajax(searchTarget, searchKeyword, important, type, status, sort, currentPage );



})

function sendajax(searchTarget, searchKeyword, important, type, status, sort, currentPage ){
    console.log("sendajax");

    $.ajax({
        url : "searchOptionAllList.do",
        type : "post", 
        data : {searchTarget : searchTarget, 
                searchKeyword : searchKeyword,
                important : important,
                type : type ,
                status : status,
                sort : sort,
                currentPage : currentPage},
        success : function(result){
            console.log("데이터 가져옴");
            let data = JSON.parse(result);
            console.log(data);
             setList(data.list)
             setpi(data.pi);
        },
        error : function(err){
    
        }
    
    })

    console.log("sendajax 끝남");

}





function setList(list){

    console.log("list : "+list);
    $('.listarea').empty();
$.each(list, function(index, item){

    text ="<tr><td>"+item.rw_no+"</td>";

    text+="<td>"+item.req_member+"</td>";
    text+="<td>"+item.res_member+"</td>";



   
   
   if(item.important == '1'){
       text+="<td><button class='btn btn-sm btn-danger' style='width: 100px;'>중요</button></td>";
   }else if(item.important == '2'){
       text += "<td><button class='btn btn-sm btn-primary' style='width: 100px;'>보통</button></td>";
   }else if(item.important == '3'){
    text += "<td><button class='btn btn-sm btn-secondary' style='width: 100px;'>낮음</button></td>";
   }

   switch(item.status){
    case 'RQ':
        text +="<td><div class='s-css' style='background-color: lightgray;'>진행전</div></td>";
        break;
    case 'P':
        text +="<td><div class='s-css' style='background-color: rgb(39, 82, 223); color: white; '>진행중</div></td>";
        break;
    case 'S':
        text +="<td><div class='s-css' style='background-color: rgb(94, 155, 94); color: white;'>보류중</div></td>"
        break;
    case 'CC':
        text +="<td><div class='s-css' style='background-color: rgb(187, 42, 42); color: white; '>취소됨</div></td>";
        break;
    case 'RF':
        text +="<td><div class='s-css' style='background-color: rgb(219, 124, 15); color: white;'>거절됨</div></td>";
        break;
   }
   text += "<td>"+item.title+"</td>";

   console.log(item.term);
   if(!item.term){
    text +="<td>기한 없음</td>"
   }else{
    text +="<td>"+item.term+"</td>"
   }
   
    text +="<td>"+item.create_date+"</td>"
   

  
    text += "<td><button class='btn btn-secondary' onclick='deleteRW("+item.rw_no+")'>삭제</button></td></tr>";
    $('.listarea').append(text);
  

});

}

function setpi(pi){
    let text;
   
    $('.Pi').html("");
  

    if(pi.currentPage != '1'){
        text = "<li class='page-item' ><a class='page-link' onclick='beforafterPage(-1)'>Previous</a></li>";
    }else{
        text = "<li class='page-item disabled'><a class='page-link' >Previous</a></li>";
    }

    for(let i = Number(pi.startPage); i<=Number(pi.endPage); i++){
        if(i != Number(pi.currentPage)){
            text +="<li class='page-item' ><a class='page-link' onclick='changePage("+i+")'>"+i+"</a></li>";
        }else if(i == Number(pi.currentPage) ){ 
            text += "<li class='page-item disabled'><a class='page-link' id='crnpage'>"+i+"</a></li>";
        }
    }

    if(pi.currentPage != pi.maxPage){
        text += "<li class='page-item'><a class='page-link' onclick='beforafterPage(1)'>Next</a></li>";
    }else{
        text += "<li class='page-item disabled'><a class='page-link' >Next</a></li>";
    }

    
    $('.Pi').html(text);

}

$('#selectsort').change(function(){
    console.log("정렬 있음");
    let searchTarget = $('#selectsearch').val();
    let searchKeyword = $('#searchedKeyword').val();

    let important = $('input[name = "important"]:checked').val();
    let type = $('input[name = "type"]:checked').val();
    let status = $('input[name = "status"]:checked').val();

    let sort = $('#selectsort').val();
    let currentPage = 1;
    console.log(searchTarget);
    console.log(searchKeyword);
    console.log(important);
    console.log(type);
    console.log(status);
    console.log(sort);


sendajax(searchTarget, searchKeyword, important, type, status, sort, currentPage );

})

function beforafterPage(num){
    let crnP = Number($('#crnpage').text());
    console.log(crnP);
    crnP += Number(num);
    console.log(crnP);

    changePage(crnP);
}

function changePage(num){
    let searchTarget = $('#selectsearch').val();
    let searchKeyword = $('#searchedKeyword').val();

    let important = $('input[name = "important"]:checked').val();
    let type = $('input[name = "type"]:checked').val();
    let status = $('input[name = "status"]:checked').val();

    let sort = $('#selectsort').val();

    sendajax(searchTarget, searchKeyword, important, type, status, sort, num );
}


function deleteRW(num){
    
    console.log(num+"번 글 삭제");
    event.stopPropagation();
if(confirm("정말 삭제하시겠습니까? ")){

    $.ajax({
        url: "deleteAjax.do",
        data:{rw_no : num},
        type: "get",
        success : function(result){
            console.log(result)
            beforafterPage(0);
        },
        error : function(err){
            console.log(err);
        }
    })
}

}


$(document).on('click', '.listarea tr', function(){
    let rw_no = $(this).children('td:nth-child(1)').text();
	console.log(rw_no);

	selectDetail(rw_no)

	$('#rwDetail_3').modal("show");
})
/*$(".listarea").children('tr').click(function(){
	let rw_no = $(this).children('td:nth-child(1)').text();
	console.log(rw_no);

	selectDetail(rw_no)

	$('#rwDetail_3').modal("show");

})*/

function selectDetail(rw_no){

	$.ajax({
		url : "selectRWDetail.do",
		data :{rw_no : rw_no},
		type : "get",
		success : function(result){
			let obj = JSON.parse(result);
			console.log(obj);
			DetailView(obj);
			

		},
		error :function(err){
			console.log('ajax 연결 실패');
			console.log(err);
		}

	})

}


function DetailView(obj){
	$('#rwDetail_3 .td').eq(0).text(obj.title);
	if(obj.pj_no == null){
		$('#rwDetail_3 .td').eq(1).text("관련 프로젝트가 없습니다");
	}else{
		$('#rwDetail_3 .td').eq(1).text(obj.pj_no);
	}

	let arr = obj.res_member.split(" ");
	$('#rwDetail_3 .td').eq(2).text(arr[0]);
	$('#rwDetail_3 .td').eq(3).text(arr[1]+" "+arr[2]+"님");

	let status;
	switch(obj.status){
		case 'RQ': status = "<button class='btn btn-secondary rwD_1btns'>진 행 전</button>"; break;
		case 'P': status = "<button class='btn btn-primary rwD_1btns'>진 행 중</button>"; break;
		case 'S': status = "<button class='btn btn-success rwD_1btns'>보 류 중</button>"; break;
		case 'RQ': status = "<button class='btn btn-warning rwD_1btns'>거 절 됨</button>"; break;
		case 'CC': status = "<button class='btn btn-danger rwD_1btns'>취 소 됨</button>"; break;
	}
	$('#rwDetail_3 .td').eq(4).html(status);
	$('#rwDetail_3 .td').eq(5).text(obj.term);

	let important;
	switch(obj.important){
		case '1': important = "<button class='btn btn-danger rwD_1btns'>중요</button>"; break;
		case '2': important = "<button class='btn btn-info rwD_1btns'>보통</button>"; break;
		case '3': important = "<button class='btn btn-secondary rwD_1btns'>낮음</button>"; break;
	}
	$('#rwDetail_3 .td').eq(6).html(important);


	if(obj.req_file == null){
		$('#rwDetail_3 .td').eq(7).text("첨부된 파일이 없습니다.");
	}else{
		$('#rwDetail_3 .td').eq(7).html("<a href='/resources/upload_files/"+obj.req_file_change+"'download type='text/example')>"+obj.req_file_origin+"</a>");
	}

	$('#rwDetail_3 .td').eq(8).text(obj.content);
	$('#rwDetail_3 .td').eq(9).text(obj.status_message);
	if(obj.res_file == null){
		$('#rwDetail_3 .td').eq(10).text("첨부된 파일이 없습니다.");
	}else{
		$('#rwDetail_3 .td').eq(10).html("<a href='/resources/upload_files/"+obj.res_file_change+"'download type='text/example')>"+obj.res_file_origin+"</a>");
	}



}