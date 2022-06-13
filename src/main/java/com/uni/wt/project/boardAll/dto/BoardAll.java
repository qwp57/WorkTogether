package com.uni.wt.project.boardAll.dto;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class BoardAll {
    private int board_no;

    private int pj_no;

    private int board_type;

    private int writer;

    private Date create_date;
}
