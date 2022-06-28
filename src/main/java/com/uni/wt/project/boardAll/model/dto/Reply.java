package com.uni.wt.project.boardAll.model.dto;

import lombok.Data;

@Data
public class Reply {

    int reply_no;
    int board_no;
    int writer;
    String name;
    String reply_content;
    String create_date;
}
