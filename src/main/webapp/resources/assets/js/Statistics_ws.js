var today = new Date();

$(function(){
let month = today.getMonth()+1;

console.log(month);

for(let i = 1; i<= month; i++){
    $('#selectMonth').append("<option value = "+i+">"+i+"월 </option>");
}

$('#selectMonth option[value = "'+month+'"').prop('selected', true);

let year = today.getFullYear();
for(let i = 2020; i<=year; i++){
    $('#selectYear').append("<option value = "+i+">"+i+"년 </option>");
}

$('#selectYear option[value = "'+year+'"').prop('selected', true);

})


$('#selectMonth').change(function(){
let month = $('#selectMonth option:selected').val();
console.log(month);
$.ajax({
    url: "workstateStats_month.do",
    data : {month : month,
            type : 'month'},
    type :"post",
    success : function(){

    }

})

})

$('#selectYear').change(function(){
let year = $('#selectYear option:selected').val();
console.log(year);
$.ajax({
    url: "workstateStats_year.do",
    data : {year : year,
            type : 'year'},
    type :"post",
    success : function(){

    }

})

})
