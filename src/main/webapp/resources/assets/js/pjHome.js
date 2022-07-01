function loadBoards() {
    let crnP = Number($('#crnpage').text());
    changePage(crnP)
}

function beforafterPage(num) {
    let crnP = Number($('#crnpage').text());
    console.log(crnP);
    crnP += Number(num);
    console.log(crnP);

    changePage(crnP);
}

function changePage(num) {
    let searchTarget = $('#selectsearch').val();
    let searchKeyword = $('#searchedKeyword').val();

    let type = $("#filter").val()

    sendajax(searchTarget, searchKeyword, type, num);
}



function setpi(pi) {
    var content = '<ul class="pagination Pi">'
    if (pi.currentPage != 1) {
        content += '<li class="page-item" ><a class="page-link" onclick="beforafterPage(-1)">이전</a></li>'
    } else {
        content += '<li class="page-item disabled"><a class="page-link" >이전</a></li>'
    }
    for (var i = pi.startPage; i <= pi.endPage; i++) {
        if (pi.currentPage != i) {
            content += '<li class="page-item" ><a class="page-link" onclick="changePage(' + i + ')">' + i + '</a></li>'
        } else {
            content += '<li class="page-item disabled"><a class="page-link" id="crnpage">' + i + '</a></li>'
        }
    }
    if (pi.currentPage != pi.maxPage) {
        content += '<li class="page-item"><a class="page-link" onclick="beforafterPage(1)">다음</a></li>'
    } else {
        content += '<li class="page-item disabled"><a class="page-link" >다음</a></li>'
    }
    content += '</ul>'
    $("#pagination").html(content)

}

function setList(list) {
    $(".boardTable").html('')
    $.each(list, function (i, obj) {
        if (obj.board_type == 'post') {
            $(".boardTable").append(
                '<tr>' +
                '<td style="width: 7%; text-align: right; color: #f3a435 ;">' +
                '<span class="bi bi-file-text"></span>' +
                '<input type="text" class="board_no" value="' + obj.board_no + '" style="display: none;">' +
                '<input type="text" class="board_type" value="' + obj.board_type + '" style="display: none;">' +
                '</td>' +
                '<td style="width: 8%; text-align: left;">글</td>' +
                '<th style="width: 40%;">' + obj.post_title + '</th>' +
                '<td style="width: 12%;">' + obj.name + '</td>' +
                '<td style="width: 22%;">' + obj.create_date + '</td>' +
                '<td>' +
                '</td>' +
                '</tr>'
            )
        } else if (obj.board_type == 'schedule') {
            $(".boardTable").append(
                '<tr>' +
                '<td style="width: 7%; text-align: right; color: #1cc88a">' +
                '<span class="bi bi-calendar"></span>' +
                '<input type="text" class="board_no" value="' + obj.board_no + '" style="display: none;">' +
                '<input type="text" class="board_type" value="' + obj.board_type + '" style="display: none;">' +
                '</td>' +
                '<td style="width: 8%; text-align: left;">일정</td>' +
                '<th style="width: 40%;">' + obj.sch_title + '</th>' +
                '<td style="width: 12%;">' + obj.name + '</td>' +
                '<td style="width: 22%;">' + obj.create_date + '</td>' +
                '<td><b>' + moment(obj.sch_start).format('MM/DD') + '</b></td>' +
                '</tr>'
            )
        } else if (obj.board_type == 'todo') {
            $(".boardTable").append(
                '<tr>' +
                '<td style="width: 7%; text-align: right; color: #4e73df;">' +
                '<span class="bi bi-check2-square"></span>' +
                '<input type="text" class="board_no" value="' + obj.board_no + '" style="display: none;">' +
                '<input type="text" class="board_type" value="' + obj.board_type + '" style="display: none;">' +
                '</td>' +
                '<td style="width: 8%; text-align: left;">할 일</td>' +
                '<th style="width: 40%;">' + obj.todo_title + '</th>' +
                '<td style="width: 12%;">' + obj.name + '</td>' +
                '<td style="width: 22%;">' + obj.create_date + '</td>' +
                '<td><span class="badge" style="background-color: #3591f3 ; height: 100%; font-size: 18px; color: white;">' + obj.todo_percent + '%</span></td>' +
                '</tr>'
            )
        }
    })
}

