$('#res_file').click(function(){
    $('#uploadfile').click();
})

$("#uploadfile").on('change', function(){  // 값이 변경되면
if(window.FileReader){  // modern browser
    var filename = $(this)[0].files[0].name;
} else {  // old IE
        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
}

    // 추출한 파일명 삽입
$("#resFile").val(filename);
});




/*$(".rs").children('tr').click(function(){
	let rw_no = $(this).children('td:nth-child(1)').text();
	console.log(rw_no);

	selectDetail(rw_no,'rs')

	$('#rwDetail_1').modal("show");

})*/

$(document).on("click",'.rs tr',function(){
	let rw_no = $(this).children('td:nth-child(1)').text();
	console.log(rw_no);

	selectDetail(rw_no,'rs')

	$('#rwDetail_1').modal("show");

})


$(document).on("click",'.rq tr',function(){
	let rw_no = $(this).children('td:nth-child(1)').text();
	console.log(rw_no);

	selectDetail(rw_no,'rq')
	$('#rwDetail_2').modal("show");

})

/*$(".rq").children('tr').on('click', function(){
	let rw_no = $(this).children('td:nth-child(1)').text();
	console.log(rw_no);

	selectDetail(rw_no,'rq')
	$('#rwDetail_2').modal("show");

})*/
	

function selectDetail(rw_no, tag){

	$.ajax({
		url : "selectRWDetail.do",
		data :{rw_no : rw_no},
		type : "get",
		success : function(result){
			let obj = JSON.parse(result);
			console.log(obj);
			
			if(tag == 'rs'){
				rsDetailView(obj);
			}else if(tag == 'rq'){
				rqDetailView(obj);
			}

		},
		error :function(err){
			console.log('ajax 연결 실패');
			console.log(err);
		}

	})

}

function rsDetailView(obj){

	$('#rwDetail_1 .td').eq(0).text(obj.title);
	if(obj.pj_no == null){
		$('#rwDetail_1 .td').eq(1).text("관련 프로젝트가 없습니다");
	}else{
		$('#rwDetail_1 .td').eq(1).text(obj.pj_no);
	}
	
	$('#rwDetail_1 .td').eq(2).text(obj.req_member+"님");
	if(obj.term == null){
		$('#rwDetail_1 .td').eq(3).text("정해진 기한이 없습니다.");
	}else{
		$('#rwDetail_1 .td').eq(3).text(obj.term);
	}

	let important;
	switch(obj.important){
		case '1': important = "<button class='btn btn-danger rwD_1btns'>높음</button>"; break;
		case '2': important = "<button class='btn btn-info rwD_1btns'>보통</button>"; break;
		case '3': important = "<button class='btn btn-secondary rwD_1btns'>낮음</button>"; break;
	}
	$('#rwDetail_1 .td').eq(4).html(important);

	if(obj.req_file == null){
		$('#rwDetail_1 .td').eq(5).text("첨부된 파일이 없습니다.");
	}else{
		$('#rwDetail_1 .td').eq(5).html("<a href='/resources/upload_files/"+obj.req_file_change+"'download type='text/example')>"+obj.req_file_origin+"</a>");
	}

	$('#rwDetail_1 .td').eq(6).text(obj.content)

	$('input[name=status_message]').val(obj.status_message);
	$('#stSelect').val(obj.status).prop("selected", true);
	

	if(res_file != null){
		$('#resFile').val(obj.res_file_origin);
	}

	$('.rs_rwno').val(obj.rw_no);
	$('input[name=res_file]').val(obj.res_file);

	$('#modalFooter1').empty();
	if(obj.status != 'RF' && obj.status != 'CC'){
		$('#modalFooter1').append("<button type='submit' class='btn btn-secondary btns' onclick='return reject();'>거절</button>");
		$('#modalFooter1').append("<button type='button' class='btn btn-primary btns' data-dismiss='modal'>확인</button>");
		$('.rsupdate input').attr("disabled", false);
		$('.rsupdate select').attr("disabled", false);
	}else{
		$('#modalFooter1').append("<button type='button' class='btn btn-primary btns' data-dismiss='modal'>확인</button>");
		$('.rsupdate input').attr("disabled", true);
		$('.rsupdate select').attr("disabled", true);
	}



}


function rqDetailView(obj){
	$('#rwDetail_2 .td').eq(0).text(obj.title);
	if(obj.pj_no == null){
		$('#rwDetail_2 .td').eq(1).text("관련 프로젝트가 없습니다");
	}else{
		$('#rwDetail_2 .td').eq(1).text(obj.pj_no);
	}

	let arr = obj.res_member.split(" ");
	$('#rwDetail_2 .td').eq(2).text(arr[0]);
	$('#rwDetail_2 .td').eq(3).text(arr[1]+" "+arr[2]+"님");

	let status;
	switch(obj.status){
		case 'RQ': status = "<button class='btn btn-secondary rwD_1btns'>진 행 전</button>"; break;
		case 'P': status = "<button class='btn btn-primary rwD_1btns'>진 행 중</button>"; break;
		case 'S': status = "<button class='btn btn-success rwD_1btns'>보 류 중</button>"; break;
		case 'RQ': status = "<button class='btn btn-warning rwD_1btns'>거 절 됨</button>"; break;
		case 'CC': status = "<button class='btn btn-danger rwD_1btns'>취 소 됨</button>"; break;
	}
	$('#rwDetail_2 .td').eq(4).html(status);
	$('#rwDetail_2 .td').eq(5).text(obj.term);

	let important;
	switch(obj.important){
		case '1': important = "<button class='btn btn-danger rwD_1btns'>높음</button>"; break;
		case '2': important = "<button class='btn btn-info rwD_1btns'>보통</button>"; break;
		case '3': important = "<button class='btn btn-secondary rwD_1btns'>낮음</button>"; break;
	}
	$('#rwDetail_2 .td').eq(6).html(important);


	if(obj.req_file == null){
		$('#rwDetail_2 .td').eq(7).text("첨부된 파일이 없습니다.");
	}else{
		$('#rwDetail_2 .td').eq(7).html("<a href='/resources/upload_files/"+obj.req_file_change+"'download type='text/example')>"+obj.req_file_origin+"</a>");
	}

	$('#rwDetail_2 .td').eq(8).text(obj.content);
	$('#rwDetail_2 .td').eq(9).text(obj.status_message);
	if(obj.res_file == null){
		$('#rwDetail_2 .td').eq(10).text("첨부된 파일이 없습니다.");
	}else{
		$('#rwDetail_2 .td').eq(10).html("<a href='/resources/upload_files/"+obj.res_file_change+"'download type='text/example')>"+obj.res_file_origin+"</a>");
	}

	$('#modalFooter2').empty();
	if(obj.status == 'RQ'){
		$('#modalFooter2').append("<button type='button'  id='canclebtn' class='btn btn-secondary btns'>요청 취소</button>");
		
	}else{
		$('#modalFooter2').append("<button type='button' class='btn btn-secondary btns' data-dismiss='modal'>닫기</button>");
	}


	$('#rq_rwno').val(obj.rw_no);

}

$(document).on("click",'#canclebtn',function(){
	
	if(confirm("요청을 취소하시겠습니까?")){
		$('#cancle').submit();
	};

})

function reject(){
	return confirm("요청을 거절하시겠습니까?");
}

function updateRWState(){
	return confirm("작성한 내용대로 업무 요청 상태를 변경하시겠습니까?");
}


