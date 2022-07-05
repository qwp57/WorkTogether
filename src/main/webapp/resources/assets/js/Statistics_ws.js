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
    success : function(result){
        let map = JSON.parse(result);
        console.log(map.list1);
        console.log(map.list2);
        setBestEmpList(map.list2, 'month');
        setDeptworkList(map.list1, 'month');

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
    success : function(result){
        let map = JSON.parse(result);
        console.log(map.list1);
        console.log(map.list2);
        setBestEmpList(map.list2, 'year');
        setDeptworkList(map.list1, 'year');
    }

})

})

function setBestEmpList(list, type){
    let text;

    list.forEach(l => {
        text += "<tr><th>"+l.dept_name+"</th><th>"+l.name+" "+l.job_name+"님 </th></tr>";
    });

    console.log(text);

    if(type == 'month'){
        $('#monthBestEmp').empty();
        $('#monthBestEmp').append(text);
    }else if(type == 'year'){
        $('#yearBestEmp').empty();
        $('#yearBestEmp').append(text);
    }



}

function setDeptworkList(list, type){
    let text;

    list.forEach(l => {
        text += "<tr><th>"+l.DEPT_NAME+"</th><th>"+l.SUM+" 시간 </th><th>"+l.AVG+" 시간 </th></tr>";
    });

    if(type == 'month'){
        $('#monthDept').empty();
        $('#monthDept').append(text);
    }else if(type == 'year'){
        $('#yearDept').empty();
        $('#yearDept').append(text);
    }

}

