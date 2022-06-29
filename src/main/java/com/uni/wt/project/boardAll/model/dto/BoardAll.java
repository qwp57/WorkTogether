package com.uni.wt.project.boardAll.model.dto;

import java.sql.Date;

import lombok.Data;
import org.thymeleaf.expression.Dates;

@Data
public class BoardAll {
    private int board_no;

    private int pj_no;

    private String board_type;

    private int writer;

    private String name;

    private String create_date;

    private String post_title;

    private String sch_title;

    private String todo_title;

    private int todo_percent;

    private String sch_start;

    private int count;
}
