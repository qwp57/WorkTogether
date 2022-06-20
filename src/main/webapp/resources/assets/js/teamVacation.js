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