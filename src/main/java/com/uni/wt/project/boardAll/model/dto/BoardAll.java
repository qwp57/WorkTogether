package com.uni.wt.project.boardAll.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardAll {
    private int board_no;

    private int pj_no;

    private String board_type;

    private int writer;

    private Date create_date;
}
