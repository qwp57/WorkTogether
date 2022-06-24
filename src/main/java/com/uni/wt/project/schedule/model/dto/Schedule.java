package com.uni.wt.project.schedule.model.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class Schedule {

    private int board_no;

    private String sch_title;

    private String sch_content;

    private String sch_attendee;

    private Date sch_start;

    private Date sch_end;

    private String sch_place;

    private String name;

    private String create_date;

}
