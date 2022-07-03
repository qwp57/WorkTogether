package com.uni.wt.project.schedule.model.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class Schedule {

    private int board_no;

    private int emp_no;

    private String sch_title;

    private String sch_content;

    private String sch_attendee;

    private String sch_start;

    private String sch_end;

    private String sch_place;

    private String name;

    private String create_date;

    private int count;

    private String status;

}
