$('#selectyear').change(function() {
	let yearVal = $('#selectyear option:selected').val();
    $('#startyearId').val(yearVal);
    $('#currantPageId').val("");
    $('#searchText').val("");
    $('#selectsearch').val("");
    $('#teamForm').submit();
    //연도 바꿀땐 페이지 1, 검색키워드 없이 submit
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

function searchSubmit(){
    $('#searchText').val($('#searchArea').val());
    $('#currantPageId').val("");
    //검색버튼 누르면 curpage 리셋하고 연도와 검색 키워드 전송
    $('#teamForm').submit();
}

function changeStatus(status, vac_no, e){

    console.log("status : "+status+" vac_no : "+vac_no);

    $.ajax({
        url : "/workState/updateVacStatus.do",
        data : {status : status,
                vac_no : vac_no},
        type : "post",
        success : function(result){
             alert("휴가상태를 변경했습니다.");

             let pObj= $(e).parent().parent().parent().find('button');
            
             pObj.attr('class', '');

             if(status == 'A'){
                pObj.addClass("btn btn-primary btn-lg dropdown-toggle");
                pObj.text("승인 완료");
             }else if(status == 'RJ'){
                pObj.addClass("btn btn-danger btn-lg dropdown-toggle");
                pObj.text("승인 거부");
             }else{
                pObj.addClass("btn btn-secondary btn-lg dropdown-toggle");
                pObj.text("승인 대기");
             }

            
        },
        error : function(){console.log("ajax 통신실패")}

    })

}