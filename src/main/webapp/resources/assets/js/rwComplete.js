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

