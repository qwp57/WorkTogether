package com.uni.wt.project.model.dto;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class Project {

    private int pj_no;

    @NotNull(message = "프로젝트 제목을 입력하세요.")
    private String pj_title;

    private String pj_content;

    private Date create_date;

    private String board_power;

    private String reply_power;

    private String file_power;

    private String status;

}