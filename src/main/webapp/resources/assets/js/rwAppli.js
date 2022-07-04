$(function(){

$("#rw-application").click(function(){
    $('#rwApplicationModal').modal("show");
    $('#dept').change();
})

})

$('#rw_file').click(function(){
    $('#upload-file').click();
})

$("#upload-file").on('change', function(){  // 값이 변경되면
if(window.FileReader){  // modern browser
    var filename = $(this)[0].files[0].name;
} else {  // old IE
        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
}

    // 추출한 파일명 삽입
$("#file-label").val(filename);
});



$('#dept').on("change", function(){
let dept_code = $(this).val();

$.ajax({
    url:"/getDeptMember.do",
    data : {dept_code : dept_code},
    type : "post",
    success : function(obj){
        $('#res_memberId').empty();

       // console.log(typeof(obj));
    //console.log(obj.length);
    console.log(obj);

       $.each($.parseJSON(obj), function(i, e){
        text = "<option value ="+e.emp_no+">"+e.name+"</option>"
    
        $('#res_memberId').append(text);
       })


    }

})


})

$('.termRadio').click(function(){
    if($('input[name=termYN]:checked').val() == 'Y'){
        $('#termId').attr('disabled', false);
        $('#termId').attr('name', 'term');


    }else if($('input[name=termYN]:checked').val() == 'N'){
        $('#termId').attr('disabled', true);
        $('#termId').attr('name', '');
    }
})

