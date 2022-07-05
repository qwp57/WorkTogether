package com.uni.wt.project.boardAll.model.dto;

import lombok.Data;

@Data
public class Reply {

    private int reply_no;
    private int board_no;
    private int writer;
    private String change_name;
    private String name;
    private String reply_content;
    private String create_date;
}
