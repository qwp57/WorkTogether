$('.cmenu').click(function(){
    let t = $(this).text();
    console.log(t);
    let tresult;
    switch(t){
        case '전체' : tresult = '';break;
        case '요청된 업무' : tresult = 'RS'; break;
        case '요청한 업무' : tresult = 'RQ'; break; 
    }
    console.log(tresult);
    $('#typeid').val(tresult);
    $('#selectsort_2 option').eq(0).prop('selected', true);
    $('#searchText').val("");
    $('#crnPage').val("");

    $('#completeForm').submit();
})

$('#selectsort_2').change(function(){
    console.log("Elfhfld");
    $('#searchText').val("");
    $('#crnPage').val("");
    $('#completeForm').submit();

})

$('#searchbtn').click(function(){

 $('#crnPage').val("");
 $('#completeForm').submit();
})

function beforafterRQPage(num){
let crn = $('#crnPage').val();
crn += num;
$('#crnPage').val(crn);

$('#completeForm').submit();
}

function changeRQPage(num){

    $('#crnPage').val(num);
    $('#completeForm').submit();
}

function deleteComplete(num){
    
    console.log(num+"번째 글 삭제");
	event.stopPropagation();
if(confirm("정말 삭제하시겠습니까? ")){

    $.ajax({
        url: "deleteAjax.do",
        data:{rw_no : num},
        type: "get",
        success : function(result){
            console.log(result)
            $('#completeForm').submit();
        },
        error : function(err){
            console.log(err);
        }
    })
}

}


$(".complete").children('tr').click(function(){
	let rw_no = $(this).children('td:nth-child(1)').text();
	console.log(rw_no);

	selectDetail(rw_no)

	$('#rwDetail_3').modal("show");

})

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
	$('#rwDetail_3 .td').eq(4).html("<button class='btn btn-secondary rwD_1btns'>완 료 됨</button>");
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
