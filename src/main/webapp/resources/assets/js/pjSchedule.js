$(document).on('click', '#schEditBtn', function () {
    if (checkStored()) {


        console.log($(this).parents(".boardBody").find("#schTitle").text())
        console.log($(this).parents(".boardBody").find("#schDate").html())
        console.log($(this))
        $("#postForm").css("display", "none")
        $("#postSch").css("display", "block")
        $("#postTodo").css("display", "none")
        $(".switchSch").css("color", "#6777ef")
        $(".switchTodo").css("color", "black")
        $(".switchPost").css("color", "black")

        $(".boardNoti").text('게시물 수정')
        $(".boardUploadBtn").text('수정')
        $("#boardPost").find("input[name=sch_title]").val($(this).parents(".boardBody").find("#schTitle").text())
        var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
        $.ajax({
            url: '/schedule/selectSchDate.do',
            data: {
                "board_no": board_no
            },
            async: false,
            success: function (data) {
                console.log(data)
                $("input[name=sch_start]").val(moment(data.sch_start).format('YYYY-MM-DD h:mm'))
                $("input[name=sch_end]").val(moment(data.sch_end).format('YYYY-MM-DD h:mm'))
                $("input[name=sch_place]").val(data.sch_place)
                $("textarea[name=sch_content]").val(data.sch_content)
                $("textarea[name=sch_content]").text(data.sch_content)
                // if (data.sch_attendee != undefined) {
                //     $("#addPeople").val(data.sch_attendee)
                // }
            }
        })
        $(".boardUploadForm").append(
            '<input type="hidden" name="board_no" value="' + board_no + '">'
        )
        $(".boardUploadForm").attr("id", "editSch");
        $(".boardUploadForm").attr("action", "/schedule/editSch.do");
        $("#boardPost").modal("show")
        $("#boardPost").css("z-index", "111111")
    }
})

$(document).on('click', '.switchSch', function () {
    $(".switchSch").css("color", "#6777ef")
    $(".switchTodo").css("color", "black")
    $(".switchPost").css("color", "black")
    $("#postForm").css("display", "none")
    $("#postSch").css("display", "block")
    $("#postTodo").css("display", "none")
    $(".boardUploadForm").attr("id", "enrollSch");
    $(".boardUploadForm").attr("action", "/schedule/insertSch.do");
})

$(document).on('click', '#SchAddEmpBtn', function () {
    if ($(this).parents("#mentionForModal").find(".inviteEmpNo:checked").length == 0) {
        alert("한명 이상 선택해주세요.")
        return false
    }
    console.log($(this).parents("#mentionForModal").find(".emp_name"))
    console.log($(this).parents("#mentionForModal").find(".inviteEmpNo"))
    $(this).parents("#mentionForModal").find(".inviteEmpNo:checked").each(function (e) {
        var content = $(this).parents("tr").find(".emp_name").text()
        $("#addPeople").parent().append('<span class="empName">' + content + '<span><input type="hidden" name="sch_attendee" ' +
            'value="' + $(this).val() + '">' +
            '<i class="bi bi-x fa-2x removeEmp" style="color: red; padding-right: 0px;"></i></span></span>')
    })
    if ($("input[name=sch_attendee]").length > 0) {
        $("#addPeople").css("display", "none")
    }
    $("#mentionForModal").modal("hide")
})

$(document).on('click', '#schJoin', function () {
    var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
    schJoin('Y', board_no)
})

$(document).on('click', '#schNotJoin ', function () {
    var board_no = $(this).parents(".boardBody").find(".detailViewBoard_no").val()
    schJoin('N', board_no)
})

function loadSchAttendee(board_no) {
    $.ajax({
        url: '/schedule/loadSchAttendee.do',
        data: {
            "board_no": board_no
        },
        async: false,
        success: function (data) {
            console.log(data)
            $("#schYCount").text('참석 ' + data.yCount)
            $("#schNCount").text('불참' + data.nCount)
        }
    })
}

function schJoin(status, board_no) {
    $.ajax({
        url: '/schedule/schJoin.do',
        data: {
            "board_no": board_no,
            "status": status
        },
        async: false,
        success: function (data) {
            //console.log('dd')
        }
    })
    loadSchAttendee(board_no)
}

$(document).on('click', '.viewAttendee', function () {
    $.ajax({
        url: '/schedule/selectSchAttendee.do',
        data: {
            "board_no": $(this).parents(".boardBody").find(".detailViewBoard_no").val(),
        },
        success: function (list) {
            console.log(list)
            $("#viewSchAttendee").find(".inviteTable").html('')
            console.log(list.length)
            if (list.length > 0) {
                $.each(list, function (i, obj) {
                    var content = '<tr>'
                    content += '<td rowspan="2"><span class="bi bi-person-circle fa-2x"></span>'
                    content += '<input type="hidden" class="inviteEmpNo" value="' + obj.emp_no + '">'
                    content += '</td>'
                    content += '<th style="width: 50%; text-align: center">' + obj.name + '</th>'
                    content += '<td rowspan="2" style="width: 20%; text-align: right;">'
                    content += '</td>'
                    content += '</tr>'
                    content += '<tr>'
                    if (obj.job_name != undefined) {
                        content += '<td style="text-align: center;">' + obj.job_name + '</td>'
                    } else {
                        content += '<td style="text-align: center;">직급이 없습니다.</td>'
                    }
                    content += '</tr>'

                    $("#viewSchAttendee").find(".inviteTable").append(content)
                })
            } else {
                $("#viewSchAttendee").find(".inviteTable").append('<tr><td>참석한 사원이 없습니다.</td></tr>')
            }

            $("#viewSchAttendee").modal("show")
        }
    })

})
$(function (){
    var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.498971671111775, 127.03287470164285), // 지도의 중심좌표
            level: 4 // 지도의 확대 레벨
        };
    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    $("#kakaoMapSearch").keyup(function(){
        // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();
        // 키워드로 장소를 검색합니다
        var keyword = $("#kakaoMapSearch").val();
        //console.log(keyword)
        ps.keywordSearch(keyword, placesSearchCB);
        // 키워드 검색 완료 시 호출되는 콜백함수 입니다

    });
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new kakao.maps.LatLngBounds();
            for (var i = 0; i < data.length; i++) {
                displayMarker(data[i]);
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
            }
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }
    }

    // 지도에 마커를 표시하는 함수입니다
    function displayMarker(place) {
        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x)
        });
        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function () {
            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
            infowindow.open(map, marker);
            $("input[name=sch_place]").val(place.place_name);
        });
    }
    $('#datetimepicker7').datetimepicker({
        icons: {
            time: "fa fa-clock"
        },
        locale: 'ko',
        format: "YYYY-MM-DD HH:mm"

    });
    $('#datetimepicker8').datetimepicker({
        icons: {
            time: "fa fa-clock"
        },
        useCurrent: false,
        locale: 'ko',
        format: "YYYY-MM-DD HH:mm"

    });
    $("#datetimepicker7").on("change.datetimepicker", function (e) {
        console.log('ㅋㅋ')
        $('#datetimepicker8').datetimepicker('minDate', e.date);
    });
    $("#datetimepicker8").on("change.datetimepicker", function (e) {
        $('#datetimepicker7').datetimepicker('maxDate', e.date);
    });
})
